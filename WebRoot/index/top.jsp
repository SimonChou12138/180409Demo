<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath() + "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<base href="<%=basePath%>" target="leftFrame"/>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>无标题文档</title>
	<link href="<%=basePath %>css/style.css" rel="stylesheet" type="text/css" />
</head>

<body style="background:url(<%=basePath %>images/topbg.gif) repeat-x;">

<div class="topleft">
	<a><img src="<%=basePath %>images/logo-1.png" title="系统首页" /></a>
</div>
    
<div class="topright">    
	<ul>
	<li><span><img src="<%=basePath%>images/help.png" title="帮助"  class="helpimg"/></span><a>帮助</a></li>
	<li><a>关于</a></li>
	<li><a target="_parent" href="ExitServlet">退出</a></li>
	</ul>
	<div class="user">
		<span>${map.account}</span>
		<i>消息</i>
		<b>10</b>
	</div>    
</div>
    
<script type="text/javascript" src="<%=basePath %>js/jQuery/jquery.js"></script>
<script type="text/javascript">
	$(function(){	
		//顶部导航切换
		$(".nav li a").click(function(){
			$(".nav li a.selected").removeClass("selected")
			$(this).addClass("selected");
		})	
	});	
</script>
</body>
</html>

