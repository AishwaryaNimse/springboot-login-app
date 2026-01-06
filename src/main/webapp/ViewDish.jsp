<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="navbar.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

body {
    background: linear-gradient(135deg, #ff9a9e 0%, #fecfef 50%, #f6d365 100%);
	            
}

button {
	font-family: 'Segoe UI', sans-serif;
	font-size: 16px;
}

.edit-btn {
	background-color: skyblue;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 10px;
	cursor: pointer;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	transition: background-color 0.3s ease, transform 0.2s ease;
}

.edit-btn:hover {
	background-color: blue;
	transform: scale(1.05);
}

.delete-btn {
	background-color: #f44336; /* Red */
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 10px;
	cursor: pointer;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	transition: background-color 0.3s ease, transform 0.2s ease;
}

.delete-btn:hover {
	background-color: green;
	transform: scale(1.05);
}

.cart-btn {
	background-color: Grey;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 10px;
	cursor: pointer;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	transition: background-color 0.3s ease, transform 0.2s ease;
}

.cart-btn:hover {
	background-color: blue;
	transform: scale(1.05);
}
</style>
</head>
<body>
	<table border="2" cellpadding="10"
		style="width: 100%; text-align: center; border-collapse: collapse;">
		<thead>
			<tr>
				<th>Id</th>
				<th>Image</th>
				<th>Name</th>
				<th>Price</th>
				<th>Category</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="dish" items="${listDish}">
				<tr>
					<td>${dish.id }</td>
					<td><img style="width: 100px; height: auto;"
						src="${dish.imgUrl}" alt="Dish Image"></td>
					<td>${dish.name }</td>
					<td>${dish.price }</td>
					<td>${dish.category }</td>
					<td><a href="/UpdateDishById?dish_id=${dish.id }">
							<button class="btn edit-btn">Edit</button>
					</a> <a href="/deleteById/${dish.id }"><button
								class="btn delete-btn">Delete</button></a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>