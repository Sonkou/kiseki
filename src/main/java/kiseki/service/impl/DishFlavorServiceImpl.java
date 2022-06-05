package kiseki.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import kiseki.entity.DishFlavor;
import kiseki.mapper.DishFlavorMapper;
import kiseki.service.DishFlavorService;
import org.springframework.stereotype.Service;

@Service
public class DishFlavorServiceImpl extends ServiceImpl<DishFlavorMapper, DishFlavor> implements DishFlavorService {
}
