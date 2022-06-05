package kiseki.service;

import com.baomidou.mybatisplus.extension.service.IService;
import kiseki.entity.Category;

public interface CategoryService extends IService<Category> {

    public void removeAfterCheck(Long id);

}
