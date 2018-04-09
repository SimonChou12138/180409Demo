package com.offcn.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CheckOriPwd")
public class CheckOriPwd extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//处理html乱码
		response.setContentType("text/html;charset=utf-8");
		//获取用户原始密码
		String oripwd=request.getParameter("oripwd");
		//获取数据库的原始密码
		Map<String, Object> map = (Map<String, Object>) request.getSession().getAttribute("map");
		String password=map.get("password")+"";
		String msg="";
		
		//判断用户输入的原始密码与数据库中的原始密码是否相同
		if(oripwd.equals(password)){
			msg="ok";
		}else{
			msg="error";
		}
		//作为异步请求的相应数据
		response.getWriter().write(msg);
	}

}
