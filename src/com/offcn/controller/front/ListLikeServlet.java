package com.offcn.controller.front;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.offcn.dao.BaseDao;


@WebServlet("/ListLikeServlet")
public class ListLikeServlet extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String sql = "SELECT * FROM u_idle_info WHERE  NAME LIKE '%ÊÖ»ú%' ";
		
		List<Map<String, Object>> list = new BaseDao().executeQuery(sql);
		request.setAttribute("list",list);
		
		request.getRequestDispatcher("front/list.jsp").forward(request, response);
	}

}
