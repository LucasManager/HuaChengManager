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
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Insert title here</title>
	<%@include file="/page/head/head.jsp" %>
</head>
<body>
<div class="height_40"></div>
<div class="panel panel-default width_960  div_margin_center">
    <div class="panel-heading">
        <h3 class="panel-title">客户管理</h3>
    </div>
    <div class="panel-body background_F9F7F6">
        <div class="panel border_364150 width_980  div_margin_center">
            <form id="searchTerms" action="" method="post" class="margin_0">
                <div class="height_40 background_364150">
                    <div class="height_40 float_left background_293846">
                        <div class="float_left width_300">
                            <input type="text" name="projectNo" class="object_search argin_l_15" placeholder="请输入姓名">
                            <input type="text" name="projectName" class="object_search" placeholder=" 请输入手机号">
                            <input type="submit" class="input_hide" id="searchButtom">
                        </div>
                        <span onclick="$('#searchButtom').click()" class="table_search_submit"><i class="glyphicon glyphicon-search" style="font-size:18px"></i></span>
                    </div>

                    <span data-toggle="modal" data-target="#changeobj" onclick="addCustomer();" class=" float_right object_addobject" title="添加客户"><i class="glyphicon glyphicon-plus-sign"></i>添加客户</span>
                </div>
                <table class="table table-bordered table-hover table-striped">
                    <thead>
                    <tr>
                        <!-- <th class="check_width">
                            <span class="pointer" onclick="true_cheked(this)"><input type="checkbox" onclick="$(this).parent().click()"></span>
                        </th> -->
                        <th>姓名</th>
                        <th>手机号</th>
                        <th>地址</th>
                        <th>已提供服务</th>
                        <th>新增时间</th>
                        <th colspan="2">编辑操作</th>
                    </tr>
                    </thead>
                    <tbody id="projectContent">
                    <c:forEach items="${users }" var="user">
                        <tr>
                            <td>张三</td>
                            <td>15555555555</td>
                            <td>
                                西安XX区XX号
                            </td>
                            <td><a>查看所有服务<a></td><td>2016-04-05</td>

                            <td class="td_width_100">
                                <!--                             			data-target="#changeobj" -->
                                <a href="javascript:void(0)" title="修改" data-toggle="modal" data-target="#add_resource"
                                   onclick="findDetailById(${project.iProjectId})"><i class="glyphicon glyphicon-edit "></i></a>
                                <a href="javascript:void(0)" title="删除" onclick="deleteProject()" class="btn-margin_5"><i class="glyphicon glyphicon-trash"></i></a>

                            </td>
                        </tr>

                        <tr>
                            <td>张三</td>
                            <td>15555555555</td>
                            <td>
                                西安XX区XX号
                            </td>
                            <td><a>查看所有服务<a></td><td>2016-04-05</td>
                            <td class="td_width_100">
                                <!--                                        data-target="#changeobj" -->
                                <a href="javascript:void(0)" title="修改" data-toggle="modal" data-target="#changeobj"
                                   onclick="findDetailById(${project.iProjectId})"><i class="glyphicon glyphicon-edit "></i></a>
                                <a href="javascript:void(0)" title="删除" onclick="deleteProject()" class="btn-margin_5"><i class="glyphicon glyphicon-trash"></i></a>

                            </td>
                        </tr>
                        <tr>
                            <td>张三</td>
                            <td>15555555555</td>
                            <td>
                                西安XX区XX号
                            </td>
                            <td><a>查看所有服务<a></td><td>2016-04-05</td>
                            <td class="td_width_100">
                                <!--                                        data-target="#changeobj" -->
                                <a href="javascript:void(0)" title="修改" data-toggle="modal" data-target="#add_resource"
                                   onclick="findDetailById(${project.iProjectId})"><i class="glyphicon glyphicon-edit "></i></a>
                                <a href="javascript:void(0)" title="删除" onclick="deleteProject(${project.iProjectId},this)" class="btn-margin_5"><i class="glyphicon glyphicon-trash"></i></a>

                            </td>
                        </tr>
                        <tr>
                            <td>张三</td>
                            <td>15555555555</td>
                            <td>
                                西安XX区XX号
                            </td>
                            <td><a>查看所有服务<a></td><td>2016-04-05</td>
                            <td class="td_width_100">
                                <!--                                        data-target="#changeobj" -->
                                <a href="javascript:void(0)" title="修改" data-toggle="modal" data-target="#add_resource"
                                   onclick="findDetailById(${project.iProjectId})"><i class="glyphicon glyphicon-edit "></i></a>
                                <a href="javascript:void(0)" title="删除" onclick="deleteProject(${project.iProjectId},this)" class="btn-margin_5"><i class="glyphicon glyphicon-trash"></i></a>

                            </td>
                        </tr>
                        <tr>
                            <td>张三</td>
                            <td>15555555555</td>
                            <td>
                                西安XX区XX号
                            </td>
                            <td><a>查看所有服务<a></td><td>2016-04-05</td>
                            <td class="td_width_100">
                                <!--                                        data-target="#changeobj" -->
                                <a href="javascript:void(0)" title="修改" data-toggle="modal" data-target="#add_resource"
                                   onclick="findDetailById(${project.iProjectId})"><i class="glyphicon glyphicon-edit "></i></a>
                                <a href="javascript:void(0)" title="删除" onclick="deleteProject(${project.iProjectId},this)" class="btn-margin_5"><i class="glyphicon glyphicon-trash"></i></a>

                            </td>
                        </tr>
                        <tr>
                            <td>张三</td>
                            <td>15555555555</td>
                            <td>
                                西安XX区XX号
                            </td>
                            <td><a>查看所有服务<a></td><td>2016-04-05</td>
                            <td class="td_width_100">
                                <!--                                        data-target="#changeobj" -->
                                <a href="javascript:void(0)" title="修改" data-toggle="modal" data-target="#add_resource"
                                   onclick="findDetailById(${project.iProjectId})"><i class="glyphicon glyphicon-edit "></i></a>
                                <a href="javascript:void(0)" title="删除" onclick="deleteProject(${project.iProjectId},this)" class="btn-margin_5"><i class="glyphicon glyphicon-trash"></i></a>

                            </td>
                        </tr>
                        <tr>
                            <td>张三</td>
                            <td>15555555555</td>
                            <td>
                                西安XX区XX号
                            </td>
                            <td><a>查看所有服务<a></td><td>2016-04-05</td>
                            <td class="td_width_100">
                                <!--                                        data-target="#changeobj" -->
                                <a href="javascript:void(0)" title="修改" data-toggle="modal" data-target="#add_resource"
                                   onclick="findDetailById(${project.iProjectId})"><i class="glyphicon glyphicon-edit "></i></a>
                                <a href="javascript:void(0)" title="删除" onclick="deleteProject(${project.iProjectId},this)" class="btn-margin_5"><i class="glyphicon glyphicon-trash"></i></a>

                            </td>
                        </tr>
                        <tr>
                            <td>张三</td>
                            <td>15555555555</td>
                            <td>
                                西安XX区XX号
                            </td>
                            <td><a>查看所有服务<a></td><td>2016-04-05</td>
                            <td class="td_width_100">
                                <!--                                        data-target="#changeobj" -->
                                <a href="javascript:void(0)" title="修改" data-toggle="modal" data-target="#add_resource"
                                   onclick="findDetailById(${project.iProjectId})"><i class="glyphicon glyphicon-edit "></i></a>
                                <a href="javascript:void(0)" title="删除" onclick="deleteProject(${project.iProjectId},this)" class="btn-margin_5"><i class="glyphicon glyphicon-trash"></i></a>

                            </td>
                        </tr>
                        <tr>
                            <td>张三</td>
                            <td>15555555555</td>
                            <td>
                                西安XX区XX号
                            </td>
                            <td><a>查看所有服务<a></td><td>2016-04-05</td>
                            <td class="td_width_100">
                                <!--                                        data-target="#changeobj" -->
                                <a href="javascript:void(0)" title="修改" data-toggle="modal" data-target="#add_resource"
                                   onclick="findDetailById(${project.iProjectId})"><i class="glyphicon glyphicon-edit "></i></a>
                                <a href="javascript:void(0)" title="删除" onclick="deleteProject(${project.iProjectId},this)" class="btn-margin_5"><i class="glyphicon glyphicon-trash"></i></a>

                            </td>
                        </tr>
                        <tr>
                            <td>张三</td>
                            <td>15555555555</td>
                            <td>
                                西安XX区XX号
                            </td>
                            <td><a>查看所有服务<a></td><td>2016-04-05</td>
                            <td class="td_width_100">
                                <!--                                        data-target="#changeobj" -->
                                <a href="javascript:void(0)" title="修改" data-toggle="modal" data-target="#add_resource"
                                   onclick="findDetailById(${project.iProjectId})"><i class="glyphicon glyphicon-edit "></i></a>
                                <a href="javascript:void(0)" title="删除" onclick="deleteProject(${project.iProjectId},this)" class="btn-margin_5"><i class="glyphicon glyphicon-trash"></i></a>

                            </td>
                        </tr>
                        <tr>
                            <td>张三</td>
                            <td>15555555555</td>
                            <td>
                                西安XX区XX号
                            </td>
                            <td><a>查看所有服务<a></td><td>2016-04-05</td>
                            <td class="td_width_100">
                                <!--                                        data-target="#changeobj" -->
                                <a href="javascript:void(0)" title="修改" data-toggle="modal" data-target="#add_resource"
                                   onclick="findDetailById(${project.iProjectId})"><i class="glyphicon glyphicon-edit "></i></a>
                                <a href="javascript:void(0)" title="删除" onclick="deleteProject(${project.iProjectId},this)" class="btn-margin_5"><i class="glyphicon glyphicon-trash"></i></a>

                            </td>
                        </tr>
                        <tr>
                            <td>张三</td>
                            <td>15555555555</td>
                            <td>
                                西安XX区XX号
                            </td>
                            <td><a>查看所有服务<a></td><td>2016-04-05</td>
                            <td class="td_width_100">
                                <!--                                        data-target="#changeobj" -->
                                <a href="javascript:void(0)" title="修改" data-toggle="modal" data-target="#add_resource"
                                   onclick="findDetailById(${project.iProjectId})"><i class="glyphicon glyphicon-edit "></i></a>
                                <a href="javascript:void(0)" title="删除" onclick="deleteProject(${project.iProjectId},this)" class="btn-margin_5"><i class="glyphicon glyphicon-trash"></i></a>

                            </td>
                        </tr>
                        <tr>
                            <td>张三</td>
                            <td>15555555555</td>
                            <td>
                                西安XX区XX号
                            </td>
                            <td><a>查看所有服务<a></td><td>2016-04-05</td>
                            <td class="td_width_100">
                                <!--                                        data-target="#changeobj" -->
                                <a href="javascript:void(0)" title="修改" data-toggle="modal" data-target="#add_resource"
                                   onclick="findDetailById(${project.iProjectId})"><i class="glyphicon glyphicon-edit "></i></a>
                                <a href="javascript:void(0)" title="删除" onclick="deleteProject(${project.iProjectId},this)" class="btn-margin_5"><i class="glyphicon glyphicon-trash"></i></a>

                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                    <tfoot>
                    <tr>
                        <td colspan="6">
                            <button class="btn btn-primary">上一页</button>
                            <button class="btn btn-primary">下一页</button>
                        </td>
                    </tr>
                    </tfoot>
                </table>
            </form>
            <div style="clear:both"></div>
        </div>
    </div>
</div>
<!--模态框 添加客户-->
<div class="modal fade" id="changeobj" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    新增客户
                </h4>
            </div>
            <div class="modal-body">
                <div>
                    <!--添加表单-->
                    <form role="form" id="project_id" action="" class="form-horizontal" >
                        <div class="form-group">
                            <label for="customerName" class="col-sm-3 control-label">客户名称：</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="customerName" name="customerName" onkeyup="keyup(this);">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="customerName" class="col-sm-3 control-label"> 手机号：</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="customerName" name="customerName" onkeyup="keyup(this);">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="customerName" class="col-sm-3 control-label">客户地址：</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="customerName" name="customerName" onkeyup="keyup(this);">
                            </div>
                        </div>
                        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#addCar"  >添加车辆</button>
                        <div class="">

                            <table class="table table-bordered table-hover table-striped font-16">
                                <thead class="" style="font-size: 18"><h4>车辆信息</h4></thead>
                                <tr>
                                    <td>车牌号</td>
                                    <td>型号</td>
                                    <td>颜色</td>
                                    <td>进场里程</td>
                                    <td>车架识别码</td>
                                    <td>描述</td>
                                </tr>
                                <tbody class="">
                                    <tr>
                                        <td>沪123ABC</td>
                                        <td>308</td>
                                        <td>红色</td>
                                        <td>123213213</td>
                                        <td>fdafdasfdsa</td>
                                        <td>描述。。。。</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <!--<div class="form-group form-inline">-->
                            <!--<label for="name" class="font-16">手机号:</label>-->
                            <!--<input type="text" class="form-control" id="upt_projectName" name="sProjectName" placeholder="请输入项目名称" onkeyup="keyup(this);">-->
                        <!--</div>-->
                        <!--<div class="form-group">-->
                            <!--<label for="object_talk" class="font-16">项目描述:</label>-->
                            <!--<textarea class="form-control" id="upt_projectDescribe" name="sDescribe" rows="3"></textarea>-->
                        <!--</div>-->
                        <!--<div class="form-group add_select_style float_left">-->
                            <!--<label for="upt_checkService" class="font-16">选择服务器:</label>-->
                            <!--<select id="upt_checkService" name="server" class="form-control">-->
                                <!--<option value="0">未选择</option>-->
                                <!--<c:forEach items="${Services }" var="service">-->
                                    <!--<option value="${service.serverId }">${service.name }</option>-->
                                <!--</c:forEach>-->
                            <!--</select>-->
                        <!--</div>-->
                        <!--<div class="form-group add_select_style float_left">-->
                            <!--<label style="margin-left: 10%;" for="upt_status" class="font-16">项目状态:</label>-->
                            <!--<select style="margin-left: 10%;" id="upt_status" name="status" class="form-control">-->
                                <!--<option value="0">未选择</option>-->
                                <!--<option value="1">正常</option>-->
                                <!--<option value="2">完结</option>-->
                                <!--<option value="3">删除</option>-->
                            <!--</select>-->
                        <!--</div>-->
                        <!-- 添加开始时间 -->
                        <!--<label style="margin-top: 20px;">开始时间：</label>-->
                        <!--<div class="input-group input-medium date date-picker" data-date="2016-3-16" data-date-format="yyyy/mm/dd" data-date-viewmode="years">-->
                            <!--<input id="startDate" name="startDate" type="text" class="form-control" readonly> <span class="input-group-btn">-->
									<!--<button class="btn default" type="button">-->
                                        <!--<i class="fa fa-calendar"></i>-->
                                    <!--</button>-->
								<!--</span>-->
                        <!--</div>-->
                        <!--<input type="submit" class="input_hide" id="change_obj">-->
                    </form>
                    <!--添加表单-->
                </div>
                <div style="clear: both"></div>
            </div>
            <div class="modal-footer">
                <button id="form_submit" type="button" class="btn btn-primary" onclick="beforeSubmit();">
                    <!-- $('#change_obj').click(); -->
                    提交添加
                </button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal -->
    <!--模态框-->
</div>

<!-- 增加车辆 -->
<div class="modal fade" id="addCar" tabindex="-1" role="dialog" >
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3>添加车辆</h3>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                <div class="form-group">
                    <label for="customerName" class="col-sm-3 control-label">车牌号：</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="carNum" name="carNum" >
                    </div>
                </div>
                <div class="form-group">
                    <label for="customerName" class="col-sm-3 control-label"> 型号：</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="carType" name="carType" >
                    </div>
                </div>
                <div class="form-group">
                    <label for="customerName" class="col-sm-3 control-label">颜色：</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="carColor" name="carColor">
                    </div>
                </div>
                <div class="form-group">
                    <label for="customerName" class="col-sm-3 control-label">进场里程：</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="mileage" name="mileage">
                    </div>
                </div>
                <div class="form-group">
                    <label for="customerName" class="col-sm-3 control-label">车架识别码：</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="vin" name="vim">
                    </div>
                </div>
                <div class="form-group">
                    <label for="customerName" class="col-sm-3 control-label">描述：</label>
                    <div class="col-sm-9">
                        <textarea class="form-control" id="carDesc" name="carDesc"></textarea>
                    </div>
                </div>
            </div>
            </form>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary">确认</button>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
    var currentProjectId = 0;
    $(document).ready(function() {

    });


    function findDetailById(projectId) {

    }
    //添加项目
    function addCustomer() {

    }

    function deleteProject(projectId, obj) {
        if (confirm("是否确认删除？")) {
            $.ajax({
                type: "POST",
                url: "deleteProjectById.do",
                data: {
                    projectId: projectId
                },
                dataType: "json",
                success: function(data) {
                    if (data.success == "success") {
                        alert("删除成功！");
                        obj.parentNode.parentNode.parentNode.removeChild(obj.parentNode.parentNode);
                    } else {
                        alert("删除失败！");
                    }
                }
            });
        }
    }

    function check_resource(projectId) {

    }
    //条件查询
    function searchProjectList() {
        var terms = $("#searchTerms");
        terms.attr("action", "searchProjectList.do");
        $.ajax({
            type: "POST",
            url: "searchProjectList.do",
            data: $("#searchTerms").serialize(),
            dataType: "json",
            success: function(data) {
                var projectList = data.projectList;
                var projectTable = $("#projectContent");
                projectTable.empty();
                for (var i = 0; i < projectList.length; i++) {
                    var appendStr = "";
                    appendStr += "<tr><td><input type='checkbox'></td>";
                    appendStr += "<td>" + projectList[i].sProjectNo + "</td>";
                    appendStr += "<td>" + projectList[i].sProjectName + "</td>";
                    if (projectList[i].status == 1) {
                        appendStr += "<td>正常</td>";
                    } else if (projectList[i].status == 2) {
                        appendStr += "<td>完结</td>";
                    } else {
                        appendStr += "<td>未设置</td>";
                    }
                    appendStr += "<td>" + projectList[i].sDescribe + "</td>";
                    appendStr += "<td class='td_width_100'>";
                    appendStr += "<span class='btn btn-primary btn-margin' data-toggle='modal'  onclick='findDetailById(" + projectList[i].iProjectId + ")'>修改</span>";
                    appendStr += "<span class='btn btn-primary btn-margin' data-toggle='modal' data-target='#add_resource' onclick='check_resource(" + projectList[i].iProjectId + ")'>资源设置</span>";
                    appendStr += "<span class='btn btn-danger btn-margin' onclick='deleteProject()'>删除</span></td></tr>";
                    projectTable.append(appendStr);
                }
            }
        });
    }
    //分页
    function skippage(page) {
        if (page != '${curpage}') {
            $("#pageindex").val(page);
            $("#searchTerms").submit();
        }
    }
    //表单校验
    function beforeSubmit() {

    }

    function keyup(o) {

    }
</script>
</body>
</html>