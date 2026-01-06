<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Dish</title>
<style>
body {
	margin: 0;
	padding: 0;
	font-family: 'Segoe UI', sans-serif;
	background: linear-gradient(to right, #FAD0C4, #D8B4E2);
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
}

.form-wrapper {
	width: 100%;
	max-width: 600px;
	background: #ffd1dc;
	border-radius: 18px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.25);
	padding: 1rem;
	color: #333;
}

.form-wrapper h2 {
	text-align: center;
	margin-bottom: 2rem;
	font-size: 2rem;
	color: #d63384;
}

label {
	display: block;
	margin-bottom: 0.5rem;
	font-weight: 600;
	font-size: 1rem;
	color: #555;
}

input[type="text"], input[type="number"], select {
	width: 100%;
	padding: 0.7rem;
	margin-bottom: 1.2rem;
	border: 1px solid #ccc;
	border-radius: 10px;
	background-color: #f9f9f9;
	color: #333;
	font-size: 1rem;
}

input::placeholder {
	color: #aaa;
}

input[type="submit"] {
	width: 100%;
	padding: 0.9rem;
	font-size: 1rem;
	border: none;
	border-radius: 12px;
	background: linear-gradient(to right, #fc5c7d, #6a82fb);
	color: white;
	font-weight: bold;
	cursor: pointer;
	transition: transform 0.2s ease;
}

input[type="submit"]:hover {
	transform: scale(1.03);
	background: linear-gradient(to right, #6a82fb, #fc5c7d);
}

@media ( max-width : 100px) {
	.form-wrapper {
		padding: 2rem 1.5rem;
	}
}
</style>
</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>

	<div class="form-wrapper">
		<form action="/addDish">
			<div class="form-container">
				<h2>Add New Dish</h2>

				<label for="dish_name">Dish Name</label> <input type="text"
					id="name" name="name" maxlength="80" required> <label
					for="dish_price">Dish Price</label> <input type="number"
					step="0.01" id="price" name="price" required> <label
					for="dish_category">Dish Category</label> 
					<select id="category"name="category">
					<option value="Veg">Veg</option>
					<option value="Non-Veg">Non-Veg</option>
				    </select> 
				<label for="imgUrl">Dish Img</label> <input type="text" id="imgUrl"
					name="imgUrl" required> <input type="submit"
					value="Add Dish">
			</div>
		</form>
	</div>
</body>
</html>