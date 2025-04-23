package com.example.servlets;

import com.example.model.Movie;
import com.example.model.SeatBooking;
import com.example.model.SeatBookingDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("selectSeats".equals(action)) {
            int movieId = Integer.parseInt(request.getParameter("movieId"));
            
            // Set movie ID in request and forward to seat selection page
            request.setAttribute("movieId", movieId);
            request.getRequestDispatcher("seatSelection.jsp").forward(request, response);
        } else {
            // Default action - show booking form
            int movieId = Integer.parseInt(request.getParameter("movieId"));
            Movie movie = Movie.getMovieById(movieId);
            
            request.setAttribute("movie", movie);
            request.getRequestDispatcher("booking.jsp").forward(request, response);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("bookSeats".equals(action)) {
            // Handle seat booking
            int movieId = Integer.parseInt(request.getParameter("movieId"));
            String selectedSeatsParam = request.getParameter("selectedSeats");
            
            // Get or create user ID from session
            HttpSession session = request.getSession(true);
            String userId = (String) session.getAttribute("userId");
            if (userId == null) {
                userId = "user_" + System.currentTimeMillis();
                session.setAttribute("userId", userId);
            }
            
            if (selectedSeatsParam != null && !selectedSeatsParam.isEmpty()) {
                String[] seatArray = selectedSeatsParam.split(",");
                List<SeatBooking> bookings = new ArrayList<>();
                List<String> bookedSeats = new ArrayList<>();
                boolean allSeatsBooked = true;
                
                // First check if all seats are available before booking
                for (String seat : seatArray) {
                    String[] coordinates = seat.split("-");
                    int row = Integer.parseInt(coordinates[0]);
                    int column = Integer.parseInt(coordinates[1]);
                    
                    if (SeatBookingDAO.isSeatBooked(movieId, row, column)) {
                        allSeatsBooked = false;
                        break;
                    }
                }
                
                // Book all seats if available
                if (allSeatsBooked) {
                    for (String seat : seatArray) {
                        String[] coordinates = seat.split("-");
                        int row = Integer.parseInt(coordinates[0]);
                        int column = Integer.parseInt(coordinates[1]);
                        
                        SeatBooking booking = new SeatBooking(movieId, row, column, userId);
                        boolean success = SeatBookingDAO.bookSeat(booking);
                        
                        if (success) {
                            // Format as A1, B5 etc. for display
                            char rowLetter = (char) ('A' + row - 1);
                            bookedSeats.add(rowLetter + "" + column);
                            bookings.add(booking);
                        } else {
                            allSeatsBooked = false;
                        }
                    }
                }
                
                if (allSeatsBooked && !bookings.isEmpty()) {
                    // Calculate total price
                    Movie movie = Movie.getMovieById(movieId);
                    double totalPrice = movie.getPrice() * bookings.size();
                    
                    // Store booking details in session for confirmation page
                    session.setAttribute("bookedSeats", bookedSeats);
                    session.setAttribute("totalPrice", totalPrice);
                    session.setAttribute("movie", movie);
                    
                    // Redirect to confirmation page
                    response.sendRedirect("bookingConfirmation.jsp");
                } else {
                    // Some seats were already taken, redirect back to seat selection
                    request.setAttribute("errorMessage", "Some seats are no longer available. Please try again.");
                    response.sendRedirect("BookingServlet?action=selectSeats&movieId=" + movieId);
                }
            } else {
                // No seats selected
                response.sendRedirect("BookingServlet?action=selectSeats&movieId=" + movieId);
            }
        } else {
            // Default booking form submission - redirect to seat selection
            int movieId = Integer.parseInt(request.getParameter("movieId"));
            response.sendRedirect("BookingServlet?action=selectSeats&movieId=" + movieId);
        }
    }
}