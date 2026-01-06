<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="navbar2.jsp" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Your Cart</title>
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background: #fff0f5;
	margin: 0;
	padding: 10px;
}

h2 {
	text-align: center;
	color: #cc3366;
	margin-bottom: 30px;
}

table {
	width: 85%;
	margin: 0 auto;
	border-collapse: collapse;
	background: #fff;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	border-radius: 12px;
	overflow: hidden;
}

th, td {
	padding: 16px;
	text-align: center;
	border-bottom: 1px solid #f8d7e5;
}

th {
	background-color: skyblue;
	color: white;
	font-size: 18px;
}

td {
	font-size: 16px;
	color: #444;
}

tr:hover {
	background-color: #ffe4ec;
}

/* Center the button using flexbox */
.order-btn-container {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}

.order-btn {
	background-color: #ff5a5f;
	color: white;
	padding: 12px 32px;
	font-size: 1rem;
	font-weight: bold;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
	transition: background 0.3s ease, transform 0.2s ease;
}

.order-btn:hover {
	background-color: #e34e51;
	transform: translateY(-2px);
}

.empty-message {
	text-align: center;
	color: #888;
	font-size: 18px;
	margin-top: 50px;
}
</style>
</head>
<body>
	<h2>Your Cart</h2>

	<c:if test="${not empty message}">
		<script>
			alert("${message}");
		</script>
	</c:if>

	<c:if test="${not empty cartItems}">
		<table border="1">
			<tr>
				<th>Dish Name</th>
				<th>Quantity</th>
				<th>Price</th>
			</tr>
			<c:forEach var="item" items="${cartItems}">
				<tr>
					<td>${item.dish.name}</td>
					<td>${item.quantity}</td>
					<td>₹${item.dish.price}</td>
				</tr>
			</c:forEach>
		</table>

		<div class="order-btn-container">
			<form action="${pageContext.request.contextPath}/cart/order"
				method="post">
				<button type="submit" class="order-btn">Place Order</button>
			</form>
		</div>
	</c:if>

	<c:if test="${empty cartItems}">
		<p class="empty-message">Your cart is empty.</p>
	</c:if>
</body>
</html>
