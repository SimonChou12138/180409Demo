package com.offcn.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CheckOriPwd")
public class CheckOriPwd extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//����html����
		response.setContentType("text/html;charset=utf-8");
		//��ȡ�û�ԭʼ����
		String oripwd=request.getParameter("oripwd");
		//��ȡ���ݿ��ԭʼ����
		Map<String, Object> map = (Map<String, Object>) request.getSession().getAttribute("map");
		String password=map.get("password")+"";
		String msg="";
		
		//�ж��û������ԭʼ���������ݿ��е�ԭʼ�����Ƿ���ͬ
		if(oripwd.equals(password)){
			msg="ok";
		}else{
			msg="error";
		}
		//��Ϊ�첽�������Ӧ����
		response.getWriter().write(msg);
	}

}
