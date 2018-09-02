<#-- @ftlroot "." -->
<#import "generalFrame.ftl" as frame />
<#escape x as x?html>

<@frame.frame "Training Room">

<h1>用户管理</h1>

<script type="text/javascript">
    $(function () {
        $("#gridBody").jqGrid({
            url: '/book/list/data',

            colModel: [
                { label: 'ID', name: 'id', hidden:true },
                { label: '书名', name: 'bookName', width: 75 },
                { label: '作者', name: 'authorName', width: 200, sortable:false },
                { label: 'ISBN号', name: 'ISBN', width: 200, sortable:false },
                { label: '借出状态', name: 'isSaid', width: 20, formatter:disabledFormatter }
            ]
        });
    });

    function disable() {
        var selection = resolveSelection();
        if (selection) {
            $.post("/user/loan/"+selection.id, function(response) {
                if (response.ret === 0) {
                    alert("借出图书成功");
                    $("#gridBody").trigger("reloadGrid");
                }
            });
        }
    }

    function enable() {
        var selection = resolveSelection();
        if (selection) {
            $.post("/user/return/"+selection.id, function(response) {
                if (response.ret === 0) {
                    alert("归还图书成功");
                    $("#gridBody").trigger("reloadGrid");
                }
            });
        }
    }

</script>

<div class="panel panel-default">
    <div class="panel-heading clearfix">
        <div id="buttons" class="pull-right">
            <button class="btn btn-success" onclick="loan()">借出图书</button>
            <button class="btn btn-danger" onclick="return()">归还图书</button>
        </div>
    </div>
    <div class="grid-container">
        <table id="gridBody"></table>
        <div id="toolBar"></div>
    </div>
</div>

</@frame.frame>

</#escape>