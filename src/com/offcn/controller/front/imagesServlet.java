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

import net.sf.json.JSONArray;

@WebServlet("/imagesServlet")
public class imagesServlet extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");//修复响应格式的乱码现象
		String sql = "SELECT * FROM u_idle_info";
		List<Map<String, Object>> list = new BaseDao().executeQuery(sql);//利用basedao发送sql语句并把值保存在list中
		String str = JSONArray.fromObject(list).toString();//把list的值从json格式的数组转换成string并保存给str
		response.getWriter().write(str);//发送str给ajax的data
	}

}
