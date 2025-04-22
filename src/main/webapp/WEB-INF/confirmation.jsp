<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Booking Confirmation</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .confirmation { border: 1px solid #4CAF50; padding: 20px; border-radius: 5px; }
    </style>
</head>
<body>
    <div class="confirmation">
        <h1>Booking Confirmed!</h1>
        <p><strong>Movie:</strong> ${movie}</p>
        <p><strong>Show Time:</strong> ${showTime}</p>
        <p><strong>Seat Type:</strong> ${seatType}</p>
        <p><strong>Tickets:</strong> ${tickets}</p>
        
        <p>Thank you for your booking!</p>
    </div>
</body>
</html>