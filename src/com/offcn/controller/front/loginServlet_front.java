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

@WebServlet("/loginServlet_front")
public class loginServlet_front extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		String phonenum = request.getParameter("phonenum");
		String password = request.getParameter("password");
		String sql="SELECT * FROM u_idle_user WHERE u_phonenum='"+phonenum+"' AND u_password='"+password+"'";
		List<Map<String, Object>> list = new BaseDao().executeQuery(sql);
		if(list!=null&&list.size()>0){
			Map<String, Object> map_front = list.get(0);
			request.getSession().setAttribute("map_front",map_front);
			request.getRequestDispatcher("front/index.jsp").forward(request, response);
		}
	}
}
