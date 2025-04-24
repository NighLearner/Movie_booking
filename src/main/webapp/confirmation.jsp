<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Booking Confirmation</title>
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
            text-align: center;
        }
        .confirmation { 
            background-color: #1e1e1e;
            padding: 30px; 
            border-radius: 10px; 
            max-width: 500px; 
            margin: 40px auto;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        }
        .success { 
            color: #03dac6; 
            font-size: 28px; 
            margin-bottom: 25px;
        }
        .success-icon {
            font-size: 48px;
            color: #03dac6;
            margin-bottom: 15px;
        }
        .details { 
            margin-top: 25px;
            text-align: left;
            background-color: #252525;
            padding: 20px;
            border-radius: 8px;
        }
        .details p {
            margin: 12px 0;
            display: flex;
            justify-content: space-between;
        }
        .details strong {
            color: #bb86fc;
        }
        .home-btn { 
            background: #bb86fc; 
            color: #121212; 
            padding: 12px 25px; 
            text-decoration: none; 
            display: inline-block; 
            margin-top: 30px;
            font-weight: bold;
            border-radius: 4px;
            transition: background-color 0.3s; 
        }
        .home-btn:hover {
            background-color: #a370d8;
        }
        .ticket-id {
            font-family: monospace;
            background: #222;
            padding: 8px;
            border-radius: 4px;
            letter-spacing: 1px;
            margin-top: 20px;
            color: #03dac6;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="confirmation">
            <div class="success-icon">✓</div>
            <h2 class="success">Booking Confirmed!</h2>
            
            <div class="details">
                <p><strong>Movie:</strong> <span>${movie}</span></p>
                <p><strong>Show Time:</strong> <span>${showTime}</span></p>
                <p><strong>Seat Type:</strong> <span>${seatType}</span></p>
                <p><strong>Number of Tickets:</strong> <span>${tickets}</span></p>
            </div>
            
            <div class="ticket-id">TICKET #: ${Math.abs(movie.hashCode() + System.currentTimeMillis())}</div>
            
            <a href="home" class="home-btn">Back to Movies</a>
        </div>
    </div>
</body>
</html>