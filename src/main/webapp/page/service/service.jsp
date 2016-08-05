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
	<%@include file="/page/head/head.jsp" %>
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
							<input type="text" name="projectNo" class="object_search argin_l_15" placeholder="服务名称名称">
							<input type="text" name="projectName" class="object_search" placeholder="服务类型">
							<input type="text" name="projectName" class="object_search" placeholder="客户名称">
							<input type="submit" class="input_hide" id="searchButtom">
						</div>
						<span onclick="$('#searchButtom').click()" class="table_search_submit">&nbsp;<i class="glyphicon glyphicon-search" style="font-size:18px"></i>&nbsp;</span>
					</div>

					<span data-toggle="modal" data-target="#addService" class=" float_right object_addobject" title="新增服务"><i class="glyphicon glyphicon-plus-sign"></i>新增服务</span>
				</div>
				<table class="table table-bordered table-hover table-striped">
					<thead>
					<tr>
						<th  class="">服务项目</th>
						<th class="">类型</th>
						<th class="">客户名称</th>
						<th class="">车牌号</th>
						<th class="">开始时间</th>
						<th class="">结束时间</th>
						<th class="">是否完成</th>
						<th class="">详情</th>
						<th class="">描述</th>
						<th colspan="2"  class="clo-sm-1">编辑操作</th>
					</tr>
					</thead>
					<tbody id="">
					<tr>
						<td>配件换取</td>
						<td>换件</td>
						<th>张三</th>
						<td>2016-06-12</td>
						<td>2016-06-12</td>
						<td>已完成</td>
						<td>ffff</td>
						<td><a href="javascript:void(0)" data-toggle="modal" data-target="#showServiceDetial"  onclick="" class="btn-margin_5">详情</a></td>
						<td><a href="javascript:void(0)" data-toggle="modal" data-target="#showServiceDetial"  onclick="" class="btn-margin_5">详情</a></td>
						<td>
							<a href="javascript:void(0)" title="修改" data-toggle="modal" data-target="#addStore" ><i class="glyphicon glyphicon-edit "></i></a>
							<a href="javascript:void(0)" title="删除" onclick="deleteProject()" class="btn-margin_5"><i class="glyphicon glyphicon-trash"></i></a>
						</td>
					</tr>
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
			<div style="clear:both"></div>
		</div>
	</div>
</div>


<div class="modal fade" id="addService" tabindex="-1" role="dialog" >
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h3>新增服务</h3>
			</div>
			<div class="modal-body">
				<div class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-3 control-label">客户名：</label>
						<div class="col-sm-7">
							<label type="text" class="form-control" id="cusName" name="CusName" ></label>
						</div>
						<div class="col-sm-2">
							<button class="btn btn-info" data-toggle="modal" data-target="#SearchUser" id="searchUserBtn" >查找用户</button>
						</div>
					</div>
					<div class="form-group">
						<label for="projectType" class="col-sm-3 control-label">服务类型：</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="projectType" name="projectType">
						</div>
					</div>
					<div class="form-group">
						<label for="mileage" class="col-sm-3 control-label">进场里程：</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="mileage" name="mileage">
						</div>
					</div>
					<div class="form-group">
					<label for="customerName" class="col-sm-3 control-label">所需配件：</label>
					<div class="col-sm-9">
					<button class="btn btn-info text-left" data-toggle="modal" data-target="#SearchPartsModal" id="searchParts" >查找配件</button>
					<table class="table table-hover table-bordered col-lg-3">
						<thead>
							<th class="display-none">配件Id</th>
							<th>配件名称</th>
							<th>配件个数</th>
						</thead>
						<tbody>
							<tr>
								<td class="display-none">1</td>
								<td>配件1</td>
								<td >3</td>
							</tr>
							<tr>
								<td class="display-none">1</td>
								<td>配件1</td>
								<td >3</td>
							</tr>

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
							<input type="text" class="form-control" id="laborCharge" name="laborCharge">
						</div>
					</div>
					<div class="form-group">
						<label for="chargePerson" class="col-sm-3 control-label">维修负责人：</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="chargePerson" name="chargePerson">
						</div>
					</div>
					<div class="form-group">
						<label for="description" class="col-sm-3 control-label">描述：</label>
						<div class="col-sm-9">
							<textarea class="form-control" id="description" name="description"></textarea>
						</div>
					</div>
				</div>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary">确认</button>
			</div>
		</div>
	</div>
</div>



<div class="modal fade" id="addStore" tabindex="-1" role="dialog" >
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h3>修改服务信息</h3>
			</div>
			<div class="modal-body">
				<div class="form-horizontal">
					<div class="form-group">
						<label for="addPartDate" class="col-sm-3 control-label">服务开始日期：</label>
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
						<label for="addPartDate" class="col-sm-3 control-label">服务结束时间：</label>
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
						<label for="partsType" class="col-sm-3 control-label">服务名称：</label>
						<div class="col-sm-9">
							<input type="email" class="form-control" id="" placeholder="服务名称">
						</div>
					</div>
					<div class="form-group">
						<label for="partsType" class="col-sm-3 control-label">服务类型：</label>
						<div class="col-sm-9">
							<input type="email" class="form-control" id="" placeholder="服务类型">
						</div>
					</div>
					<div class="form-group">
						<label for="customerName" class="col-sm-3 control-label">所需配件：</label>
						<div class="col-sm-9">
							<button class="btn btn-info text-left" data-toggle="modal" data-target="#SearchPartsModal" id="searchParts" >新增配件</button>
							<table class="table table-hover table-bordered col-lg-3">
								<thead>
								<th class="display-none">配件Id</th>
								<th>配件名称</th>
								<th>配件个数</th>
								</thead>
								<tbody>
								<tr>
									<td class="display-none">1</td>
									<td>配件1</td>
									<td >3</td>
								</tr>
								<tr>
									<td class="display-none">1</td>
									<td>配件1</td>
									<td >3</td>
								</tr>

								</tbody>
							</table>
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">配件总价：</label>
						<div class="col-sm-9">
							<input type="email" class="form-control" id="inputEmail3" placeholder="配件总价">
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">其他费用：</label>
						<div class="col-sm-9">
							<input type="email" class="form-control" id="inputEmail3" placeholder="其他费用">
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">负责人：</label>
						<div class="col-sm-9">
							<input type="email" class="form-control" id="inputEmail3" placeholder="负责人">
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">描述：</label>
						<div class="col-sm-9">
							<textarea class="form-control width_400 height-auto font-lg" id="inputEmail3" placeholder="对当前进货的备注信息"></textarea>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary">确认</button>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="showParts" tabindex="-1" role="dialog" >
	<div class="modal-dialog" role="document">
		<div class="modal-content">
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
						<th>型号</th>
						<th>进货单价</th>
						<th>进货总价</th>
						<th>总量</th>
						<th>剩余量</th>
						<th>备注</th>
						</thead>
						<tbody>
						<tr>
							<td class="col-sm-2">2016-06-11</td>
							<td class="col-sm-2">XNP0001</td>
							<td class="col-sm-1">23.1</td>
							<td class="col-sm-1">10000</td>
							<td class="col-sm-1">200</td>
							<td class="col-sm-1">50</td>
							<td class="col-sm-4">备注信息备注信息备注信息备注信息备注信息</td>
						</tr>
						<tr>
							<td class="col-sm-2">2016-06-11</td>
							<td class="col-sm-2">XNP0001</td>
							<td class="col-sm-1">23.1</td>
							<td class="col-sm-1">10000</td>
							<td class="col-sm-1">200</td>
							<td class="col-sm-1">50</td>
							<td class="col-sm-4">备注信息</td>
						</tr>
						<tr>
							<td class="col-sm-2">2016-06-11</td>
							<td class="col-sm-2">XNP0001</td>
							<td class="col-sm-1">23.1</td>
							<td class="col-sm-1">10000</td>
							<td class="col-sm-1">200</td>
							<td class="col-sm-1">50</td>
							<td class="col-sm-4">备注信息</td>
						</tr>
						<tr>
							<td class="col-sm-2">2016-06-11</td>
							<td class="col-sm-2">XNP0001</td>
							<td class="col-sm-1">23.1</td>
							<td class="col-sm-1">10000</td>
							<td class="col-sm-1">200</td>
							<td class="col-sm-1">50</td>
							<td class="col-sm-4">备注信息</td>
						</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary">确认</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="SearchUser" tabindex="-1" role="dialog" >
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h3>查找用户</h3>
			</div>
			<div class="modal-body">
				<div class="panel-heading">
					<div class="height_40 float_left background_293846 col-sm-12">
						<div class="float_left">
							<input type="text" name="projectNo" class="object_search argin_l_15" placeholder="客户手机号">
							<input type="submit" class="input_hide" id="searchByPhone">
						</div>
						<span onclick="" class="table_search_submit">&nbsp;<i class="glyphicon glyphicon-search" style="font-size:18px"></i>&nbsp;</span>
					</div>
				</div>
				<table class="table table-hover" >
					<thead>
						<th  class="display-none">ID</th>
						<th>用户名</th>
						<th>手机号</th>
						<th>车牌号</th>
						<th>地址</th>
					</thead>
					<tbody id="userTable">
						<tr>
							<td class="display-none">1</td>
							<td>张三1</td>
							<td>15900975555</td>
							<td>鲁AXXXX</td>
							<td>咸阳城</td>
						</tr>
						<tr>
							<td class="display-none">2</td>
							<td>张三2</td>
							<td>15900975555</td>
							<td>豫AXXXX</td>
							<td>咸阳城</td>
						</tr>
						<tr>
							<td class="display-none">3</td>
							<td>张三3</td>
							<td>15900975555</td>
							<td>沪AXXXX</td>
							<td>咸阳城</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" id="getUser" >确认</button>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="SearchPartsModal" tabindex="-1" role="dialog" >
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h3>查找配件</h3>
			</div>
			<div class="modal-body">
				<div class="panel-heading">
					<div class="height_40 float_left background_293846 col-sm-12">
						<div class="float_left">
							<input type="text" name="projectNo" class="object_search argin_l_15" placeholder="配件名称">
							<input type="text" name="projectNo" class="object_search argin_l_15" placeholder="配件类型">
							<input type="submit" class="input_hide" id="searchPartsByName">
						</div>
						<span onclick="" class="table_search_submit">&nbsp;<i class="glyphicon glyphicon-search" style="font-size:18px"></i>&nbsp;</span>
					</div>
				</div>
				<table class="table table-hover table-bordered"  >
					<thead>
						<th style="display: none">ID</th>
						<th>配件名称</th>
						<th>配件类型</th>
						<th>配件型号</th>
						<th>进货日期</th>
						<th>单价</th>
						<th>总量</th>
						<th>剩余量</th>
					</thead>
					<tbody id="userTable">
						<tr>
							<td style="display: none">1</td>
							<td>配件1</td>
							<td>添加类</td>
							<td>NX911</td>
							<td>2016-03-01</td>
							<td>120元</td>
							<td>1000</td>
							<td>30</td>
						</tr>
						<tr>
							<td style="display: none">1</td>
							<td>配件1</td>
							<td>添加类</td>
							<td>NX911</td>
							<td>2016-03-01</td>
							<td>130元</td>
							<td>1000</td>
							<td>30</td>
						</tr>
					</tbody>
				</table>
				<div class="form form-horizontal">
					<div class="form-group">
						<label class="col-sm-3 control-label">配件个数</label>
						<div class="col-sm-9">
							<input class="form-control">
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal" id="" >确认</button>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="showServiceDetial" tabindex="-1" role="dialog" >
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h3>张三 服务器信息信息</h3>
			</div>
			<div class="modal-body">
				<div class="form-horizontal">
					<div class="form-group">
						<label for="partsType" class="col-sm-3 control-label">客户名称：</label>
						<div class="col-sm-9">
							<label class="form-control" id="" placeholder=""></label>
						</div>
					</div>
					<div class="form-group">
						<label for="partsType" class="col-sm-3 control-label">手机号：</label>
						<div class="col-sm-9">
							<label class="form-control" id="" placeholder=""></label>
						</div>
					</div>
					<div class="form-group">
						<label for="partsType" class="col-sm-3 control-label">车牌号：</label>
						<div class="col-sm-9">
							<label class="form-control" id="" placeholder=""></label>
						</div>
					</div>
					<div class="form-group">
						<label for="partsType" class="col-sm-3 control-label">车辆颜色：</label>
						<div class="col-sm-9">
							<label class="form-control" id="" placeholder=""></label>
						</div>
					</div>
					<div class="form-group">
						<label for="partsType" class="col-sm-3 control-label">服务名称：</label>
						<div class="col-sm-9">
							<label class="form-control" id="" placeholder=""></label>
						</div>
					</div>
					<div class="form-group">
						<label for="partsType" class="col-sm-3 control-label">服务类型：</label>
						<div class="col-sm-9">
							<label class="form-control" id="" placeholder=""></label>
						</div>
					</div>
					<div class="form-group">
						<label for="partsType" class="col-sm-3 control-label">使用配件：</label>
						<div class="col-sm-9">
							<label class="form-control" id="" placeholder=""></label>
						</div>
					</div>
					<div class="form-group">
						<label for="partsType" class="col-sm-3 control-label">配件总价格：</label>
						<div class="col-sm-9">
							<label class="form-control" id="" placeholder=""></label>
						</div>
					</div>
					<div class="form-group">
						<label for="partsType" class="col-sm-3 control-label">其他服务费用：</label>
						<div class="col-sm-9">
							<label class="form-control" id="" placeholder=""></label>
						</div>
					</div>
					<div class="form-group">
						<label for="partsType" class="col-sm-3 control-label">开始日期：</label>
						<div class="col-sm-9">
							<label class="form-control" id="" placeholder=""></label>
						</div>
					</div>
					<div class="form-group">
						<label for="partsType" class="col-sm-3 control-label">结束日期：</label>
						<div class="col-sm-9">
							<label class="form-control" id="" placeholder=""></label>
						</div>
					</div>
					<div class="form-group">
						<label for="partsType" class="col-sm-3 control-label">负责人：</label>
						<div class="col-sm-9">
							<label class="form-control" id="" placeholder=""></label>
						</div>
					</div>
					<div class="form-group">
						<label for="partsType" class="col-sm-3 control-label">备注：</label>
						<div class="col-sm-9">
							<label class="form-control" id="" placeholder=""></label>
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
<script type="text/javascript">
$(document).ready(function(){
	$('#addPartDate').datetimepicker({
		language:  'zh-CN',
		format:'yyyy-dd-mm hh:ii:ss',
		weekStart: 1,
		todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
		showMeridian: 1,
		minView:2
	});
})
function deleteProject(projectId, obj) {
	if (confirm("是否确认删除？")) {
		
	}
}
</script>
</body>
</html>