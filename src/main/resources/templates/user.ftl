<#-- @ftlroot "." -->
<#import "generalFrame.ftl" as frame />
<#escape x as x?html>

<@frame.frame "Training Room">

<h1>用户管理</h1>

<script type="text/javascript">
    $(function () {
        $("#gridBody").jqGrid({
            url: '/user/list/data',

            colModel: [
                { label: 'ID', name: 'id', hidden:true },
                { label: '用户名', name: 'username', width: 75 },
                { label: '密码', name: 'password', width: 200, sortable:false },
                { label: '是否禁用', name: 'disabled', width: 20, formatter:disableFormatter }
            ]
        });
    });

    function enable() {
        var selection = resolveSelection();
        if (selection) {
            $.post("/user/enable/"+selection.id, function(response) {
                if (response.ret === 0) {
                    alert("启用帐号成功");
                    $("#gridBody").trigger("reloadGrid");
                }
            });
        }
    }

    function disable() {
        var selection = resolveSelection();
        if (selection) {
            $.post("/user/disable/"+selection.id, function(response) {
                if (response.ret === 0) {
                    alert("禁用帐号成功");
                    $("#gridBody").trigger("reloadGrid");
                }
            });
        }
    }

</script>

<div class="panel panel-default">
    <div class="panel-heading clearfix">
        <div id="buttons" class="pull-right">
            <button class="btn btn-success" onclick="enable()">启用帐号</button>
            <button class="btn btn-danger" onclick="disable()">禁用帐号</button>
        </div>
    </div>
    <div class="grid-container">
        <table id="gridBody"></table>
        <div id="toolBar"></div>
    </div>
</div>

</@frame.frame>

</#escape>