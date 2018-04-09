package com.offcn.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.offcn.dao.BaseDao;

public class LoginService {
	
	/**
	 * 根据账号和密码，进行校验，若校验成功，返回该用户（对应的map对象）
	 * @param request
	 * @param response
	 * @return
	 */
	public Map<String, Object> login(HttpServletRequest request, HttpServletResponse response){
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		
		String sql = "SELECT * FROM u_sys_admin WHERE account = '"+account+"' AND PASSWORD = '"+password+"'";
		
		List<Map<String, Object>> list = new BaseDao().executeQuery(sql);
		if(list!=null&&list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
		
	}

	public void exitLogin(HttpServletRequest request, HttpServletResponse response){
		//1.销毁session
		HttpSession session = request.getSession();
		session.invalidate();
		
		//2.重定向到登录页面
		try {
			response.sendRedirect("login.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
