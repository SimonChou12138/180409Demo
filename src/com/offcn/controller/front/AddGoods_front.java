package com.offcn.controller.front;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.offcn.dao.BaseDao;


@WebServlet("/AddGoods_front")
@MultipartConfig
public class AddGoods_front extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		//��ȡjspҳ���ϵ�ֵ
		String name = request.getParameter("name");
		String presentation = request.getParameter("presentation");
		
		String filename=saveImg(request,response);
		//sql���
		String sql = " INSERT INTO u_idle_info "
				+ "(NAME,idleimg,presentation,create_date)  "
				+ " VALUES "
				+ " ('"+name+"','"+filename+"','"+presentation+"',CURRENT_DATE()) ";
		
		//����BaseDao���߷���sql���
		int n = new BaseDao().executeUpdate(sql);
		if(n>0){
			System.out.println("��ӳɹ�");
			request.getRequestDispatcher("front/index.jsp").forward(request, response);
		}else{
			System.out.println("���ʧ��");
		}
	}

	private String saveImg(HttpServletRequest request, HttpServletResponse response) {
		Part part = null;
		try {
			//1.��ȡ�û��ϴ�ͼƬ��Ӧ��part����
			part = request.getPart("idleimg");
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		}
		
		//2.��ȡ��ǰʱ��
		Date date = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddhhmmss");
		String str = sf.format(date);
		
		//3.��ȡ�û��ϴ���ͼƬ�ĺ�׺
		String cd = part.getHeader("Content-Disposition");
		//form-data; name="idleimg"; filename="20171108083623.jpg"
		String houzui = cd.substring(cd.lastIndexOf("."), cd.length()-1);//����substring ȡ.�������λ��
		String fileName = str+houzui;
		
		//4.��ͼƬ����,�������ɵ��ļ���
		try {
			//D:\apache-tomcat-9.0.0.M21\webapps\offcn_idle_sys\idleimg
			String realPath = request.getServletContext().getRealPath("/idleimg")+"\\"+fileName;
			part.write(realPath);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return fileName;
	}

}
