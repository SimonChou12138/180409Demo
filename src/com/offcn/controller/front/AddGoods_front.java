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
		//获取jsp页面上的值
		String name = request.getParameter("name");
		String presentation = request.getParameter("presentation");
		
		String filename=saveImg(request,response);
		//sql语句
		String sql = " INSERT INTO u_idle_info "
				+ "(NAME,idleimg,presentation,create_date)  "
				+ " VALUES "
				+ " ('"+name+"','"+filename+"','"+presentation+"',CURRENT_DATE()) ";
		
		//利用BaseDao工具发送sql语句
		int n = new BaseDao().executeUpdate(sql);
		if(n>0){
			System.out.println("添加成功");
			request.getRequestDispatcher("front/index.jsp").forward(request, response);
		}else{
			System.out.println("添加失败");
		}
	}

	private String saveImg(HttpServletRequest request, HttpServletResponse response) {
		Part part = null;
		try {
			//1.获取用户上传图片对应的part对象
			part = request.getPart("idleimg");
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		}
		
		//2.获取当前时间
		Date date = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddhhmmss");
		String str = sf.format(date);
		
		//3.获取用户上传的图片的后缀
		String cd = part.getHeader("Content-Disposition");
		//form-data; name="idleimg"; filename="20171108083623.jpg"
		String houzui = cd.substring(cd.lastIndexOf("."), cd.length()-1);//利用substring 取.后面的三位数
		String fileName = str+houzui;
		
		//4.将图片保存,利用生成的文件名
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
