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
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="/style/css/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/style/css/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/style/style/font-awesome.min.css">
<link rel="stylesheet" href="/style/style/table.css">
<link rel="stylesheet" href="/style/style/components.css">
<link rel="stylesheet" href="/style/style/style.min.css">
<script src="/style/css/bootstrap/js/jquery.min.js"></script>
<script src="/style/css/bootstrap/js/bootstrap.min.js"></script>
<script src="/style/css/bootstrap/js/bootstrap-datetimepicker.js"></script>
<script src="/style/css/bootstrap/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="/style/css/bootstrap/js/jquery.PrintArea.js"></script>
   <script>
        function getPrintPage(i) {
            $("#watermark").css("z-index", "-1");
            switch (i) {
                case 1:
                    $("#content").load("/page/printPage/lackPrint.html");
                    break;
                case 2:
                    $("#content").load("/page/printPage/servicePrint.html");
                    break;
            }
        }
        $(document).ready(function () {
            $("#printBtn").click(function (e) {
                $("#watermark").css("z-index", "2");
                $("#printDemo").printArea();
            });
        })
    </script>
</head>
<body>
<div class="container">
    <div class="panel-heading">
        <h1>打印清单</h1>
    </div>
    <div class="panel-body">
        <button class="btn btn-primary col-sm-2" onclick="getPrintPage(1)">缺件表</button>
        <button class="btn btn-primary col-sm-2" onclick="getPrintPage(2)">服务清单</button>
    </div>
    <div class="panel-footer">
        <button class="btn btn-primary" id="printBtn">打印</button>
    </div>

    <div id="printDemo" class="container text-center">
        <div style="z-index:-1;opacity: 0.4;position: absolute;width: 100%;align-content: center" id="watermark">
            <img src="/page/printPage/1.gif">
        </div>
        <div id="content">
        </div>
    </div>

</div>

</body>
</html>