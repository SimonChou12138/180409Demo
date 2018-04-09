package com.offcn.controller.front;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.offcn.dao.BaseDao;

@WebServlet("/FinalReg")
public class FinalReg extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String password = request.getParameter("pwd");
		String phonenum = request.getSession().getAttribute("phonenum")+"";
		
		String sql="INSERT INTO u_idle_user(u_phonenum,u_password) VALUES ('"+password+"','"+phonenum+"')";
		int n=new BaseDao().executeUpdate(sql);
		if(n>0){
			request.getRequestDispatcher("front/login.jsp").forward(request, response);
		}
		
	}

}
