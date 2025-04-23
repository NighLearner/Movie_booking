<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.model.Movie" %>

<%
    // Get movie from request attribute or parameter
    Movie movie = (Movie) request.getAttribute("movie");
    if (movie == null && request.getParameter("movieId") != null) {
        int movieId = Integer.parseInt(request.getParameter("movieId"));
        movie = Movie.getMovieById(movieId);
    }
    
    // Redirect to home if no movie found
    if (movie == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Book Tickets - <%= movie.getTitle() %></title>
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
            color: #333;
        }
        
        .movie-details {
            margin-bottom: 30px;
        }
        
        .movie-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        
        .movie-description {
            margin-bottom: 15px;
        }
        
        .movie-price {
            font-weight: bold;
            color: #4CAF50;
        }
        
        .select-seats-btn {
            background-color: #4CAF50;
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 20px;
        }
        
        .select-seats-btn:hover {
            background-color: #45a049;
        }
        
        .back-link {
            display: inline-block;
            margin-top: 20px;
            color: #666;
            text-decoration: none;
        }
        
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Movie Ticket Booking</h1>
        
        <div class="movie-details">
            <div class="movie-title"><%= movie.getTitle() %></div>
            <div class="movie-description"><%= movie.getDescription() %></div>
            <div class="movie-price">Price: $<%= movie.getPrice() %> per ticket</div>
        </div>
        
        <form action="BookingServlet" method="post">
            <input type="hidden" name="movieId" value="<%= movie.getId() %>">
            <input type="hidden" name="action" value="selectSeats">
            <button type="submit" class="select-seats-btn">Select Seats</button>
        </form>
        
        <a href="index.jsp" class="back-link">Back to Movies</a>
    </div>
</body>
</html>