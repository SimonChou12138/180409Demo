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
		<li><a href="#">首页</a></li>
		<li><a href="#">表单</a></li>
	</ul>
</div>

<form action="">
	<div class="formbody">
		<div class="formtitle"><span>基本信息</span></div>
		<ul class="forminfo">
			<li>
				<label>文章标题</label>
				<input name="" type="text" class="dfinput" />
				<i>标题不能超过30个字符</i>
			</li>
			<li>
				<label>关键字</label>
				<input name="" type="text" class="dfinput" />
				<i>多个关键字用,隔开</i>
			</li>
			<li>
				<label>是否审核</label>
				<cite>
					<input name="" type="radio" value="" checked="checked" />是&nbsp;&nbsp;&nbsp;&nbsp;
					<input name="" type="radio" value="" />否
				</cite>
			</li>
			<li>
				<label>引用地址</label>
				<input name="" type="text" class="dfinput" value="" /><i class="inputerror">多个关键字用,隔开</i>
			</li>
			
			<li>
				<label>课程</label>
				<select class="dfinput">
					<option>java</option>
					<option>php</option>
					<option>web</option>
				</select>
			</li>
			<li>
				<label>图片</label>
				<div id="divPreview" >
	     			<img id="imgHeadPhoto" src="Images/Headphoto/noperson.jpg" style="width: 160px; height: 170px;border: solid 1px #d2e2e2;" alt="" />
				</div>
				<input type = "file"  onchange = "PreviewImage(this, 'imgHeadPhoto', 'divPreview')" />
			</li>
			<li>
				<label>文章内容</label>
				<textarea name="" cols="" rows="" class="textinput"></textarea>
			</li>
			<li>
				<label>&nbsp;</label>
				<input name="" type="submit" class="btn" value="确认保存"/>
			</li>
		</ul>
	</div>
</form>

<script src="<%=basePath %>js/upload.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jQuery/jquery.js"></script>
</body>
</html>
	