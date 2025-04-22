<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Book Tickets - ${movie.title}</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        form { max-width: 400px; }
        label { display: block; margin-top: 10px; }
        input, select { width: 100%; padding: 8px; margin-top: 5px; }
        button { background: #4CAF50; color: white; padding: 10px 15px; border: none; margin-top: 15px; }
    </style>
</head>
<body>
    <h1>Book Tickets for ${movie.title}</h1>
    <p>Show Time: ${movie.showTime}</p>
    
    <form action="book" method="post">
        <input type="hidden" name="movie" value="${movie.title}">
        <input type="hidden" name="showTime" value="${movie.showTime}">
        
        <label for="seatType">Seat Type:</label>
        <select id="seatType" name="seatType" required>
            <c:forEach items="${movie.seatTypes}" var="type">
                <option value="${type}">${type}</option>
            </c:forEach>
        </select>
        
        <label for="tickets">Number of Tickets:</label>
        <input type="number" id="tickets" name="tickets" min="1" max="10" required>
        
        <button type="submit">Confirm Booking</button>
    </form>
</body>
</html>