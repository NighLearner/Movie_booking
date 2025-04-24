<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.model.Movie" %>
<%@ page import="java.util.List" %>

<%
    // Get movies from request attribute or fetch them
    List<Movie> movies = (List<Movie>) request.getAttribute("movies");
    if (movies == null) {
        movies = Movie.getAllMovies();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Movie Ticket Booking</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f5f5f5;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
        }
        
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 30px;
        }
        
        .movie-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
        }
        
        .movie-card {
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            padding: 20px;
            transition: transform 0.3s ease;
        }
        
        .movie-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .movie-title {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
            color: #333;
        }
        
        .movie-description {
            color: #666;
            margin-bottom: 15px;
            line-height: 1.5;
        }
        
        .movie-price {
            font-weight: bold;
            color: #4CAF50;
            margin-bottom: 15px;
        }
        
        .book-button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 15px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        
        .book-button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Movie Ticket Booking</h1>
        
        <div class="movie-grid">
            <% for (Movie movie : movies) { %>
                <div class="movie-card">
                    <div class="movie-title"><%= movie.getTitle() %></div>
                    <div class="movie-description"><%= movie.getDescription() %></div>
                    <div class="movie-price">Price: $<%= String.format("%.2f", movie.getPrice()) %></div>
                    <a href="BookingServlet?action=selectSeats&movieId=<%= movie.getId() %>" class="book-button">Book Tickets</a>
                </div>
            <% } %>
        </div>
    </div>
</body>
</html>