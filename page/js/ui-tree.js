var UITree = function () {
    var handleSample2 = function (id,dataSource) {
		$(id).data('jstree', false).empty().jstree({
            'plugins': ["wholerow", "checkbox", "types"],
            'core': {
                "themes" : {
                    "responsive": false
                },    
                'data':dataSource
            },
            "types" : {
                "default" : {
                    "icon" : "fa fa-folder icon-state-warning icon-lg"
                },
                "file" : {
                    "icon" : "fa fa-file icon-state-warning icon-lg"
                }
            }
        });
	}
    return {
        init: function (id,dataSource) {
        	handleSample2(id,dataSource);
        },
    };

}();