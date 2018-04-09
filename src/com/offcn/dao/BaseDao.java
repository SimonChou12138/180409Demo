package com.offcn.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BaseDao {

	public Connection getConnection() {
		Connection conn = null;
		// 1.加载数据库驱动
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 数据库url地址
		String url = "jdbc:mysql://localhost:3306/u_idleness_transaction_platform?useUnicode=true&characterEncoding=utf-8";
		// 数据库用户名
		String user = "root";
		// 数据库密码
		String password = "070115";
		// 创建数据库连接对象
		try {
			conn = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	public Statement getStmt(Connection conn) {
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return stmt;
	}

	/**
	 * 此方法可以执行insert/delete/update 类型的sql语句
	 * 
	 * @param sql
	 * @return
	 */
	public int executeUpdate(String sql) {
		Connection conn = getConnection();
		Statement stmt = getStmt(conn);

		int i = -1;
		try {
			i = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				stmt.close();
				conn.close();
			} catch (Exception e2) {
				System.out.println("关流异常");
			}
		}
		return i;
	}

	public List<Map<String, Object>> executeQuery(String sql) {

		Connection conn = getConnection();
		Statement stmt = getStmt(conn);

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		ResultSet rs = null;
		ResultSetMetaData rsmt = null;
		try {
			rs = stmt.executeQuery(sql);
			rsmt = rs.getMetaData();

			// 列数
			int count = rsmt.getColumnCount();

			while (rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();

				for (int i = 1; i <= count; i++) {
					String key = rsmt.getColumnName(i);
					Object val = rs.getObject(key);

					map.put(key, val);
				}

				list.add(map);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	public static void main(String[] args) {
		/*
		 * String sql = "DELETE  FROM favorites WHERE id = 2"; int i = new
		 * BaseDao().executeUpdate(sql); System.out.println(i);
		 */

		String sql = "SELECT * FROM u_idle_user";
		List<Map<String, Object>> list = new BaseDao().executeQuery(sql);
		System.out.println(list);
	}

}
