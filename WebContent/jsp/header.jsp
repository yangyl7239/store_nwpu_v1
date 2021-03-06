<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	type="text/css" />
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"
	type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css" type="text/css" />
</head>

<body>

	<div class="container-fluid">
	
	<!-- 描述：菜单栏 -->
	<div class="container-fluid">
		<div class="col-md-4">
			<img src="${pageContext.request.contextPath}/img/logo2.png" />
		</div>
		<div class="col-md-5">
			<img src="${pageContext.request.contextPath}/img/header.png" />
		</div>
		<div class="col-md-3" style="padding-top:20px">
			<ol class="list-inline">
			
				<!-- 未登录状态 -->
				<c:if test="${empty loginUser }">
					<li><a href="${pageContext.request.contextPath}/UserServlet?method=loginUI">登录</a></li>
					<li><a href="${pageContext.request.contextPath}/UserServlet?method=registerUI">注册</a></li>
				</c:if>
				<!-- 登录状态 -->
				<c:if test="${not empty loginUser }">
					<li><a href="${pageContext.request.contextPath}"> 欢迎: ${loginUser.name} </a></li>
					<li><a href="${pageContext.request.contextPath}/UserServlet?method=logout">退出</a></li>
				</c:if>
				
				<li><a href="${pageContext.request.contextPath}/jsp/cart.jsp">购物车</a></li>
				<li><a href="${pageContext.request.contextPath}/OrderServlet?method=findOrdersWithPage&num=1">我的订单</a></li>
			</ol>
		</div>
	</div>
	
	<!-- 描述：导航条 -->
	<div class="container-fluid">
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="${pageContext.request.contextPath}">首页</a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav" id = "myUL">
					<%--
					<c:forEach items="${allCategories }" var="c">
						<li><a href="#">${c.cname }</a></li>
					</c:forEach>
					--%>
					</ul>
					<form class="navbar-form navbar-right" role="search">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Search">
						</div>
						<button type="submit" class="btn btn-default">搜索</button>
					</form>

				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
	</div>
	</div>
</body>
<script type="text/javascript">
// 在页面加载完毕之后，向服务器端发起AJAX请求
$(function(){
	//向服务器端CategoryServlet->getAllCategories()发起ajax请求，服务器端经过处理
	//将所有分类信息以JSON格式的数据返回，获取到返回的所有分类绑定再页面的显示分类区域
	var url = "${pageContext.request.contextPath}/CategoryServlet";
	var param = {"method" : "findAllCats"};
	$.post(url, param, function(data){
		// alert(data);
		// 获取到服务器端响应回来的数据，经过观察data中存放的是一个JSON格式的数组，遍历数组，动态的显示分类区域代码
		var li = "<li><a href = '#'></a></li>";
		$.each(data, function(i, obj){
			var li = "<li><a href = '/store_nwpu_v1/ProductServlet?method=findProductsByCidWithPage&num=1&cid="+obj.cid+"'>" + obj.cname + "</a></li>";
			$("#myUL").append(li);
		}); // 遍历
	}, "json");
});
</script>
</html>