<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>虚拟资源池管理</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<link rel="stylesheet"
	href="jsp/bootstrap-3.3.5-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="jsp/style/table.css">
<link rel="stylesheet" href="jsp/style/components.css">
<link rel="stylesheet" href="jsp/style/style.min.css">
</head>
<body>
	<ol class="breadcrumb">
            <li><a href="picture.jsp"><i class="glyphicon glyphicon-home"></i>&nbsp;首页</a></li>
            <li><a href="javascript:void(0)">资源管理</a></li>
			<li><a href="#">服务器管理</a></li>
        </ol>
        <div class="panel panel-default width_900  div_margin_center">
            <div class="panel-heading" >
                <h3 class="panel-title">服务器管理</h3>
            </div>
            <div class="panel-body background_F9F7F6">
                <div class="panel border_364150 width_800  div_margin_center">
                    <div class="height_40 background_364150">
                     
						<span class=" float_right object_addobject" onclick="del_cheked('deleteServers')" title="删除选择"><i class="glyphicon glyphicon-minus-sign"></i>删除选择</span>
						<span id="popAddDiv" data-toggle="modal" data-target="#myModal" class=" float_right object_addobject" title="添加服务器"><i class="glyphicon glyphicon-plus-sign"></i>添加服务器</span>
                    </div>
                    <table class="table table-bordered table-hover table-striped">
					<thead>
						<tr>
							<th class="check_width"><span class="pointer"
								onclick="true_cheked(this)"><input type="checkbox" onclick="$(this).parent().click()"></span>
							</th>
							<th>服务器名</th>
							<th>概述</th>
							<th colspan="2">编辑操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${servers}" var="server" >
                        		<tr>
                            			<td><input type="checkbox" value="${server.serverId}"></td>
                            			<td>${server.name}</td>
                            			<td>${server.info}</td>
                            			<td class="width_btn">
                            				<a href="javascript:void(0)" data-toggle="modal"data-target="#myModal" onclick="updateServer(${server.serverId})" title="修改"><i class="glyphicon glyphicon-edit "></i></a>
                                   	    	<a href="javascript:void(0)" title="删除" onclick="deleteServer(this)" class="argin_l_15"><i class="glyphicon glyphicon-trash"></i><span><input type="hidden" value="${server.serverId }"></span></a>
										</td>
                            		</tr>
                        	</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="8">
							<!-- 分页 -->
							<form id="searchTerm" action="findAllServer.do">
									<ul class="pagination">
										<li><a
											style="width: 40px; margin-top: -2px; height: 35px;"
											class="glyphicon glyphicon-chevron-left"
											href="javascript:void(0)" onclick="skippages('${_prepage}')"></a></li>
										<c:if test="${_totalpage>8 }">
											<li <c:if test="${1==_curpage}">class="active"</c:if>><a
												href="javascript:void(0)" style="height: 35px;"
												onclick="skippages(1)">1</a></li>
											<li <c:if test="${2==_curpage}">class="active"</c:if>><a
												href="javascript:void(0)" style="height: 35px;"
												onclick="skippages(2)">2</a></li>
											<c:if test="${_curpage<=5 }">
												<c:forEach begin="3" end="7" var="i">
													<li <c:if test="${i==_curpage }">class="active"</c:if>>
														<a href="javascript:void(0)" onclick="skippages('${i}')"
														style="height: 35px;">${i}</a>
													</li>
												</c:forEach>
												<li><a style="height: 35px;">...</a></li>
											</c:if>
											<c:if test="${_curpage>5 and _curpage<_totalpage-3 }">
												<li><a style="height: 35px;">...</a></li>
												<c:forEach begin="0" end="4" var="i">
													<li <c:if test="${i==2 }">class="active"</c:if>><a
														href="javascript:void(0)"
														onclick="skippages('${_curpage-2+i}')" style="height: 35px;">${_curpage-2+i}</a>
													</li>
												</c:forEach>
												<li><a style="height: 35px;">...</a></li>
											</c:if>
											<c:if test="${_curpage>=_totalpage-3 }">
												<li><a style="height: 35px;">...</a></li>
												<c:forEach begin="${_totalpage-5 }" end="${_totalpage-1 }"
													var="i">
													<li <c:if test="${i==_curpage }">class="active"</c:if>>
														<a href="javascript:void(0)" onclick="skippages('${i}')"
														style="height: 35px;">${i}</a>
													</li>
												</c:forEach>
											</c:if>
											<li <c:if test="${_curpage==_totalpage}">class="active"</c:if>><a
												href="javascript:void(0)" style="height: 35px;"
												onclick="skippages(${_totalpage})">${_totalpage}</a></li>
										</c:if>
										<c:if test="${_totalpage<=8 }">
											<c:forEach begin="1" end="${_totalpage }" var="i">
												<li <c:if test="${i==_curpage }">class="active"</c:if>>
													<a href="javascript:void(0)" onclick="skippages('${i}')"
													style="height: 35px;">${i}</a>
												</li>
											</c:forEach>
										</c:if>
										<li><a
											style="width: 40px; margin-top: -2px; height: 35px;"
											class="glyphicon glyphicon-chevron-right"
											href="javascript:void(0)" onclick="skippages('${_nextpage}')"></a></li>
									</ul>
									<input type="hidden" id="page_index" name="page_index"
										value="${_curpage}" />
								</form> 
								<!-- 分页 -->
							</td>
						</tr>
					</tfoot>
				</table>
				<div style="clear: both"></div>
			</div>
		</div>
	</div>
	<!-- 提示框 -->
	<div class="modal fade" id="alertTable" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
				
				</div>
			</div>
		</div>
	</div>
	<!-- 提示框 -->
	<!--模态框-->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog div_width_1000">
			<div class="modal-content div_width_1000">
				<div class="modal-header div_width_1000">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">新增服务器</h4>
				</div>
				<div class="modal-body div_width_1000">
					<div class="div_width_960">
						<!--添加表单-->
						<form role="form" action="">
							<input type="hidden" id="serverId">
							<div class="div_Width_600 float_left div_height_425">
								<div class="form-group div_Width_600 float_left">
									<label for="name" class="font-16">服务器名:</label> 
									<input type="text" class="form-control" id="serverName"
										placeholder="请输入项目名称">
								</div>
								<div class="form-group div_Width_600 float_left" >
									<label class="font-16">占用资源列表:<a
										class="btn btn-primary float_right btn_width btn_mar_l_30 margin_top_-10 showVitualCI" 
										 href="#" id="showVitualCI"  >添加资源</a></label>
									<div style="overflow:auto;height:320px;">
									<table class="table table-bordered table-hover">
										<thead>
											<tr>
											</tr>
											<tr>
												<th>名称</th>
												<th>当前分配量</th>
												<th>编辑操作</th>
											</tr>
										</thead>
										<tbody id="saveCITable">
										</tbody>
									</table>
									</div>
								</div>
							</div>
							<div class="float_right div_height_425 div_width_350">
								<div class="form-group">
									<label for="object_talk" class="font-16">服务器备注</label>
									<textarea class="form-control" id="serverInfoNew" rows="18"></textarea>
								</div>
							</div>
							<input type="submit" class="input_hide" id="add_submit">
						</form>
						<!--添加表单-->
						<div style="clear: both"></div>

					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" class="btn btn-primary" id="saveNewServer"
						>保存服务器</button>
					<form id="saveServer" style="display:none" >
						<input name="serverId" > 
						<input name="serverName" />
						<input name="serverDesc" />
						<input name="useCI" />
					</form>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>


	<div class="modal fade" id="add_resource" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" >添加资源</h4>
				</div>
				<!-- 弹框数据表格 -->
				<div id="allcifLabel" >
					
				</div>
				<!-- 弹框数据表格结束 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal"
						onclick="addRes('')">添加</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>

	<script src="jsp/bootstrap-3.3.5-dist/js/jquery.min.js"></script>
	<script src="jsp/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
	<script src="jsp/js/table.js"></script>
	<script src="jsp/js/jstree.min.js"></script>
	<script src="jsp/js/ui-tree.js"></script>
	<script src="jsp/js/metronic.js"></script>
	<script src="jsp/js/layout.js"></script>
	<script src="jsp/js/quick-sidebar.js"></script>
	<script src="jsp/js/demo.js"></script>
	<script>
		//存放已分配的资源CI
		var arr = {};
		
		jQuery(document).ready(function() {
			// initiate layout and plugins
			Metronic.init(); // init metronic core components
			Layout.init(); // init current layout
			QuickSidebar.init(); // init quick sidebar
			Demo.init(); // init demo features
			UITree.init();
			
			//add by bert: find all vitual CI
			$(".showVitualCI").click(function(){
				arr = {};
				$("#showAllVitualRes").html("");
// 				data-toggle="modal" data-target="#add_resource"
				ShowSubDialog_Edit("allcifLabel","findAllFiRes.do",null);
				$("#add_resource").modal({show:true});
				
// 				$.ajax({
// 				type : "GET",
// 				url : "findAllFiRes.do",
// 				data : {},
// 				success : function(data) {
// 					$("#allcifLabel").html(data);
// 					if(data!=null && typeof(data)!="undefined")
// 					{
						
// 						var data = JSON.parse(data);
// 						var tbodycontent = "";
// 						for (var i = 0; i < data.length; i++) {
// 							var res = data[i];
// 							tbodycontent+="<tr> <input type='hidden' value="+res.ciId+" /><td><input type='checkbox'></td><td name=name1>"+res.fictitiousName+"</td><td>"+res.actualValue+"</td><td><input type='text' class='div_width_100' name='name' disabled='disabled'></td></tr>";
// 						}
// 						$("#showAllVitualRes").html(tbodycontent);
// 					}
// 					
// 				},
// 				error:function(data)
// 				{
// 					$("#showAllVitualRes").html("后台数据异常，请和管理员联系！");
// 				}
// 			});
				
			});
			$("#popAddDiv").click(function(){
				$("#saveServer").attr("action","addServer.do");
				$("#serverName").val("");
				$("#serverInfoNew").val("");
				$("#saveCITable").html("");
				$("#myModalLabel").text("新增服务器");
				$("#saveNewServer").text("保存服务器");
				$("#serverId").val("");
			});
			
			// save or update new Server
			$("#saveNewServer").click(function(){
				var serverName = $("#serverName").val();
				var serverDesc = $("#serverInfoNew").val();
				var serverId = $("#serverId").val();
				var useCI = {};
				if(serverName==null || serverName==""){
					$("#serverName").attr("style","border:red 1px solid");
					alert("服务器名不能为空！");
				}else{
				$("#saveCITable").find("tr").each(function(i,value){
					var currentUse = $(this).find("td[name=currentUse]").text();
					var ciId  = $(this).find("input[type=hidden]").val();
					if(currentUse!="" && typeof(currentUse)!="undefined"){
						useCI[ciId] = currentUse;
					}
				});
// 				alert(serverId);
				$("#saveServer").find("input[name=serverId]").val(serverId);
				$("#saveServer").find("input[name=serverName]").val(serverName);
				$("#saveServer").find("input[name=serverDesc]").val(serverDesc);
				$("#saveServer").find("input[name=useCI]").val(JSON.stringify(useCI));
				$("#saveServer").submit();
				}
			});

		});
		$('.pagination li>a[name=page]').on('click', function() {
			$('.pagination li').removeClass('active');
			var num = Number($(this).html());
			if (num < 4) {
				$(this).parent().addClass('active');
			} else {
				var count_page = 20;
				if (num + 3 > count_page) {
					var num1 = count_page - 6;
				} else {
					num1 = num - 3;
				}
				$.each($('.pagination li>a[name=page]'), function() {
					$(this).html(num1++);
					if ($(this).html() == num) {
						$('.pagination li').removeClass('active');
						$(this).parent().addClass('active');
					} 	
				})
			}
		});
		
		function addRes(){
			var e=$("#showAllVitualRes").find("td[name=name1]");
			var box=$("#showAllVitualRes").find("input[type=checkbox]");//取到选择的checkbox
			var addBox=$("#saveCITable");//取到要添加到的table
			var appendStr="";//拼接添加字符串
			for(var i=0;i<box.length;i++){
				var checkNo=$(box[i]).prop("value");
				var useNo=$("#showAllVitualRes").find("input[name=name"+checkNo+"]").val();
// 				alert($(box[i]).prop("checked"));
				if($(box[i]).prop("checked") & useNo>0){
					var te=addBox.find("input[value="+checkNo+"]");
					if(te.length==0){
					var e=$("#showAllVitualRes").find("input[id="+checkNo+"]");
					var count=$("#showAllVitualRes").find("input[name=name"+checkNo+"]");
					appendStr+="<tr><input type='hidden' value="+checkNo+" /> <td>"+e.prop("name")+"</td><td name='currentUse'>"+count.val()+"</td>"+
 	           	 	"<td><span class='btn btn-danger btn-margin' onclick='dele_tr(this)'>删除</span></td>"+"</tr>"
					}
					else{
						var count=$("#showAllVitualRes").find("input[name=name"+checkNo+"]");
						$($(te[0]).parent().children()[2]).text(count.val());
					}
				}
			}
			addBox.append(appendStr);
			$("#showAllVitualRes").empty();
		}
		
		//修改资源：
		function updateServer(serverId)
		{
			$("#saveCITable").html("");
			$("#showAllVitualRes").html("");
			$("#myModalLabel").text("修改服务器");
			$("#saveNewServer").text("保存配置");
			$("#saveServer").attr("action","updateServer.do");
			$.ajax({
				type:"GET",
				url:"findServerById.do",
				data:{
					serverId:serverId
				},
				success:function(data){
					var result = JSON.parse(data);
					$("#serverName").val(result.name);
					$("#serverInfoNew").val(result.info);
					$("#serverId").val(serverId);
// 					$("#updateServerId").val(result.serverId);
					var tabledata = result.fise;
					var content = "";
					for(var i=0;i<tabledata.length;i++){
						content+="<tr><input type='hidden' value="+tabledata[i].fictitiousId+" /><td>"+tabledata[i].fictitiousName+"</td><td  name='currentUse'>"+tabledata[i].usageAmount+"</td>"+
						"<td><span class='btn btn-danger btn-margin' onclick='dele_tr(this)'>删除</span></td></tr>";
					}
					$("#saveCITable").append(content);
				}
			});
		}
		
		
		function to_prev() {
		}
		function to_next() {
		}
		
		function addResource()
		{
			
		}
		//删除服务器
		function deleteServer(obj){
// 			alert($(obj).find("span").find("input").val());
			if(confirm("确认删除？")){
			var deleteId=$(obj).find("span").find("input").val();
			$.ajax({
				type : "GET",
				url : "deleteServerById.do",
				data :{
					serverId : deleteId
				},
				dataType : "json",
				success : function(data){
					if(data.success=='Success'){
						alert("删除成功！");
					}else{
						alert("删除失败！");
					}
					window.location.reload();	
				},
				error : function(){
					alert("删除失败！");
				}
			})
			}
		}
		
		//分页
		function skippages(page){
			if(page!='${_curpage}'){
				$("#page_index").val(page);
				$("#searchTerm").submit();
			}
		}
		//判断输入资源数量是否超过上限
		function judgeNumber(obj,divId){
			var inputNo=obj.value;
			var trueNo=$("#id"+divId);
			var truen=trueNo.text();
			if(parseInt(inputNo)>parseInt(truen)){
				alert("分配量不得超过资源总量，请重新输入！");
				obj.value="";
			}
		}
		
		$("#serverName").keyup(function(){
			$(this).removeAttr("style");
		})
	</script>
</body>
</html>
