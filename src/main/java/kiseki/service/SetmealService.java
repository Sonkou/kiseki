package kiseki.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import kiseki.dto.SetmealDto;
import kiseki.entity.Setmeal;

import java.util.List;

public interface SetmealService extends IService<Setmeal> {
    //新增套餐，同时需要保存套餐和菜品的关联关系
    public void saveWithDish(SetmealDto setmealDto);

    //分页查询
    public Page<SetmealDto> pageWithCategoryName(int page, int pageSize, String name);

    //套餐所带的菜品一起删除
    public void deleteWithDish(List<Long> ids);

    //根据id查询套餐及其包含的菜品
    public SetmealDto findByIdWithDish(Long id);

    //修改套餐及其包含的菜品
    public void updateWithDish(SetmealDto setmealDto);
}
