package com.offcn.controller.front;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.offcn.dao.BaseDao;

@WebServlet(urlPatterns = "/PayServlet")
public class PayServlet extends HttpServlet {

	BaseDao dao = new BaseDao();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("支付成功");

		String order_sql = request.getSession().getAttribute("order_sql") + "";
		dao.executeUpdate(order_sql);
		//request.getSession().setAttribute("order_sql", null);

		String u_idle_id = request.getSession().getAttribute("u_idle_id") + "";
		
		//更改闲置信息的状态（变成已交易）
		//String s = "UPDATE u_idle_info SET transfer_state = '已交易' WHERE id = "+u_idle_id+"";
		//new BaseDao().executeUpdate(s);

		response.sendRedirect(request.getContextPath() + "/front/index.jsp");
	}

}
