package kiseki.filter;

import com.alibaba.fastjson.JSON;
import kiseki.common.BaseContext;
import kiseki.common.R;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.AntPathMatcher;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

//检查用户是否已经完成登录
@WebFilter(filterName = "loginCheckFilter",urlPatterns = "/*")
@Slf4j
public class LoginCheckFilter implements Filter{
    //路径匹配器，支持通配符
    public static final AntPathMatcher PATH_MATCHER = new AntPathMatcher();

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        //1、获取本次请求的URI
        String requestURI = request.getRequestURI();// /backend/index.html

        log.info("拦截到请求：{}",requestURI);

        //定义不需要处理的请求路径
        String[] urls = new String[]{
                "/employee/login",
                "/employee/logout",
                "/backend/**",
                "/front/**",
                "/common/**",
                "/user/sendMsg",
                "/user/login"
        };

        //2、判断本次请求是否需要处理
        boolean check = check(urls, requestURI);

        //3、如果不需要处理，则直接放行
        if(check){
            log.info("本次请求{}不需要处理",requestURI);
            filterChain.doFilter(request,response);
            return;
        }

        //4、判断登录状态，如果已登录，则直接放行
        Long employeeId = (Long) request.getSession().getAttribute("employee");
        Long user = (Long) request.getSession().getAttribute("user");
        if (employeeId != null) {
            log.info("用户已登录，id为{}", employeeId);
            //向ThreadLocal添加当前登录用户id
            BaseContext.setCurrentId(employeeId);

            filterChain.doFilter(request, response);
            return;
        }
        if (user!=null){
            log.info("用户已登录，id为{}", user);
            BaseContext.setCurrentId(user);
            filterChain.doFilter(request,response);
            return;
        }

        log.info("用户未登录");
        //5、如果未登录则返回未登录结果，通过输出流方式向客户端页面响应数据
        PrintWriter writer = response.getWriter();
        writer.write(JSON.toJSONString(R.error("NOTLOGIN")));
        log.info("未登录，访问拒绝");
        return;

    }

    /**
     * 路径匹配，检查本次请求是否需要放行
     * @param patterns   定义的不需要处理的请求路径
     * @param requestUrl 需要判断的url
     * @return 布尔值
     */
    private boolean check(String[] patterns, String requestUrl) {
        for (String pattern : patterns) {
            boolean match = PATH_MATCHER.match(pattern, requestUrl);
            if (match) {
                return true;
            }
        }
        return false;
    }
}

