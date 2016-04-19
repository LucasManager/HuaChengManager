<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="modal-body">
	<!--添加表单-->
	<form role="form" id="searchTerms" action="findAllFiRes.do">
		<div class="form-group">
			<!--属性图插件-->
			<table class="table table-bordered table-hover add_resource_table">
				<thead>
					<tr>
						<th colspan="3"><input type="button" onclick="search_cjf();" value="搜索"
							class="btn btn-primart float_right input_submit"> <input
							type="text" value="<c:if test="${cifName!=null }">${cifName }</c:if>" id="cif_name" class="input_sreach float_right"
							placeholder=" 请输入资源名"></th>
					</tr>
					<tr>
						<th class="check_width"><input type="checkbox"
							onclick="check_resource(this)"></th>
						<th>CI名称</th>
						<th>CI分配上限</th>
					</tr>
				</thead>
				<tbody id="showAllVitualRes">
					<c:forEach items="${list }" var="CIFictitious">
						<tr> 
						<td><input type="checkbox" value="${CIFictitious.ciId}"/></td>
						<td name=name1>${CIFictitious.fictitiousName }</td>
						<td><input type="text" class="div_width_100" name="name${CIFictitious.ciId }" disabled="disabled"></td>
						</tr>
						<input type="hidden" id="${CIFictitious.ciId}" name="${CIFictitious.fictitiousName}" value="${CIFictitious.distributionValue}">
					</c:forEach>
				</tbody>
			</table>

			<!--属性图插件-->
		</div>
		<input type="submit" class="input_hide" id="addresource">
	</form>
	<div style="clear: both"></div>
</div>
<script type="text/javascript">
	function search_cjf(page){
		var name=$("#cif_name").val();
		ShowSubDialog_Edit("allcifLabel","../CIcategory/findAllFiRes.do",name,page);
	}
</script>
