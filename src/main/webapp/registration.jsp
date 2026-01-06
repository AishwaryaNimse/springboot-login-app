<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Registration</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	background: linear-gradient(rgba(250, 208, 196, 0.8), rgba(216, 180, 226, 0.8)),
		url('${pageContext.request.contextPath}/img/restaurant-background.jpg');
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
}

.register-container {
	background: rgba(255, 255, 255, 0.95);
	padding: 45px 40px;
	border-radius: 20px;
	box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2);
	width: 100%;
	max-width: 440px;
	animation: slideFade 0.8s ease forwards;
	transform: translateY(-20px);
	opacity: 0;
}

@keyframes slideFade {
	to {
		transform: translateY(0);
		opacity: 1;
	}
}

.register-container h2 {
	text-align: center;
	color: #2c3e50;
	margin-bottom: 28px;
	font-size: 30px;
}

.form-group {
	margin-bottom: 20px;
}

.form-group label {
	display: block;
	margin-bottom: 8px;
	color: #444;
	font-weight: 600;
}

.form-group input {
	width: 100%;
	padding: 12px 15px;
	border: 1px solid #ccc;
	border-radius: 10px;
	font-size: 15px;
	background-color: #f9f9f9;
	transition: all 0.3s ease;
}

.form-group input:focus {
	border-color: #5d5fef;
	box-shadow: 0 0 6px rgba(93, 95, 239, 0.4);
	outline: none;
	background-color: #fff;
}

.btn {
	width: 100%;
	padding: 14px;
	background: #5d5fef;
	border: none;
	color: white;
	font-size: 16px;
	font-weight: 600;
	border-radius: 10px;
	cursor: pointer;
	transition: background 0.3s ease;
}

.btn:hover {
	background: #3d3fbe;
}

.login-link {
	margin-top: 20px;
	text-align: center;
	font-size: 14px;
}

.login-link a {
	color: #5d5fef;
	font-weight: 600;
	text-decoration: none;
	transition: 0.2s ease;
}

.login-link a:hover {
	text-decoration: underline;
	color: #3d3fbe;
}
</style>
</head>
<body>
	<div class="register-container">
		<h2>Register</h2>
		<form action="/signUp" method="post">
			<div class="form-group">
				<label for="username">Username</label>
				<input type="text" id="username" name="username" required />
			</div>
			<div class="form-group">
				<label for="email">Email</label>
				<input type="email" id="email" name="email" required />
			</div>
			<div class="form-group">
				<label for="password">Password</label>
				<input type="password" id="password" name="password" required />
			</div>
			<button type="submit" class="btn">Register</button>
			<div class="login-link">
				Already have an account? <a href="/login">Login here</a>
			</div>
		</form>
	</div>
</body>
</html>
