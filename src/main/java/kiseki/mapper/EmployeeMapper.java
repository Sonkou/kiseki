package kiseki.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import kiseki.entity.Employee;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EmployeeMapper extends BaseMapper<Employee>{
}
