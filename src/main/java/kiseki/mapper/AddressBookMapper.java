package kiseki.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import kiseki.entity.AddressBook;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AddressBookMapper extends BaseMapper<AddressBook> {

}
