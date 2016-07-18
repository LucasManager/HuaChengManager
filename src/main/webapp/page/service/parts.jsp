<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>库存</title>
	<%@include file="/page/head/head.jsp" %>
</head>
<body>
<div class="height_40"></div>
<div class="panel panel-default width_960  div_margin_center">
	<!--<div class="panel-heading">-->
		<!--<h3 class="panel-title">库存管理</h3>-->
	<!--</div>-->
	<ul class="nav nav-tabs" id="tabs">
		<li role="presentation" class="active"><a href="javascript:void(0);">库存管理</a></li>
		<li role="presentation"><a href="javascript:void(0);">缺件管理</a></li>
	</ul>
	<div class="panel-body background_F9F7F6" id="bb">

	</div>
</div>
	<script>
		$(document).ready(function(){
			//init
			$("#bb").load("page/service/partsStore.jsp");

			$("#tabs li a").click(function(e){
				$(this).parent().parent().find("li").each(function(index,element){
						element.setAttribute("class","");
				});
				if(e.target.text=='库存管理')
				{
					$("#bb").load("page/service/partsStore.jsp");
				}else if(e.target.text=='缺件管理')
				{
					$("#bb").load("page/service/lackParts.jsp");
				}
				$(this).parent().attr("class","active");
			});
		})
	</script>
</body>
</html>