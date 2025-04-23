<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Movie Ticket Booking</title>
    <style>
        body { 
            font-family: 'Segoe UI', Arial, sans-serif; 
            margin: 0; 
            padding: 0;
            background-color: #121212;
            color: #e1e1e1;
        }
        .container {
            max-width: 900px;
            margin: 0 auto;
            padding: 20px;
        }
        header {
            text-align: center;
            padding: 30px 0;
            border-bottom: 1px solid #333;
            margin-bottom: 40px;
        }
        h1 { 
            color: #bb86fc; 
            font-size: 2.5em;
            margin-bottom: 10px;
        }
        .movies-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 25px;
        }
        .movie { 
            background: #1e1e1e; 
            border-radius: 10px; 
            overflow: hidden;
            transition: transform 0.3s;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        }
        .movie:hover {
            transform: translateY(-5px);
        }
        .movie-poster {
            height: 150px;
            background: #2d2d2d;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #bb86fc;
            font-size: 1.2em;
            text-align: center;
        }
        .movie-details {
            padding: 15px;
        }
        .movie h3 { 
            margin: 0 0 10px 0; 
            color: #bb86fc;
            font-size: 1.3em;
        }
        .movie p {
            margin: 8px 0;
            color: #b0b0b0;
        }
        .book-btn { 
            display: inline-block;
            background: #bb86fc; 
            color: #121212; 
            padding: 10px 15px; 
            text-decoration: none; 
            border-radius: 4px; 
            font-weight: bold;
            margin-top: 10px;
            transition: background-color 0.3s;
        }
        .book-btn:hover {
            background-color: #a370d8;
        }
        .footer {
            text-align: center;
            margin-top: 50px;
            padding-top: 20px;
            border-top: 1px solid #333;
            color: #888;
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h1>Cinema Experience</h1>
            <p>Book your tickets for the latest movies</p>
        </header>
        
        <div class="movies-grid">
            <c:forEach items="${movies}" var="movie">
                <div class="movie">
                    <div class="movie-poster">
                        ${movie.title}
                    </div>
                    <div class="movie-details">
                        <h3>${movie.title}</h3>
                        <p>Show Time: ${movie.showTime}</p>
                        <a href="book?movie=${movie.title}&time=${movie.showTime}" class="book-btn">Book Tickets</a>
                    </div>
                </div>
            </c:forEach>
        </div>
        
        <div class="footer">
            <p>&copy; 2025 Cinema Experience. All rights reserved.</p>
        </div>
    </div>
</body>
</html>