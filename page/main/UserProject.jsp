<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>人员项目绑定</title>
<%@ include file="top.jsp"%>
<link href="../stlye/components.css" id="style_components" rel="stylesheet" type="text/css"/>
         
</head>
<body>
	<ol class="breadcrumb">
            <li><a href="picture.jsp"><i class="glyphicon glyphicon-home"></i>&nbsp;首页</a></li>
            <li><a href="javascript:void(0)">后台管理</a></li>
			<li><a href="#">资源绑定</a></li>
        </ol>
        <div class="panel panel-default width_900  div_margin_center">
            <div class="panel-heading" >
                <h3 class="panel-title">资源绑定</h3>
            </div>
            <div class="panel-body background_F9F7F6">
                <div class="panel border_364150 width_800  div_margin_center">
                    <div class="height_40 background_364150">
					   <span class=" float_right object_addobject" onclick="del_cheked()"><i class="glyphicon glyphicon-minus-sign"></i>&nbsp;&nbsp;删除多选</span>
					  <span data-toggle="modal" onclick="adduserproject()" data-target="#myModal" class=" float_right object_addobject"><i class="glyphicon glyphicon-plus-sign"></i>&nbsp;&nbsp;添加</span>
                      </div>
                    <table class="table table-bordered table-hover table-striped">
					<thead>
						
						<tr>
							<th class="check_width"><span class="pointer"
								onclick="true_cheked(this)"><input type="checkbox" onclick="$(this).parent().click()"></span>
							</th>
							<th>项目名</th>
							<th>用户</th>
							<th>说明</th>
							<th class="td_width_200">编辑操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${userProjectlist}" var="UserProject">
							<tr>
								<td>
									<input type="checkbox">
								</td>
								<td>
									${UserProject.sProject_name}
									<input type="hidden"  id='${UserProject.sId}projectid' value='${UserProject.sProjectid}' />
								</td>
								<td>
									${UserProject.sUserid}
									<input type="hidden"  id='${UserProject.sId}userid' value='${UserProject.sUserid}' />
								</td>
								<td>
									${UserProject.sInfo}
									<input type="hidden"  id='${UserProject.sId}info' value='${UserProject.sInfo}' />
								</td>
								<td class="width_btn">
									<a href="javascript:void(0)" data-toggle="modal" onclick="edituserproject('${UserProject.sId}')" data-target="#myModal" title="修改"><i class="glyphicon glyphicon-edit "></i></a>
                                    <a href="javascript:void(0)" title="删除" class="btn-margin_5" data-toggle="modal"  data-target="#delModal" onclick="deluserproject('${UserProject.sId}')"><i class="glyphicon glyphicon-trash"></i></a>
								
								</td>
							</tr>
						</c:forEach>
					</tbody>
                    <tfoot>
                        <tr>
                            <td colspan="6">
	                            <form role="form" id="searchTerms" name="searchTerms" action="../../userproject/ShowUserProject.do">
<%-- 									<%@include file="../menu/page.jsp" %> --%>
								</form>
                            </td>
                        </tr>
                    </tfoot>
				</table>
				
				<div style="clear: both"></div>
			</div>
		</div>
	</div>
	<!--模态框-->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">绑定人员</h4>
				</div>
				<div class="modal-body">
					<div id="add_role">
						<!--添加表单-->
						<form role="form" id="editform" name="editform" action="">
							<div class="form-group add_select_style float_left">
								<label for="resource" class="font-16">人员:</label> <select
									id="userid" name="userid" class="form-control">
									<c:forEach items="${UserList}" var="User">
										<option value="${User.sId}">${User.sId}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group add_select_style float_right">
								<label for="resource_num" class="font-16">项目:</label> <select
									id="projectid" name="projectid" class="form-control">
									<c:forEach items="${ProjectList}" var="Project">
										<option value="${Project.sId}">${Project.sProject_name}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group">
								<label for="talk" class="font-16">说明：</label>
								<textarea class="form-control" id="projectinfo" name="projectinfo" rows="5"></textarea>
							</div>
							<input type="hidden" id="userprojectid" name="userprojectid"/>
							<input type="submit" class="input_hide" id="add_submit">
						</form>
						<!--添加表单-->
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" class="btn btn-primary"
						onclick="checkuserProject()">提交</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
		<!--模态框-->
	</div>
	
		<!--模态框-->
	<div class="modal fade" id="delModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">删除确认</h4>
				</div>
				<div class="modal-body">
					删除后无法还原，是否确认删除？
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary"
						onclick='$("#del_submit").click();'>确认</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
		<!--模态框-->
	</div>
	
	<form id="delform" name="delform"  action="../userproject/DeleteUserProject.do">
		<input type="hidden" id="delid" name="delid"/>
		<input type="submit" class="input_hide" id="del_submit">
	</form>
</body>
<script type="text/javascript">
	//var delid="";
	function adduserproject(){
		$("#myModalLabel").html("添加项目绑定");
		$("#userprojectid").val("");
		$('#editform').attr("action", "../userproject/AddUserProject.do");
	}
	
	function edituserproject(userprojectid){
		$("#myModalLabel").html("修改项目绑定");
		$("#userprojectid").val(userprojectid);
		$("#userid").val($("#"+userprojectid+"userid").val());
		$("#projectid").val($("#"+userprojectid+"projectid").val());
		$("#projectinfo").val($("#"+userprojectid+"info").val());
		$('#editform').attr("action", "../userproject/UpdateUserProject.do");
	}
	
	function checkuserProject(){
		if($("#userprojectid").val() == ""){
			$.ajax({
				type : "POST",
				url : "../userproject/CheckUserProject.do",
				data : {
					userid : $("#userid").val(),
					projectid : $("#projectid").val()
				},
				dataType : "text",
				success : function(data) {
					if(data == "0"){
						$("#add_submit").click();
					}else{
						alert("数据已存在");
					}
				}
			});	
		}else{
			$("#add_submit").click();
		}
	}
	
	function deluserproject(delid){
		$("#delid").val(delid);
		//
	}
</script>
</html>
