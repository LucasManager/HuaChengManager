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
						<th colspan="5"><input type="button" onclick="search_cjf();" value="搜索"
							class="btn btn-primart float_right input_submit"> <input
							type="text" value="<c:if test="${cifName!=null }">${cifName }</c:if>" id="cif_name" class="input_sreach float_right"
							placeholder=" 请输入资源名"></th>
					</tr>
					<tr>
						<th class="check_width"><input type="checkbox"
							onclick="check_resource(this)"></th>
						<th>CI名称</th>
						<th>CI分配上限</th>
						<th>CI剩余量</th>
						<th class="div_width_150">当前分配量</th>
					</tr>
				</thead>
				<tbody id="showAllVitualRes">
					<c:forEach items="${list }" var="CIFictitious">
						<tr> 
<%-- 						<input type="hidden" id="${CIFictitious.id }" /> --%>
						
						<td><input <c:if test="${CIFictitious.canUsage<=0 }">disabled="true"</c:if> type="checkbox" value="${CIFictitious.id}"/></td>
						<td name=name1>${CIFictitious.fictitiousName }</td>
						<td>${CIFictitious.distributionValue }</td>
						<td id="id${CIFictitious.id }">${CIFictitious.canUsage }</td>
						<td><input type="text" class="div_width_100" name="name${CIFictitious.id }" onkeyup="judgeNumber(this,${CIFictitious.id });" disabled="disabled"></td>
						</tr>
						<input type="hidden" id="${CIFictitious.id }" name="${CIFictitious.fictitiousName }" value="${CIFictitious.actualValue }">
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="5">
						<%@include file="../../menu/page.jsp" %>
						</td>
					</tr>
				</tfoot>
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
		ShowSubDialog_Edit("allcifLabel","findAllFiRes.do",name,page);
	}
	
	function skippage(page){
		if(page!='${curpage}'){
			$("#pageindex").val(page);
			search_cjf(page);
		}
	}
	
	
</script>
