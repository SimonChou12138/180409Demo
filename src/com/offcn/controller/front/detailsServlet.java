package com.offcn.controller.front;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.offcn.dao.BaseDao;


@WebServlet("/detailsServlet")
public class detailsServlet extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");//修复响应格式的乱码现象
		String id=request.getParameter("id");
		String sql="SELECT * FROM u_idle_info WHERE id="+id+"";
		Map<String,Object>map = new BaseDao().executeQuery(sql).get(0);
		request.setAttribute("map", map);
		request.getRequestDispatcher("front/details.jsp").forward(request, response);
	}

}
