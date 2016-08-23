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
<title>Insert title here</title>
<%@include file="/page/head/head.jsp" %>
<!-- <script type="text/javascript" src="style/js/partsStore.js"></script> -->
</head>
<body>
	<div class="panel border_364150 width_980  div_margin_center">
		<form id="searchTerms" action="" method="post" class="margin_0">
			<div class="height_40 background_364150">
				<div class="height_40 float_left background_293846">
					<div class="float_left width_300">
						<input type="text" name="projectNo"
							class="object_search argin_l_15" placeholder="配件名称"> <input
							type="text" name="projectName" class="object_search"
							placeholder="配件型号"> <input type="submit"
							class="input_hide" id="searchButtom">
					</div>
					<span onclick="$('#searchButtom').click()"
						class="table_search_submit">&nbsp;<i
						class="glyphicon glyphicon-search" style="font-size: 18px"></i>&nbsp;
					</span>
				</div>

				<span data-toggle="modal" data-target="#addParts" onclick="addClick()"
					class=" float_right object_addobject" title="新增配件"><i
					class="glyphicon glyphicon-plus-sign"></i>新增配件</span>
			</div>
			<table class="table table-bordered table-hover table-striped">
				<thead>
					<tr>
						<th>配件名称</th>
						<th>类型</th>
						<th>型号</th>
						<th>剩余数量</th>
						<th>位置</th>
						<th>详情</th>
						<th>描述</th>
						<th>编辑操作</th>
					</tr>
				</thead>
				<tbody id="partStore">
				</tbody>
				<tfoot>
					<tr>
						<td colspan="9">
							<button class="btn btn-primary">上一页</button>
							<button class="btn btn-primary">下一页</button>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
		<div style="clear: both"></div>
	</div>


<div class="modal fade" id="addParts" tabindex="-1" role="dialog" >
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h3>新增配件</h3>
			</div>
			<div class="modal-body">
				<div class="form-horizontal">
					<div class="form-group">
						<label for="partsName" class="col-sm-3 control-label">配件名称：</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="partsName" name="partsName" >
						</div>
					</div>
					<div class="form-group">
						<label for=""partsType"" class="col-sm-3 control-label">类型：</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="partsType" name=""partsType"">
						</div>
					</div>
					<div class="form-group">
						<label for="partsNo" class="col-sm-3 control-label">型号：</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="partsNo" name="partsNo">
						</div>
					</div>
					<div class="form-group">
						<label for="partsPosition" class="col-sm-3 control-label">位置：</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="partsPosition" name="partsPosition">
						</div>
					</div>
					<div class="form-group">
						<label for="partsDesc" class="col-sm-3 control-label">描述：</label>
						<div class="col-sm-9">
							<textarea class="form-control" id="partsDesc" name="partsDesc"></textarea>
						</div>
					</div>
				</div>
				<input id="hiddenPartId" type="hidden" >
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" id="confirmAddPartsBtn">确认</button>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="addStore" tabindex="-1" role="dialog" >
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h3>新增库存</h3>
			</div>
			<div class="modal-body">
			<form class="form-horizontal">
				<div class="form-group">
					<label for="addPartDate" class="col-sm-3 control-label">进货日期：</label>
					<div class="col-sm-9">
						<div class="controls">
							<div class="input-prepend input-group">
											<span class="add-on input-group-addon">
												<i class="glyphicon glyphicon-calendar fa fa-calendar">
												</i>
											</span>
								<input type="text" style="width: 200px" name="addPartDate" id="addPartDate" readonly
									class="form-control" value="" />
							</div>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label for="partsNum" class="col-sm-3 control-label">本次进货数量：</label>
					<div class="col-sm-9">
						<input type="email" class="form-control" id="partsNum" placeholder="本次进货数量">
					</div>
				</div>
				<div class="form-group">
					<label for="partsUnit" class="col-sm-3 control-label">进货单价：</label>
					<div class="col-sm-9">
						<input type="email" class="form-control" id="partsUnit" placeholder="进货单价">
					</div>
				</div>
				<div class="form-group">
					<label for="sellUnit" class="col-sm-3 control-label">销售单价：</label>
					<div class="col-sm-9">
						<input type="email" class="form-control" id="sellUnit" placeholder="销售单价">
					</div>
				</div>
				<div class="form-group">
					<label for="description" class="col-sm-3 control-label">描述：</label>
					<div class="col-sm-9">
						<textarea class="form-control width_400 height-auto font-lg" id="description" placeholder="对当前进货的备注信息"></textarea>
					</div>
				</div>
				<input type="hidden" id="parHiddenId" >
			</form>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" id="confirmStore">确认</button>
			</div>
		</div>
	</div>
</div>
</div>

<div class="modal fade" id="showParts" tabindex="-1" role="dialog" >
	<div class="modal-dialog" role="document">
		<div class="modal-content width_700">
			<div class="modal-header">
				<h3>配件信息</h3>
			</div>
			<div class="modal-body">
				<div class="panel panel-default">
					<div class="panel-heading font-16">配件进货信息</div>
					<!-- Table -->
						<table class="table table-striped table-hover table-responsive">
						<thead>
							<th>进货日期</th>
							<th>进货总量</th>
							<th>进货单价</th>
							<th>销售单价</th>
							<th>剩余量</th>
							<th>备注</th>
							<th>编辑</th>
						</thead>
						<tbody id="partStoreTable">
							
						</tbody>
						<tfoot>
							<tr>
								<td colspan="7" >
									<button class="btn btn-primary" >上一页</button>
									<button class="btn btn-primary" >上一页</button>
								</td>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
	$('#addPartDate').datetimepicker({
		language : 'zh-CN',
		format : 'yyyy-mm-dd hh:ii:ss',
		weekStart : 1,
		todayBtn : 1,
		autoclose : 1,
		todayHighlight : 1,
		startView : 2,
		forceParse : 0,
		showMeridian : 1,
		minView : 2
	});
	loadPartsGrid("", "", 0);
	$("#confirmStore").click(function(e){
		confirmStoreClick();
	});
	
});

function loadPartsGrid(partName,partType,currentPage){
	$.ajax({
		type:"POST",
		url:"partsManager/findParts.do",
		data:{
			name:partName,
			type:partType,
			currentPage:currentPage
		},
		dataType:"json",
		success:function(data){
			var content =  "";
			if(data!=null && data.length!=0){
				for(var i=0;i<data.length;i++){
					var part = data[i];
					content = content.concat("<tr><td>"+part.name+"</td><td>"+part.type+"</td><td>"+part.partsNo+"</td><td>"+part.surplusNum+"</td><td>"+part.positions+"</td>"+
							"<td><a href='javascript:void(0)' title='查看进货记录' data-toggle='modal' data-target='#showParts' onclick='findPartsStore("+part.id+")' class='btn-margin_5'>详情</a></td><td>"+part.description+"</td>"+
							"<td><a href='javascript:void(0)' title='增加库存' data-toggle='modal' data-target='#addStore' onclick='addStoreClick("+part.id+")' class='btn-margin_5'><i class='glyphicon glyphicon-plus'></i></a>"+
							"<a href='javascript:void(0)' title='修改' data-toggle='modal' data-target='#addParts' onclick='updateParts("+part.id+")'  class='btn-margin_5'><i class='glyphicon glyphicon-edit'></i></a>"+
							"<a href='javascript:void(0)' title='删除'  onclick='deleteParts("+part.id+",this)' class='btn-margin_5'><i class='glyphicon glyphicon-trash'></i></a></td></tr>");
				}
			}
			$("#partStore").html(content);
		}
	});
}
function confirmAddParts()
{
	if($("#partsName").val()==null || $("#partsName").val()==undefined ||$("#partsName").val()=='')
	{
		alert("配件名称不能为空！");
		return;
	}
	if($("#partsType").val()==null || $("#partsType").val()==undefined ||$("#partsType").val()=='')
	{
		alert("配件类型不能为空！");
		return;
	}
	if($("#partsNo").val()==null || $("#partsNo").val()==undefined ||$("#partsNo").val()=='')
	{
		alert("配件型号不能为空！");
		return;
	}
	var parts ={name:$("#partsName").val(),type:$("#partsType").val(),partsNo:$("#partsNo").val(),positions:$("#partsPosition").val(),description:$("#partsDesc").val()};
	$("#confirmAddPartsBtn").attr("data-dismiss","modal");
	$.ajax({
		type:"POST",
		url:"partsManager/addParts.do",
		dataType:"json",
		data:{
			parts:JSON.stringify(parts)
		},
		success:function(data){
			if(data.result=="success"){
				loadPartsGrid("", "", 0);
			}else{
				alert("添加失败！");
			}
		},
		error:function(error){
			alert("添加出错！");
		}
	});
	
}
//修改配件信息：
function updateParts(partId){
	$("#hiddenPartId").val(partId);
	$("#confirmAddPartsBtn").attr("onclick","confirmUpdateParts()");
	$("#confirmAddPartsBtn").removeAttr("data-dismiss");
	clearParts();
	$.ajax({
		type:"GET",
		url:"partsManager/findParts.do",
		data:{
			id:partId
		},
		dataType:"json",
		success:function(data){
			if(data!=null && data!=undefined && data.length!=0){
				$("#partsName").val(data[0].name);
				$("#partsType").val(data[0].type);
				$("#partsNo").val(data[0].partsNo);
				$("#partsPosition").val(data[0].positions);
				$("#partsDesc").val(data[0].description);
			}
		},
		error:function(error){
			console.info(error);
		}
		
	});
}

function confirmUpdateParts(){
	if($("#partsName").val()==null || $("#partsName").val()==undefined ||$("#partsName").val()=='')
	{
		alert("配件名称不能为空！");
		return;
	}
	if($("#partsType").val()==null || $("#partsType").val()==undefined ||$("#partsType").val()=='')
	{
		alert("配件类型不能为空！");
		return;
	}
	if($("#partsNo").val()==null || $("#partsNo").val()==undefined ||$("#partsNo").val()=='')
	{
		alert("配件型号不能为空！");
		return;
	}
	var parts ={id:$("#hiddenPartId").val(),name:$("#partsName").val(),type:$("#partsType").val(),partsNo:$("#partsNo").val(),positions:$("#partsPosition").val(),description:$("#partsDesc").val()};
	$("#confirmAddPartsBtn").attr("data-dismiss","modal");
	$.ajax({
		type:"POST",
		url:"partsManager/updateParts.do",
		dataType:"json",
		data:{
			parts:JSON.stringify(parts)
		},
		success:function(data){
			if(data.result=="success"){
				loadPartsGrid("", "", 0);
			}else{
				alert("修改失败！");
			}
		},
		error:function(error){
			alert("修改出错！");
		}
	});
}



function addPartsBtn()
{
	clearParts();
}
//清空parts内的值
function clearParts()
{
	$("#partsName").val("");
	$("#partsType").val("");
	$("#partsNo").val("");
	$("#partsPosition").val("");
	$("#partsDesc").val("");
}
//清空库存表单
function clearStore(){
	$("#parHiddenId").val("");
	$("#addPartDate").val("");
	$("#partsNum").val("");
	$("#partsUnit").val("");
	$("#sellUnit").val("");
	$("#description").val("");
}

//点击新增配件
function addClick(){
	clearParts();
	$("#confirmAddPartsBtn").removeAttr("data-dismiss");
	$("#confirmAddPartsBtn").attr("onclick","confirmAddParts()");
}
//点击新增库存：
function addStoreClick(partId){
	clearStore();
	$("#parHiddenId").val(partId);
	$("#confirmStore").removeAttr("data-dismiss");
}
//提交新增库存
function confirmStoreClick(){
	if($("#partsNum").val()==null ||$("#partsNum").val() == undefined || $("#partsNum").val()==""){
		alert("进货数量不能为空！");
		return;
	}
	if($("#partsUnit").val()==null || $("#partsUnit").val()==undefined || $("#partsUnit").val()==""){
		alert("进货单价不能为空！");
		return;
	}
	var createDate = $("#addPartDate").val()==""||$("#addPartDate").val()==undefined?null:$("#addPartDate").val();
	var store={part:{id:$("#parHiddenId").val()},increaseDate:createDate,num:$("#partsNum").val(),unitPrice:$("#partsUnit").val(),sellUnitPrice:$("#sellUnit").val(),description:$("#description").val()};
	$("#confirmStore").attr("data-dismiss","modal");
	$.ajax({
		type:"POST",
		url:"partsManager/addStore.do",
		data:{
			partsStore:JSON.stringify(store)
		},
		dataType:"json",
		success:function(data){
			if(data.result=="success")
			{
				alert("库存添加成功！");
				loadPartsGrid("", "", 0);
			}else
			{
				alert("库存添加失败！");
			}
		},
		error:function(data){
			console.info(data.result);
		}
	});
}

//记录配件进货分页信息
var storeCurrentPage = 0;
//查看进货记录：
function findPartsStore(partsId){
	var store={part:{id:partsId}};
	$.ajax({
		type:"GET",
		url:"partsManager/findPartsStore.do",
		data:{
			partsStore:JSON.stringify(store),
			currentPage:storeCurrentPage
		},
		dataType:"json",
		success:function(data){
			var content = "";
			if(data!=null && data!=undefined && data.length!=0){
				for(var i=0;i<data.length;i++){
					var store = data[i];
					content = content.concat("<tr><td>"+getDate(store.increaseDate)+"</td><td>"+store.num+"</td><td>"+store.unitPrice+"</td><td>"+store.sellUnitPrice+"</td><td>"+store.surplusNum+"</td><td>"+store.description+"</td>"+
							"<td><a onclick='deleteStore("+store.id+",this)'>删除</a></td></tr>");
				}
			}
			$("#partStoreTable").html(content);
		},
		error:function(error){
			console.info(error);
		}
		
	});
}
function deleteParts(partsId, obj) {
	if (confirm("是否确认删除？")) {
		var parts = {id:partsId}
		$.ajax({
			type : "POST",
			url : "partsManager/deleteParts.do",
			data : {
				parts : JSON.stringify(parts)
			},
			dataType : "json",
			success : function(data) {
				if (data.result == "success") {
					alert("删除成功！");
					obj.parentNode.parentNode.parentNode
							.removeChild(obj.parentNode.parentNode);
				} else {
					alert("删除失败！");
				}
			}
		});
	}
}
function deleteStore(storeId, obj) {
	if (confirm("是否确认删除？")) {
		var store={id:storeId}
		$.ajax({
			type : "POST",
			url : "partsManager/deleteStore.do",
			data : {
				partsStore : JSON.stringify(store)
			},
			dataType : "json",
			success : function(data) {
				if (data.result == "success") {
					alert("删除成功！");
					obj.parentNode.parentNode.parentNode
							.removeChild(obj.parentNode.parentNode);
				} else {
					alert("删除失败！");
				}
			}
		});
	}
}
 //日期格式化
   function getDate(date)
   {
   	var s = date.year+"-"+(date.month+1)+"-"+date.day;
   	return s;
   }
</script>
</body>
</html>