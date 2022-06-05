package kiseki.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import kiseki.common.R;
import kiseki.dto.SetmealDto;
import kiseki.entity.Dish;
import kiseki.entity.Setmeal;
import kiseki.entity.SetmealDish;
import kiseki.service.CategoryService;
import kiseki.service.DishService;
import kiseki.service.SetmealDishService;
import kiseki.service.SetmealService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;


import java.util.List;
import java.util.stream.Collectors;


//套餐管理
@RestController// == @ResponseBody ＋ @Controller
@RequestMapping("/setmeal")//指定控制器处理的URL请求
@Slf4j
public class SetmealController {

    @Autowired
    private SetmealService setmealService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private SetmealDishService setmealDishService;

    @Autowired
    private DishService dishService;


    //新增套餐
    @PostMapping
    @CacheEvict(value = "SetmealCache", allEntries = true)
    public R<String> save(@RequestBody SetmealDto setmealDto) {
        log.info("新增套餐：{}", setmealDto);
        setmealService.saveWithDish(setmealDto);
        return R.success("新增套餐成功");
    }


    //套餐的分页
    @GetMapping("/page")
    public R<Page<SetmealDto>> page(int page, int pageSize, String name) {
        Page<SetmealDto> pageInfo = setmealService.pageWithCategoryName(page, pageSize, name);
        return R.success(pageInfo);
    }


    //删除套餐
    @DeleteMapping
    public R<String> delete(@RequestParam List<Long> ids) {
        log.info("删除{}", ids.toString());

        setmealService.deleteWithDish(ids);

        return R.success("套餐数据删除成功");
    }

    /**
     * 修改停售/起售状态
     *
     * @param flag 0：停售，1：起售
     * @param ids  被操作的id
     * @return 操作结果
     */
    @PostMapping("/status/{flag}")
    @CacheEvict(value = "SetmealCache", allEntries = true)
    public R<String> status(@PathVariable int flag, @RequestParam List<Long> ids) {
        for (Long id : ids) {
            Setmeal setmeal = new Setmeal();
            setmeal.setId(id);
            setmeal.setStatus(flag);
            setmealService.updateById(setmeal);
        }
        return R.success("修改成功~");
    }

    @GetMapping("/{id}")
    public R<SetmealDto> findById(@PathVariable Long id) {
        SetmealDto setmealDto = setmealService.findByIdWithDish(id);
        return R.success(setmealDto);
    }

    @PutMapping
    @CacheEvict(value = "SetmealCache", allEntries = true)
    public R<String> update(@RequestBody SetmealDto setmealDto) {
        log.info("修改套餐{}", setmealDto.toString());
        setmealService.updateWithDish(setmealDto);
        return R.success("修改成功");
    }


    //根据条件查询套餐数据
    @GetMapping("/list")
    public R<List<Setmeal>> list(Setmeal setmeal) {
        LambdaQueryWrapper<Setmeal> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(setmeal.getCategoryId() != null, Setmeal::getCategoryId, setmeal.getCategoryId());
        queryWrapper.eq(setmeal.getStatus() != null, Setmeal::getStatus, setmeal.getStatus());
        queryWrapper.orderByDesc(Setmeal::getUpdateTime);

        List<Setmeal> list = setmealService.list(queryWrapper);

        return R.success(list);
    }

    @GetMapping("/dish/{setmealId}")
    @Cacheable(value = "SetmealCache", key = "#setmealId")
    public R<List<Dish>> dish(@PathVariable Long setmealId) {
        List<SetmealDish> setmealDishList = setmealDishService.list(
                new LambdaQueryWrapper<SetmealDish>()
                        .eq(SetmealDish::getSetmealId, setmealId));
        List<Dish> dishList = setmealDishList.stream().map(item -> {
            return dishService.getById(item.getDishId());
        }).collect(Collectors.toList());
        return R.success(dishList);
    }
}
