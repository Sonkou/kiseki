package kiseki.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import kiseki.entity.OrderDetail;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderDetailMapper extends BaseMapper<OrderDetail> {

}