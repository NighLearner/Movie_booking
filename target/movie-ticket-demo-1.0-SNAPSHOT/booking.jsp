<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Book Tickets - ${movie.title}</title>
    <style>
        body { 
            font-family: 'Segoe UI', Arial, sans-serif; 
            margin: 0; 
            padding: 20px;
            background-color: #121212;
            color: #e1e1e1;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }
        h1 {
            color: #bb86fc;
            margin-bottom: 5px;
        }
        form { 
            max-width: 500px; 
            margin-top: 30px;
            background-color: #1e1e1e;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
        }
        label { 
            display: block; 
            margin-top: 15px; 
            color: #bb86fc;
            font-weight: 500;
        }
        input, select { 
            width: 100%; 
            padding: 10px; 
            margin-top: 8px; 
            background-color: #2d2d2d;
            border: 1px solid #444;
            border-radius: 4px;
            color: #e1e1e1;
        }
        select:focus, input:focus {
            outline: none;
            border-color: #bb86fc;
        }
        button { 
            background: #bb86fc; 
            color: #121212; 
            padding: 12px 20px; 
            border: none; 
            margin-top: 25px; 
            font-weight: bold;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #a370d8;
        }
        .movie-info {
            background-color: #1e1e1e;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            border-left: 4px solid #bb86fc;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Book Tickets</h1>
        
        <div class="movie-info">
            <h2>${movie.title}</h2>
            <p>Show Time: ${movie.showTime}</p>
        </div>
        
        <form action="book" method="post">
            <input type="hidden" name="movie" value="${movie.title}">
            <input type="hidden" name="showTime" value="${movie.showTime}">
            
            <label for="seatType">Seat Type:</label>
            <select id="seatType" name="seatType" required>
                <option value="Gold">Gold</option>
                <option value="Silver">Silver</option>
                <option value="Platinum">Platinum</option>
            </select>
            
            <label for="tickets">Number of Tickets:</label>
            <input type="number" id="tickets" name="tickets" min="1" max="10" required>
            
            <button type="submit">Confirm Booking</button>
        </form>
    </div>
</body>
</html>