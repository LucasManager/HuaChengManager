<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>人员资源绑定</title>
<%@ include file="top.jsp"%>
</head>
<body>
	<ol class="breadcrumb">
            <li><a href="picture.jsp"><i class="glyphicon glyphicon-home"></i>&nbsp;首页</a></li>
            <li><a href="javascript:void(0)">后台管理</a></li>
			<li><a href="#">人员绑定</a></li>
        </ol>
        <div class="panel panel-default width_900  div_margin_center">
            <div class="panel-heading" >
                <h3 class="panel-title">人员绑定</h3>
            </div>
            <div class="panel-body background_F9F7F6">
                <div class="panel border_364150 width_800  div_margin_center">
                    <div class="height_40 background_364150">
					   <span class=" float_right object_addobject" onclick="del_cheked()"><i class="glyphicon glyphicon-minus-sign"></i>&nbsp;&nbsp;删除多选</span>
					  <span data-toggle="modal" data-target="#myModal" onclick="adduserCI()" class=" float_right object_addobject"><i class="glyphicon glyphicon-plus-sign"></i>&nbsp;&nbsp;添加</span>
                    </div>
                    <table class="table table-bordered table-hover table-striped">
					<thead>
						
						<tr>
							<th class="check_width"><span class="pointer"
								onclick="true_cheked(this)"><input type="checkbox" onclick="$(this).parnet().click()"></span>
							</th>
							<th>资源名</th>
							<th>用户</th>
							<th>说明</th>
							<th class="td_width_200">编辑操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${userCIcategoryList}" var="UserCIcategory">
							<tr>
								<td>
									<input type="checkbox">
								</td>
								<td>
									${UserCIcategory.sCI_name}
									<input type="hidden"  id='${UserCIcategory.sId}userid' value='${UserCIcategory.sUserid}' />
								</td>
								<td>
									${UserCIcategory.sDisplayName}
									<input type="hidden"  id='${UserCIcategory.sId}ciid' value='${UserCIcategory.sCIid}' />
								</td>
								<td>
									${UserCIcategory.sInfo}
									<input type="hidden"  id='${UserCIcategory.sId}info' value='${UserCIcategory.sInfo}' />
								</td>
								<td class="width_btn">
								<a href="javascript:void(0)" title="删除" class="btn-margin_5" data-toggle="modal"  data-target="#delModal"onclick="deluserCI('${UserCIcategory.sId}')"><i class="glyphicon glyphicon-trash"></i></a>
								
								</td>
							</tr>
						</c:forEach>
						
					</tbody>
                    <tfoot>
                        <tr>
                            <td colspan="6">
	                            <form role="form" id="searchTerms" name="searchTerms" action="../../usercicategory/ShowUserCIcategory.do">
									<%@include file="../menu/page.jsp" %>
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
					<h4 class="modal-title" id="myModalLabel"></h4>
				</div>
				<div class="modal-body">
					<div id="add_role">
						<!--添加表单-->
						<form role="form" id="editform" name="editform" action="">
							<div class="form-group add_select_style float_left">
								<label for="resource" class="font-16">资源:</label> <select
									id="ciid" name="ciid" class="form-control">
									<c:forEach items="${CIcategoryList}" var="CIcategory">
										<option value="${CIcategory.sId}">${CIcategory.sCI_name}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group add_select_style float_right">
								<label for="resource_num" class="font-16">人员:</label> <select
									id="userid" name="userid" class="form-control">
									<c:forEach items="${UserList}" var="User">
										<option value="${User.sId}">${User.sId}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group">
								<label for="talk" class="font-16">说明：</label>
								<textarea class="form-control" id="ciinfo" name="ciinfo" rows="5"></textarea>
							</div>
							<input type="hidden" id="userciid" name="userciid"/>
							<input type="submit" class="input_hide" id="add_submit">
						</form>
						<!--添加表单-->
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" class="btn btn-primary"
						onclick="checkuserCI()">提交</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
		<!--模态框-->
	</div>
	
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
	<form id="delform" name="delform"  action="../usercicategory/DeleteUserCIcategory.do">
		<input type="hidden" id="delid" name="delid"/>
		<input type="submit" class="input_hide" id="del_submit">
	</form>
</body>

<script type="text/javascript">
	function adduserCI(){
		$("#myModalLabel").html("添加资源绑定");
		$('#editform').attr("action", "../usercicategory/AddUserCIcategory.do");
	}
	
	function edituserCI(userciid){
		$("#myModalLabel").html("修改资源绑定");
		$("#userciid").val(userciid);
		$("#userid").val($("#" + userciid + "userid").val());
		$("#ciid").val($("#" + userciid + "ciid").val());
		$("#ciinfo").val($("#" + userciid + "info").val());
		$('#editform').attr("action", "../usercicategory/UpdateUserCIcategory.do");
	}
	
	function deluserCI(delid){
		//alert(delid);
		$("#delid").val(delid);
		//$("#del_submit").click();
	}
	
	function checkuserCI(){
		if($("#userciid").val() == ""){
			$.ajax({
				type : "POST",
				url : "../usercicategory/CheckUserCIcategory.do",
				data : {
					userid : $("#userid").val(),
					ciid : $("#ciid").val()
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
</script>

</html>
