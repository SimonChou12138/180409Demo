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
		<li><a href="#">关键词管理</a></li>
		<li><a href="#">关键词列表</a></li>
	</ul>
</div>
<div class="formbody">
	<div class="formtitle" style="cursor: pointer;" id="formtitle"><span>录入关键词</span></div>
	<ul class="forminfo" style="display: none;" id="forminfo">
		<li>
			<label>关键词</label>
			<input id="keywords" name="" type="text" class="dfinput" />
			<i>关键词不能超过10个字</i>
		</li>
		<li>
			<label>&nbsp;</label>
			<input name="" onclick="saveKeyWorld()" type="button" class="btn" value="添加"/>
		</li>
	</ul>
</div>
<div class="rightinfo">
	<div class="tools">
		<ul class="toolbar">
			<li class="click"><span><img src="images/t01.png"/></span>添加</li>
			<li class="click" onclick="toUpdate()"><span><img src="images/t02.png"/></span>修改</li>
			<li class="click" onclick="deleteKeyWords()"><span><img src="images/t03.png"/></span>删除</li>
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
				<th>关键词</th>
				<th>创建时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id='tb'>

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
<script>
	$(function(){
		$.ajax({
			url:"KeyWorldServlet",
			type:'post',
			success:function(data){
				ajax_return(data);
			},
			error:function(){
				alert('请求失败')
			},
			dataType:'json'
		});
	});
	
	function saveKeyWorld(){
		var keywords = $('#keywords').val();
		if(keywords.length<10){
			$.ajax({
				url:'AddKeyWords',
				data:'keywords='+keywords,
				dataType:'json',
				success:function(data){
					ajax_return(data);
				},
				error:function(){
					alert('请求失败')
				}
			});
		}else{
			alert('长度不能超过10')
		}
	}
	function ajax_return(data){
		var str = "";
				for(var i = 0 ; i < data.length ; i++){
					str +=
					"<tr>"+
						"<td><input name='id' type='radio' value='"+data[i].id+"'/></td>"+
						"<td>"+data[i].id+"</td>"+
						"<td>"+data[i].keywords+"</td>"+
						"<td>"+data[i].createtime+"</td>"+
						"<td>操作</td>"
					"</tr>"
				}
				$('#tb').html(str);
	}
	function deleteKeyWords(){
		var id = $("input[name='id']:checked").val();
		if(!id){
			alert("请选择要操作的记录");
			return false;
		}else{
		//把当前行id异步传递到后台进行删除
			$.ajax({
				url:'DeleteKeyWord',
				data:'id='+id,
				dataType: "json",
				success:function(data){
					ajax_return(data);
				},
				error:function(){
					alert('请求失败')
				}
			});
		}
	}
</script>
</body>
</html>

