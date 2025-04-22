package com.example.servlets;

import com.example.model.Movie;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "HomeServlet", value = "/home")
public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Create some sample movies
        List<Movie> movies = new ArrayList<>();
        movies.add(new Movie("Avengers: Endgame", "10:00 AM"));
        movies.add(new Movie("The Dark Knight", "2:30 PM"));
        movies.add(new Movie("Inception", "6:00 PM"));
        
        request.setAttribute("movies", movies);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}