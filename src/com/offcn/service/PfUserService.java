package com.offcn.service;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.offcn.dao.BaseDao;

public class PfUserService {
	public List<Map<String, Object>> pfuserList(){
		//sql语句
		String sql = "SELECT * FROM u_idle_user";
		System.out.println("执行成功");
		//把数据的返回的值装进List中然后return
		List<Map<String, Object>> list = new BaseDao().executeQuery(sql);
		return list;
	}
	public List<Map<String, Object>> pfuserListByLike(HttpServletRequest request, HttpServletResponse response){
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String SelectName = request.getParameter("SelectName");
		String sql = "SELECT * FROM u_idle_user WHERE u_state LIKE '%"+SelectName+"%' OR u_province LIKE '%"+SelectName+"%' ";
		
		List<Map<String, Object>> list = new BaseDao().executeQuery(sql);
		
		return list;
	}
	public List<Map<String, Object>> pfuserstatistics(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String sql = "SELECT u_province,COUNT(u_province) As usercount  FROM u_idle_user GROUP BY u_province";
		
		List<Map<String, Object>> list = new BaseDao().executeQuery(sql);
		
		return list;
	}
	
}
