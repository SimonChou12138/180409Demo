<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath() + "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="<%=basePath%>" target="rightFrame"/>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>无标题文档</title>
	<link href="<%=basePath %>css/style.css" rel="stylesheet" type="text/css" />
</head>

<body style="background:#f0f9fd;">

<div class="lefttop"><span></span>工作台</div>
<dl class="leftmenu">
	
	<!-- 一个模块开始 -->
	<dd>
		<div class="title">
			<span><img src="<%=basePath %>images/leftico01.png"/></span>系统首页
		</div>
		<ul class="menuson">
			<li class="active"><cite></cite><a href="index/welcome.jsp" >首页1</a><i></i></li>
		</ul>
	</dd>
	<!-- 一个模块结束 -->
	
	<!-- 一个模块开始 -->
	<dd>
		<div class="title">
			<span><img src="<%=basePath %>images/leftico01.png"/></span>闲置信息管理
		</div>
		<ul class="menuson">
			<li><cite></cite><a href="module_idle/addidle.jsp">录入闲置信息</a><i></i></li>
			<li><cite></cite><a href="QueryIdle">查看闲置信息</a><i></i></li> 
		</ul>
	</dd>
	<!-- 一个模块结束 -->
	
	<!-- 一个模块开始 -->
	<dd>
		<div class="title">
			<span><img src="<%=basePath %>images/leftico01.png"/></span>个人中心
		</div>
		<ul class="menuson">
			<li><cite></cite><a href="PfUserServlet">基本信息</a><i></i></li>
		</ul>    
	</dd>
	<!-- 一个模块结束 -->
	
	<!-- 一个模块开始 -->
	<dd>
		<div class="title">
			<span><img src="<%=basePath %>images/leftico01.png"/></span>平台用户管理
		</div>
		<ul class="menuson">
			<li><cite></cite><a href="PfUserServlet">用户列表</a><i></i></li>
			<li><cite></cite><a href="PfUserStatistics">用户统计</a><i></i></li>
		</ul>    
	</dd>
	<!-- 一个模块结束 -->
	
	<!-- 一个模块开始 -->
	<dd>
		<div class="title">
			<span><img src="<%=basePath %>images/leftico01.png"/></span>关键词管理
		</div>
		<ul class="menuson">
			<li><cite></cite><a href="module_KeyWord/KeyWords.jsp">关键词列表</a><i></i></li>
		</ul>    
	</dd>
	<!-- 一个模块结束 -->
	
</dl>

<script type="text/javascript" src="<%=basePath %>js/jQuery/jquery.js"></script>
<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson li").click(function(){
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if($ul.is(':visible')){
			$(this).next('ul').slideUp();
		}else{
			$(this).next('ul').slideDown();
		}
	});
})	
</script>
</body>
</html>
