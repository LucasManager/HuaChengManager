<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>CI管理</title>
<%@ include file="top.jsp"%>
<style type="text/css">
.ztree li span.button.add {
	margin-left: 2px;
	margin-right: -1px;
	background-position: -144px 0;
	vertical-align: top;
	*vertical-align: middle
}

#treeDemo {
	width: 565px
}

#treeDemo1 {
	width: 565px
}
</style>
<!-- jquery smartmenus -->
  <script src="../jsp/main/js/jquery-smartMenu.js"></script>
  <script src="../jsp/main/js/context.js"></script>
  <link href="../jsp/main/css/smartMenu.css" type="text/css" rel="stylesheet" />
  <!-- jquery smartmenus -->
</head>
<body>
	<ol class="breadcrumb">
            <li><a href="picture.jsp"><i class="glyphicon glyphicon-home"></i>&nbsp;首页</a></li>
            <li><a href="javascript:void(0)">资源管理</a></li>
			<li><a href="#">CI管理</a></li>
        </ol>
        <div class="panel panel-default width_900  div_margin_center">
            <div class="panel-heading" >
                <h3 class="panel-title">CI管理</h3>
            </div>
            <div class="panel-body background_F9F7F6">
                <div class="panel border_364150 width_800  div_margin_center">
                    <div class="height_40 background_364150">
                        <div class="height_40 float_left background_293846">
                            <div class="float_left width_600">
							<div>
                            	<form action="../CIcategory/ShowCIcategory.do" id="showci" name="showci" class="margin_0">
										<select  name="choseCiType" class="object_search argin_l_15"  onchange="selectci('first')">
											<option <c:if test="${choseCiType==0}">selected="selected"</c:if> value="0">全部CI</option>
											<option <c:if test="${choseCiType==1}">selected="selected"</c:if> value="1">实体CI</option>
											<option <c:if test="${choseCiType==2}">selected="selected"</c:if> value="2">虚拟化CI</option>
										</select>
										<select id="first" name="first" class="object_search" onchange="selectci(this.id)">
											<option value="0">请选择CI</option>
											<c:forEach items="${firstlist}" var="first">
											<option value="${first.sId}"
											<c:if test="${first.sId==firstselect}">
												selected
											</c:if>>
												${first.sCI_name}</option>
											</c:forEach>
										</select> 
										<input type="hidden" value='${firstinput}' id="firstinput" name="firstinput" />
										<input type="hidden" value='${firstselect}' id="firstselect" name="firstselect" />
										<select id="second" name="second" class="object_search" onchange="selectci(this.id)">
										    <option value="">请选择CI</option>
											<c:forEach items="${secondlist}" var="second">
											<option value="${second.sId}"
											<c:if test="${second.sId==secondselect}">
												selected
											</c:if>>
												${second.sCI_name}</option>
											</c:forEach>
										</select>
										<input type="hidden" value='${secondinput}' id="secondinput" name="secondinput" /> 
										<input type="hidden" value='${secondselect}' id="secondselect" name="secondselect" />
										<select id="third" name="third" class="object_search" onchange="selectci(this.id)">
											<option value="">请选择CI</option>
											<c:forEach items="${thirdlist}" var="third">
											<option value="${third.sId}"
											<c:if test="${third.sId==thirdselect}">
												selected
											</c:if>>
												${third.sCI_name}</option>
											</c:forEach>
										</select> 
										<input type="hidden" value='${thirdinput}' id="thirdinput" name="thirdinput" /> 
										<input type="hidden" value='${thirdselect}' id="thirdselect" name="thirdselect" />
									    <select id="fourth" name="fourth" class="object_search" onchange="selectci(this.id)">
											 <option value="">请选择CI</option>
											 <c:forEach items="${fourthlist}" var="fourth">
											 <option value="${fourth.sId}"
											 <c:if test="${fourth.sId==fourthselect}">
										         selected
											 </c:if>>
												 ${fourth.sCI_name}</option>
											 </c:forEach>
											</select>
										    <input type="hidden" value='${fourthinput}' id="fourthinput" name="fourthinput" /> 
										    <input type="hidden" value='${fourthselect}' id="fourthselect" name="fourthselect" />
											<!-- 									
												 <select id="fifth" name="fifth" class="form-control" onchange="selectci(this.id)">
												       <option value="">请选择</option>
												 	   <c:forEach items="${fifthlist}" var="fifth">
												 	  	<option value="${fifth.sId}" 												 	  		
												 	  		<c:if test="${fifth.sId==fifthselect}">
													 	  			selected
													 	  	</c:if>>
													 	  	${fifth.sCI_name}
													 	 </option>
												 	  </c:forEach>
												 </select>
												 <input type="hidden" value='${fifthinput}' id="fifthinput" name="fifthinput" />
												 <input type="hidden" value='${fifthselect}' id="fifthselect" name="fifthselect" />
											 -->
									<input type="hidden" id="partentId" name="partentId" value="${partentId}"> 
									<input type="hidden" id="typelist" name="typelist" value="${typelist}">
								    <input type="hidden" id="pageindex" name="pageindex" value="${curpage-1}" />
								    <input type="submit" class="input_hide" id="search_CI_type">
                                </form>
                                </div>
                            </div>
<!-- 							<span  class="table_search_submit" onclick="$('#search_CI_type').click()">&nbsp;<i class="glyphicon glyphicon-search font_18"></i>&nbsp;</span> -->
						</div>
						<input type="file" name="file" id="file" class="input_hide">
						<span class=" float_right object_addobject" onclick="del_cheked()" title="删除选择"><i class="glyphicon glyphicon-minus-sign"></i></span>
						<span class="float_right object_addobject" title="资源" data-toggle="modal" data-target="#edit_resourse" onclick="loadresourse()"><i class="glyphicon glyphicon-tasks" ></i></span>
						<span class="float_right object_addobject" title="导入" onclick="document.getElementById('file').click();"><input type="file" name="file" id="file" class="input_hide"><i class="glyphicon glyphicon-open"></i></span>
                        <span data-toggle="modal" data-target="#myModal" class=" float_right object_addobject" title="添加CI"><i class="glyphicon glyphicon-plus-sign"></i></span>
                    </div>
                    <table class="table table-bordered table-hover table-striped">					<thead>
						<tr>
							<th class="check_width"><span class="pointer"
								onclick="true_cheked(this)"><input type="checkbox" onclick="$(this).parent().click()"></span>
							</th>
							<th colspan="4">CI名</th>
							<th class="td_width_200">编辑操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${CICategorylist}" var="CIcategory">
							<tr>
								<td><input type="checkbox"></td>
								<td colspan="4">${CIcategory.sCIName}</td>
								<td class="width_btn">
									<!-- <span class="btn btn-primary btn-margin" data-toggle="modal" data-target="#changemyModal">修改</span>-->
									<!-- <span class="btn btn-danger btn-margin" onclick="dele_tr(this)">删除</span> -->
									<span class="btn btn-primary btn-margin"
									onclick="detail('${CIcategory.iCIId}')">详情</span>
								</td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="6">
								<ul class="pagination">
									<li><a
										style="width: 40px; margin-top: -2px; height: 35px;"
										class="glyphicon glyphicon-chevron-left"
										href="javascript:void(0)" onclick="skippage('${prepage}')"></a></li>
									<c:if test="${totalpage>8 }">
										<li <c:if test="${1==curpage}">class="active"</c:if>><a
											href="javascript:void(0)" style="height: 35px;"
											onclick="skippage(1)">1</a></li>
										<li <c:if test="${2==curpage}">class="active"</c:if>><a
											href="javascript:void(0)" style="height: 35px;"
											onclick="skippage(2)">2</a></li>
										<c:if test="${curpage<=5 }">
											<c:forEach begin="3" end="7" var="i">
												<li <c:if test="${i==curpage }">class="active"</c:if>>
													<a href="javascript:void(0)" onclick="skippage('${i}')"
													style="height: 35px;">${i}</a>
												</li>
											</c:forEach>
											<li><a>...</a></li>
										</c:if>
										<c:if test="${curpage>5 and curpage<totalpage-3 }">
											<li><a>...</a></li>
											<c:forEach begin="0" end="4" var="i">
												<li <c:if test="${i==2 }">class="active"</c:if>><a
													href="javascript:void(0)"
													onclick="skippage('${curpage-2+i}')" style="height: 35px;">${curpage-2+i}</a>
												</li>
											</c:forEach>
											<li><a>...</a></li>
										</c:if>
										<c:if test="${curpage>=totalpage-3 }">
											<li><a>...</a></li>
											<c:forEach begin="${totalpage-5 }" end="${totalpage-1 }"
												var="i">
												<li <c:if test="${i==curpage }">class="active"</c:if>>
													<a href="javascript:void(0)" onclick="skippage('${i}')"
													style="height: 35px;">${i}</a>
												</li>
											</c:forEach>
										</c:if>
										<li <c:if test="${curpage==totalpage}">class="active"</c:if>><a
											href="javascript:void(0)" style="height: 35px;"
											onclick="skippage(${totalpage})">${totalpage}</a></li>
									</c:if>
									<c:if test="${totalpage<=8 }">
										<c:forEach begin="1" end="${totalpage }" var="i">
											<li <c:if test="${i==curpage }">class="active"</c:if>><a
												href="javascript:void(0)" onclick="skippage('${i}')"
												style="height: 35px;">${i}</a></li>
										</c:forEach>
									</c:if>
									<li><a
										style="width: 40px; margin-top: -2px; height: 35px;"
										class="glyphicon glyphicon-chevron-right"
										href="javascript:void(0)" onclick="skippage('${nextpage}')"></a></li>
								</ul>
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
					<h4 class="modal-title" id="myModalLabel">添加CI</h4>
				</div>
				<div class="modal-body">
					<button type="button" class="btn btn-primary" onclick="addTreeRoot()">
						添加大类</button>
					<div>
						<!--添加表单-->
						<form role="form" action="">
							<div class="form-group">
								<ul id="treeDemo" class="ztree"></ul>
							</div>
							<input type="submit" class="input_hide" id="add_sumbmit">
						</form>
						<!--添加表单-->
						<div style="clear: both"></div>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="edittree()">
						提交添加</button>
					<button type="button" class="btn btn-default" data-dismiss="modal" onclick="delEdit()">关闭
					</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<!--模态框-->
	<div class="modal fade" id="changemyModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">修改CI</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<ul id="treeDemo1" class="ztree"></ul>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						onclick="$('#add_sumbmit').click()">提交修改</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal -->
	<!--模态框-->

	<div class="modal fade" id="add_proper" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">添加属性</h4>
				</div>
				<div class="modal-body">
					<div>
						<!--添加表单-->
						<form role="form" action="">
							<div class="form-group">
								<label for="name" class="font-16">CI名称:</label> <input
									type="text" class="form-control" id="name"
									placeholder="请输入CI名称">
							</div>
							<div class="form-group">
								<label for="name" class="font-16">CI名称:</label> <input
									type="text" class="form-control" id="name"
									placeholder="请输入CI名称">
							</div>
							<input type="submit" class="input_hide" id="add_sumbmit">
						</form>
					</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						onclick="$('#add_sumbmit').click()">提交添加</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>

				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal -->
	<!--模态框-->

	<div class="modal fade" id="edit_resourse" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">资源上限</h4>
				</div>
				<!-- 弹框数据表格 -->
				<div id="allcifLabel"></div>
				<!-- 弹框数据表格结束 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal"
						onclick="editRes()">添加</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>

	<script src="../bootstrap-3.3.5-dist/js/jquery.min.js"></script>
	<script src="../bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
	<script src="../js/table.js"></script>
	<script type="text/javascript" src="../js/jquery.ztree.core.js"></script>
	<script type="text/javascript" src="../js/jquery.ztree.excheck.js"></script>
	<script type="text/javascript" src="../js/jquery.ztree.exedit.js"></script>
	<SCRIPT type="text/javascript">
        var arr = {};
		//<!--
		var setting = {
                check: {
				enable: true
			},
			view: {
				addHoverDom: addHoverDom,
				removeHoverDom: removeHoverDom,
				selectedMulti: true
			},
			edit: {
				enable: true,
				editNameSelectAll: true,
				showRemoveBtn: true,
				showRenameBtn: true
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				onRemove: onRemove,
				onRename: onRename,
				onNodeCreated: onNodeCreated
// 				onRightClick: zTreeOnRightClick
			}
		};

		var zNodes = ${CICategorytree};
		
		var isCreate = false;
		var createjsons = {};
		var editjsons = {};
		var delid = "-1";
		var addAndDelNode="-1";
		
		function onNodeCreated(event, treeId, treeNode) {
			
		    if(isCreate){
		    	addAndDelNode += ","+treeNode.id;
// 		    	createjsons[treeNode.id] = {"id":treeNode.id,"pId":treeNode.pId,"name":treeNode.name};
		    }
		}
		
		function onRemove(e, treeId, treeNode) {
			delid += "," + treeNode.id;
		}
		
		function detail(CIid){
			location.href="../CIcategory/ShowCIAttribute.do?CIid="+CIid;
		}
		
		function onRename(e, treeId, treeNode, isCancel) {
			if(createjsons[treeNode.id]){
				createjsons[treeNode.id] = {"id":treeNode.id,"pId":treeNode.pId,"name":treeNode.name};
			}else{
				editjsons[treeNode.id] = {"id":treeNode.id,"pId":treeNode.pId,"name":treeNode.name};
			}
		}
		
		var log, className = "dark";

		function showRemoveBtn(treeId, treeNode) {
			return !treeNode.isFirstNode;
		}
		function showRenameBtn(treeId, treeNode) {
			return !treeNode.isLastNode;
		}
		function showLog(str) {
			if (!log) log = $("#log");
			log.append("<li class='"+className+"'>"+str+"</li>");
			if(log.children("li").length > 8) {
				log.get(0).removeChild(log.children("li")[0]);
			}
		}
		function getTime() {
			var now= new Date(),
			h=now.getHours(),
			m=now.getMinutes(),
			s=now.getSeconds(),
			ms=now.getMilliseconds();
			return (h+":"+m+":"+s+ " " +ms);
		}

		var newCount = 1;
		function addHoverDom(treeId, treeNode) {
			var sObj = $("#" + treeNode.tId + "_span");
			if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
			var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
				+ "' title='add node' onfocus='this.blur();'></span>";
			sObj.after(addStr);
			var btn = $("#addBtn_"+treeNode.tId);
                       // var name=sObj.parent().find('span[class=node_name]').html().split('-');
			if (btn) btn.bind("click", function(){
				var zTree = $.fn.zTree.getZTreeObj("treeDemo");
				var newNode={id:(100 + newCount), pId:treeNode.id, name:"new node" + (newCount++)};
				$.ajax({
					type:"post",
					url:"addNewTree.do",
					data:{
						newNode:JSON.stringify(newNode),
					},
					dataType:"json",
					success:function(data){
						if('Success'==data.success){
							newNode={name:"新增类名",pId:treeNode.id,id:data.treeId};
							zTree.addNodes(treeNode, newNode);
						}else{
							alert("+新增失败，请联系管理员！");
						}
					},
					error:function(data){
						alert("新增失败，请联系管理员！");
					}
				})
// 				zTree.addNodes(treeNode, newNode);
				//zTree.addNodes(treeNode, {id:(100 + newCount), pId:treeNode.id, name:namestring});
				return false;
			});
		};
		
		function removeHoverDom(treeId, treeNode) {
			$("#addBtn_"+treeNode.tId).unbind().remove();
		};
		
		function selectAll() {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			zTree.setting.edit.editNameSelectAll =  $("#selectAll").attr("checked");
		}
		
		function edittree(){
			var addci = JSON.stringify(createjsons);
			var upci = JSON.stringify(editjsons);
			var delci = delid;
			addAndDelNode="-1";
			$.ajax({
				type : "POST",
				url : "../CIcategory/editCIcategorytree.do",
				data : {
					addci:addci,
					upci:upci,
					delci:delci
				},
				dataType : "text",
				success : function(data) {
					if(data == "success"){
						location=location;
					}
				}
			});
		}
		
		$(document).ready(function(){
            var t=$("#treeDemo");
			$.fn.zTree.init(t, setting, zNodes);
			$("#selectAll").bind("click", selectAll);
            var t1=$("#treeDemo1");
			$.fn.zTree.init(t1, setting, zNodes);
			isCreate=true;
			
		});
		
		function selectci(type){
			$("#partentId").val($("#"+type).val());
			$("#firstselect").val($("#first").val());
			$("#secondselect").val($("#second").val());
			$("#thirdselect").val($("#third").val());
			$("#fourthselect").val($("#fourth").val());
			$("#fifthselect").val($("#fifth").val());
			if(type == "first"){
				$("#typelist").val("second");
			}
			if(type == "second"){
				$("#typelist").val("third");
			}
			if(type == "third"){
				$("#typelist").val("fourth");
			}
			if(type == "fourth"){
				$("#typelist").val("fifth");
			}
			if(type == "fifth"){
				return;
			}
			$("#pageindex").val("1");
			$("#showci").submit();
		}
		
		function skippage(page){
			if(page!='${curpage}'){
				$("#pageindex").val(page);
				$("#showci").submit();
			}
		}
		
		function loadresourse(){
			ShowSubDialog_Edit("allcifLabel","../CIcategory/findAllFiRes.do",null);
		}
		
		function editRes(){
			var e=$("#showAllVitualRes").find("td[name=name1]");
			var box=$("#showAllVitualRes").find("input[type=checkbox]");//取到选择的checkbox
			var checkNos="-1";
			var counts="-1";
			for(var i=0;i<box.length;i++){
				var checkNo=$(box[i]).prop("value");
				var count=$("#showAllVitualRes").find("input[name=name"+checkNo+"]").val();
				checkNos += "," + checkNo;
				counts += "," + count;
			}
			$.ajax({
				type : "POST",
				url : "../CIcategory/editRes.do",
				data : {
					checkNos:checkNos,
					counts:counts
				},
				dataType : "text",
				success : function(data) {
					$("#showAllVitualRes").empty();
				}
			});
		}
		
		//选择查看实体资源还是虚拟资源
		function choseCiType(){
			$("#choseCiTypeSubmit").submit();
		}
		//-->
		//选中行高亮 以及右键单击事件
//         function zTreeOnRightClick(event, treeId, treeNode) {
// // 			alert("fff");
//         	alert(treeNode ? treeNode.tId + ", " + treeNode.name : "isRoot");
// 		}
        
		//添加大类
		function addTreeRoot(){
			var tree=$.fn.zTree.getZTreeObj("treeDemo");
			var newNode={name:"新增类名",pId:null,id:0};
			$.ajax({
				type:"post",
				url:"addNewTree.do",
				data:{
					newNode:JSON.stringify(newNode),
				},
				dataType:"json",
				success:function(data){
					if('Success'==data.success){
						newNode={name:"新增类名",pId:null,id:data.treeId};
						tree.addNodes(null,-1,newNode,false);	
					}else{
						alert("+新增失败，请联系管理员！");
					}
				},
				error:function(data){
					alert("新增失败，请联系管理员！");
				}
			})
		}
		
		//修改完树之后点击关闭而不是提交
		function delEdit(){
			if(addAndDelNode!='-1'){
				$.ajax({
					type:"post",
					url:"delAddTree.do",
					data:{
						addAndDelNode:addAndDelNode
					},
					dataType:"json",
					success:function(data){
						if(data.success=='Success'){
							$("#treeDemo").empty();
						}
					}
				})
			}
		}
	</script>
</body>
</html>
