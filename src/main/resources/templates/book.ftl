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
                { label: '书名', name: 'bookname', width: 50 },
                { label: '作者', name: 'authorname', width: 35, sortable:false },
                { label: 'ISBN号', name: 'ISBN', width: 50, sortable:false },
                { label: '借出状态', name: 'isSaid', width: 50, formatter:disabledFormatter }
            ]
        });
    });

    function loanBook() {
        var selection = resolveSelection();
        if (selection) {
            $.post("/book/loanBook/"+selection.id, function(response) {
                if (response.ret === 0) {
                    alert("借出图书成功");
                    $("#gridBody").trigger("reloadGrid");
                }
            });
        }
    }

    function returnBook() {
        var selection = resolveSelection();
        if (selection) {
            $.post("/book/returnBook/"+selection.id, function(response) {
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
            <button class="btn btn-success" onclick="loanBook()">借出图书</button>
            <button class="btn btn-danger" onclick="returnBook()">归还图书</button>
        </div>
    </div>
    <div class="grid-container">
        <table id="gridBody"></table>
        <div id="toolBar"></div>
    </div>
</div>

</@frame.frame>

</#escape>