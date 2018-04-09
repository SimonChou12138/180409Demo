package com.offcn.service;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.offcn.dao.BaseDao;

public class AdminService {
	public int updateAdmin(HttpServletRequest request, HttpServletResponse response){
		//修复乱码现象
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		//获取jsp页面上的值
		String account = request.getParameter("account");
		String phonenum = request.getParameter("phonenum");
		String address = request.getParameter("address");
		String mailbox = request.getParameter("mailbox");
		//sql语句
		String sql = "UPDATE u_sys_admin SET phonenum='"+phonenum+"',address='"+address+"',mailbox='"+mailbox+"' WHERE account='"+account+"'";
		
		//利用BaseDao工具发送sql语句
		int n = new BaseDao().executeUpdate(sql);
		
		//返回n(是否发送成功)
		return n;
	}
}
