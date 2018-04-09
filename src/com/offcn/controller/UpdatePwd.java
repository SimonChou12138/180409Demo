package com.offcn.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.offcn.dao.BaseDao;


@WebServlet("/UpdatePwd")
public class UpdatePwd extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pwd = request.getParameter("pwd");
		Map<String, Object> map =(Map<String,Object>)request.getSession().getAttribute("map");
		 
		String id = map.get("id")+"";
		String sql = "UPDATE u_sys_admin SET PASSWORD = '"+pwd+"' WHERE id = '"+id+"'";
		int n=new BaseDao().executeUpdate(sql);
		 
		if(n>0){
			response.getWriter().write("ok");
		}else{
			response.getWriter().write("error");
		}
	}

}
