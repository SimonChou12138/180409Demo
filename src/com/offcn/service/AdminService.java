package com.offcn.service;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.offcn.dao.BaseDao;

public class AdminService {
	public int updateAdmin(HttpServletRequest request, HttpServletResponse response){
		//�޸���������
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		//��ȡjspҳ���ϵ�ֵ
		String account = request.getParameter("account");
		String phonenum = request.getParameter("phonenum");
		String address = request.getParameter("address");
		String mailbox = request.getParameter("mailbox");
		//sql���
		String sql = "UPDATE u_sys_admin SET phonenum='"+phonenum+"',address='"+address+"',mailbox='"+mailbox+"' WHERE account='"+account+"'";
		
		//����BaseDao���߷���sql���
		int n = new BaseDao().executeUpdate(sql);
		
		//����n(�Ƿ��ͳɹ�)
		return n;
	}
}
