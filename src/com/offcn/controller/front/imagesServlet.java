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
		response.setContentType("text/html;charset=utf-8");//�޸���Ӧ��ʽ����������
		String sql = "SELECT * FROM u_idle_info";
		List<Map<String, Object>> list = new BaseDao().executeQuery(sql);//����basedao����sql��䲢��ֵ������list��
		String str = JSONArray.fromObject(list).toString();//��list��ֵ��json��ʽ������ת����string�������str
		response.getWriter().write(str);//����str��ajax��data
	}

}
