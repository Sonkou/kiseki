package kiseki;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Slf4j//日志输出
@SpringBootApplication//SpringBootConfiguration + EnableAutoConfiguration + ComponentScan
@ServletComponentScan//加载 bean 定义到 Spring 的 IoC 容器
@EnableTransactionManagement//开启事务管理
@EnableCaching //开启Spring Cache缓存
public class KisekiApplication {
    public static void main(String[] args) {
        SpringApplication.run(KisekiApplication.class,args);
        log.info("项目启动成功...");
    }
}
