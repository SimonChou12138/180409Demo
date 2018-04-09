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
		<li><a href="#">闲置信息管理</a></li>
		<li><a href="#">录入闲置信息</a></li>
	</ul>
</div>

<form action="AddIdleServlet" method="post" enctype="multipart/form-data"><!-- 表单链接 与 请求方式可选（post）和（get） -->
	<div class="formbody">
		<div class="formtitle"><span>闲置信息</span></div>
		<ul class="forminfo">
			<li>
				<label>闲置物品名称</label>
				<input name="name" type="text" class="dfinput" />
				<i>名称不能超过20个字符</i>
			</li>
			<li>
				<label>物品图片</label>
				<div id="divPreview" >
	     			<img id="imgHeadPhoto" src="Images/Headphoto/noperson.jpg" style="width: 160px; height: 170px;border: solid 1px #d2e2e2;" alt="" />
				</div>
				<input name="idleimg" type = "file"  onchange = "PreviewImage(this, 'imgHeadPhoto', 'divPreview')" />
			</li>
			
			<li>
				<label>物品介绍</label>
				<textarea name="presentation" cols="" rows="" class="textinput"></textarea>
			</li>
			
			<li>
				<label>计量单位</label>
				<input name="unit" type="text" class="dfinput" />
				<i></i>
			</li>
			<li>
				<label>数量</label>
				<input name="amount" type="text" class="dfinput" />
				<i></i>
			</li>
			<li>
				<label>闲置所在地</label>
				<input name="location" type="text" class="dfinput" />
				<i></i>
			</li>
			<li>
				<label>购买时间</label>
				<input name="purchasing_date" type="text" class="dfinput" />
				<i></i>
			</li>
			<li>
				<label>购买价格</label>
				<input name="original_price" type="text" class="dfinput" />
				<i></i>
			</li>
			<li>
				<label>转让价格</label>
				<input name="transfer_price" type="text" class="dfinput" />
				<i></i>
			</li>
			<li>
				<label>交易方式</label>
				<select name="transfer_mode" class="dfinput">
					<option>线上交易</option>
					<option>线下交易</option>
				</select>
			</li>
			
			<li>
				<label>成色</label>
				<select name="percentage" class="dfinput">
					<option>全新</option>
					<option>八成新</option>
					<option>半成新</option>
				</select>
			</li>
			
			<li>
				<label>所属类别</label>
				<select name="fk_idletype" class="dfinput">
					<option value="1">闲置数码</option>
					<option value="2">闲置母婴</option>
					<option value="3">家居日用</option>
					<option value="4">影音家电</option>
				</select>
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
	