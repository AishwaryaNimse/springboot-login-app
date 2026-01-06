<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Restaurant Menu</title>
<style>
body {
	font-family: Arial, sans-serif;
	background: linear-gradient(to right, #FAD0C4, #D8B4E2);
	margin: 0;
	padding: 20px;
}

h1 {
	text-align: center;
	margin-bottom: 10px;
}

.dish-grid {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	gap: 20px;
	max-width: 1100px;
	margin: auto;
}

.dish-card {
	background: white;
	border-radius: 10px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
	width: 240px;
	padding: 15px;
	text-align: center;
}

.dish-card img {
	width: 100%;
	height: 200px;
	object-fit: cover;
	border-radius: 6px;
}

.dish-info {
	margin-top: 10px;
}

.dish-info h3 {
	margin: 8px 0;
	font-size: 18px;
}

.dish-info p {
	margin: 4px 0;
	color: #555;
}

.btn {
	margin-top: 10px;
	padding: 8px 14px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.cart-btn {
	background-color: #ff9800;
	color: white;
}

.order-btn {
	background-color: #4caf50;
	color: white;
}

.cart-btn:hover {
	background-color: #fb8c00;
}

.order-btn:hover {
	background-color: #43a047;
}
</style>
</head>
<body>
<jsp:include page="navbar2.jsp"></jsp:include>
	<h1>Our Menu</h1>
	<div class="dish-grid">
		<c:forEach var="dish" items="${listDish}">
			<div class="dish-card">
				<img src="${dish.imgUrl}" alt="Dish Image" />
				<div class="dish-info">
					<h3>${dish.name}</h3>
					<p>
						<strong>₹${dish.price}</strong>
					</p>
					<p>${dish.category}</p>
					<form action="${pageContext.request.contextPath}/cart/addDish"
						method="post">
						<input type="hidden" name="id" value="${dish.id}" />
						<button type="submit" class="btn cart-btn">Add to Cart</button>
					</form>

					<form action="${pageContext.request.contextPath}/cart/order"
						method="post" style="display: inline;">
						<input type="hidden" name="id" value="${dish.id}" />
						<button class="btn order-btn" type="submit">Order Now</button>
					</form>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>