package kiseki.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import kiseki.entity.AddressBook;
import kiseki.mapper.AddressBookMapper;
import kiseki.service.AddressBookService;
import org.springframework.stereotype.Service;

@Service
public class AddressBookServiceImpl extends ServiceImpl<AddressBookMapper, AddressBook> implements AddressBookService {

}
