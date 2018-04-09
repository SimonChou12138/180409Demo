package com.offcn.controller.front;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.offcn.dao.BaseDao;

@WebServlet("/informationServlet")
public class informationServlet extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//修复乱码现象
				try {
					request.setCharacterEncoding("UTF-8");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				//获取jsp页面上的值
				String phonenum = request.getParameter("phonenum");
				String nickname = request.getParameter("nickname");
				String birthday = request.getParameter("birthday");
				String province = request.getParameter("province");
				String city = request.getParameter("city");
				String district = request.getParameter("district");
				
				//sql语句
				String sql = "UPDATE u_idle_user SET u_nickname='"+nickname+"',u_birthday='"+birthday+"',u_province='"+province+"',u_city='"+city+"',u_district='"+district+"' WHERE u_phonenum='"+phonenum+"'";
				
				//利用BaseDao工具发送sql语句
				int n = new BaseDao().executeUpdate(sql);
				
				if(n>0)
				{
					String sql1 = "SELECT * FROM u_idle_user WHERE u_phonenum='"+phonenum+"'";
					Map<String, Object> map = new BaseDao().executeQuery(sql1).get(0);
					request.getSession().setAttribute("map",map);
					
					request.getRequestDispatcher("front/Updateinformation.jsp").forward(request, response);
				}
				
	}

}
