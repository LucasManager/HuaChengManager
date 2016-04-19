<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!dcotype html>
<html>
	<head>
		<title>权限维护</title>
                   <link rel="stylesheet" href="../bootstrap-3.3.5-dist/css/bootstrap.min.css">
                   <link rel="stylesheet" href="../bootstrap-3.3.5-dist/css/bootstrap.css">
                   <script src="../bootstrap-3.3.5-dist/js/jquery.min.js"></script>
                   <script src="../bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
                   <script src="../bootstrap-3.3.5-dist/js/tests/vendor/jquery.min.js"></script> 
		<meta http-equiv="content-type" content="text/html;charset=utf-8">
		<link rel="stylesheet" href="../style/table.css">
		<script src="../js/table.js"></script>
	</head>
	<body>
	<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12 div_background div_padding div_margin">
			<table class="table table-bordered table-hover table_attr">
                            <thead>
                                <tr>
                                    <td colspan="6">
                                        <button class="btn btn-primary float_right btn_width btn_margin-r" data-toggle="modal" data-target="#myModal">添加</button>
                                    </td>
                                </tr>
                                <tr>
                                        <th class="check_width">
						<span class="pointer" onclick="true_cheked(this)"><input type="checkbox">全选</span>
					</th>
					<th>资源名</th>
					<th>角色</th>
                                        <th>创建人</th>
                                        <th>创建时间</th>
                                        <th class="td_width_200">编辑操作</th>
				</tr>
                            </thead>
                            <tbody>
				<tr>
                                        <td><input type="checkbox"></td>
					<td>cmdb</td>
                                        <td>cmdb</td>
					<td>righting</td>
				        <td>2016/2/23</td>
					<td class="width_btn"><span class="btn btn-primary btn-margin" data-toggle="modal" data-target="#changepermossion">修改</span><span class="btn btn-danger btn-margin" onclick="dele_tr(this)">删除</span></td>
				</tr>
                            </tbody>
                            <tfoot>
				<tr>
                                    <td class="check_width">
			                 <span class="pointer" onclick="del_cheked()">删除</span>
                                    </td>
                                    <td colspan="5">
					<ul class="pagination">
					<li><a href="javascript:void(0)" onclick="to_prev()"><i class="glyphicon glyphicon-chevron-left" style="height:21px;"></i></a></li>
					<li class="active"><a href="javascript:void(0)" name="page">1</a></li>
					<li ><a href="javascript:void(0)" name="page">2</a></li>
					<li><a href="javascript:void(0)" name="page">3</a></li>
					<li><a href="javascript:void(0)" name="page">4</a></li>
					<li><a href="javascript:void(0)" name="page">5</a></li>
					<li><a href="javascript:void(0)" name="page">6</a></li>
                                        <li><a href="javascript:void(0)" name="page">7</a></li>
					<li><a href="javascript:void(0)" onclick="to_next()"><i class="glyphicon glyphicon-chevron-right" style="height:21px;"></i></a></li>
				   </ul>
				    </td>
				</tr>
                            </tfoot>
			</table>
                    <div style="clear:both"></div>
                    </div>
                 </div>
		</div>
           <!--模态框-->
           <div class="modal fade" id="myModal" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                   <div class="modal-content">
                      <div class="modal-header">
                         <button type="button" class="close" 
                            data-dismiss="modal" aria-hidden="true">
                               &times;
                         </button>
                         <h4 class="modal-title" id="myModalLabel">
                            添加权限
                         </h4>
                      </div>
                      <div class="modal-body">
                         <div id="add_role">
                             <!--添加表单-->
                            <form role="form" action="">
                               <div class="form-group">
                                  <label for="name" class="font-16">资源名:</label>
                                  <input type="text" class="form-control" id="name" placeholder="请输入资源名称">
                               </div>
                                <div class="form-group">
                                  <label for="start_name" class="font-16">用户:</label>
                                  <input type="text" class="form-control" id="start_name" placeholder="请输入用户">
                               </div>
                                <div class="form-group">
                                  <label for="talk" class="font-16">说明：</label>
                                  <textarea class="form-control" id="object_talk" rows="5"></textarea>
                               </div>
                               <input type="submit" class="input_hide" id="add_submit">
                            </form>
                             <!--添加表单-->
                         </div>
                      
                      </div>
                      <div class="modal-footer">
                         <button type="button" class="btn btn-default" 
                            data-dismiss="modal">关闭
                         </button>
                         <button type="button" class="btn btn-primary" onclick="$('#add_submit').click()">
                            提交添加
                         </button>
                      </div>
                   </div><!-- /.modal-content -->
             </div><!-- /.modal -->
           <!--模态框-->
            </div>
           
            <!--模态框-->
           <div class="modal fade" id="changepermossion" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                   <div class="modal-content">
                      <div class="modal-header">
                         <button type="button" class="close" 
                            data-dismiss="modal" aria-hidden="true">
                               &times;
                         </button>
                         <h4 class="modal-title" id="myModalLabel">
                            修改权限
                         </h4>
                      </div>
                      <div class="modal-body">
                         <div id="add_CI_child">
                             <!--添加表单-->
                            <form role="form" action="">
                               <div class="form-group add_select_style float_left">
                                  <label for="resource" class="font-16">资源:</label>
                                  <select id="resource" class="form-control">
                                       <option>第一资源</option>
                                       <option>第一资源</option>
                                       <option>第一资源</option>
                                  </select>
                               </div>
                                <div class="form-group add_select_style float_right">
                                  <label for="resource_num" class="font-16">角色:</label>
                                  <select id="resource_mun" class="form-control">
                                       <option>第一角色</option>
                                       <option>第一角色</option>
                                       <option>第一角色</option>
                                  </select>
                               </div>
                                <div style="clear:both" class="margin_bu_15"></div>
                               <div class="form-group">
                                  <label for="talk" class="font-16">说明:</label>
                                  <textarea class="form-control" id="talk" rows="3"></textarea>
                               </div>
                               <input type="submit" class="input_hide" id="add_submit">
                            </form>
                             <!--添加表单-->
                         </div>
                      
                      </div>
                      <div class="modal-footer">
                         <button type="button" class="btn btn-default" 
                            data-dismiss="modal">关闭
                         </button>
                         <button type="button" class="btn btn-primary" onclick="$('#add_submit').click()">
                            提交修改
                         </button>
                      </div>
                   </div><!-- /.modal-content -->
             </div><!-- /.modal -->
           <!--模态框-->
            </div>
	    <script>
	     $('.pagination li>a[name=page]').on('click', function () {
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
                    $.each($('.pagination li>a[name=page]'), function () {
                        $(this).html(num1++);
                        if ($(this).html() == num) {
                            $('.pagination li').removeClass('active');
                            $(this).parent().addClass('active');
                        }
                    })
                }
            });

            function to_prev() {
            }
            function to_next() {
            }

	    </script>
	</body>
        
</html>
