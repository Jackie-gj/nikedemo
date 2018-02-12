<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Nike Demo - 登录</title>
<meta name="keywords" content="nikedemo">
<meta name="description" content="nikedemo">

<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/font-awesome.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/animate.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.min.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/jquery-easyui-1.5.4.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/login.js"></script>
<script src="${pageContext.request.contextPath}/js/common.js"></script>
</head>
<body class="gray-bg">
	<div class="middle-box text-center loginscreen  animated fadeInDown">
		<div>
			<div>
				<h1 class="logo-name">13</h1>
			</div>
			<h3>欢迎使用 Nike DSI Tool</h3>
			<form class="m-t" role="form" id="adminlogin" method="post"
				name="adminlogin" onsubmit="return false" action="##">
				<div class="form-group">
					<input type="email" class="form-control" placeholder="用户名"
						name="userName" id="userName" required="true">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="密码"
						name="password" id="password" required="true">
				</div>
				<button type="button" class="btn btn-primary block full-width m-b"
					onclick="javascript:login();">登 录</button>
				<p class="text-muted text-center">
					<a href="##" onclick="javascript:adminlogin.reset();return false;">
						<small>重置</small>
					</a>
				</p>
			</form>
		</div>
	</div>
</body>
</html>
