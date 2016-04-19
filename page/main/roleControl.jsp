<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!dcotype html>
<html>
	<head>
		<title>角色维护</title>
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
					<td colspan="4">
						<form action="" method="post">
							<input type="text" name="id" class="input_sreach float_left" placeholder=" 请输入角色名查找">
							<input type="text" name="name" class="input_sreach float_left" placeholder=" 请输入创建人查找">
                                                        <input type="text" name="job"  class="input_sreach float_left" placeholder=" 请输入创建时间查找">
							<input type="submit" value="搜索" class="btn btn-primart float_left input_submit">
							<span class="btn append_person" data-toggle="modal" data-target="#myModal">添加角色</span>
						</form>
					</td>
				</tr>
                                <tr>
					<th>角色名</th>
					<th>创建人</th>
                                        <th>创建时间</th>
					<th>编辑操作</th>
				</tr>
                            </thead>
                            <tbody>
				<tr>
					<td>cmdb</td>
					<td>righting</td>
				        <td>2016/2/23</td>
					<td class="width_btn"><span class="btn btn-primary btn-margin" data-toggle="modal" data-target="#changerole">修改</span><span class="btn btn-danger btn-margin" onclick="dele_tr(this)">删除</span></td>
				</tr>
                            </tbody>
                            <tfoot>
				<tr>

					<td colspan="4">
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
                            添加角色
                         </h4>
                      </div>
                      <div class="modal-body">
                         <div id="change_role">
                             <!--添加表单-->
                            <form role="form" action="">
                               <div class="form-group">
                                  <label for="name" class="font-16">角色名称:</label>
                                  <input type="text" class="form-control" id="name" placeholder="请输入角色名称">
                               </div>
                                <div class="form-group">
                                  <label for="start_name" class="font-16">创建人:</label>
                                  <input type="text" class="form-control" id="start_name" placeholder="请输入创建人">
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
           <div class="modal fade" id="changerole" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                   <div class="modal-content">
                      <div class="modal-header">
                         <button type="button" class="close" 
                            data-dismiss="modal" aria-hidden="true">
                               &times;
                         </button>
                         <h4 class="modal-title" id="myModalLabel">
                            修改角色
                         </h4>
                      </div>
                      <div class="modal-body">
                         <div id="add_role">
                             <!--添加表单-->
                            <form role="form" action="">
                               <div class="form-group">
                                  <label for="name" class="font-16">角色ID:</label>
                                  <input type="text" class="form-control" id="name" placeholder="请输入角色ID">
                               </div>
                                <div class="form-group">
                                  <label for="start_name" class="font-16">角色名:</label>
                                  <input type="text" class="form-control" id="start_name" placeholder="请输入角色名">
                               </div>
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
                            提交添加
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
