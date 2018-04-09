package com.offcn.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.offcn.dao.BaseDao;
import com.offcn.service.AdminService;


@WebServlet("/UpdateAdmin")
public class UpdateAdmin extends HttpServlet {
	AdminService adminservice=new AdminService();
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	int n = adminservice.updateAdmin(request, response);
	if(n>0)
	{
		String account = request.getParameter("account");
		String sql = "SELECT * FROM u_sys_admin WHERE account='"+account+"'";
		Map<String, Object> map = new BaseDao().executeQuery(sql).get(0);
		request.getSession().setAttribute("map",map);
		
		request.getRequestDispatcher("module_Personal Center/MyCenter.jsp").forward(request, response);
	}
	}

}
