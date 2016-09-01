$(document).ready(function() {
	$('#addPartDate').datetimepicker({
		language : 'zh-CN',
		format : 'yyyy-dd-mm hh:ii:ss',
		weekStart : 1,
		todayBtn : 1,
		autoclose : 1,
		todayHighlight : 1,
		startView : 2,
		forceParse : 0,
		showMeridian : 1,
		minView : 2
	});
	loadPartsGrid("", "", 0);
	$("#confirmAddPartsBtn").click(function(e){
		confirmAddParts();
	});
	
});

function loadPartsGrid(partName,partType,currentPage){
	$.ajax({
		type:"POST",
		url:"partsManager/findParts.do",
		data:{
			name:partName,
			type:partType,
			currentPage:currentPage
		},
		dataType:"json",
		success:function(data){
			var content =  "";
			if(data!=null && data.length!=0){
				for(var i=0;i<data.length;i++){
					var part = data[i];
					content = content.concat("<tr><td>"+part.name+"</td><td>"+part.type+"</td><td>"+part.partsNo+"</td><td>"+part.surplusNum+"</td><td>"+part.positions+"</td>"+
							"<td><a href='javascript:void(0)' title='查看进货记录' data-toggle='modal' data-target='#showParts' onclick='' class='btn-margin_5'>详情</a></td><td>"+part.description+"</td>"+
							"<td><a href='javascript:void(0)' title='增加库存' data-toggle='modal' data-target='#addStore' onclick='' class='btn-margin_5'><li class='glyphicon glyphicon-plus'></i></a>"+
							"<a href='javascript:void(0)' title='修改' data-toggle='modal' data-target='#updateStore' onclick='' class='btn-margin_5'><li class='glyphicon glyphicon-edit'></i></a>"+
							"<a href='javascript:void(0)' title='删除'  onclick='deleteParts("+part.id+",this)' class='btn-margin_5'><li class='glyphicon glyphicon-trash'></i></a></td><td></td></tr>");
				}
			}
			$("#partStore").html(content);
		}
	});
}
function confirmAddParts()
{
	if($("#partsName").val()==null || $("#partsName").val()==undefined ||$("#partsName").val()=='')
	{
		alert("配件名称不能为空！");
		return;
	}
	if($("#partsType").val()==null || $("#partsType").val()==undefined ||$("#partsType").val()=='')
	{
		alert("配件类型不能为空！");
		return;
	}
	if($("#partsNo").val()==null || $("#partsNo").val()==undefined ||$("#partsNo").val()=='')
	{
		alert("配件型号不能为空！");
		return;
	}
	var parts ={name:$("#partsName").val(),type:$("#partsType").val(),partsNo:$("#partsNo").val(),positions:$("#partsPosition").val(),description:$("#partsDesc").val()};
	$.ajax({
		type:"POST",
		url:"partsManager/addParts.do",
		dataType:"json",
		data:{
			parts:JSON.stringify(parts)
		},
		success:function(data){
			alert(data);
			if(data.result=="success"){
				loadPartsGrid("", "", 0);
			}else{
				alert("添加失败！");
			}
		},
		error:function(error){
			alert("添加出错！");
		}
	});
	
}


function addPartsBtn()
{
	clearParts();
}
//清空parts内的值
function clearParts()
{
	$("#partsName").val("");
	$("#partsType").val("");
	$("#partsNo").val("");
	$("#partsPosition").val("");
	$("#partsDesc").val("");
}


function deleteParts(partsId, obj) {
	if (confirm("是否确认删除？")) {
		$.ajax({
			type : "POST",
			url : "deleteProjectById.do",
			data : {
				projectId : projectId
			},
			dataType : "json",
			success : function(data) {
				if (data.success == "success") {
					alert("删除成功！");
					obj.parentNode.parentNode.parentNode
							.removeChild(obj.parentNode.parentNode);
				} else {
					alert("删除失败！");
				}
			}
		});
	}
}