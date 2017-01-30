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
                <div class="height_40 background_364150">
                    <div class="height_40 float_left background_293846">
                        <div class="float_left width_300">
                            <input type="text" id="searchName" class="object_search argin_l_15" placeholder="请输入姓名">
                            <input type="text" id="searchPhone" class="object_search" placeholder=" 请输入手机号">
                        </div>
                        <span  id="searchButtom" class="table_search_submit"><i class="glyphicon glyphicon-search" style="font-size:18px"></i></span>
                    </div>

                    <span data-toggle="modal" data-target="#addCustomer" onclick="addCustomer();" class=" float_right object_addobject" title="添加客户"><i class="glyphicon glyphicon-plus-sign"></i>添加客户</span>
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
                        <th>车辆信息</th>
                        <th>新增时间</th>
                        <th colspan="2">编辑操作</th>
                    </tr>
                    </thead>
                    <tbody id="projectContent">
                    </tbody>
                    <tfoot>
                    <tr>
                        <td colspan="6">
                            <button class="btn btn-primary" id="prePage">上一页</button>
                            <button class="btn btn-primary" id="nexPage">下一页</button>
                        </td>
                    </tr>
                    </tfoot>
                </table>
            <div style="clear:both"></div>
        </div>
    </div>
</div>
<!--模态框 添加客户-->
<div class="modal fadey" id="addCustomer" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content width_700">
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
                                <input type="text" class="form-control" id="name" name="name" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="customerName" class="col-sm-3 control-label"> 手机号：</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="phone" name="phone" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="customerName" class="col-sm-3 control-label">客户地址：</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="address" name="address" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="customerName" class="col-sm-3 control-label">备注：</label>
                            <div class="col-sm-9">
                                <textArea class="form-control" id="description" name="description" ></textArea>
                            </div>
                        </div>
                        <input id="customerId" value="" type="hidden">
                        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#addCar" onclick="carAdd()"  >添加车辆</button>
                        <div class="">
                            <table class="table table-bordered table-hover table-striped font-16">
                                <thead class="" style="font-size: 18"><h4>车辆信息</h4></thead>
                                <tr>
                                    <td>车牌号</td>
                                    <td>型号</td>
                                    <td>颜色</td>
<!--                                     <td>进场里程</td> -->
                                    <td>车架识别码</td>
                                    <td class="td_width_200">描述</td>
                                    <td id="del">操作</td>
                                </tr>
                                <tbody id="customerCar">
                                    
                                </tbody>
                            </table>
                        </div>
                    </form>
                    <!--添加表单-->
                </div>
                <div style="clear: both"></div>
            </div>
            <div class="modal-footer">
                <button id="form_submit" type="button" class="btn btn-primary" >
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
        <div class="modal-content width_700">
            <div class="modal-header">
                <h3>添加车辆</h3>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                <div class="form-group">
                    <label for="carNum" class="col-sm-3 control-label">车牌号：</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="carNum" name="carNum" >
                    </div>
                </div>
                <div class="form-group">
                    <label for="carType" class="col-sm-3 control-label"> 型号：</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="carType" name="carType" >
                    </div>
                </div>
                <div class="form-group">
                    <label for="carColor" class="col-sm-3 control-label">颜色：</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="carColor" name="carColor">
                    </div>
                </div>
<!--                 <div class="form-group"> -->
<!--                     <label for="mileage" class="col-sm-3 control-label">进场里程：</label> -->
<!--                     <div class="col-sm-9"> -->
<!--                         <input type="text" class="form-control" id="mileage" name="mileage"> -->
<!--                     </div> -->
<!--                 </div> -->
                <div class="form-group">
                    <label for="vin" class="col-sm-3 control-label">车架识别码：</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="vin" name="vim">
                    </div>
                </div>
                <div class="form-group">
                    <label for="carDesc" class="col-sm-3 control-label">描述：</label>
                    <div class="col-sm-9">
                        <textarea class="form-control" id="carDesc" name="carDesc"></textarea>
                    </div>
                </div>
            </form>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" id="addCarBtn" onclick="addCar()" class="btn btn-primary">确认</button>
            </div>
        </div>
    </div>
</div>
</div>

<div class="modal fade" id="carMessage" tabindex="-1" role="dialog" >
    <div class="modal-dialog" role="document">
        <div class="modal-content width_700">
            <div class="modal-header">
                <h3>车辆信息</h3>
            </div>
            <div class="modal-body">
            	<table class="table table-bordered table-hover table-striped">
	            	<thead>
	            		<tr>
	            			<th>车牌号</th>
	            			<th>型号</th>
	            			<th>颜色</th>
	            			<th>新增日期</th>
<!-- 	            			<th>进场里程</th> -->
	            			<th>车架识别码</th>
	            			<th>描述</th>
	            		</tr>
	            	</thead>
            		<tbody id="carmessage">
            		</tbody>
            	</table>
             </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
    var currentProjectId = 0;
    var currentPageIndex = 1;
    $(document).ready(function() {
		loadDataGrid("", "", 0);
		$("#searchButtom").click(function(e){
			loadDataGrid($("#searchName").val(), $("#searchPhone").val(),0);
		});
		
		$("#prePage").click(function(){
			currentPageIndex = currentPageIndex-1;
			if(currentPageIndex<0){
				currentPageIndex = 0;
			}
			loadDataGrid($("#searchName").val(), $("#searchPhone").val(),currentPageIndex);
		});
		$("#nexPage").click(function(){
			currentPageIndex = currentPageIndex+1;
			loadDataGrid($("#searchName").val(), $("#searchPhone").val(),currentPageIndex);
		});
		
		
    });
	//新增car:
//    var newCar =[];
    var newCar ={};
    var updateNewCar ={};
    function loadDataGrid(name,phone,currentPage){
    	$.ajax({
    		type:"POST",
    		url:"customerManager/selectCustomer.do",
    		data:{
    			name:name,
    			phone:phone,
    			currentPage:currentPage
    		},
    		dataType:"json",
    		success:function(data){
    			var content = "";
    			for(var i=0;i<data.length;i++)
    			{
    				var cus = data[i];
    				var s = getDate(cus.createDate);
    				content = content.concat("<tr><td>"+cus.name+"</td><td>"+cus.phone+"</td><td>"+cus.address+"</td><td><a data-toggle='modal' data-target='#carMessage' onclick='findCarByCusId("+cus.id+")'>查看所有车辆</a></td><td>"+s+"</td><td>"+
    						"<a href='javascript:void(0)' title='修改' data-toggle='modal' data-target='#addCustomer' onclick='findCusByCusId("+cus.id+")'><i class='glyphicon glyphicon-edit'></i></a>"+
    						"<a href='javascript:void(0)' title='删除' onclick='deleteCustomer("+cus.id+",this)' class='btn-margin_5'><i class='glyphicon glyphicon-trash'></i></a>"+
    						"</td></tr>");
    			}
    			if(data.length<10){
    				$("#nexPage").attr("disabled","true");
    			}else{
    				$("#nexPage").removeAttr("disabled");
    			}
    			if(currentPageIndex==0 ||currentPageIndex==1){
    				$("#prePage").attr("disabled","true");
    			}else{
    				$("#prePage").removeAttr("disabled");
    			}
    			
    			$("#projectContent").html(content);
    		},
    		error:function(e){
    			
    		}
    	});
    }
    
    function addCar(){
    	var carNum = $("#carNum").val();
    	if(carNum==null || carNum=="")
    	{
    		alert("车牌号不能为空");
    		return;
    	}
    	var car = {id:null,carNum:$("#carNum").val(),carType:$("#carType").val(),carColor:$("#carColor").val(),VIN:$("#vin").val(),description:$("#carDesc").val()};
    	$("#customerCar").append("<tr><td>"+car.carNum+"</td><td>"+car.carType+"</td><td>"+car.carColor+"</td><td>"+car.VIN+"</td><td>"+car.description+"</td><td><a onclick='deleteCar("+car.id+",this)'>删除</a></td></tr>");
    	//newCar.push(car);
    	newCar[car.carNum+car.carType]=car;
    	$("#addCarBtn").attr("data-dismiss","modal");
    }
    
   function carAdd(){
	   $("#addCarBtn").removeAttr("data-dismiss");
	   clearforCar();
   }
    //日期格式化
    function getDate(date)
    {
    	var s = date.year+"-"+date.month+"-"+date.day;
    	return s;
    }
    //修改客户信息
    function findCusByCusId(id) {
    	$("#customerId").val("");
    	clearforCustomer();
    	newCar={};
    	$("#customerCar").empty();
    	$("#myModalLabel").text("修改客户信息");
    	$("#del").removeAttr("hidden");
    	$("#form_submit").attr("onclick","updateCustomer()");
    	$("#form_submit").removeAttr("data-dismiss");
		$.ajax({
			type:"GET",
			url:"customerManager/selectById.do",
			data:{
				id:id
			},
			dataType:"json",
			success:function(data){
				$("#name").val(data.name);	
		    	$("#phone").val(data.phone);	
		    	$("#address").val(data.address);	
		    	$("#description").val(data.description);
		    	$("#customerId").val(data.id);
		    	var cars = data.cars;
		    	if(cars!=null && cars.length!=0)
		    	{
		    		var carcontent = "";
		    		for(var i =0;i<cars.length;i++){
		    			var car = cars[i];
		    			carcontent = carcontent.concat("<tr><td>"+car.carNum+"</td><td>"+car.carType+"</td><td>"+car.carColor+"</td><td>"+car.VIN+"</td><td>"+car.description+"</td><td><a onclick='deleteCar("+car.id+",this)'>删除</a></td></tr>");
		    		}
		    		$("#customerCar").append(carcontent);
		    	}
			}
		});
    }
    
    //根据Id查找车辆信息：
    function findCarByCusId(id)
    {
    	$.ajax({
			type:"GET",
			url:"customerManager/findCar.do",
			data:{
				id:id
			},
			dataType:"json",
			success:function(data){
				var carContent = "";
		    	if(data!=null && data.length!=0)
		    	{
		    		for(var i=0;i<data.length;i++)
		    		{
		    			var car = data[i];
			    		carContent = carContent.concat("<tr><td>"+car.carNum+"</td><td>"+car.carType+"</td><td>"+car.carColor+"</td><td>"+getDate(car.createDate)+"</td><td>"+car.VIN+"</td><td>"+car.description+"</td></tr>");
		    		}
		    	}
		    	$("#carmessage").html(carContent);
			}
		});
    }
    

    function addCustomer() {
    	$("#myModalLabel").text("新增客户");
    	newCar={};
    	$("#customerCar").empty();
    	$("#form_submit").removeAttr("data-dismiss");
    	//$("#del").attr("hidden","true");
    	$("#form_submit").attr("onclick","addCustomerDeal()");
    	clearforCustomer();
    	$("#customerId").val("");
    }
    
    function clearforCustomer()
    {
    	$("#name").val("");	
    	$("#phone").val("");	
    	$("#address").val("");	
    	$("#description").val("");	
    	clearforCar();
    }
    
    function clearforCar()
    {
    	$("#carNum").val("");	
    	$("#carType").val("");	
    	$("#carColor").val("");	
    	/* $("#mileage").val("");	 */
    	$("#vin").val("");	
    	$("#carDesc").val("");	
    }

    function deleteCustomer(id,obj) {
        if (confirm("是否确认删除此客户信息？")) {
            $.ajax({
                type: "POST",
                url: "customerManager/deleteCustomer.do",
                data: {
                	id: id
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
    //删除car:
    function deleteCar(id,obj){
    	if (confirm("是否确认删除此车辆？")) {
	    	if(id==null || id=='' || id==undefined)
	    	{
	    		obj.parentNode.parentNode.parentNode.removeChild(obj.parentNode.parentNode);
	    		var prop = obj.parentNode.parentNode.getElementsByTagName('td')[0].innerHTML+obj.parentNode.parentNode.getElementsByTagName('td')[1].innerHTML;
	    		delete newCar[prop];
	    		return;
	    	}
    		$.ajax({
    			type:"POST",
    			url: "customerManager/deleteCar.do",
    			data: {
                	id: id
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

    function addCustomerDeal() {
		if($("#name").val()==null || $("#name").val()=="")
		{
			alert("客户姓名不能为空！");
			return;
		}
		if($("#phone").val()==null || $("#name").val()=="")
		{
			alert("手机号不能为空！");
			return;
		}
		var cars = getCars();
		var customer = {name:$("#name").val(),phone:$("#phone").val(),address:$("#address").val(),description:$("#description").val(),cars:cars};
		$("#form_submit").attr("data-dismiss","modal");
		$.ajax({
			url:"customerManager/addCustomer.do",
			type:"POST",
			data:{"customer":JSON.stringify(customer)},
			dataType:"json",
			success:function(data){
				if(data.result=="success")
				{
					loadDataGrid("", "", 0);
					newCar={};
					alert("添加成功！");
				}else
				{
					alert("添加失败！");
				}
			},
			error:function(data){
				console.info(data.result);
			}
		})
		
    }
    
    function updateCustomer()
    {
    	if($("#name").val()==null || $("#name").val()=="")
		{
			alert("客户姓名不能为空！");
			return;
		}
		if($("#phone").val()==null || $("#name").val()=="")
		{
			alert("手机号不能为空！");
			return;
		}
		var cars = getCars();
		var customer = {id:$("#customerId").val(),name:$("#name").val(),phone:$("#phone").val(),address:$("#address").val(),description:$("#description").val(),cars:cars};
		$("#form_submit").attr("data-dismiss","modal");
		$.ajax({
			url:"customerManager/updateCustomer.do",
			type:"POST",
			data:{"customer":JSON.stringify(customer)},
			dataType:"json",
			success:function(data){
				if(data.result=="success")
				{
					loadDataGrid($("#searchName").val(), $("#searchPhone").val(),0);
					newCar={};
					alert("修改成功！");
				}else
				{
					alert("修改失败！");
				}
			},
			error:function(data){
				console.info(data.result);
			}
		})
		
		
    }
    
    
    function getCars(){
    	var cars = [];
		for(var p in newCar)
		{
			cars.push(newCar[p]);	
		}
		return cars;
    }
</script>
</body>
</html>