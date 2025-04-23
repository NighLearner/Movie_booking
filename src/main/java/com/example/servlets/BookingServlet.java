package com.example.servlets;

import com.example.model.Movie;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "BookingServlet", value = "/book")
public class BookingServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String movieTitle = request.getParameter("movie");
        String showTime = request.getParameter("time");
        
        Movie movie = new Movie(movieTitle, showTime);
        request.setAttribute("movie", movie);
        request.getRequestDispatcher("/booking.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String movie = request.getParameter("movie");
        String showTime = request.getParameter("showTime");
        String seatType = request.getParameter("seatType");
        int tickets = Integer.parseInt(request.getParameter("tickets"));
        
        // In a real app, you would save this booking to a database
        // For demo, we'll just display the confirmation
        
        request.setAttribute("movie", movie);
        request.setAttribute("showTime", showTime);
        request.setAttribute("seatType", seatType);
        request.setAttribute("tickets", tickets);
        
        request.getRequestDispatcher("/WEB-INF/confirmation.jsp").forward(request, response);
    }
}