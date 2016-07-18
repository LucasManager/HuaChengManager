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
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<%@include file="/page/head/head.jsp" %>
	<link rel="stylesheet" href="style/style/menu.css">
	<style>
    a {
        *blr: expression(this.onFocus=this.blur());
        outline: none !important;
        outline: none;
        text-decoration: none;
    }icon-print
    </style>
</head>
<body>
    <p></p>
    <ul id="menu_list">
        <li>
            <a href="page/service/customer.jsp" target="right" style="">
                <i class="icon-user"></i>
                <span>客户管理</span>
            </a>
        </li>
        <li>
            <a href="page/service/parts.jsp" target="right">
                <i class="icon-truck"></i>
                <span>库存管理</span>
            </a>
        </li>
        <li>
            <a href="../page/service.html" target="right">
                <i class="icon-coffee"></i>
                <span>服务管理</span>
            </a>
        </li>
        <li>
            <a href="../page/print.html" target="right">
                <i class="icon-print"></i>
                <span>票据打印</span>
            </a>
        </li>
    </ul>
    <script>
    $(function() {
        $.each($('#menu_list').children(), function() {
            $(this).css('border-bottom', '1px solid #293846');
        });
        $.each($('#menu_list').find('a'), function() {
            $(this).children().eq(0).css({
                'margin-left': '10px',
                'float': 'left',
                'line-height': '30px',
                'margin-right': '5px'
            });
            $(this).children().eq(1).css({
                'float': 'left',
                'line-height': '30px'
            });
            $(this).children().eq(2).css({
                'float': 'right',
                'margin-right': '10px',
                'line-height': '30px'
            });
            $(this).next('ul').css('display', 'none');
            $(this).hover(function() {
                $(this).css('color', 'white').find('span').css('color', 'white');
                if ($(this).attr('class') != 'active_menu') {
                    $(this).parent().css('background', '#44515D');
                }
            }, function() {
                if ($(this).attr('class') != 'active_menu') {
                    $(this).css('color', '#c4c4c4').find('span').css('color', '#c4c4c4');
                    if ($(this).parent().parent().attr('id') != 'menu_list') {
                        $(this).parent().css('background', '#293846');
                    } else {
                        $(this).parent().css('background', '#364150');
                    }

                } else {
                    $(this).css('color', 'white').find('span').css('color', 'white');
                }
            });
            if ($(this).next('ul').length == 0) {
                $(this).find('span.icon-angle-left').remove();
                $(this).click(function() {
                    $(this).attr('class', 'active_menu');
                    $(this).parent().siblings().find('a').removeClass('active_menu');
                    $(this).parent().siblings().find('ul>li>a').removeClass('active_menu');
                    $(this).parent().parent().prev('a').addClass('active_menu');
                    $(this).parent().parent().parent().siblings().find('a').removeClass('active_menu');
                    $(this).parent().siblings().find('a').css('color', '#c4c4c4').children('span').css('color', '#c4c4c4');
                    $(this).parent().siblings().find('ul>li>a').css('color', '#c4c4c4').children('span').css('color', '#c4c4c4');
                    $(this).parent().parent().prev('a').css('color', 'white').children('span').css('color', 'white');
                    $(this).parent().parent().parent().siblings().find('a').css('color', '#c4c4c4').children('span').css('color', '#c4c4c4');
                    $(this).css('color', 'white').children('span').css('color', 'white');
                    if ($(this).parent().parent().attr('id') != 'menu_list') {
                        $(this).parent().parent().parent().css('background', '#1CAF9A');
                        $(this).parent().parent().parent().siblings().css('background', '#364150');
                        $(this).parent().siblings().css('background', '#293846');
                        $(this).parent().css('background', '#44515D');
                    } else {
                        $(this).parent().css('background', '#1CAF9A');
                        $(this).parent().siblings().css('background', '#364150');
                        $(this).parent().siblings().find('ul>li').css('background', '#293846');
                    }
                })
            };
        });
    });
    </script>
</body>
</html>