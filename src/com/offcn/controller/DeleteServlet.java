package com.offcn.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.offcn.service.IdleService;


@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	IdleService deleteservice=new IdleService();
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int n=deleteservice.deleteIdleById(request, response);
		if(n>0){
			System.out.println("Ö´ÐÐ³É¹¦");
			request.getRequestDispatcher("QueryIdle").forward(request, response);	
		}
			
	}

}
