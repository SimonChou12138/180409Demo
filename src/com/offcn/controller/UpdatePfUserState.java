package com.offcn.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.offcn.dao.BaseDao;

@WebServlet(urlPatterns="/UpdatePfUserState")
public class UpdatePfUserState extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("uid");
		String sql = "UPDATE u_idle_user SET u_state = IF(u_state='正常','锁定','正常') WHERE u_id = '"+uid+"'";
		int n=new BaseDao().executeUpdate(sql);
		if(n>0){
			request.getRequestDispatcher("PfUserServlet").forward(request, response);
		}else{
			System.out.println("执行失败");
		}
	}
}
