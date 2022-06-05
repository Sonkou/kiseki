package kiseki.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import kiseki.entity.Employee;
import kiseki.mapper.EmployeeMapper;
import kiseki.service.EmployeeService;
import org.springframework.stereotype.Service;

@Service
public class EmployeeServiceImpl extends ServiceImpl<EmployeeMapper, Employee> implements EmployeeService {
}
