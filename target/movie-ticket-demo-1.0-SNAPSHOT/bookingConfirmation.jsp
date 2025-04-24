<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.model.Movie" %>
<%@ page import="java.util.List" %>

<%
    // Get booking details from session
    Movie movie = (Movie) session.getAttribute("movie");
    List<String> bookedSeats = (List<String>) session.getAttribute("bookedSeats");
    Double totalPrice = (Double) session.getAttribute("totalPrice");
    
    // Check if booking details exist
    if (movie == null || bookedSeats == null || totalPrice == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Booking Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f5f5f5;
        }
        
        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        
        h1 {
            color: #2e7d32;
            text-align: center;
        }
        
        .confirmation-box {
            border: 2px solid #81c784;
            background-color: #e8f5e9;
            border-radius: 5px;
            padding: 20px;
            margin-bottom: 20px;
        }
        
        .movie-details {
            margin-bottom: 20px;
        }
        
        .booking-details {
            margin-bottom: 20px;
        }
        
        .seat-list {
            font-weight: bold;
        }
        
        .total-price {
            font-size: 1.2em;
            font-weight: bold;
            color: #2e7d32;
        }
        
        .back-button {
            background-color: #4caf50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            display: block;
            width: 200px;
            margin: 20px auto 0;
            text-align: center;
            text-decoration: none;
        }
        
        .back-button:hover {
            background-color: #45a049;
        }
        
        .ticket-id {
            font-family: monospace;
            background: #e8f5e9;
            padding: 10px;
            border-radius: 4px;
            text-align: center;
            margin: 20px 0;
            border: 1px dashed #81c784;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Booking Confirmed!</h1>
        
        <div class="confirmation-box">
            <p>Thank you for your booking. Your tickets have been reserved successfully.</p>
        </div>
        
        <div class="movie-details">
            <h2><%= movie.getTitle() %></h2>
            <p><%= movie.getDescription() %></p>
            <p>Show Time: <%= movie.getShowTime() %></p>
        </div>
        
        <div class="booking-details">
            <h3>Booking Details:</h3>
            <p>Seats: <span class="seat-list"><%= String.join(", ", bookedSeats) %></span></p>
            <p>Number of Tickets: <%= bookedSeats.size() %></p>
            <p class="total-price">Total Price: $<%= String.format("%.2f", totalPrice) %></p>
        </div>
        
        <div class="ticket-id">
            TICKET #: <%= Math.abs((movie.getTitle() + System.currentTimeMillis()).hashCode()) %>
        </div>
        
        <a href="index.jsp" class="back-button">Return to Home</a>
    </div>
</body>
</html>