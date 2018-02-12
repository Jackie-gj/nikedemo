<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>CLC Door Master Manger</title>
    <link href="${pageContext.request.contextPath}/css/base.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/tab.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/item.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/item_do.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/uploadify.css" type="text/css"></link>

    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/jquery-easyui-1.5.4.1/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/jquery-easyui-1.5.4.1/themes/icon.css">
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/jquery-easyui-1.5.4.1/jquery.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/jquery-easyui-1.5.4.1/jquery.easyui.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/jquery-easyui-1.5.4.1/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/common.js"></script>
<body style="margin:1px;" id="ff">
<table id="dg" title="CLC门店主数据管理" class="easyui-datagrid" pagination="true"
       rownumbers="true" fit="true" data-options="pageSize:30"
       url="${pageContext.request.contextPath}/clcdoormaster/list.do"
       toolbar="#tb">
    <thead>
    <tr>
        <th field="cb" checkbox="true" align="center"></th>
        <th field="clcDoorCode" width="10%" align="center">CLC Door Code</th>
        <th field="posIdNewPos" width="150" align="center">POS ID (NEW POS)</th>
        <th field="status" width="150" align="center">Status</th>
        <th field="globalConcept" width="250" align="center">Global Concept</th>
    </tr>
    </thead>
</table>
<div id="tb">
    <div>
        <a href="javascript:openDataAddDialog()" class="easyui-linkbutton"
           iconCls="icon-add" plain="true">上传</a> <a
            href="javascript:openModifyDialog()"
            class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a> <a
            href="javascript:deleteData()" class="easyui-linkbutton"
            iconCls="icon-remove" plain="true">删除</a>
    </div>
    <div>
        &nbsp;关键字：&nbsp;<input type="text" id="status" size="20"
                              onkeydown="if(event.keyCode==13) search()"/>&nbsp; <a
            href="javascript:search()" class="easyui-linkbutton"
            iconCls="icon-search" plain="true">搜索</a>
    </div>
</div>
<div id="dlg" class="easyui-dialog"
     style="width: 600px;height:350px;padding: 10px 20px; position: relative; z-index:1000;"
     closed="true" buttons="#dlg-buttons">
    <form id="fm" method="post" enctype="multipart/form-data">
		<div style="margin-bottom:20px">
			<div>CLC门店主数据文件:</div>
			<input id="file" class="easyui-filebox" name="file" data-options="buttonText:'选择文件', prompt:'Choose a file...'" style="width:100%">
		</div>
		<!-- div>
			<a href="#" class="easyui-linkbutton">上传</a>
		</div-->
    </form>
</div>

<div id="dlg-buttons">
    <a href="javascript:saveData()" class="easyui-linkbutton"
       iconCls="icon-ok">上传</a> <a href="javascript:closeDialog()"
                                   class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>

</body>
<script type="text/javascript">
    var url;
    function search() {
        $("#dg").datagrid('load', {
            "status": $("#status").val(),
        });
    }

    function deleteData() {
        var selectedRows = $("#dg").datagrid('getSelections');
        if (selectedRows.length == 0) {
            $.messager.alert("系统提示", "请选择要删除的数据！");
            return;
        }
        var strIds = [];
        for (var i = 0; i < selectedRows.length; i++) {
            strIds.push(selectedRows[i].id);
        }
        var ids = strIds.join(",");
        $.messager.confirm("系统提示", "您确认要删除这<font color=red>"
                + selectedRows.length + "</font>条数据吗？", function (r) {
            if (r) {
                $.post("${pageContext.request.contextPath}/clcdoormaster/delete.do",
                        {
                            ids: ids
                        }, function (result) {
                            if (result.success) {
                                $.messager.alert("系统提示", "数据已成功删除！");
                                $("#dg").datagrid("reload");
                            } else {
                                $.messager.alert("系统提示", "数据删除失败！");
                            }
                        }, "json");
            }
        });

    }
    function openDataAddDialog() {
        $("#dlg").dialog("open").dialog("setTitle", "上传CLC门店主数据");
       	url = "${pageContext.request.contextPath}/clcdoormaster/upload.do";
    }

    function saveData() {
        $("#fm").form("submit", {
            url: url,
            success: function (result) {
                if (result.success) {
                    $.messager.alert("系统提示", "保存成功");
                    $("#dlg").dialog("close");
                    $("#dg").datagrid("reload");
                    resetValue();
                } else {
                    $.messager.alert("系统提示", "保存失败");
                    window.location.reload();
                    return;
                }
            }
        });
    }

    function openModifyDialog() {
        var selectedRows = $("#dg").datagrid('getSelections');
        if (selectedRows.length != 1) {
            $.messager.alert("系统提示", "请选择一条要编辑的数据！");
            return;
        }
        var row = selectedRows[0];
        $("#dlg").dialog("open").dialog("setTitle", "修改信息");
        $('#fm').form('load', row);
        url = "${pageContext.request.contextPath}/clcdoormaster/save.do?id="
                + row.id;
    }

    function resetValue() {
        $("#desc").val("");
        $("#path").val("");
    }

    function closeDialog() {
        $("#dlg").dialog("close");
        resetValue();
    }
    
	function myformatter(date) {
		var d = new Date(date.time || Date.now()), month = ''
				+ (d.getMonth() + 1), day = '' + d.getDate(), year = d
				.getFullYear();
		if (month.length < 2)
			month = '0' + month;
		if (day.length < 2)
			day = '0' + day;
		return [ day, month, year ].join('/');
	}

	function myparser(s) {
		if (!s) {
			return new Date();
		} else {
			return new Date(s.time);
		}
	}
</script>
</head>
</html>