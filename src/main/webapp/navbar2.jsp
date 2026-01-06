<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Restaurant Management</title>
<style>
/* Reset */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.navbar2 {
	display: flex;
	align-items: center;
	justify-content: space-between;
	background-color: #fc5c7d;
	padding: 12px 20px; /* reduced vertical padding for slimmer look */
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	color: white;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	gap: 20px;
}

/* Larger site title */
.navbar2 h2 {
	font-size: 1.8rem; /* increased font size for emphasis */
	margin: 0;
	color: white;
}

.center-links {
	display: flex;
	gap: 20px;
}

.center-links a {
	color: white;
	text-decoration: none;
	font-weight: 500;
	transition: color 0.3s ease;
	font-size: 1rem;
}

.center-links a:hover {
	color: #1abc9c;
}

/* Make login/username match links */
.user-dropdown, .login-link {
	font-family: inherit;
	font-size: 1rem;
	font-weight: 500;
	color: white;
}

.user-dropdown a, .login-link {
	background: none;
	border: none;
	padding: 0;
	color: white;
	text-decoration: none;
	cursor: pointer;
	transition: color 0.3s ease;
}

.user-dropdown a:hover, .login-link:hover {
	color: #1abc9c;
}

/* user-button styling */
.user-button {
	background: none;
	border: none;
	color: white;
	display: flex;
	align-items: center;
	font-size: 1rem;
	font-weight: 500;
	cursor: pointer;
}

.user-button .user-icon {
	background: white;
	color: #fc5c7d;
	border-radius: 50%;
	padding: 5px 10px;
	margin-right: 8px;
	font-weight: bold;
}

.dropdown-content {
	display: none;
	position: absolute;
	right: 0;
	background: #fff;
	min-width: 120px;
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
	border-radius: 5px;
	z-index: 1000;
}

.dropdown-content a {
	display: block;
	padding: 8px 12px;
	color: black;
	text-decoration: none;
}

.dropdown-content a:hover {
	background: #f1f1f1;
}

.user-dropdown:hover .dropdown-content {
	display: block;
}

/* Fallback margins */
.navbar2>* {
	margin-right: 20px;
}

.navbar2>*:last-child {
	margin-right: 0;
}

@
supports (gap: 20px) { .navbar2 > * { margin-right:0;
	
}
}
</style>
</head>
<body>
	<div class="navbar2">
		<h2>Restaurant Management</h2>
		<div class="center-links">
			<a href="/category/Veg">Veg Menu</a> 
			<a href="/category/Non-Veg">Non-Veg Menu</a>
		</div>
		<div class="user-dropdown">
			<c:choose>
				<c:when test="${not empty userName}">
					<button class="user-button">
						<span class="user-icon">${fn:toUpperCase(fn:substring(userName,0,1))}</span>${userName}
					</button>
					<div class="dropdown-content">
						<a href="/logout">Logout</a>
					</div>
				</c:when>
				<c:otherwise>
					<a href="/login">Login</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>
