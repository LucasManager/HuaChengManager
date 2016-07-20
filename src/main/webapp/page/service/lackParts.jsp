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
</head>
<body>
	<div class="panel border_364150 width_980  div_margin_center">
    <form id="searchTerms" action="" method="post" class="margin_0">
        <div class="height_40 background_364150">
            <div class="height_40 float_left background_293846">
                <div class="float_left width_980">
                    <input type="text" name="projectNo" id="searchCustName" class="object_search argin_l_15" placeholder="客户名称">
                    <input type="text" name="projectName" id="searchPhone" class="object_search" placeholder="客户手机号">
                    <select class="object_search" id="searchStatus">
                        <option >当前缺件状态</option>
                        <option value="0">缺件</option>
                        <option value="1">完成</option>
                    </select>
                </div>
                <span onclick="searchLackParts()" class="table_search_submit">&nbsp;<i class="glyphicon glyphicon-search" style="font-size:18px"></i>&nbsp;</span>
            </div>
            <span data-toggle="modal" data-target="#addLockParts" onclick="addLackBtn()" class=" float_right object_addobject" title="缺件记录"><i class="glyphicon glyphicon-plus-sign"></i>缺件记录</span>
        </div>
        <table class="table table-bordered table-hover table-striped">
            <thead>
            <tr>
                <th>缺件人</th>
                <th>手机号</th>
                <th>车牌号</th>
                <th>配件名称</th>
                <th>型号</th>
                <th>所需数量</th>
                <th>登记日期</th>
                <th>缺件状态</th>
                <th>描述</th>
                <th>编辑操作</th>
            </tr>
            </thead>
            <tbody id="lackPartsTable">
<!-- 	            <tr> -->
<!-- 	                <td>李四</td> -->
<!-- 	                <td>1363666666</td> -->
<!-- 	                <th>豫XAAAAA</th> -->
<!-- 	                <td>前轮</td> -->
<!-- 	                <td>大号</td> -->
<!-- 	                <td>2</td> -->
<!-- 	                <td>2016-07-06</td> -->
<!-- 	                <td>已完成</td> -->
<!-- 	                <td>对当前缺件的描述</td> -->
<!-- 	                <td> -->
<!-- 	                	<a href="javascript:void(0)" title="缺件补充完成" data-toggle="modal" hidden><i class="glyphicon glyphicon-ok"></i></a> -->
<!-- 	                    <a href="javascript:void(0)" title="修改" data-toggle="modal" data-target="#addStore" onclick="findDetailById()"><i class="glyphicon glyphicon-edit "></i></a> -->
<!-- 	                    <a href="javascript:void(0)" title="删除" onclick="deleteProject()" class="btn-margin_5"><i class="glyphicon glyphicon-trash"></i></a> -->
<!-- 	                </td> -->
<!-- 	            </tr> -->
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


<div class="modal fade" id="addLockParts" tabindex="-1" role="dialog" >
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h3>记录缺件</h3>
			</div>
			<div class="modal-body">
					<div class="form-horizontal">
						<div class="form-group">
							<label for="createDate" class="col-sm-3 control-label">等级日期：</label>
							<div class="col-sm-9">
								<div class="controls">
									<div class="input-prepend input-group">
										<span class="add-on input-group-addon"> <i
											class="glyphicon glyphicon-calendar fa fa-calendar"> </i>
										</span> <input type="text" style="width: 200px" name="addPartDate"
											id="createDate" readonly class="form-control" value="" />
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="customerName" class="col-sm-3 control-label">缺件人：</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="customerName" placeholder="">
							</div>
						</div>
						<div class="form-group">
							<label for="phone" class="col-sm-3 control-label">手机号：</label>
							<div class="col-sm-9">
								<input type="email" class="form-control" id="phone" placeholder="">
							</div>
						</div>
						<div class="form-group">
							<label for="carNum" class="col-sm-3 control-label">车牌号：</label>
							<div class="col-sm-9">
								<input type="email" class="form-control" id="carNum" placeholder="">
							</div>
						</div>
						<div class="form-group">
							<label for="partsName" class="col-sm-3 control-label">配件名称：</label>
							<div class="col-sm-9">
								<input type="email" class="form-control" id="partsName" placeholder="">
							</div>
						</div>
						<div class="form-group">
							<label for="partsNum" class="col-sm-3 control-label">型号：</label>
							<div class="col-sm-9">
								<input type="email" class="form-control" id="partsNum" placeholder="">
							</div>
						</div>
						<div class="form-group">
							<label for="needNum" class="col-sm-3 control-label">所需数量：</label>
							<div class="col-sm-9">
								<input type="email" class="form-control" id="needNum" placeholder="">
							</div>
						</div>
						<div class="form-group">
							<label for="description" class="col-sm-3 control-label">描述：</label>
							<div class="col-sm-9">
								<textarea type="email" class="form-control" id="description" placeholder=""></textarea>
							</div>
						</div>
						<input type="hidden" id="lackPartId" >
					</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" id="confirmAddLack" onclick="confirmAddLack()">确认</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		$('#createDate').datetimepicker({
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
		loadLackGrid("", "","",0);
		
	});

	function loadLackGrid(custName,phone,status,currentPage){
		var lackParts = {customerName:custName,phone:phone,status:status};
		$.ajax({
			type:"GET",
			url:"lackParts/findLackParts.do",
			data:{
				lackParts:JSON.stringify(lackParts),
				currentPage:currentPage
			},
			dataType:"json",
			success:function(data){
				var content = "";
				if(data!=null && data!=undefined && data.length!=0){
					for(var i=0;i<data.length;i++){
						var lp = data[i];
						var status="未完成";
						if(lp.status=="1"){
							status="已完成";
						}
						content = content.concat("<tr><td>"+lp.customerName+"</td><td>"+lp.phone+"</td><td>"+lp.carNum+"</td><td>"+lp.partsName+"</td><td>"+lp.partsNum+"</td><td>"+lp.needNum+"</td><td>"+getDate(lp.createDate)+"</td><td>"+status+"</td><td>"+lp.description+"</td>"+
								"<td><a href='javascript:void(0)' title='完成缺件' onclick='finishiLack("+lp.id+")'><i class='glyphicon glyphicon-ok'></i></a>&nbsp;"+
								"<a href='javascript:void(0)' title='修改' onclick='updateLackBtn("+lp.id+")' data-target='#addLockParts' data-toggle='modal'><i class='glyphicon glyphicon-edit'></i></a>&nbsp;"+
								"<a href='javascript:void(0)' title='删除' onclick='deletelackPart("+lp.id+",this)'><i class='glyphicon glyphicon-trash'></i></a></td></tr>")
					}
				}
				$("#lackPartsTable").html(content);
			}
			});
	}
	function addLackBtn(){
		clearLackParts();
		$("#confirmAddLack").attr("onclick","confirmAddLack()");
		$("#confirmAddLack").removeAttr("data-dismiss");
	}
	function updateLackBtn(id){
		clearLackParts();
		$("#lackPartId").val(id);
		$("#confirmAddLack").attr("onclick","confirmUpdateLack()");
		$("#confirmAddLack").removeAttr("data-dismiss");
		var lack={id:id}
		$.ajax({
			type:"POST",
			url:"lackParts/findLackParts.do",
			data:{
				lackParts:JSON.stringify(lack)
			},
			dataType:"json",
			success:function(data){
				if(data!=null && data!=undefined && data.length!=0){
					var part =data[0];
					$("#customerName").val(part.customerName);
					$("#phone").val(part.phone);
					$("#carNum").val(part.carNum);
					$("#partsName").val(part.partsName);
					$("#partsNum").val(part.partsNum);
					$("#needNum").val(part.needNum);
					$("#description").val(part.description);
					$("#createDate").val(getDateDetil(part.createDate));
				}			
			}
		});
		
		
	}
	//增加缺件
	function confirmAddLack(){
		if($("#customerName").val()==null || $("#customerName").val()==undefined ||$("#customerName").val()==""){
			alert("缺件人姓名不能为空！");
			return;
		}
		if($("#phone").val()==null || $("#phone").val()==undefined ||$("#phone").val()==""){
			alert("缺件人手机号不能为空！");
			return;
		}
		if($("#partsName").val()==null || $("#partsName").val()==undefined ||$("#partsName").val()==""){
			alert("配件名称不能为空！");
			return;
		}
		var createDate = $("#createDate").val()==""||$("#createDate").val()==undefined?null:$("#createDate").val();
		var lack={customerName:$("#customerName").val(),phone:$("#phone").val(),partsName:$("#partsName").val(),partsNum:$("#partsNum").val(),carNum:$("#carNum").val(),createDate:createDate,needNum:$("#needNum").val(),description:$("#description").val()};
		$("#confirmAddLack").attr("data-dismiss","modal")
		$.ajax({
			type:"POST",
			url:"lackParts/saveLackParts.do",
			data:{
				lackParts:JSON.stringify(lack)
			},
			dataType:"json",
			success:function(data){
				if(data.result=="success"){
					alert("增加成功！")
					loadLackGrid("", "", "",0);
				}				
			}
		});
	}
	
	function confirmUpdateLack(){
		if($("#customerName").val()==null || $("#customerName").val()==undefined ||$("#customerName").val()==""){
			alert("缺件人姓名不能为空！");
			return;
		}
		if($("#phone").val()==null || $("#phone").val()==undefined ||$("#phone").val()==""){
			alert("缺件人手机号不能为空！");
			return;
		}
		if($("#partsName").val()==null || $("#partsName").val()==undefined ||$("#partsName").val()==""){
			alert("配件名称不能为空！");
			return;
		}
		var createDate = $("#createDate").val()==""||$("#createDate").val()==undefined?null:$("#createDate").val();
		var lack={id:$("#lackPartId").val(),customerName:$("#customerName").val(),phone:$("#phone").val(),partsName:$("#partsName").val(),partsNum:$("#partsNum").val(),carNum:$("#carNum").val(),createDate:createDate,needNum:$("#needNum").val(),description:$("#description").val()};
		$("#confirmAddLack").attr("data-dismiss","modal")
		$.ajax({
			type:"POST",
			url:"lackParts/updateLackParts.do",
			data:{
				lackParts:JSON.stringify(lack)
			},
			dataType:"json",
			success:function(data){
				if(data.result=="success"){
					alert("修改成功！")
					loadLackGrid("", "", "",0);
				}else{
					alert("修改失败！");
				}				
			},
			error:function(data){
				alert("修改失败！");
			}
		});
	}
	//完成缺件
	function finishiLack(id){
		var lackParts = {id:id}
		$.ajax({
			type:"POST",
			url:"lackParts/changeStatus.do",
			data:{
				lackParts:JSON.stringify(lackParts)
			},
			dataType:"json",
			success:function(data){
				if(data.result=="success"){
					alert("缺件补充完成");
					loadLackGrid("", "", "",0);
				}else{
					alert("缺件补充失败!");
				}
			},
			error:function(error){
				alert("缺件补充失败！");
			}
		});
	}
	
	function searchLackParts(){
		var customer = $("#searchCustName").val();
		var phone=$("#searchPhone").val();
		var status = $("#searchStatus option:selected").val();
		loadLackGrid(customer, phone, status,0);
	}
	
	function clearLackParts(){
		$("#customerName").val("");
		$("#phone").val("");
		$("#carNum").val("");
		$("#partsName").val("");
		$("#partsNum").val("");
		$("#needNum").val("");
		$("#description").val("");
		$("#createDate").val("");
	}
	
	
	
	function deletelackPart(projectId, obj) {
		if (confirm("是否确认删除？")) {
			var lackParts = {id:projectId}
			$.ajax({
				type:"POST",
				url:"lackParts/deleteLackParts.do",
				data:{
					lackParts:JSON.stringify(lackParts)
				},
				dataType:"json",
				success:function(data){
					if(data.result=="success"){
						alert("删除成功！");
						loadLackGrid("", "", "",0);
					}else{
						alert("缺件补充失败!");
					}
				},
				error:function(error){
					alert("删除成功！");
				}
			});
		}
	}
	 //日期格式化
	function getDate(date){
		var s = date.year+"-"+(date.month+1)+"-"+date.day;
	 	return s;
	}
	function getDateDetil(date){
		var s = date.year+"-"+(date.month+1)+"-"+date.day+" "+date.hours+":"+date.minutes+":"+date.seconds;
		return s;
	}
</script>
</body>
</html>