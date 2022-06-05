package kiseki.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import kiseki.entity.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper extends BaseMapper<User>{
}
