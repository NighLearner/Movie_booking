<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Movie Ticket Booking</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .movie { border: 1px solid #ddd; padding: 15px; margin-bottom: 10px; border-radius: 5px; }
        .movie h3 { margin-top: 0; }
        .book-btn { background: #4CAF50; color: white; padding: 8px 16px; text-decoration: none; border-radius: 4px; }
    </style>
</head>
<body>
    <h1>Now Showing</h1>
    
    <c:forEach items="${movies}" var="movie">
        <div class="movie">
            <h3>${movie.title}</h3>
            <p>Show Time: ${movie.showTime}</p>
            <a href="book?movie=${movie.title}&time=${movie.showTime}" class="book-btn">Book Tickets</a>
        </div>
    </c:forEach>
</body>
</html>