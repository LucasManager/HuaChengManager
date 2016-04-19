function true_cheked(obj) {
    if ($(obj).find('input').prop('checked')) {
        $(obj).find('input').prop('checked', false);
        $('.table').find('tbody').find('input[type=checkbox]').prop('checked', false);
    } else {
        $(obj).find('input').prop('checked', true);
        $('.table').find('tbody').find('input[type=checkbox]').prop('checked', true);
    }
}

function del_cheked(url) {
	var pros=[];
    $.each($('.table').find('tbody').find('input:checked'), function () {
        pros.push($(this).val());
    });
    var s=JSON.stringify(pros);
    $.ajax({
    	type:"post",
    	url:url+".do",
    	data:{
    		projects:s
    	},
    	dataType:"json",
    	success:function(data){
    		if(data.Success=='success'){
    			alert("删除成功！");
    			window.location.reload();
    		}
    	},
    	error:function(){
    		alert("删除失败！");
    	}
    })
}

function dele_tr(obj) {
    obj.parentNode.parentNode.parentNode.removeChild(obj.parentNode.parentNode);
}

function show_mian(id, information) {
	var name = id;//$(id).attr('value');
    $('#' + name).parent().parent().siblings("div.htmleaf-content").hide();
    $('#' + name).parent().parent().show();
    switch (name)
    {
        case 'canvas':
            var ctx = document.getElementById("canvas").getContext("2d");
            window.myBar = new Chart(ctx).Bar(information, {responsive: true});
            break;
        case 'chart-area':
            var ctx = document.getElementById("chart-area").getContext("2d");
            window.myPie = new Chart(ctx).Pie(information);
            break;
        case 'chart2':
            Chart.defaults.global.pointHitDetectionRadius = 1;
            Chart.defaults.global.customTooltips = function (tooltip) {
                var tooltipEl = $('#chartjs-tooltip');
                if (!tooltip) {
                    tooltipEl.css({
                        opacity: 0
                    });
                    return;
                }
                tooltipEl.removeClass('above below');
                tooltipEl.addClass(tooltip.yAlign);
                var innerHtml = '';
                for (var i = tooltip.labels.length - 1; i >= 0; i--) {
                    innerHtml += [
                        '<div class="chartjs-tooltip-section">',
                        '	<span class="chartjs-tooltip-key" style="background-color:' + tooltip.legendColors[i].fill + '"></span>',
                        '	<span class="chartjs-tooltip-value">' + tooltip.labels[i] + '</span>',
                        '</div>'
                    ].join('');
                }
                tooltipEl.html(innerHtml);

                tooltipEl.css({
                    opacity: 1,
                    left: tooltip.chart.canvas.offsetLeft + tooltip.x + 'px',
                    top: tooltip.chart.canvas.offsetTop + tooltip.y + 'px',
                    fontFamily: tooltip.fontFamily,
                    fontSize: tooltip.fontSize,
                    fontStyle: tooltip.fontStyle,
                });
            };

            var ctx2 = document.getElementById("chart2").getContext("2d");
            window.myLine = new Chart(ctx2).Line(information, {responsive: true});
            break;
        case 'canvas2':
            window.myRadar = new Chart(document.getElementById("canvas2").getContext("2d")).Radar(information, {responsive: true});
            break;
        case 'chart_2':
            var plot = $.plot($("#chart_2"), [{
                    data: information[0],
                    label: "Unique Visits",
                    lines: {
                        lineWidth: 1,
                    },
                    shadowSize: 0

                }, {
                    data: information[1],
                    label: "Page Views",
                    lines: {
                        lineWidth: 1,
                    },
                    shadowSize: 0
                }], {
                series: {
                    lines: {
                        show: true,
                        lineWidth: 2,
                        fill: true,
                        fillColor: {
                            colors: [{
                                    opacity: 0.05
                                }, {
                                    opacity: 0.01
                                }]
                        }
                    },
                    points: {
                        show: true,
                        radius: 3,
                        lineWidth: 1
                    },
                    shadowSize: 2
                },
                grid: {
                    hoverable: true,
                    clickable: true,
                    tickColor: "#eee",
                    borderColor: "#eee",
                    borderWidth: 1
                },
                colors: ["#d12610", "#37b7f3", "#52e136"],
                xaxis: {
                    ticks: 11,
                    tickDecimals: 0,
                    tickColor: "#eee",
                },
                yaxis: {
                    ticks: 11,
                    tickDecimals: 0,
                    tickColor: "#eee",
                }
            });


            function showTooltip(x, y, contents) {
                $('<div id="tooltip">' + contents + '</div>').css({
                    position: 'absolute',
                    display: 'none',
                    top: y + 5,
                    left: x + 15,
                    border: '1px solid #333',
                    padding: '4px',
                    color: '#fff',
                    'border-radius': '3px',
                    'background-color': '#333',
                    opacity: 0.80
                }).appendTo("body").fadeIn(200);
            }

            var previousPoint = null;
            $("#chart_2").bind("plothover", function (event, pos, item) {
                $("#x").text(pos.x.toFixed(2));
                $("#y").text(pos.y.toFixed(2));

                if (item) {
                    if (previousPoint != item.dataIndex) {
                        previousPoint = item.dataIndex;

                        $("#tooltip").remove();
                        var x = item.datapoint[0].toFixed(2),
                                y = item.datapoint[1].toFixed(2);

                        showTooltip(item.pageX, item.pageY, item.series.label + " of " + x + " = " + y);
                    }
                } else {
                    $("#tooltip").remove();
                    previousPoint = null;
                }
            });

            break;
        case 'chart_1_2':
            $.plot($("#chart_1_2"), [information[0]], information[1]);
            break;
        case 'chart_2_2':
            $('#chart_2_2').closest('.portlet').find('.fullscreen').click(function () {
                information.invalidateSize();
            });
            break;
        default:

            alert('不能展示图片');
    }

}

function check_resource(obj){
    if($(obj).prop('checked')){
        $(obj).parent().parent().parent().next().find('input[type=checkbox]').prop('checked',true);
        $(obj).parent().parent().parent().next().find('input[type=checkbox]').parent().parent().find('input[type=text]').removeAttr('disabled')
        $('.add_resource_table').find('tbody input[type=checkbox]').click(function () {
				var ciId = $(this).parent().parent().find('input[type=hidden]').val();
	             if ($(this).prop('checked')) {
	                 $(this).parent().parent().find('td input[type=text]').removeAttr('disabled');
	                 //alert($(this).parent().parent().find('td input[type=text]').val());
	                 arr[ciId] =$(this).parent().parent(); 
	             } else {
	                 $(this).parent().parent().find('td input[type=text]').attr('disabled', 'disabled');
	                 delete arr[ciId];
	             }
             
	         })
    }else{
        $(obj).parent().parent().parent().next().find('input[type=checkbox]').prop('checked',false)
        $(obj).parent().parent().parent().next().find('input[type=checkbox]').parent().parent().find('input[type=text]').attr('disabled','disabled')
        $('.add_resource_table').find('tbody input[type=checkbox]').click(function () {
				var ciId = $(this).parent().parent().find('input[type=hidden]').val();
	             if ($(this).prop('checked')) {
	                 $(this).parent().parent().find('td input[type=text]').removeAttr('disabled');
	                 //alert($(this).parent().parent().find('td input[type=text]').val());
	                 arr[ciId] =$(this).parent().parent(); 
	             } else {
	                 $(this).parent().parent().find('td input[type=text]').attr('disabled', 'disabled');
	                 delete arr[ciId];
	             }
             
	         })
    }
}

function ShowSubDialog_Edit(divId,url,name,page){
	$.ajax({
		type:"GET",
		url:url,
		data:{
			cif_name:name,
			pageindex:page
		},
		success:function(data){
			$("#"+divId).html(data);
			$('.add_resource_table').find('tbody input[type=checkbox]').click(function () {
				var ciId = $(this).parent().parent().find('input[type=hidden]').val();
	             if ($(this).prop('checked')) {
	                 $(this).parent().parent().find('td input[type=text]').removeAttr('disabled');
	                 //alert($(this).parent().parent().find('td input[type=text]').val());
	                 arr[ciId] =$(this).parent().parent(); 
	             } else {
	                 $(this).parent().parent().find('td input[type=text]').attr('disabled', 'disabled');
	                 delete arr[ciId];
	             }
             
	         })
		}
	});
}




