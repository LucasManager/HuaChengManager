<%@page import="com.cmdb.entity.CIProject"%>
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
        <title>图表展示</title>
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
    </head>
    <body>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12 div_background div_padding div_margin">
                <form id="searchTerms" action="getProjectList.do" method="post">
                    <table class="table table-bordered table-hover table_attr">
                        <thead>
                            <tr>
                                <td colspan="7">
                                		<select></select>
                                        <input type="text" name="projectName" class="input_sreach float_left" placeholder=" 请输入关键字">
                                        <input type="submit" id="searchButtom" value="搜索" class="btn btn-primart float_left input_submit">
										<span style="margin-left: 35%;" class="btn append_person" data-toggle="modal" data-target="#changeobj" onclick="addProject();">添加项目</span> 
                                    
                                </td>
                            </tr>
                            <tr>
                                <th class="check_width">
                                    <span class="pointer" onclick="true_cheked(this)"><input type="checkbox"></span>
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
                            			<td><input type="checkbox"></td>
                            			<td>${project.sProjectNo}</td>
                            			<td>${project.sProjectName}</td>
                            			<td>
                            			<c:if test="${project.status==1}">正常</c:if>
                            			<c:if test="${project.status==2}">完结</c:if>
                            			</td>
                            			<td>${project.sDescribe}</td>
                            			<td class="td_width_100">
<!--                             			data-target="#changeobj" -->
                            			<span class="btn btn-primary btn-margin" data-toggle="modal"  onclick="findDetailById(${project.iProjectId})">修改</span>
                            			<span class="btn btn-primary btn-margin" data-toggle="modal" data-target="#add_resource" onclick="check_resource(${project.iProjectId})">资源设置</span>
                            			<span class="btn btn-danger btn-margin" onclick="deleteProject(${project.iProjectId},this)">删除</span>
                            			</td>
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
                        <!--  -->
                        </div>
                        <div style="clear: both"></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" onclick="$('#change_obj').click()">
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
                        <button type="button" class="btn btn-primary" id="updateCIBtn">
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
                    
               });
                
        </script>
        
    </body>
</html>
