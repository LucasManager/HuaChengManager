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
</head>
<body>
	<div class="panel border_364150 width_980  div_margin_center">
    <form id="searchTerms" action="" method="post" class="margin_0">
        <div class="height_40 background_364150">
            <div class="height_40 float_left background_293846">
                <div class="float_left width_300">
                    <input type="text" name="projectNo" class="object_search argin_l_15" placeholder="客户名称">
                    <input type="text" name="projectName" class="object_search" placeholder="客户手机号">
                    <input type="submit" class="input_hide" id="searchButtom">
                </div>
                <span onclick="$('#searchButtom').click()" class="table_search_submit">&nbsp;<i class="glyphicon glyphicon-search" style="font-size:18px"></i>&nbsp;</span>
            </div>

            <span data-toggle="modal" data-target="#addLockParts" class=" float_right object_addobject" title="缺件记录"><i class="glyphicon glyphicon-plus-sign"></i>缺件记录</span>
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
                <th>描述</th>
                <th>编辑操作</th>
            </tr>
            </thead>
            <tbody id="projectContent">
            <tr>
                <td>李四</td>
                <td>1363666666</td>
                <th>豫XAAAAA</th>
                <td>前轮</td>
                <td>大号</td>
                <td>2</td>
                <td>2016-07-06</td>
                <td>对当前缺件的描述</td>
                <td>
                    <a href="javascript:void(0)" title="修改" data-toggle="modal" data-target="#addStore" onclick="findDetailById()"><i class="glyphicon glyphicon-edit "></i></a>
                    <a href="javascript:void(0)" title="删除" onclick="deleteProject()" class="btn-margin_5"><i class="glyphicon glyphicon-trash"></i></a>
                </td>
            </tr>
            </tbody>
            <tfoot>
            <tr>
                <td colspan="9">
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
							<label for="partsNum" class="col-sm-3 control-label">手机号：</label>
							<div class="col-sm-9">
								<input type="email" class="form-control" id="" placeholder="">
							</div>
						</div>
						<div class="form-group">
							<label for="partsNum" class="col-sm-3 control-label">车牌号：</label>
							<div class="col-sm-9">
								<input type="email" class="form-control" id="" placeholder="">
							</div>
						</div>
						<div class="form-group">
							<label for="partsNum" class="col-sm-3 control-label">配件名称：</label>
							<div class="col-sm-9">
								<input type="email" class="form-control" id="" placeholder="">
							</div>
						</div>
						<div class="form-group">
							<label for="partsNum" class="col-sm-3 control-label">型号：</label>
							<div class="col-sm-9">
								<input type="email" class="form-control" id="" placeholder="">
							</div>
						</div>
						<div class="form-group">
							<label for="partsNum" class="col-sm-3 control-label">所需数量：</label>
							<div class="col-sm-9">
								<input type="email" class="form-control" id="" placeholder="">
							</div>
						</div>
						<div class="form-group">
							<label for="partsNum" class="col-sm-3 control-label">描述：</label>
							<div class="col-sm-9">
								<textarea type="email" class="form-control" id="" placeholder=""></textarea>
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

<script type="text/javascript">
	$(document).ready(function(){
	});

	function deleteProject(projectId, obj) {

		if (confirm("是否确认删除？")) {
			$.ajax({
				type: "POST",
				url: "deleteProjectById.do",
				data: {
					projectId: projectId
				},
				dataType: "json",
				success: function(data) {
					if (data.success == "success") {
						alert("删除成功！");
						obj.parentNode.parentNode.parentNode.removeChild(obj.parentNode.parentNode);
					} else {
						alert("删除失败！");
					}
				}
			});
		}
	}
</script>
</body>
</html>