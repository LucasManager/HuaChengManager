<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>CI属性</title>
<%@ include file="top.jsp"%>
<style>
	a i{color:#5BB2E3;background:#F5F5F5}
	a{color:#5BB2E3;background:#F5F5F5}
	a:hover i{color:#3175AF}
	a:hover{background:#F5F5F5}
	a:hover i{background:#F5F5F5}
</style>
</head>
<body>
	<ol class="breadcrumb">
            <li><a href="picture.jsp"><i class="glyphicon glyphicon-home"></i>&nbsp;首页</a></li>
            <li><a href="javascript:void(0)">资源管理</a></li>
			<li><a href="../CIcategory/ShowCIcategory.do">CI管理</a></li>
			<li><a href="#">CI详情</a></li>
        </ol>
        <div class="panel panel-default width_900  div_margin_center">
            <div class="panel-heading" >
                <h3 class="panel-title">CI详情</h3>
            </div>
            <div class="panel-body background_F9F7F6">
                <div class="panel border_364150 width_800  div_margin_center">
                    <div class="height_40 background_364150">
                       
						<span class=" float_right object_addobject" onclick="del_cheked()" title="删除选择"><i class="glyphicon glyphicon-minus-sign"></i>删除选择</span>
						 <span data-toggle="modal" data-target="#myModal" onclick="addCIattr()" class=" float_right object_addobject" title="添加CI"><i class="glyphicon glyphicon-plus-sign"></i>添加</span>
                    </div>
                    <table class="table table-bordered table-hover table-striped">
					<thead>
				
						<tr>
							<th class="check_width"><span class="pointer"
								onclick="true_cheked(this)"><input type="checkbox" onclick="$(this).parent().click()"></span>
							</th>
							<th>属性</th>
							<th>值</th>
							<th class="td_width_200">编辑操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${CIAttributelist}" var="CIattributet">
							<tr>
								<td>
									<input type="checkbox">
								</td>
								<td>
									${CIattributet.sAttributeName}
									<input type="hidden"  id='${CIattributet.iAttributeId}ciid' value='${CIattributet.iCIId}' />
									<input type="hidden"  id='${CIattributet.iAttributeId}attrname' value='${CIattributet.sAttributeName}' />
								</td>
								<td>
									${CIattributet.sAttributeValue}
									<input type="hidden" id='${CIattributet.iAttributeId}attrvalue' value='${CIattributet.sAttributeValue}' />
								</td>
								<td class="width_btn">
								<a href="javascript:void(0)" data-toggle="modal" onclick="editCIattr('${CIattributet.iAttributeId}')"  title="修改"><i class="glyphicon glyphicon-edit "></i></a>
                                <c:if test="${CIattributet.iAttributeId!=-1}">
                                <a href="javascript:void(0)" title="删除" data-toggle="modal"  data-target="#delModal" onclick="delCIattr('${CIattributet.iAttributeId}')" class="argin_l_15"><i class="glyphicon glyphicon-trash"></i></a>
								</c:if>
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
								<label for="resource" class="font-16">CI属性:</label> 
								<input type="text" class="form-control" name="ciattributet"  id="ciattributet">
							</div> 
							<div class="form-group add_select_style float_right" id="ci_valuediv">
								<label for="resource_num" class="font-16">CI值:</label>
								<input type="text" class="form-control" name="civalue" id="civalue">
							</div>
							<input type="hidden" id="ciattrid" name="ciattrid"/>
							<input type="hidden" id="CIid" name="CIid" value="${CIid}"/>
							<input type="submit" class="input_hide" id="add_submit">
						</form>
						<!--添加表单-->
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" class="btn btn-primary"
						onclick="$('#add_submit').click()">提交</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
		<!--模态框-->
	</div>
	
	<!--ci修改是否虚拟资源模态框-->
	<div class="modal fade" id="editCiStatusModal" tabindex="-1" role="dialog"
		aria-labelledby="editCiStatusModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="editCiStatusModalLabel"></h4>
				</div>
				<div class="modal-body">
					<div id="add_role">
						<!--添加表单-->
						<form role="form" id="editStatusForm" name="editStatusForm" action="">
							<div class="form-group add_select_style float_left">
								<label for="resource" class="font-16">CI属性:</label> 
								<input type="text" disabled="disabled" class="form-control" name="ciStatusName"  id="ciStatusName">
							</div> 
							<div class="form-group add_select_style float_right" id="ci_valuediv">
								<label for="resource_num" class="font-16">CI值:</label>
								<select class="form-control" id="ciStatusValue" name="ciStatusValue" onchange="choseCiStatus(this.value);">
									<option value="是">是</option>
									<option value="否">否</option>
								</select>
							</div>
							<div class="form-group add_select_style float_left">
								<label for="resource" class="font-16">实际数量上限:</label> 
								<input type="text" class="form-control" name="ciActualLimit"  id="ciActualLimit">
							</div> 
							<div class="form-group add_select_style float_right">
								<label for="resource" class="font-16">分配上限:</label> 
								<input type="text" class="form-control" name="ci_limit"  id="ci_limit">
							</div> 
							
							<input type="hidden" id="ciattrid" name="ciattrid"/>
							<input type="hidden" id="CIid" name="CIid" value="${CIid}"/>
							<input type="submit" class="input_hide" id="add_status_submit">
						</form>
						<!--添加表单-->
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" class="btn btn-primary"
						onclick="beforeSubmitStatus();">提交</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
		<!--模态框-->
	</div>
	
	<form id="delform" name="delform"  action="../CIcategory/delCIAttribute.do">
		<input type="hidden" id="delid" name="delid"/>
		<input type="hidden" id="delCIid" name="delCIid" value="${CIid}"/>
		<input type="submit" class="input_hide" id="del_submit">
	</form>
	
	<div class="modal fade" id="delModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="mydelModalLabel">删除确认</h4>
				</div>
				<div class="row">
				<div class="col-md-3"></div>
				<div class="modal-body col-md-6">
					删除后无法还原，是否确认删除？
				</div>
				<div class="col-md-3"></div>
				</div>
				<div class="modal-footer">
					<button id="delbutton" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button id="submitbutton" type="button" class="btn btn-primary"
						onclick='$("#del_submit").click();'>确认</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
		<!--模态框-->
	</div>
</body>

<script type="text/javascript">
	function addCIattr(){
		$("#myModalLabel").html("添加CI属性");
		$("#ciattributet").val("");
		$("#civalue").val("");
		$('#editform').attr("action", "../CIcategory/addCIAttribute.do");
	}
	
	function editCIattr(ciattrid){
		/*20160406 white update begin*/
		if(ciattrid=="-1"){
			$("#editCiStatusModalLabel").html("修改CI属性");
			$("#ciStatusName").val($("#" + ciattrid + "attrname").val());
			var statusValue=$("#" + ciattrid + "attrvalue").val();
			if(statusValue=='是'){
				$("#ciStatusValue").val("是");
				$("#ci_limit").removeAttr("disabled");
				$("#ciActualLimit").removeAttr("disabled");
			}else{
				$("#ciStatusValue").val("否");
				$("#ci_limit").attr("disabled","disabled").attr("value","");
				$("#ciActualLimit").attr("disabled","disabled").attr("value","");
			}
			$("#ciStatusValue").val($("#" + ciattrid + "attrvalue").val());
			$('#editStatusForm').attr("action", "../CIcategory/editCIStatus.do");
			$("#editCiStatusModal").modal({show:true});
		}else{
			$("#myModalLabel").html("修改CI属性");
			$("#ciattrid").val(ciattrid);
			$("#ciattributet").val($("#" + ciattrid + "attrname").val());
			$("#civalue").val($("#" + ciattrid + "attrvalue").val());
			$('#editform').attr("action", "../CIcategory/editCIAttribute.do");
			$("#myModal").modal({show:true});
		}
		/*20160406 white update end*/
		
	}
	
	function delCIattr(delid){
		//alert(delid);
		$("#delid").val(delid);
		//$("#del_submit").click();
	}
	
	//选择是否虚拟资源
	function choseCiStatus(status){
		if(status=='是'){
			$("#ci_limit").removeAttr("disabled");
			$("#ciActualLimit").removeAttr("disabled");
		}else{
			$("#delModal [class='modal-body col-md-6']").html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;修改为否将从虚拟资源池删除该资源，提交前请确认虚拟资源池中该资源已不被占用！");
			$("#mydelModalLabel").html("修改提示");
			$("#delbutton").html("关闭");	
			$("#submitbutton").attr("hidden","hidden");
			$("#delModal").modal({show:true});
			$("#ci_limit").attr("disabled","disabled");
			$("#ciActualLimit").attr("disabled","disabled");
		}
	}
	//表单验证
	function beforeSubmitStatus(){
		var status=$("#ciStatusValue").val();
		var limit=$("#ci_limit").val();
		var actualLimit=$("#ciActualLimit").val();
		if(status=='是' && (limit=='' || actualLimit=='')){
			$("#ci_limit").attr("style","border:red 1px solid");
			$("#delModal [class='modal-body col-md-6']").html("若设置为虚拟资源，资源上限为必填项！");
			$("#mydelModalLabel").html("提交提示");
			$("#delbutton").html("关闭");
			$("#submitbutton").attr("hidden","hidden");
			$("#delModal").modal({show:true});
		}else if(status=='是' && (isNaN(limit)||isNaN(actualLimit))){
			$("#ci_limit").attr("style","border:red 1px solid");
			$("#delModal [class='modal-body col-md-6']").html("资源上限为必须为数字！");
			$("#mydelModalLabel").html("提交提示");
			$("#delbutton").html("关闭");
			$("#submitbutton").attr("hidden","hidden");
			$("#delModal").modal({show:true});
		}else{
			$('#add_status_submit').click();
		}
		
	};
	
	$("#ci_limit").keyup(function(){
		$(this).removeAttr("style");
	})
</script>

</html>
