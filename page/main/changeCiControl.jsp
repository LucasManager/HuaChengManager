<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
    <head>
        <title>CI日志</title>
    <!-- jsp文件头和头部 -->
	<%@ include file="top.jsp"%>
    </head>
    <body>
       <ol class="breadcrumb">
            <li><a href="picture.jsp"><i class="glyphicon glyphicon-home"></i>&nbsp;首页</a></li>
            <li><a href="javascript:void(0)">后台管理</a></li>
			<li><a href="#">CI变更日志</a></li>
        </ol>
        <div class="panel panel-default width_900  div_margin_center">
            <div class="panel-heading" >
                <h3 class="panel-title">CI变更日志</h3>
            </div>
            <div class="panel-body background_F9F7F6">
                <div class="panel border_364150 width_800  div_margin_center">
                    <form id="searchTerms" class="margin_0" action="findoperationlogs.do" method="post" id="form1">
                    <div class="height_40 background_364150">
                        <div class="height_40 float_left background_293846">
                            <div class="float_left width_560">
                                       	<select id="operation" name="operation" class="object_search argin_l_15">
                                       	<option value="">选择操作类型</option>
                                       	<option value="1">新增</option>
                                       	<option value="2">删除</option>
                                       	<option value="3">修改</option>
                                 	</select>
                                 	<input type="text" name="userid" class="object_search" id="userid" placeholder=" 请输入操作人查找">
                                	<div class="input-group date-picker input-daterange time_div"  data-date="2016/3/3" data-date-format="yyyy/mm/dd">
                                        <input type="text" name="begintime" id="begintime" class="text_time_input" placeholder="&nbsp;开始时间">
                                        <span class="input-group-addon center_span">to</span>
                                        <input type="text" name="endtime" id="endtime" class="text_time_input" placeholder="&nbsp;结束时间">
                                    </div>
                                    <input type="hidden" id="currentPage" name="currentPage" >
                                	<input type="hidden" id="operation" name="operation" >
                                	<input type="hidden" id="userid" name="userid" >
                                	<input type="hidden" id="begintime" name="begintime" >
                                	<input type="hidden" id="endtime" name="endtime" >
                                    <input type="submit" class="input_hide" id="hide_search" onclick="search()">
                            </div>
                            <span  onclick="$('#hide_search').click()" class="table_search_submit">&nbsp;<i class="glyphicon glyphicon-search font_18"></i>&nbsp;</span>
                        </div>
                         </div>
                    <table class="table table-bordered table-hover table-striped" style="width:100%">
                        <thead>
                                                      <tr>
                                <th>操作类型</th>
                                <th>CI名称</th>
                                <th>操作人</th>
                                <th>操作时间</th>
                            </tr>
                        </thead>
                        <tbody>
							<c:forEach items="${logslist}" var="logs">
							<tr>
                                <td>
                                <c:if test="${logs.sOperation == 1}">
									新增
								</c:if>
                                <c:if test="${logs.sOperation == 2}">
									删除
								</c:if>
                                <c:if test="${logs.sOperation == 3}">
									修改
								</c:if>
                                </td>
                                <td>${logs.sCIName}</td>
                                <td>${logs.sCreateUser}</td>
                                <td>${logs.sCreateTime}</td>
                                
                            </tr>
							
							</c:forEach>
                            
                        </tbody>
                        <tfoot>
                            <tr>

                                <td colspan="6">
                                    <%@include file="../menu/page.jsp" %>
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                 </form>
                    <div style="clear:both"></div>
                </div>
            </div>
        </div>
        <!--模态框-->
        
        

        <script>
                            jQuery(document).ready(function () {
                                // initiate layout and plugins
                                Metronic.init(); // init metronic core components
                                Layout.init(); // init current layout
                                Demo.init(); // init demo features
                                ComponentsPickers.init();
                            });
                            
                            $(document).ready(function() {
   			$("#operation").val("${operation}");
   			$("#userid").val("${userid}");
   			$("#begintime").val("${begintime}");
   			$("#endtime").val("${endtime}");
   		});
           
           function search() {
   			$("#operation").val($("#operation").val());
   			$("#userid").val($("#userid").val());
   			$("#begintime").val($("#begintime").val());
   			$("#endtime").val($("#endtime").val());
   			$("#pageindex").val(0);
   			$("#form1").submit();
   		}

                            $('.pagination li>a[name=page]').on('click', function () {
                                $('.pagination li').removeClass('active');
                                var num = Number($(this).html());
                                if (num < 4) {
                                    $(this).parent().addClass('active');
                                } else {
                                    var count_page = 20;
                                    if (num + 3 > count_page) {
                                        var num1 = count_page - 6;
                                    } else {
                                        num1 = num - 3;
                                    }
                                    $.each($('.pagination li>a[name=page]'), function () {
                                        $(this).html(num1++);
                                        if ($(this).html() == num) {
                                            $('.pagination li').removeClass('active');
                                            $(this).parent().addClass('active');
                                        }
                                    })
                                }
                            });

        </script>
    </body>

</html>
