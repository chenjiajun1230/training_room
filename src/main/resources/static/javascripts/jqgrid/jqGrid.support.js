$(function () {
    // Initialize jqGrid...
    if ($.jgrid) {
        $.extend($.jgrid.defaults, {
            responsive: true,
            styleUI: 'Bootstrap',
            autowidth: true,
            height: '100%',
            mtype: 'GET',
            datatype: 'json',
            rowList: [10, 15, 20, 50, 100, 200, 500, 1000, 5000, 10000, 20000],
            rowNum: 20,
            viewrecords: true,
            pager: '#toolBar',
            pagerpos: "left",
            recordpos: "center",
            hidegrid: false,
            regional: 'cn',
            loadtext: "加载中……",
            jsonReader: {
                root: "rows",
                page: "page",
                total: "total",
                records: "records",
                repeatitems: false,
                cell: "cell"
            },
            subGridOptions: {
                sortable: false
            },
            onInitGrid: function () {
                // var $gridContainer = $('#gbox_'+$(this)[0].id).parent()
                // if ($gridContainer.width() > 10 && $gridContainer.hasClass('grid-container')) { //小于10表示grid_container被隐藏了, 无法正确计算宽度
                //     $gridContainer.width($gridContainer.width()+3)
                // }
            },
            loadError: function(jqXHR, textStatus, errorThrown) {
                alert(textStatus)
            }
        })
    }
});

function isSaidFormatter(cellValue, options, rowObject) {
    if (cellValue === true) return "<span class='glyphicon glyphicon-ban-circle text-danger'></span>";
    return "<span class='glyphicon glyphicon-ok-sign text-success'></span>";
}

function disableFormatter(cellValue, options, rowObject) {
    if (cellValue === true) return "<span class='glyphicon glyphicon-remove text-danger'></span>";
    return "";
}

function resolveGrid(gridId) {
    var $grid;
    if (gridId && typeof gridId == 'object') {
        $grid = gridId
    } else {
        if (!gridId) gridId = 'gridBody';
        if (!gridId.startsWith("$")) gridId = '#'+gridId
        $grid = $(gridId)
    }
    return $grid
}

function resolveSelection(gridId) {
    var $grid = resolveGrid(gridId);
    var id = $grid.jqGrid('getGridParam', 'selrow');
    if (id) {
        return $grid.jqGrid('getRowData', id);
    } else {
        alert("请选择一条记录");
    }
}