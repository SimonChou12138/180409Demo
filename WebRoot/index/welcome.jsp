<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath() + "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<base href="<%=basePath%>"/>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>无标题文档</title>
	<link href="<%=basePath %>css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>

<div class="place">
	<span>位置：</span>
	<ul class="placeul">
		<li><a>首页</a></li>
	</ul>
</div>

<div class="mainindex" >
	<div class="welinfo">
		<span><img src="<%=basePath %>images/sun.png" alt="天气" /></span>
		<b style="font-size: 20px"> 
			<b style="font-size: 18px;color:blue;">${map.account}</b> 
			&nbsp;
			早上好，欢迎使用U闲交易后台系统
		</b>
		<b style="font-size: 18px;color:blue">(${map.mailbox})</b>
		<a>帐号设置</a>
	</div><br/><br/>
	
	<div class="welinfo">
		<span><img src="<%=basePath %>images/time.png" alt="时间" /></span>
		<i style="font-size: 20px">您上次登录的时间：2013-10-09 15:22</i> 
	</div>
	
	<br/><br/><br/>
	<div class="xline"></div>
	<ul class="iconlist">
		<li><img src="<%=basePath %>images/ico01.png" /><p><a href="#">管理设置</a></p></li>
		<li><img src="<%=basePath %>images/ico02.png" /><p><a href="#">发布文章</a></p></li>
		<li><img src="<%=basePath %>images/ico03.png" /><p><a href="#">数据统计</a></p></li>
		<li><img src="<%=basePath %>images/ico04.png" /><p><a href="#">文件上传</a></p></li>
		<li><img src="<%=basePath %>images/ico05.png" /><p><a href="#">目录管理</a></p></li>
		<li><img src="<%=basePath %>images/ico06.png" /><p><a href="#">查询</a></p></li> 
	</ul>

	<br/><br/>
	<div class="xline"></div>
	<div class="xline"></div>
	<div class="xline"></div>
	<div class="xline"></div>
	<div class="box"></div>

	<div class="welinfo">
		<span><img src="<%=basePath %>images/dp.png" alt="提醒" /></span>
		<b>系统使用指南</b>
	</div>

	<ul class="infolist">
		<li><span>您可以快速进行文章发布管理操作</span><a class="ibtn">发布或管理文章</a></li>
		<li><span>您可以快速发布产品</span><a class="ibtn">发布或管理产品</a></li>
		<li><span>您可以进行密码修改、账户设置等操作</span><a class="ibtn">账户管理</a></li>
	</ul>

	<div class="xline"></div>

</div>

</body>

</html>
	