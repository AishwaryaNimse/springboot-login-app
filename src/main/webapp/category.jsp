<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="navbar2.jsp" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>${category} Menu</title>
<style>
body {
	font-family: Arial, sans-serif;
	background: linear-gradient(to right, #FAD0C4, #D8B4E2);
	margin: 0;
	padding: 20px;
	text-align: center;
}

h1 {
	font-size: 2.4rem;
	color: white;
	margin-bottom: 20px;
}

.dish-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
	gap: 20px;
	max-width: 1000px;
	margin: auto auto 40px;
}

.dish-card {
	background: white;
	border-radius: 10px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
	overflow: hidden;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

.dish-card img {
	width: 100%;
	height: 160px;
	object-fit: cover;
}

.dish-info {
	padding: 15px;
}

.dish-info h3 {
	margin: 8px 0;
	font-size: 1.2rem;
	color: #444;
}

.dish-info p {
	margin: 4px 0;
	color: #555;
}

.dish-info .price {
	font-weight: bold;
	color: #fc5c7d;
}

.actions {
	margin-top: 10px;
	display: flex;
	justify-content: center;
	gap: 10px;
}

.btn {
	padding: 8px 14px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	color: white;
	font-size: 0.95rem;
}

.cart-btn {
	background: #ff9800;
}

.cart-btn:hover {
	background: #fb8c00;
}

.view-cart {
	display: inline-block;
	margin-bottom: 20px;
}

.view-cart a {
	padding: 12px 24px;
	background: #1abc9c;
	color: white;
	border-radius: 5px;
	text-decoration: none;
	font-size: 1rem;
	transition: background 0.3s;
}

.view-cart a:hover {
	background: #17a589;
}
</style>
</head>
<body>
	<h1>${category} Menu</h1>
	<c:if test="${empty list}">
		<p>No dishes found in this category.</p>
	</c:if>

	<div class="dish-grid">
		<c:forEach var="dish" items="${list}">
			<div class="dish-card">
				<img src="${dish.imgUrl}" alt="${dish.name}" />
				<div class="dish-info">
					<h3>${dish.name}</h3>
					<p class="price">₹${dish.price}</p>
					<p>${dish.category}</p>
					<div class="actions">
						<form action="${pageContext.request.contextPath}/cart/addDish"
							method="post">
							<input type="hidden" name="id" value="${dish.id}" />
							<button type="submit" class="btn cart-btn">Add to Cart</button>
						</form>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="view-cart">
		<a href="${pageContext.request.contextPath}/cart">View Cart</a>
	</div>
</body>
</html>
