<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Dish</title>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(to right, #ff9a9e, #fad0c4, #fad0c4);
    min-height: 80vh;
}

/* NAVBAR */
.navbar {
    background-color: #6a0572;
    padding: 15px 40px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    color: white;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
}

.navbar h1 {
    font-size: 22px;
}

.navbar a {
    color: #fcefee;
    text-decoration: none;
    margin-left: 20px;
    font-weight: 500;
    transition: color 0.3s ease;
}

.navbar a:hover {
    color: #ffd166;
}

.form-wrapper {
    display: flex;
    justify-content: center;
    align-items: flex-start; /* align at the top */
    padding: 20px 20px; /* reduced top padding from 50px to 20px */
    margin-top: 10px;   /* optional: fine control over top spacing */
}

.form-container {
    background: lightpink;
    padding: 30px 40px;
    border-radius: 20px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
    width: 100%;
    max-width: 600px; /* slightly increased width */
}

h2 {
    text-align: center;
    color: #5e2a5c;
    margin-bottom: 25px;
}

label {
    font-weight: 600;
    color: #5c3d5e;
    margin-top: 15px;
    display: block;
}

input[type="text"],
input[type="number"] {
    width: 100%;
    padding: 10px 14px;
    border: 1px solid #ccc;
    border-radius: 10px;
    font-size: 15px;
    margin-top: 6px;
    transition: border-color 0.3s ease, box-shadow 0.3s ease;
}

input[type="text"]:focus,
input[type="number"]:focus {
    border-color: #e5989b;
    box-shadow: 0 0 6px rgba(255, 175, 189, 0.4);
    outline: none;
}

input[type="submit"] {
    margin-top: 25px;
    background: linear-gradient(to right, #ff758c, #ff7eb3);
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 12px;
    cursor: pointer;
    font-size: 16px;
    font-weight: bold;
    transition: background 0.3s ease;
    width: 100%;
}

input[type="submit"]:hover {
    background: linear-gradient(to right, #ff7eb3, #ff758c);
}

select {
    width: 100%;
    padding: 10px 14px;
    border: 1px solid #ccc;
    border-radius: 10px;
    font-size: 15px;
    margin-top: 6px;
    background-color: #fff;
    transition: border-color 0.3s ease, box-shadow 0.3s ease;
}

select:focus {
    border-color: #e5989b;
    box-shadow: 0 0 6px rgba(255, 175, 189, 0.4);
    outline: none;
}
</style>
</head>
<body>
    <jsp:include page="navbar.jsp"></jsp:include>
	
	<%-- ${dish } --%>
    <!-- FORM SECTION -->
    <div class="form-wrapper">
        <form action="/updateDish" >
            <div class="form-container">
                <h2>Update Dish  </h2>

                <label for="id">Dish Id</label>
                <input type="text" id="id" readonly="readonly" value="${dish.id }" name="id"required>
                <label for="name">Dish Name</label>
                <input type="text" id="name" value="${dish.name }" name="name" maxlength="80" required>

                <label for="price">Dish Price</label>
                <input type="number" step="0.01" id="price" value="${dish.price }" name="price" required>

                <label for="category">Dish Category</label>
                <select id="category" name="category" >
                	<option value="Veg">Veg</option>
                	<option value="Non-Veg">Non-Veg</option>
                </select>
                <label for="imgUrl">Dish Img</label>
                <input type="text" value="${dish.imgUrl }" id="imgUrl" name="imgUrl" required>
                
                <input type="submit" value="Update Dish">
            </div>
        </form>
    </div>
</body>
</html>
