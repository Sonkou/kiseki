package kiseki.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import kiseki.entity.Orders;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderMapper extends BaseMapper<Orders> {

}