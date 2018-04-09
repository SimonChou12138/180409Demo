package com.offcn.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.offcn.service.LoginService;

@WebServlet(urlPatterns="/LoginServlet")
public class LoginServlet extends HttpServlet {
	
	LoginService loginService = new LoginService();
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//当前登录用户
		Map<String, Object> map = loginService.login(request, response);
		if(map!=null){
			//将map对象暂存在session对象中
			request.getSession().setAttribute("map",map);
			//登录成功,进入系统首页
			request.getRequestDispatcher("index/index.jsp").forward(request, response);
		}else{
			response.sendRedirect("login.jsp");
		}
		
	}
	
}
