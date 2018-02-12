<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Store Manger</title>
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
<table id="dg" title="销售数据列表" class="easyui-datagrid" pagination="true"
       rownumbers="true" fit="true" data-options="pageSize:50" pageList="[50,100,300]"
       url="${pageContext.request.contextPath}/saleinfo/list.do"
       toolbar="#tb">
    <thead>
    <tr>
        <th field="cb" checkbox="true" align="center"></th>
        <th field="storePosId" width="10%" align="center">Store POS Id</th>
        <th field="prodCode" width="300" align="center">Prod Code</th>
        <th field="netSalesUnits" width="200" align="center">Net Sales Units</th>
        <th field="netSalesAmt" width="200" align="center">Net Sales Amt</th>
        <th field="extendedMsrpSalesAmt" width="200" align="center">Extended MSRP Sales Amt</th>
        <th field="reportDate" width="200" align="center" data-options="formatter:myformatter2">Report Date</th>
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
        &nbsp;关键字：&nbsp;<input type="text" id="reportDate" class="easyui-datebox" data-options="sharedCalendar:'#cc',formatter:myformatter,parser:myparser"
                              onkeydown="if(event.keyCode==13) search()"/>&nbsp; <a
            href="javascript:search()" class="easyui-linkbutton"
            iconCls="icon-search" plain="true">搜索</a>
    </div>
</div>
<div id="cc" class="easyui-calendar"></div>
<div id="dlg" class="easyui-dialog"
     style="width: 600px;height:350px;padding: 10px 20px; position: relative; z-index:1000;"
     closed="true" buttons="#dlg-buttons">
    <form id="fm" method="post" enctype="multipart/form-data">
		<div style="margin-bottom:20px">
			<div>销售数据文件:</div>
			<input name="files" class="easyui-filebox" name="file" data-options="buttonText:'选择文件', prompt:'Choose a file...'" style="width:100%">
			<input name="files" class="easyui-filebox" name="file" data-options="buttonText:'选择文件', prompt:'Choose a file...'" style="width:100%">
			<input name="files" class="easyui-filebox" name="file" data-options="buttonText:'选择文件', prompt:'Choose a file...'" style="width:100%">
			<input name="files" class="easyui-filebox" name="file" data-options="buttonText:'选择文件', prompt:'Choose a file...'" style="width:100%">
			<input name="files" class="easyui-filebox" name="file" data-options="buttonText:'选择文件', prompt:'Choose a file...'" style="width:100%">
			<input name="files" class="easyui-filebox" name="file" data-options="buttonText:'选择文件', prompt:'Choose a file...'" style="width:100%">
			<input name="files" class="easyui-filebox" name="file" data-options="buttonText:'选择文件', prompt:'Choose a file...'" style="width:100%">
			<input name="files" class="easyui-filebox" name="file" data-options="buttonText:'选择文件', prompt:'Choose a file...'" style="width:100%">
		</div>
		<!-- div>
			<a href="#" class="easyui-linkbutton">上传</a>
		</div-->
    </form>
</div>

<div id="dlg-buttons">
    <a href="javascript:saveData()" class="easyui-linkbutton"
       iconCls="icon-ok">上传</a> <a href="javascript:closePictureDialog()"
                                   class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>

</body>
<script type="text/javascript">
    var url;
    function search() {
        $("#dg").datagrid('load', {
            "reportDate": myparser($("#reportDate").val()),
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
                $.post("${pageContext.request.contextPath}/saleinfo/delete.do",
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
        $("#dlg").dialog("open").dialog("setTitle", "上传销售数据");
       	url = "${pageContext.request.contextPath}/saleinfo/upload.do";
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
        url = "${pageContext.request.contextPath}/saleinfo/save.do?id="
                + row.id;
    }

    function resetValue() {
        $("#desc").val("");
        $("#path").val("");
    }

    function closePictureDialog() {
        $("#dlg").dialog("close");
        resetValue();
    }
	
	function myformatter(date){
		var y = date.getFullYear();
		var m = date.getMonth()+1;
		var d = date.getDate();
		return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
	}
	
	function myparser(s){
		if (!s) return new Date();
		var ss = (s.split('-'));
		var y = parseInt(ss[0],10);
		var m = parseInt(ss[1],10);
		var d = parseInt(ss[2],10);
		if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
			return new Date(y,m-1,d);
		} else {
			return new Date();
		}
	}
	function myformatter2(date) {
		var d = new Date(date.time || Date.now()), month = ''
				+ (d.getMonth() + 1), day = '' + d.getDate(), year = d
				.getFullYear();
		if (month.length < 2)
			month = '0' + month;
		if (day.length < 2)
			day = '0' + day;
		return [ day, month, year ].join('/');
	}
</script>
</head>
</html>