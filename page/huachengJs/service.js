var user = {};
var part = {};

$(document).ready(function(){
    $("#searchUserBtn").click(function(e){
        user={};
        $("#userTable tr").parent().find("tr").each(function(){
            $(this).css("background","");
        });
    })
    $("#userTable tr").click(function(e){
        $(this).parent().find("tr").each(function(){
            $(this).css("background","");
        });
        $(this).css("background","#B2C1D6");
        var mes = $(this).find("td");
        user = {userId:mes[0].innerHTML,userName:mes[1].innerHTML};
    })
    $("#getUser").click(function(e){
        $("#getUser").attr('data-dismiss', '');
        if(user.userName == undefined)
        {
            alert("请选中一条记录");
            return
        }else {
            $("#userName").text(user.userName);
            $("#getUser").attr('data-dismiss', 'modal');
        }
    });
})