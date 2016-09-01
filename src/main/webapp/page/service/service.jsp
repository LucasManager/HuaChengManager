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
<%@include file="/page/head/head.jsp"%>
<style type="text/css">
.myprintContent{
	left: -200px;
}
</style>
</head>
<body>
	<div class="height_40"></div>
	<div class="panel panel-default width_960  div_margin_center">
		<div class="panel-heading">
			<h3 class="panel-title">服务管理</h3>
		</div>
		<div class="panel-body background_F9F7F6">
			<div class="panel border_364150 width_980  div_margin_center">
				<form id="searchTerms" action="" method="post" class="margin_0">
					<div class="height_40 background_364150">
						<div class="height_40 float_left background_293846">
							<div class="float_left">
								<input type="text" id="ppName"
									class="object_search argin_l_15" placeholder="服务名称名称">
								<input type="text" id="ppType" class="object_search"
									placeholder="服务类型"> 
									<input type="text"
									id="pcName" class="object_search" placeholder="客户名称">
								<select class="object_search" id="searchStatus">
									<option value="">当前服务状态</option>
									<option value="0">已完成</option>
									<option value="1">未完成</option>
								</select>
							</div>
							<span  id="searchDataGrid"
								class="table_search_submit">&nbsp;<i
								class="glyphicon glyphicon-search" style="font-size: 18px"></i>&nbsp;
							</span>
						</div>
						<span data-toggle="modal" data-target="#addService"
							id="addProjectBtn" class=" float_right object_addobject"
							title="新增服务"><i class="glyphicon glyphicon-plus-sign"></i>新增服务</span>
					</div>
					<table class="table table-bordered table-hover table-striped">
						<thead>
							<tr>
								<th class="">服务项目</th>
								<th class="">类型</th>
								<th class="">客户名称</th>
								<th class="">车牌号</th>
								<th class="">开始时间</th>
								<th class="">结束时间</th>
								<!-- 								<th class="">是否完成</th> -->
								<th class="">详情</th>
								<th class="">描述</th>
								<th>打印</th>
								<th class="clo-sm-1">编辑操作</th>
							</tr>
						</thead>
						<tbody id="serviceGrid">
							
						</tbody>
						<tfoot>
							<tr>
								<td colspan="10">
									<button class="btn btn-primary">上一页</button>
									<button class="btn btn-primary">下一页</button>
								</td>
							</tr>
						</tfoot>
					</table>
				</form>
				<div style="clear: both"></div>
			</div>
		</div>
	</div>


	<div class="modal fade" id="addService" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3>服务信息</h3>
				</div>
				<div class="modal-body">
					<div class="form-horizontal">
						<div class="form-group">
							<label for="startDate" class="col-sm-3 control-label">服务开始日期：</label>
							<div class="col-sm-9">
								<div class="controls">
									<div class="input-prepend input-group">
										<span class="add-on input-group-addon"> <i
											class="glyphicon glyphicon-calendar fa fa-calendar"> </i>
										</span> <input type="text" style="width: 200px" name="startDate"
											id="startDate" readonly class="form-control myDate" value="" />
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="endDate" class="col-sm-3 control-label">服务结束时间：</label>
							<div class="col-sm-9">
								<div class="controls">
									<div class="input-prepend input-group">
										<span class="add-on input-group-addon"> <i
											class="glyphicon glyphicon-calendar fa fa-calendar"> </i>
										</span> <input type="text" style="width: 200px" name="endDate"
											id="endDate" readonly class="form-control myDate" value="" />
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">客户名：</label>
							<div class="col-sm-7">
								<label type="text" class="form-control" id="cusName"
									name="cusName"></label>
							</div>
							<div class="col-sm-2">
								<button class="btn btn-info" data-toggle="modal"
									data-target="#SearchUser" id="searchUserBtn">查找用户</button>
							</div>
						</div>
						<div class="form-group">
							<label for="projectName" class="col-sm-3 control-label">服务名称：</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="projectName"
									name="projectName">
							</div>
						</div>
						<div class="form-group">
							<label for="projectType" class="col-sm-3 control-label">服务类型：</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="projectType"
									name="projectType">
							</div>
						</div>
						<div class="form-group">
							<label for="mileage" class="col-sm-3 control-label">进场里程：</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="mileage"
									name="mileage">
							</div>
						</div>
						<div class="form-group">
							<label for="customerName" class="col-sm-3 control-label">所需配件：</label>
							<div class="col-sm-9">
								<button class="btn btn-info text-left" data-toggle="modal"
									data-target="#SearchPartsModal" id="searchPartbtn">查找配件</button>
								<table class="table table-hover table-bordered col-lg-3">
									<thead>
										<th class="display-none">配件Id</th>
										<th>配件名称</th>
										<th>型号</th>
										<th>配件个数</th>
										<th>操作</th>
									</thead>
									<tbody id="addPartTable">

									</tbody>
								</table>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">配件总价：</label>
							<div class="col-sm-9">
								<input class="form-control" type="text" id="partsCharge" />
							</div>
						</div>
						<div class="form-group">
							<label for="laborCharge" class="col-sm-3 control-label">工时费用：</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="laborCharge"
									name="laborCharge">
							</div>
						</div>
						<div class="form-group">
							<label for="chargePerson" class="col-sm-3 control-label">维修负责人：</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="chargePerson"
									name="chargePerson">
							</div>
						</div>
						<div class="form-group">
							<label for="description" class="col-sm-3 control-label">描述：</label>
							<div class="col-sm-9">
								<textarea class="form-control" id="description"
									name="description"></textarea>
							</div>
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="conformProject">确认</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="SearchUser" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3>查找用户</h3>
				</div>
				<div class="modal-body">
					<div class="panel-heading">
						<div class="height_40 float_left background_293846 col-sm-12">
							<div class="float_left">
								<input type="text" name="projectNo"
									class="object_search argin_l_15" placeholder="客户手机号"> <input
									type="submit" class="input_hide" id="searchByPhone">
							</div>
							<span onclick="" class="table_search_submit">&nbsp;<i
								class="glyphicon glyphicon-search" style="font-size: 18px"></i>&nbsp;
							</span>
						</div>
					</div>
					<table class="table table-hover">
						<thead>
							<th class="display-none">userId</th>
							<th class="display-none">carId</th>
							<th>用户名</th>
							<th>手机号</th>
							<th>车牌号</th>
						</thead>
						<tbody id="userCarTable">

						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="getUser">确认</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="SearchPartsModal" tabindex="-1"
		role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3>查找配件</h3>
				</div>
				<div class="modal-body">
					<div class="panel-heading">
						<div class="height_40 float_left background_293846 col-sm-12">
							<div class="float_left">
								<input type="text" name="projectNo"
									class="object_search argin_l_15" placeholder="配件名称"> <input
									type="text" name="projectNo" class="object_search argin_l_15"
									placeholder="配件类型"> <input type="submit"
									class="input_hide" id="searchPartsByName">
							</div>
							<span onclick="" class="table_search_submit">&nbsp;<i
								class="glyphicon glyphicon-search" style="font-size: 18px"></i>&nbsp;
							</span>
						</div>
					</div>
					<table class="table table-hover table-bordered">
						<thead>
							<th class="display-none">ID</th>
							<th>配件名称</th>
							<th>配件类型</th>
							<th>配件型号</th>
							<th>进货日期</th>
							<th>单价</th>
							<th>总量</th>
							<th>剩余量</th>
						</thead>
						<tbody id="partsTable">
						</tbody>
					</table>
					<div class="form form-horizontal">
						<div class="form-group">
							<label class="col-sm-3 control-label">配件个数</label>
							<div class="col-sm-9">
								<input class="form-control" id="partNum">
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="confirmAddPart">确认</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="showServiceDetial" tabindex="-1"
		role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content  width_700">
				<div class="modal-header">
					<h3>服务信息</h3>
				</div>
				<div class="modal-body">
					<div class="form-horizontal">
						<div class="form-group">
							<label for="partsType" class="col-sm-3 control-label">客户名称：</label>
							<div class="col-sm-9">
								<label class="form-control" id="sname" ></label>
							</div>
						</div>
						<div class="form-group">
							<label for="partsType" class="col-sm-3 control-label">手机号：</label>
							<div class="col-sm-9">
								<label class="form-control" id="sphone" ></label>
							</div>
						</div>
						<div class="form-group">
							<label for="partsType" class="col-sm-3 control-label">车牌号：</label>
							<div class="col-sm-9">
								<label class="form-control" id="scarNo" ></label>
							</div>
						</div>
						<div class="form-group">
							<label for="partsType" class="col-sm-3 control-label">服务名称：</label>
							<div class="col-sm-9">
								<label class="form-control" id="sserviceName" ></label>
							</div>
						</div>
						<div class="form-group">
							<label for="partsType" class="col-sm-3 control-label">服务类型：</label>
							<div class="col-sm-9">
								<label class="form-control" id="sserviceType" ></label>
							</div>
						</div>
						<div class="form-group">
							<label for="partsType" class="col-sm-3 control-label">使用配件：</label>
							<div class="col-sm-9">
								<table class="table table-hover table-bordered col-lg-3">
									<thead>
										<th class="display-none">配件Id</th>
										<th>配件名称</th>
										<th>型号</th>
										<th>配件个数</th>
									</thead>
									<tbody id="spart">

									</tbody>
								</table>
							</div>
						</div>
						<div class="form-group">
							<label for="partsType" class="col-sm-3 control-label">配件总价格：</label>
							<div class="col-sm-9">
								<label class="form-control" id="spartsPrice" ></label>
							</div>
						</div>
						<div class="form-group">
							<label for="partsType" class="col-sm-3 control-label">工时费：</label>
							<div class="col-sm-9">
								<label class="form-control" id="sloaberPrice" ></label>
							</div>
						</div>
						<div class="form-group">
							<label for="partsType" class="col-sm-3 control-label">开始日期：</label>
							<div class="col-sm-9">
								<label class="form-control" id="sstartDate" ></label>
							</div>
						</div>
						<div class="form-group">
							<label for="partsType" class="col-sm-3 control-label">结束日期：</label>
							<div class="col-sm-9">
								<label class="form-control" id="sendDate" ></label>
							</div>
						</div>
						<div class="form-group">
							<label for="partsType" class="col-sm-3 control-label">负责人：</label>
							<div class="col-sm-9">
								<label class="form-control" id="schargePerson" ></label>
							</div>
						</div>
						<div class="form-group">
							<label for="partsType" class="col-sm-3 control-label">备注：</label>
							<div class="col-sm-9">
								<textarea  class="form-control" id="sdescription" disabled></textarea>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
		<div class="modal fade" id="printArea" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content div_width_1000 myprintContent">
				<div class="modal-header">
					<h3>打印界面</h3>
				</div>
				<div class="modal-body">
					<div id="printDemo" class="container text-center">
						<div
							style="z-index: -1; opacity: 0.4; position: absolute; width: 100%; align-content: center"
							id="watermark">
							<img src="/page/printPage/1.gif">
						</div>
						<div id="content"></div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="printBtn">打印</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	//全局project:
	var project = {};
	var pCustomer={};
	var pCar = {};
	var ppartsStore={};
	var cacheStore={};
	
	function initData(){
		project={};
		pCustomer={};
		pCar={};
		ppartsStore={};
	}
	function clearInput(){
		initData();
		$("#cusName").text("");
		$("#projectType").val("");
		$("#mileage").val("");
		$("#addPartTable").html("");
		$("#partsCharge").val("");
		$("#laborCharge").val("");
		$("#chargePerson").val("");
		$("#description").val("");
		$("#projectName").val("");
		$(".myDate").val("");
	}
	
	
$(document).ready(function(){
	$('.myDate').datetimepicker({
		language:  'zh-CN',
		format:'yyyy-mm-dd hh:ii:ss',
		weekStart: 1,
		todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
		showMeridian: 1,
		minView:2
	});
	$("#searchDataGrid").click(function(e){
		var p = {projectName:$("#ppName").val(),projectType:$("#ppType").val(),customer:{name:$("#pcName").val()},status:$("#searchStatus option:selected").val()};
		loadDataGrid(p,0);	
	});
	loadDataGrid({},0);
	$("#searchUserBtn").click(function(e){
		findCustCar({id:null});
	});
	 $("#getUser").click(function(e){
	        $("#getUser").attr('data-dismiss', '');
	        if(!isEmpty(pCustomer.id) || !isEmpty(pCar.id))
	        {
	            alert("请选中一条记录");
	            return
	        }else {
	            $("#cusName").text(pCustomer.name);
	            $("#getUser").attr('data-dismiss', 'modal');
	        }
	    });
	$("#searchPartbtn").click(function(e){
		findPartsStore({id:null});
	});
	$("#confirmAddPart").click(function(e){
		$("#confirmAddPart").removeAttr("data-dismiss");
		var partsNu = $("#partNum").val()
		if(!isEmpty(partsNu)){
			alert("请输入所需配件个数！")
			return;
		}
		if(!isEmpty(cacheStore.partsName)){
			alert("请选择一条配件信息！")
			return;
		}
		if(eval(partsNu)>eval(cacheStore.surplusNum)){
			alert("配件剩余量不够！")
			return;
		}
		delete cacheStore["surplusNum"];
		cacheStore["useNum"] = partsNu;
		if(ppartsStore[cacheStore.partsStore.id]!=null && ppartsStore[cacheStore.partsStore.id]!=undefined){
			alert("当前的配件以选择，请删除后重新选择！");
			return;
		}
		ppartsStore[cacheStore.partsStore.id] = cacheStore;
		$("#addPartTable").append("<tr><td>"+cacheStore.partsName+"</td><td>"+cacheStore.partsNo+"</td><td>"+cacheStore.useNum+"</td><td><a onclick='deletecache("+cacheStore.partsStore.id+",this)'>删除</a></td></tr>");
		cacheStore = {};
		$("#confirmAddPart").attr("data-dismiss","modal");
	});
	$("#addProjectBtn").click(function(e){
		clearInput();
		$("#conformProject").attr("onclick","saveProject()");
		$("#searchUserBtn").removeAttr("disabled");
		$("#conformProject").removeAttr("data-dismiss");
	});
	
	
	$("#printBtn").click(function (e) {
        $("#printDemo").printArea();
    });
	
})
function deletecache(id,obj){
	try {
		delete ppartsStore[id];
		obj.parentNode.parentNode.parentNode.removeChild(obj.parentNode.parentNode);
		alert("删除成功！");
	} catch (e) {
		alert("删除失败！");
		console.info("删除失败："+e);
	}
}


function findCustCar(customer){
	$("#userCarTable").html("");
	$.ajax({
		method:"GET",
		url:"project/selectCusCar.do",
		data:{
			customer:JSON.stringify(customer),
			currentPage:0
		},
		dataType:"json",
		success:function(data){
			var content = "";
			if(data!=null && data!=undefined && data.length!=0){
				for (var i = 0; i < data.length; i++) {
					var car = data[i];
					content = content.concat("<tr><td class='display-none'>"+car.customer.id+"</td><td class='display-none'>"+car.id+"</td><td>"+car.customer.name+"</td><td>"+car.customer.phone+"</td><td>"+car.carNum+"</td></tr>");
				}
			}
			$("#userCarTable").html(content);
			$("#userCarTable tr").click(function(e){
		        $(this).parent().find("tr").each(function(){
		            $(this).css("background","");
		        });
		        $(this).css("background","#B2C1D6");
		        var mes = $(this).find("td");
		        pCustomer = {id:mes[0].innerHTML,name:mes[2].innerHTML};
		        pCar = {id:mes[1].innerHTML};
		  });
		},
		error:function(error){
			alert("查找用户失败，请重试！");
		}
	});
}

function loadDataGrid(project,currentPage){
	$.ajax({
		method:"GET",
		url:"project/findProject.do",
		data:{
			project:JSON.stringify(project),
			currentPage:currentPage
		},
		dataType:"json",
		success:function(data){
			var content=  "";
			if(data.length!=0){
				for(var i=0;i<data.length;i++){
					var p = data[i];
					content = content.concat("<tr><td>"+p.projectName+"</td><td>"+p.projectType+"</td><td>"+p.customer.name+"</td><td>"+p.car.carNum+"</td>"+
							"<td>"+getDate(p.startDate)+"</td><td>"+getDate(p.endDate)+"</td><td><a data-toggle='modal' data-target='#showServiceDetial' onclick='showService("+p.id+")'>详情</a></td><td>"+p.description+"</td>"+
							"<td><a href='javacript:void(0)' title='打印票据' onclick='popPrint("+p.id+")' data-toggle='modal' data-target='#printArea'> <i class='glyphicon glyphicon-print'></i></a></td>"+
							"<td><a href='javacript:void(0)' title='修改' onclick='updateProject("+p.id+")' data-toggle='modal' data-target='#addService'> <i class='glyphicon glyphicon-edit'></i></a>"+
							"<a href='javacript:void(0)' title='删除' onclick='deleteProject("+p.id+",this)' class='btn-margin_5'><i class='glyphicon glyphicon-trash'></i></td></tr>");
				}
			}
			$("#serviceGrid").html(content);
		},
		error:function(error){
			alert("查询失败,请重试！");
		}
	});
}

function showService(pid){
	$("#searchUserBtn").attr("disabled","disabled");
	$("#conformProject").attr("onclick","ConfirmUpdateProject("+pid+")");
	$("#conformProject").removeAttr("dismiss");
	var p = {id:pid};
	$.ajax({
		url:"project/findProject.do",
		method:"GET",
		data:{
			project:JSON.stringify(p)
		},
		dataType:"json",
		success:function(data){
			if(isEmpty(data) && data.length==1){
				var pp=data[0];
				$("#sname").text(pp.customer.name);
				$("#sphone").text(pp.customer.phone);
				$("#scarNo").text(pp.car.carNum);
				$("#sserviceName").text(pp.projectName);
				$("#sserviceType").text(pp.projectType);
				$("#spartsPrice").text(pp.partsCharge);
				$("#sloaberPrice").text(pp.laborCharge);
				$("#sstartDate").text(getDate(pp.startDate));
				$("#sendDate").text(getDate(pp.endDate));
				$("#schargePerson").text(pp.chargePerson);
				$("#sdescription").text(pp.description);
				var content = "";
				if(isEmpty(pp.useParts) && pp.useParts.length!=0){
					for(var i=0;i<pp.useParts.length;i++){
						var p = pp.useParts[i];
						content =content.concat("<tr><td>"+p.partsName+"</td><td>"+p.partsNo+"</td><td>"+p.useNum+"</td></tr>");
					}
				}
				$("#spart").html(content);
			}		
		}
	});
}

function updateProject(pid){
	clearInput();
	$("#searchUserBtn").attr("disabled","disabled");
	$("#conformProject").attr("onclick","ConfirmUpdateProject("+pid+")");
	$("#conformProject").removeAttr("dismiss");
	var p = {id:pid};
	$.ajax({
		url:"project/findProject.do",
		method:"GET",
		data:{
			project:JSON.stringify(p)
		},
		dataType:"json",
		success:function(data){
			if(isEmpty(data) && data.length==1){
				var pp=data[0];
				$("#startDate").val(getDate(pp.startDate));
				$("#endDate").val(getDate(pp.endDate));
				$("#cusName").text(pp.customer.name);
				$("#projectName").val(pp.projectName);
				$("#projectType").val(pp.projectType);
				$("#mileage").val(pp.mileage);
				$("#partsCharge").val(pp.partsCharge);
				$("#laborCharge").val(pp.laborCharge);
				$("#chargePerson").val(pp.chargePerson);
				$("#description").val(pp.description);
				var content = "";
				if(isEmpty(pp.useParts) && pp.useParts.length!=0){
					for(var i=0;i<pp.useParts.length;i++){
						var p = pp.useParts[i];
						content =content.concat("<tr><td>"+p.partsName+"</td><td>"+p.partsNo+"</td><td>"+p.useNum+"</td><td><a onclick='deleteRemote("+p.id+",this)'>删除</a></td></tr>");
					}
				}
				$("#addPartTable").html(content);
			}		
		}
	});
	
}

function ConfirmUpdateProject(pid){
	if(!isEmpty($("#projectName").val())){
		alert("项目名称不能为空！");
		return;
	}
	var startDate=$("#startDate").val()==""||$("#startDate").val()==undefined?null:$("#startDate").val();
	var endDate=$("#endDate").val()==""||$("#endDate").val()==undefined?null:$("#endDate").val();
	var p={id:pid,useParts:getParts(ppartsStore),
			startDate:startDate,endDate:endDate,
			projectName:$("#projectName").val(),projectType:$("#projectType").val(),mileage:$("#mileage").val(),
			partsCharge:$("#partsCharge").val(),laborCharge:$("#laborCharge").val(),chargePerson:$("#chargePerson").val(),
			description:$("#description").val()};
	$("#conformProject").attr("data-dismiss","modal");
	$.ajax({
		url:"project/updateProject.do",
		method:"POST",
		dataType:"json",
		data:{
			project:JSON.stringify(p)
		},
		success:function(data){
			if(data.result=="success"){
				alert("修改成功！");
				loadDataGrid({},0);
			}
		}
	});
	
	
	
}

function saveProject(){
	if(!isEmpty(pCustomer.id) || !isEmpty(pCar.id)){
		alert("请选则客户！")
		return;
	}
	if(!isEmpty($("#projectName").val)){
		alert("项目名称不能为空！");
		return;
	}
	var startDate=$("#startDate").val()==""||$("#startDate").val()==undefined?null:$("#startDate").val();
	var endDate=$("#endDate").val()==""||$("#endDate").val()==undefined?null:$("#endDate").val();
	var p={customer:pCustomer,car:pCar,useParts:getParts(ppartsStore),
			startDate:startDate,endDate:endDate,
			projectName:$("#projectName").val(),projectType:$("#projectType").val(),mileage:$("#mileage").val(),
			partsCharge:$("#partsCharge").val(),laborCharge:$("#laborCharge").val(),chargePerson:$("#chargePerson").val(),
			description:$("#description").val()};
	$("#conformProject").attr("data-dismiss","modal");
	$.ajax({
		method:"POST",
		url:"project/saveProject.do",
		data:{
			project:JSON.stringify(p)
		},
		dataType:"json",
		success:function(data){
			if(data.result=="success"){
				alert("服务添加成功！");
				loadDataGrid({},0);
			}
			
		}
	})
}

function findPartsStore(partsStore){
	$("#partsTable").html("");
	$("#partNum").val("");
	$.ajax({
		method:"GET",
		url:"partsManager/findPartsStore.do",
		data:{
			partsStore:JSON.stringify(partsStore),
			currentPage:1
		},
		dataType:"json",
		success:function(data){
			var content = "";
			if(data!=null && data!=undefined && data.length!=0){
				for (var i = 0; i < data.length; i++) {
					var c = data[i];
					content = content.concat("<tr><td class='display-none'>"+c.id+"</td><td>"+c.part.name+"</td><td>"+c.part.type+"</td><td>"+c.part.partsNo+"</td><td>"+getDate(c.increaseDate)+"</td><td>"+c.unitPrice+"</td><td>"+c.num+"</td><td>"+c.surplusNum+"</td></tr>");
				}
			}
			$("#partsTable").html(content);
			$("#partsTable tr").click(function(e){
				cacheStore = {};
		        $(this).parent().find("tr").each(function(){
		            $(this).css("background","");
		        });
		        $(this).css("background","#B2C1D6");
		        var mes = $(this).find("td");
		        cacheStore = {partsStore:{id:mes[0].innerHTML},partsName:mes[1].innerHTML,partsType:mes[2].innerHTML,partsNo:mes[3].innerHTML,surplusNum:mes[7].innerHTML};
		  });
		  
			
		},
		error:function(error){
			alert("查找用户失败，请重试！");
		}
	});
}
function deleteRemote(id,obj){
	var pp={id:id};
	$.ajax({
		url: "project/deleteProParts.do",
		type:"POST",
		data: {
			projectParts:JSON.stringify(pp)
        },
        dataType: "json",
        success: function(data) {
            if (data.result == "success") {
                alert("删除成功！");
                obj.parentNode.parentNode.parentNode.removeChild(obj.parentNode.parentNode);
            } else {
                alert(data.result);
            }
        },
        error:function(data){
        	alert(data.result);
        }
	});
}

function deleteProject(projectId, obj) {
	if (confirm("是否确认删除？")) {
		var pp = {id:projectId}
		$.ajax({
			url: "project/deleteProject.do",
			type:"POST",
			data: {
				project:JSON.stringify(pp)
	        },
	        dataType: "json",
	        success: function(data) {
	            if (data.result == "success") {
	                alert("删除成功！");
	                obj.parentNode.parentNode.parentNode.removeChild(obj.parentNode.parentNode);
	            } else {
	                alert(data.result);
	            }
	        },
	        error:function(data){
	        	alert(data.result);
	        }
		});
	}
}

function popPrint(pp){
	$("#content").load("/page/printPage/servicePrint.html");
}

function getDate(date)
{
	if(!isEmpty(date)){
		return "";
	}
	var s = date.year+"-"+(date.month+1)+"-"+date.day+" "+date.hours+":"+date.minutes+":"+date.seconds;
	return s;
}
function isEmpty(data){
	if(data==undefined || data==null || data==''){
		return false;
	}
	return true;
}

function getParts(pstore){
	var parts = [];
	for(var p in pstore)
	{
		parts.push(pstore[p]);	
	}
	return parts;
}

</script>
</body>
</html>