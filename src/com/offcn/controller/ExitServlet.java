package com.offcn.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.offcn.service.LoginService;

@WebServlet(urlPatterns="/ExitServlet")
public class ExitServlet extends HttpServlet {
	
	LoginService service = new LoginService();
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service.exitLogin(request, response);
	}
	
}
