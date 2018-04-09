<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath() + "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="<%=basePath%>"/>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>无标题文档</title>
	<link href="<%=basePath %>css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="place">
	<span>位置：</span>
		<ul class="placeul">
		<li><a href="#">首页</a></li>
		<li><a href="#">模板</a></li>
		<li><a href="#">数据列表</a></li>
	</ul>
</div>
<div class="formbody">
	<div class="formtitle" style="cursor: pointer;" id="formtitle"><span>条件查询</span></div>
	<ul class="forminfo" style="display: none;" id="forminfo">
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
			<label>&nbsp;</label>
			<input name="" type="button" class="btn" value="查询"/>
		</li>
	</ul>
</div>
<div class="rightinfo">
	<div class="tools">
		<ul class="toolbar">
			<li class="click"><span><img src="images/t01.png"/></span>添加</li>
			<li class="click" onclick="toUpdate()"><span><img src="images/t02.png"/></span>修改</li>
			<li><span><img src="images/t03.png"/></span>删除</li>
			<li><span><img src="images/t04.png"/></span>统计</li>
		</ul>
		<ul class="toolbar1">
			<li><span><img src="images/t05.png"/></span>设置</li>
		</ul>
	</div>
	
	<table class="tablelist">
		<thead>
			<tr>
				<th></th>
				<th>编号<i class="sort"><img src="images/px.gif"/></i></th>
				<th>标题</th>
				<th>用户</th>
				<th>籍贯</th>
				<th>发布时间</th>
				<th>是否审核</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input name="id" type="radio" value="1"/></td>
				<td>20130908</td>
				<td>王金平幕僚：马英九声明字字见血 人活着没意思</td>
				<td>admin</td>
				<td>江苏南京</td>
				<td>2013-09-09 15:05</td>
				<td>已审核</td>
			</tr>
			
			<tr>
				<td><input name="id" type="radio" value="2"/></td>
				<td>20130907</td>
				<td>温州19名小学生中毒流鼻血续：周边部分企业关停</td>
				<td>uimaker</td>
				<td>山东济南</td>
				<td>2013-09-08 14:02</td>
				<td>未审核</td>
			</tr>
			
			<tr>
				<td><input name="id" type="radio" value="3"/></td>
				<td>20130906</td>
				<td>社科院:电子商务促进了农村经济结构和社会转型</td>
				<td>user</td>
				<td>江苏无锡</td>
				<td>2013-09-07 13:16</td>
				<td>未审核</td>
			</tr>
			
			<tr>
				<td><input name="id" type="radio" value="4"/></td>
				<td>20130905</td>
				<td>江西&quot;局长违规建豪宅&quot;：局长检讨</td>
				<td>admin</td>
				<td>北京市</td>
				<td>2013-09-06 10:36</td>
				<td>已审核</td>
			</tr>
			
			<tr>
				<td><input name="id" type="radio" value="5"/></td>
				<td>20130904</td>
				<td>中国2020年或迈入高收入国家行列</td>
				<td>uimaker</td>
				<td>江苏南京</td>
				<td>2013-09-05 13:25</td>
				<td>已审核</td>
			</tr>
			
			<tr>
				<td><input name="id" type="radio" value="6"/></td>
				<td>20130903</td>
				<td>深圳地铁车门因乘客拉闸打开 3人被挤入隧道</td>
				<td>user</td>
				<td>广东深圳</td>
				<td>2013-09-04 12:00</td>
				<td>已审核</td>
			</tr>
			
			<tr>
				<td><input name="id" type="radio" value="7"/></td>
				<td>20130902</td>
				<td>33次地表塌陷 村民不敢下地劳作(图)</td>
				<td>admin</td>
				<td>湖南长沙</td>
				<td>2013-09-03 00:05</td>
				<td>未审核</td>
			</tr>
			
			<tr>
				<td><input name="id" type="radio" value="8"/></td>
				<td>20130901</td>
				<td>医患关系：医生在替改革不彻底背黑锅</td>
				<td>admin</td>
				<td>江苏南京</td>
				<td>2013-09-02 15:05</td>
				<td>未审核</td>
			</tr>
			
			<tr>
				<td><input name="id" type="radio" value="9"/></td>
				<td>20130900</td>
				<td>山东章丘公车进饭店景点将自动向监控系统报警</td>
				<td>uimaker</td>
				<td>山东滨州</td>
				<td>2013-09-01 10:26</td>
				<td>已审核</td>
			</tr>
		</tbody>
	</table>
	<div class="pagin">
		<div class="message">共<i class="blue">1256</i>条记录，当前显示第&nbsp;<i class="blue">2&nbsp;</i>页</div>
		<ul class="paginList">
			<li class="paginItem current"><a href="javascript:;">上一页</a></li>
			<li class="paginItem"><a href="javascript:;">下一页</a></li>
		</ul>
	</div>
</div>

<script type="text/javascript" src="<%=basePath %>js/jQuery/jquery.js"></script>
<script type="text/javascript">
	/**
	 * 这个使用的单选框选择判断
	 */
	function toUpdate(){
		var id = $("input[name='id']:checked").val();
		if(!id){
			alert("请选择要操作的记录");
			return false;
		}else{
			alert( "您操作的值为："+$("input[name='id']:checked").val())
		}
	}
	$(function(){
		$('.tablelist tbody tr:odd').addClass('odd');
		
		$("#formtitle").click(function(){
			$("#forminfo").slideToggle("slow");
		});
	});
</script>

</body>
</html>

