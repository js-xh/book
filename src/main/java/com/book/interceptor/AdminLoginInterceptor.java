package com.book.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminLoginInterceptor implements HandlerInterceptor {
    /**
     *  在进入那个后台api（/admin/下的url请求）之前进行拦截
     */
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession session = request.getSession();
        if (session.getAttribute("admin") == null){
            response.sendRedirect(request.getContextPath()+"/X-admin/adminLogin.jsp");
            return false;
        }
        return true;
    }
}
