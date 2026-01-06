<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Restaurant Management</title>
  <style>
    /* Reset */
    * { margin: 0; padding: 0; box-sizing: border-box; }

    /* Navbar container */
    .navbar {
      display: flex;
      align-items: center;
      justify-content: space-between;
      background-color: #fc5c7d;
      padding: 20px;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      color: white;
      box-shadow: 0 4px 10px rgba(0,0,0,0.1);
      gap: 20px; /* core spacing between groups */
    }

    /* Header */
    .navbar h2 {
      font-size: 22px;
    }

    /* Center links */
    .center-links {
      display: flex;
      gap: 20px; /* spacing between menu links */
    }
    .center-links a {
      color: white;
      text-decoration: none;
      font-weight: 500;
      transition: color 0.3s ease;
    }
    .center-links a:hover {
      color: #1abc9c;
    }

    /* User dropdown */
    .user-dropdown {
      position: relative;
      margin-left: 20px; /* ensures space from center links */
    }
    .user-button {
      background: transparent;
      border: none;
      color: white;
      font-weight: bold;
      font-size: 16px;
      cursor: pointer;
      display: flex;
      align-items: center;
    }
    .user-button .user-icon {
      background: white;
      color: #fc5c7d;
      border-radius: 50%;
      padding: 5px 10px;
      margin-right: 8px; /* small space before username */
      font-weight: bold;
    }

    .dropdown-content {
      display: none;
      position: absolute;
      right: 0;
      background: #fff;
      color: black;
      min-width: 120px;
      box-shadow: 0 8px 16px rgba(0,0,0,0.2);
      border-radius: 5px;
      z-index: 1000;
    }
    .dropdown-content a {
      display: block;
      padding: 10px 12px;
      text-decoration: none;
      color: black;
    }
    .dropdown-content a:hover {
      background: #f1f1f1;
    }
    .user-dropdown:hover .dropdown-content {
      display: block;
    }

    /* Fallback margins for browsers without flex gap support */
    .navbar > * { margin-right: 20px; }
    .navbar > *:last-child { margin-right: 0; }

    @supports (gap: 20px) {
      .navbar > * { margin-right: 0; }
    }
  </style>
</head>
<body>
  <div class="navbar">
    <h2>Restaurant Management</h2>
    <div class="center-links">
      <a href="/category/Veg">Veg Menu</a>
      <a href="/category/Non-Veg">Non-Veg Menu</a>
      <a href="addDish.jsp">Add Dish</a>
      <a href="/ViewDish">View Menu</a>
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
