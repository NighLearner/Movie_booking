package com.example.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SeatBookingDAO {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/movie_tickets";
    private static final String DB_USER = "username";
    private static final String DB_PASSWORD = "password";
    
    // Create the table if it doesn't exist
    public static void createTableIfNotExists() {
        try (Connection conn = getConnection()) {
            Statement stmt = conn.createStatement();
            String sql = "CREATE TABLE IF NOT EXISTS seat_bookings (" +
                    "id INT AUTO_INCREMENT PRIMARY KEY," +
                    "movie_id INT NOT NULL," +
                    "row_num INT NOT NULL," +
                    "column_num INT NOT NULL," +
                    "user_id VARCHAR(100) NOT NULL," +
                    "booking_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP," +
                    "UNIQUE KEY unique_seat (movie_id, row_num, column_num)" +
                    ")";
            stmt.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    // Save a seat booking to database
    public static boolean bookSeat(SeatBooking booking) {
        createTableIfNotExists();
        
        try (Connection conn = getConnection()) {
            String sql = "INSERT INTO seat_bookings (movie_id, row_num, column_num, user_id) VALUES (?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, booking.getMovieId());
            pstmt.setInt(2, booking.getRow());
            pstmt.setInt(3, booking.getColumn());
            pstmt.setString(4, booking.getUserId());
            
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // Get all booked seats for a specific movie
    public static List<SeatBooking> getBookedSeats(int movieId) {
        createTableIfNotExists();
        List<SeatBooking> bookedSeats = new ArrayList<>();
        
        try (Connection conn = getConnection()) {
            String sql = "SELECT * FROM seat_bookings WHERE movie_id = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, movieId);
            
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                SeatBooking booking = new SeatBooking();
                booking.setId(rs.getInt("id"));
                booking.setMovieId(rs.getInt("movie_id"));
                booking.setRow(rs.getInt("row_num"));
                booking.setColumn(rs.getInt("column_num"));
                booking.setUserId(rs.getString("user_id"));
                booking.setBookingTime(rs.getTimestamp("booking_time"));
                bookedSeats.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return bookedSeats;
    }
    
    // Check if a seat is already booked
    public static boolean isSeatBooked(int movieId, int row, int column) {
        createTableIfNotExists();
        
        try (Connection conn = getConnection()) {
            String sql = "SELECT COUNT(*) FROM seat_bookings WHERE movie_id = ? AND row_num = ? AND column_num = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, movieId);
            pstmt.setInt(2, row);
            pstmt.setInt(3, column);
            
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return false;
    }
    
    // Get connection to database
    private static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }
}