package com.offcn.controller.front;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.offcn.dao.BaseDao;

import net.sf.json.JSONArray;

@WebServlet("/InitMaiData2")
public class InitMaiData2 extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String iid = request.getParameter("iid");
		String sql_dengdaifahuo = "SELECT COUNT(1) AS 'dengdaifahuo' FROM u_idle_info WHERE fk_fisher="+iid+" AND transfer_state='ря╫╩рв'";
		BaseDao dao=new BaseDao();
		List<Map<String, Object>> list_dengdaifahuo = dao.executeQuery(sql_dengdaifahuo);
		String dengdaifahuo=list_dengdaifahuo.get(0).get("dengdaifahuo")+"";
		HashMap<String, String> initMaiMap2 = new HashMap<String, String>();
		initMaiMap2.put("dengdaifahuo", dengdaifahuo);
		String str = JSONArray.fromObject(initMaiMap2).toString();
		response.getWriter().write(str);
		
	}

}
