<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Restaurant Menu</title>
<style>
body {
	background: linear-gradient(rgba(250, 208, 196, 0.8), rgba(216, 180, 226, 0.8)),
		url('${pageContext.request.contextPath}/img/restaurant-background.jpg');
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	min-height: 100vh;
	display: flex;
	flex-direction: column;
}
.content {
	position: relative;
	z-index: 1;
	color: purple;
	text-align: center;
	padding-top: 100px;
}

.content h1 {
	font-size: 48px;
	margin-bottom: 20px;
}

.highlight-box {
	margin: 30px auto;
	max-width: 700px;
	background-color: rgba(255, 255, 255, 0.1);
	padding: 30px;
	border-radius: 15px;
	backdrop-filter: blur(3px);
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
}

.highlight-box h2 {
	font-size: 34px;
	margin-bottom: 10px;
	color: #ffe;
}

.highlight-box p {
	font-size: 20px;
	color: green;
}
</style>
</head>
<body>
	<jsp:include page="navbar3.jsp"></jsp:include>

	<div class="content">
		<h1>Welcome to Our Restaurant</h1>

		<div class="highlight-box">
			<h2>Today's Special</h2>
			<p>Check out our delicious Veg and Non-Veg dishes.</p>
		</div>
	</div>
</body>
</html>
