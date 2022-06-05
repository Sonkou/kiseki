package kiseki.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import kiseki.entity.SetmealDish;
import kiseki.mapper.SetmealDishMapper;
import kiseki.service.SetmealDishService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class SetmealDishServiceImpl extends ServiceImpl<SetmealDishMapper, SetmealDish> implements SetmealDishService {
}
