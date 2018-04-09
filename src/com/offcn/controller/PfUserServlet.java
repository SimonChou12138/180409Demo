package com.offcn.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.offcn.service.PfUserService;

@WebServlet("/PfUserServlet")
public class PfUserServlet extends HttpServlet {
	
	PfUserService pfuserservice=new PfUserService();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Map<String, Object>> list = pfuserservice.pfuserList();
		request.setAttribute("list",list);
		request.getRequestDispatcher("module_PfUserList/pfuserlist.jsp").forward(request, response);
	}
}
