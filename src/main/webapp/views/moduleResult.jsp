<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Module Result</title>
    <link href="${pageContext.request.contextPath}/css/base.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/tab.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/item.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/item_do.css" type="text/css" rel="stylesheet">
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
    <script type="text/javascript">
    	var test;
        function generate() {
        	var checkedProps = $('input[type=checkbox]:checked');
        	if (/* checkedProps == null || checkedProps.length != 6 */ 1 != 1) { // leave it ... 
        		$.messager.alert("系统提示", "请勾选6个属性！");
        		return;
        	} else {
        		var arrProps = [];
        		for (var i = 0; i < checkedProps.length; i++) {
        			arrProps.push(checkedProps[i].value);
                }
        		var props = arrProps.join(",");
        		var dg = $("#dg");
        		$.ajax({
	                    url: '${pageContext.request.contextPath}/module/generate.do',
	                    data: {
	                        "seasonYear": $("input[name='seasonYear']").val(),
	                        "prodType": $("input[name='prodType']").val(),
	                        "dsiProperties": props
	                    },
	                    type: "post",
	                    dataType: "json",
	                    success: function(data){
	                    	var wrappedColumns = new Array();
	                    	var newColumns = new Array();
	                    	for (var i = 0; i < data.columns[0].length; i++) {
	                    		var col = data.columns[0][i];
	                    		col.styler = function cellStyler(value, row, index){ return 'background-color:#f4f4f470;'; };
	                    		//col.formatter = function cellFormatter(value){return value[2];};
	                    		col.align = 'center';
	                    		col.sortable = true;
	                    		newColumns.push(col);
	                    	}
	                    	var clusterCol = new Object();
	                    	clusterCol.title = "归类";
	                    	clusterCol.width = 80;
	                    	clusterCol.field = "cluster";
	                    	clusterCol.align = 'center';
	                    	clusterCol.sortable = true;
	                    	var sdCol = new Object();
	                    	sdCol.title = "标准差";
	                    	sdCol.width = 80;
	                    	sdCol.field = "sd";
	                    	sdCol.align = 'center';
	                    	sdCol.formatter = function formatSD(val,row){
	                        	return val.toFixed(6);
	                		};
	                		sdCol.sortable = true;
	                		var sampCol = new Object();
	                		sampCol.title = "样本数";
	                		sampCol.width = 80;
	                		sampCol.field = "sampSize";
	                		sampCol.align = 'center';
	                		sampCol.sortable = true;
	                    	newColumns.push(clusterCol);
	                    	newColumns.push(sdCol);
	                    	newColumns.push(sampCol);
	                    	wrappedColumns.push(newColumns);
	                    	dg.datagrid({columns: wrappedColumns, 
	                    		singleSelect:true, 
	                    		fitColumns:true, 
	                    		striped:true, 
	                    		fit:true,
	                    		remoteSort:false,
	                    		multiSort:false});
	                    	dg.datagrid("loadData", data.rows);
	                    	$('#export').show();
	                    }
	              });
        	}
        }
        function cellStyler(value, row, index){
			return 'background-color:#f4f4f470;';
		}
        
        function formatSD(val,row){
        	return val.toFixed(6);
		}
        
        // after body load
        $(function(){  
        	$('#seasonYear').combobox({
            	url:'${pageContext.request.contextPath}/module/getSeasonYear.do',
                valueField:'value',
                textField:'text',
                groupField:'group',
                method: 'get',
    			onLoadSuccess: function (data) {
    			    if (data) {
    			        $('#seasonYear').combobox('setValue', 'FA17');
    			    }
    			}
       		});
        	$.ajax({
                url: '${pageContext.request.contextPath}/module/getPropImportance.do',
                type: "get",
                dataType: "json",
                success: function(data){
                	console.log(data);
                }
        	});
        	$('#export').hide();
        });
    </script>
    <style>
	    .checkboxSpan {
	      position: relative;
	      border: 1px solid #95B8E7;
	      background-color: #fff;
	      vertical-align: middle;
	      display: inline-block;
	      overflow: hidden;
	      white-space: nowrap;
	      margin: 0;
	      padding: 0;
	      -moz-border-radius: 5px 5px 5px 5px;
	      -webkit-border-radius: 5px 5px 5px 5px;
	      border-radius: 5px 5px 5px 5px;
	      display:block;
	    }
	    .checkboxMargin {
	    	margin-left: 20px;
	    }
	    .btnMargin {
	        border: 1px solid #95B8E7;
    		margin-left: 30px;
   			margin-right: 60px;
	    }
    </style>
</head>
<body style="overflow-x: hidden;margin:1px;">
<table id="dg" title="模型结果" class="easyui-datagrid" fitColumns="true"
       pagination="false" rownumbers="true"
       url="${pageContext.request.contextPath}/module/generate.do" fit="true"
       toolbar="#tb" remoteSort="false">
    <thead>
    <tr>
        <th field="property1" width="25" align="center" styler="cellStyler" sortable="true">店铺大小</th>
        <th field="property2" width="25" align="center" styler="cellStyler" sortable="true">店铺商圈</th>
        <th field="property3" width="25" align="center" styler="cellStyler" sortable="true">价格高低</th>
        <th field="property4" width="25" align="center" styler="cellStyler" sortable="true">性别</th>
        <th field="property5" width="40" align="center" styler="cellStyler" sortable="true">商品类别</th>
        <th field="property6" width="25" align="center" styler="cellStyler" sortable="true">颜色</th>
        <th field="cluster" width="100" align="center" sortable="true">归类</th>
        <th field="sd" width="100" align="center" formatter="formatSD" sortable="true">标准差</th>
        <th field="sampSize" width="100" align="center" sortable="true">样本数</th>
    </tr>
    </thead>
</table>

<div id="tb">
	<div id="seasonYearDiv" class="checkboxSpan">
		预测季度： <select class="easyui-combobox" id="seasonYear" name="seasonYear" style="width:150px;" >
		</select>
		商品类型： <select class="easyui-combobox" id="prodType" name="prodType" style="width:100px;" disabled>
			<option value="FTW" selected>鞋</option>
			<option value="APP">衣服</option>
			<option value="EQU">装备</option>
		</select>
		&nbsp;&nbsp;&nbsp;属性设置： 
		<input type="checkbox" class="checkboxMargin" name="dsiProperties" value="storeType" checked/>店铺大小
		<input type="checkbox" class="checkboxMargin" name="dsiProperties" value="tradeZone" checked/>店铺商圈
		<input type="checkbox" class="checkboxMargin" name="dsiProperties" value="price" checked/>价格高低
		<input type="checkbox" class="checkboxMargin" name="dsiProperties" value="gndrGroupNm" checked/>性别
		<input type="checkbox" class="checkboxMargin" name="dsiProperties" value="ctgyPtfm" checked/>商品类别
		<input type="checkbox" class="checkboxMargin" name="dsiProperties" value="colorMain" checked/>产品颜色
		<input type="checkbox" class="checkboxMargin" name="dsiProperties" value="salesAreaNames" />销售区域
		<input type="checkbox" class="checkboxMargin" name="dsiProperties" value="storeRecordType" />店铺类型
		&nbsp;<br/>
		<input type="checkbox" class="checkboxMargin" name="dsiProperties" value="storeEnvironmentDescription" />店铺环境
		<input type="checkbox" class="checkboxMargin" name="dsiProperties" value="storeLeadCategory" />店铺概念属性
		<input type="checkbox" class="checkboxMargin" name="dsiProperties" value="storeCityTierNumber" />店铺城市级别
		<input type="checkbox" class="checkboxMargin" name="dsiProperties" value="subTerritory" />店铺子领域
		<input type="checkbox" class="checkboxMargin" name="dsiProperties" value="clcStatus" />CLC状态
		<a href="javascript:generate()" class="easyui-linkbutton btnMargin" iconCls="icon-search" plain="true">提交</a>
		<a id="export" href="${pageContext.request.contextPath}/module/export.do" class="easyui-linkbutton btnMargin" plain="true">导出</a>
	</div>
</div>
</body>
</html>