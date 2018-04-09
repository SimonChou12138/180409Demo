package com.offcn.controller.front;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.offcn.dao.BaseDao;

@WebServlet("/CheckPhoneNum")
public class CheckPhoneNum extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String phonenum = request.getParameter("phonenum");
		String sql = "SELECT * FROM u_idle_user WHERE u_phonenum='"+phonenum+"'";
		List<Map<String, Object>> phonenumList=new BaseDao().executeQuery(sql);
		if(phonenumList!=null&&phonenumList.size()>0){
			response.getWriter().write("No");
		}
		else{
			response.getWriter().write("Yes");
		}
	}
}
