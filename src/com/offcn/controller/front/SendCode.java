package com.offcn.controller.front;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.offcn.juhe.JuheDemo;

@WebServlet("/SendCode")
public class SendCode extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String phonenum = request.getParameter("phonenum");
		JuheDemo juhedemo = new JuheDemo(phonenum);
		juhedemo.getRequest2();
		String code=juhedemo.key;
		//test
		//String code="123456";
		request.getSession().removeAttribute("code");
		request.getSession().setAttribute("code", code);
		
		response.getWriter().write("ok");
	}

}
