package com.example.servlets;

import com.example.model.Movie;
import com.example.model.SeatBookingDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {
    
    @Override
    public void init() throws ServletException {
        super.init();
        // Create seat bookings table if it doesn't exist
        SeatBookingDAO.createTableIfNotExists();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get all available movies
        List<Movie> movies = Movie.getAllMovies();
        
        // Set movies as request attribute
        request.setAttribute("movies", movies);
        
        // Forward to index.jsp
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Just redirect to doGet for now
        doGet(request, response);
    }
}