<%-- <%@page import="com.cmdb.entity.CIProject"%> --%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
    <head>
    <base href="<%=basePath%>">
        <title>项目管理</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <meta http-equiv="content-type" content="text/html;charset=utf-8">
        <link rel="stylesheet" href="jsp/bootstrap-3.3.5-dist/css/bootstrap.css">
        <!--<link rel="stylesheet" href="/jspbootstrap-3.3.5-dist/css/bootstrap.min.css">-->
        <link rel="stylesheet" href="jsp/style/table.css">
        <link rel="stylesheet" href="jsp/style/components.css">
        <link rel="stylesheet" href="jsp/style/style.min.css">
        <script src="jsp/bootstrap-3.3.5-dist/js/jquery.min.js"></script>
        <script src="jsp/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
<!--         <script src="jsp/bootstrap-3.3.5-dist/js/tests/vendor/jquery.min.js"></script>  -->
        <script src="jsp/js/table.js"></script>
        <script src="jsp/js/jstree.min.js"></script>
        <script src="jsp/js/ui-tree.js"></script>
        <script src="jsp/js/metronic.js"></script>
        <script src="jsp/js/layout.js"></script>
        <script src="jsp/js/quick-sidebar.js"></script>
        <script src="jsp/js/demo.js"></script>
        <!-- timepiker -->
<!--         <script src="jsp/main/js/jquery.min.js" type="text/javascript"></script> -->
<!-- 		<script src="jsp/main/js/bootstrap.min.js" type="text/javascript"></script> -->
		<script type="text/javascript" src="jsp/main/js/bootstrap-datepicker.min.js"></script>
		<script src="jsp/main/js/components-pickers.js"></script>
        <link href="jsp/main/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <!-- timepiker -->
    </head>
    <body>
         <ol class="breadcrumb">
            <li><a href="../main/picture.html"><i class="glyphicon glyphicon-home"></i>&nbsp;首页</a></li>
            <li><a href="../main/objectControl.html">项目管理</a></li>
        </ol>
        <div class="panel panel-default width_900  div_margin_center">
            <div class="panel-heading" >
                <h3 class="panel-title">项目管理</h3>
            </div>
            <div class="panel-body background_F9F7F6">
                <div class="panel border_364150 width_800  div_margin_center">
                <form id="searchTerms" action="getProjectList.do" method="post" class="margin_0">
                    <div class="height_40 background_364150">
                        <div class="height_40 float_left background_293846">
                            <div class="float_left width_300">
                               <input type="text" name="projectNo" class="object_search argin_l_15" <c:if test="${search_terms.sProjectNo!=null }">value="${search_terms.sProjectNo }"</c:if> placeholder=" 请输入编号查找">
                               <input type="text" name="projectName" class="object_search" <c:if test="${search_terms.sProjectName!=null }">value="${search_terms.sProjectName }"</c:if> placeholder=" 请输入名称查找">
                               <input type="submit" class="input_hide"  id="searchButtom">
                            </div>
                            <span  onclick="$('#searchButtom').click()" class="table_search_submit">&nbsp;<i class="glyphicon glyphicon-search" style="font-size:18px"></i>&nbsp;</span>
                        </div>
                        <span class="float_right object_addobject" onclick="del_cheked('deleteBatch')" title="删除选中"><i class="glyphicon glyphicon-minus-sign" ></i>删除选择</span>
                        <span data-toggle="modal" data-target="#changeobj" onclick="addProject();" class=" float_right object_addobject" title="添加项目"><i class="glyphicon glyphicon-plus-sign"></i>添加项目</span>
                    </div>
                    <table class="table table-bordered table-hover table-striped">
                        <thead>
                            <tr>
                                <th class="check_width">
                                    <span class="pointer" onclick="true_cheked(this)"><input type="checkbox" onclick="$(this).parent().click()"></span>
                                </th>
                                <th>项目编号</th>
                                <th>项目名称</th>
                                <th>项目状态</th>
                                <th>摘要</th>
                                <th colspan="2">编辑操作</th>
                            </tr>
                        </thead>
                        <tbody id="projectContent" >
                        	<c:forEach items="${projects }" var="project" >
                        		<tr>
                            			<td><input type="checkbox" value="${project.iProjectId}"></td>
                            			<td>${project.sProjectNo}</td>
                            			<td>${project.sProjectName}</td>
                            			<td>
                            			<c:if test="${project.status==1}">正常</c:if>
                            			<c:if test="${project.status==2}">完结</c:if>
                            			</td>
                            			<td>${project.sDescribe}</td>
                            			<td class="td_width_100">
<!--                             			data-target="#changeobj" -->
                            				<a href="javascript:void(0)" title="修改" data-toggle="modal"  onclick="findDetailById(${project.iProjectId})"><i class="glyphicon glyphicon-edit "></i></a>
                                    		<a href="javascript:void(0)" title="删除" onclick="deleteProject(${project.iProjectId},this)" class="btn-margin_5"><i class="glyphicon glyphicon-trash"></i></a>
                                    		<a href="javascript:void(0)" title="资源设置" data-toggle="modal" data-target="#add_resource" onclick="check_resource(${project.iProjectId})" class="btn-margin_5"><i class="glyphicon glyphicon-cog"></i></a>
                            	    	</td>
                            		</tr>
                        	</c:forEach>
                        </tbody>
                        <tfoot>
                            <tr>

                                <td colspan="6">
<%-- 								<%@include file="../menu/page.jsp" %> --%>
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                    </form>
                    <div style="clear:both"></div>
                </div>
            </div>
        </div>
        <!--模态框-->
        <div class="modal fade" id="changeobj" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" 
                                data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                            修改项目
                        </h4>
                    </div>
                    <div class="modal-body">
                        <div>
                            <!--添加表单-->
                            <form role="form" id="project_id" action="">
                                <input hidden="hidden" id="upt_projectId" name="sProjectId">
                                <div class="form-group">
                                    <label for="name" class="font-16">*项目编号:</label>
                                    <input type="text" class="form-control" id="upt_projectNo" name="sProjectNo"
                                           placeholder="请输入项目编号" onkeyup="keyup(this);">
                                </div>
                                <div class="form-group">
                                    <label for="name" class="font-16">*项目名称:</label>
                                    <input type="text" class="form-control" id="upt_projectName" name="sProjectName"
                                           placeholder="请输入项目名称" onkeyup="keyup(this);">
                                </div>
                               <div class="form-group">
                                    <label for="object_talk" class="font-16">项目描述:</label>
                                    <textarea class="form-control" id="upt_projectDescribe" name="sDescribe" rows="3"></textarea>
                                </div>
                                <div class="form-group add_select_style float_left">
                                  <label for="upt_checkService" class="font-16">选择服务器:</label>
                                  <select id="upt_checkService" name="server" class="form-control">
                                  	<option value="0">未选择</option>
                                  <c:forEach items="${Services }" var="service">
                                  	<option value="${service.serverId }">${service.name }</option>
                                  </c:forEach>
                                  </select>
                               </div>
                               <div class="form-group add_select_style float_left">
                                  <label style="margin-left: 10%;" for="upt_status" class="font-16">项目状态:</label>
                                  <select style="margin-left: 10%;" id="upt_status" name="status" class="form-control">
                                       <option value="0">未选择</option>
                                       <option value="1">正常</option>
                                       <option value="2">完结</option>
                                       <option value="3">删除</option>
                                  </select>
                               </div>
                               <!-- 添加开始时间 -->
                               <label style="margin-top: 20px;">开始时间：</label>
								<div class="input-group input-medium date date-picker"
								data-date="2016-3-16" data-date-format="yyyy/mm/dd"
								data-date-viewmode="years">
								<input id="startDate" name="startDate" type="text" class="form-control" readonly> <span
									class="input-group-btn">
									<button class="btn default" type="button">
										<i class="fa fa-calendar"></i>
									</button>
								</span>
							</div>
							<input type="submit" class="input_hide" id="change_obj">
                            </form>
                            <!--添加表单-->
                        </div>
                        <div style="clear: both"></div>
                    </div>
                    <div class="modal-footer">
                        <button id="form_submit" type="button" class="btn btn-primary" onclick="beforeSubmit();"><!-- $('#change_obj').click(); -->
                            提交添加
                        </button>
                        <button type="button" class="btn btn-default" 
                                data-dismiss="modal">关闭
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
            <!--模态框-->
        </div>
        
         <!--模态框-->
        <div class="modal fade" id="add_resource" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" 
                                data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                            修改项目
                        </h4>
                    </div>
                    <div class="modal-body">
                        <div>
                            <!--添加表单-->
                            <form role="form" action="">
                                <div class="form-group">
                                 
                                    <div class="portlet green-meadow box">
						<div class="portlet-title">
							<div class="caption">
						        <i class="fa fa-cogs"></i>所有资源
							</div>
							<div class="tools">
								<a href="javascript:;" class="collapse">
								</a>
								<a href="#portlet-config" data-toggle="modal" class="config">
								</a>
								<a href="javascript:;" class="reload">
								</a>
								<!--<a href="javascript:;" class="remove">
								</a>--><!--插件删除按钮-->
							</div>
						</div>
						<div class="portlet-body">
							<div id="tree" class="tree-demo">
							</div>
						</div>
					</div>
                                </div>
                                  
                            </form>
                            <!--添加表单-->
                            <div style="clear:both"></div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" data-dismiss="modal" class="btn btn-primary" id="updateCIBtn">
                            提交添加
                        </button>
                        <button type="button" class="btn btn-default" 
                                data-dismiss="modal">关闭
                        </button>

                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
            <!--模态框-->
        </div>

        <script>
                jQuery(document).ready(function() {       
                    // initiate layout and plugins
                   Metronic.init(); // init metronic core components
		   Layout.init(); // init current layout
		   QuickSidebar.init(); // init quick sidebar
		   Demo.init(); // init demo features
		   ComponentsPickers.init();
               });
                
        </script>
        <script type="text/javascript">
        
		var currentProjectId = 0;
        $(document).ready(function(){
        	$("#updateCIBtn").click(function(e){
        		var nodes=$("#tree").jstree("get_checked");
        		var nodeId = JSON.stringify(nodes);
        		$.ajax({
    				type : "POST",
    				url : "updateProjectCI.do",
    				data : {
    					projectId : currentProjectId,
    					ciIds : nodeId
    				},
    				dataType : "json",
    				success : function(data) {
//     					UITree.init("#tree",data);
    					if(data.Success=='success')
    					alert("设置成功！");
    				},
    				error : function(){
    					alert("设置错误，请联系系统管理员！")
    				}
    			});
        		
        	});
        });
        
		//点击修改，查出项目详情      
		function findDetailById(projectId) {
// 			alert(projectId);
			$("#myModalLabel").text("修改项目");
			$("#project_id").attr("action","editProjectDetail.do");
			$("#upt_projectId").val(projectId);
			$("#form_submit").text("提交修改");
			$.ajax({
				type : "POST",
				url : "getProjectDetail.do",
				data : {
					projectId : projectId
				},
				dataType : "json",
				success : function(data) {
// 					alert(data.success);
					if(data.success=="Success"){
						$("#upt_projectNo").val(data.result.sProjectNo);
						$("#upt_projectName").val(data.result.sProjectName);
						$("#upt_projectDescribe").val(data.result.sDescribe);
						$("#startDate").val(data.result.startDate);
						if(data.result.server!=null){
							$("#upt_checkService").val(data.result.server.serverId);	
						}
						if(data.result.status!=null){
							$("#upt_status").val(data.result.status);	
						}
						$("#changeobj").modal({show:true});
					}
					
				}
			});
		}
		//添加项目
		function addProject(){
			$("#myModalLabel").text("新增项目");
			$("#form_submit").text("提交新增");
			$("#project_id").attr("action","addProject.do");
			$("#upt_projectName").val("");
			$("#upt_projectDescribe").val("");
			$("#upt_projectNo").val("");
			$("#startDate").val("");
			$("#upt_checkService").find("option:selected").removeAttr("selected");
			$("#upt_status").find("option:selected").removeAttr("selected");
		}
		
		function deleteProject(projectId,obj){
			if(confirm("是否确认删除？")){
			$.ajax({
				type : "POST",
				url : "deleteProjectById.do",
				data : {
					projectId : projectId
				},
				dataType : "json",
				success : function(data) {
					if(data.success=="success"){
						alert("删除成功！");
						obj.parentNode.parentNode.parentNode.removeChild(obj.parentNode.parentNode);
					}else{
						alert("删除失败！");
					}
				}
			});
			}
		}
		
		function check_resource(projectId){
			currentProjectId = projectId;
			$.ajax({
				type : "GET",
				url : "findProjectResource.do",
				data : {
					projectId : projectId
				},
				dataType : "json",
				success : function(data) {
					UITree.init("#tree",data);
				}
			});
		}
		//条件查询
		function searchProjectList(){
			var terms=$("#searchTerms");
			terms.attr("action","searchProjectList.do");
			$.ajax({
				type : "POST",
				url : "searchProjectList.do",
				data : $("#searchTerms").serialize(),
				dataType : "json",
				success : function(data) {
					var projectList=data.projectList;
					var projectTable=$("#projectContent");
					projectTable.empty();
					for(var i=0;i<projectList.length;i++){
						var appendStr="";
						appendStr+="<tr><td><input type='checkbox'></td>";
						appendStr+="<td>"+projectList[i].sProjectNo+"</td>";
						appendStr+="<td>"+projectList[i].sProjectName+"</td>";
						if(projectList[i].status==1){
							appendStr+="<td>正常</td>";
						}else if(projectList[i].status==2){
							appendStr+="<td>完结</td>";
						}else{
							appendStr+="<td>未设置</td>";
						}
						appendStr+="<td>"+projectList[i].sDescribe+"</td>";
						appendStr+="<td class='td_width_100'>";
						appendStr+="<span class='btn btn-primary btn-margin' data-toggle='modal'  onclick='findDetailById("+projectList[i].iProjectId+")'>修改</span>";
						appendStr+="<span class='btn btn-primary btn-margin' data-toggle='modal' data-target='#add_resource' onclick='check_resource("+projectList[i].iProjectId+")'>资源设置</span>";
						appendStr+="<span class='btn btn-danger btn-margin' onclick='deleteProject("+projectList[i].iProjectId+",this)'>删除</span></td></tr>";
            			projectTable.append(appendStr);
					}
				}
			});
		}
		//分页
		function skippage(page){
		if(page!='${curpage}'){
			$("#pageindex").val(page);
			$("#searchTerms").submit();
		}
	    };
		//表单校验
		function beforeSubmit(){
			$("#project_id");
			var projectNo=$("#upt_projectNo").val();
			var projectName=$("#upt_projectName").val();
			var startDate=$("#startDate").val();
			if((projectNo==null || projectNo=="") && (projectName!=null && projectName!="")){
				$("#upt_projectNo").attr("style","border:red 1px solid");
				alert("项目编号不能为空");
			}else if((projectNo!=null && projectNo!="") && (projectName==null || projectName=="")){
				$("#upt_projectName").attr("style","border:red 1px solid");
				alert("项目名不能为空");
			}else if((projectNo==null || projectNo=="") && (projectName==null || projectName=="")){
				$("#upt_projectNo").attr("style","border:red 1px solid");
				$("#upt_projectName").attr("style","border:red 1px solid");
				alert("必填项不能为空");
			}else{
				$('#change_obj').click();
			}
		};
		function keyup(o){
			$(o).removeAttr("style");
		}
		
		
	</script>
    </body>
</html>
