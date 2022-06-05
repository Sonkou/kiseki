package kiseki.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import kiseki.entity.User;
import kiseki.mapper.UserMapper;
import kiseki.service.UserService;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper,User> implements UserService{
}
