package com.example.model;

import java.util.Date;

public class SeatBooking {
    private int id;
    private int movieId;
    private int row;
    private int column;
    private String userId;
    private Date bookingTime;
    
    public SeatBooking() {
    }
    
    public SeatBooking(int movieId, int row, int column, String userId) {
        this.movieId = movieId;
        this.row = row;
        this.column = column;
        this.userId = userId;
        this.bookingTime = new Date();
    }
    
    // Getters and setters
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public int getMovieId() {
        return movieId;
    }
    
    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }
    
    public int getRow() {
        return row;
    }
    
    public void setRow(int row) {
        this.row = row;
    }
    
    public int getColumn() {
        return column;
    }
    
    public void setColumn(int column) {
        this.column = column;
    }
    
    public String getUserId() {
        return userId;
    }
    
    public void setUserId(String userId) {
        this.userId = userId;
    }
    
    public Date getBookingTime() {
        return bookingTime;
    }
    
    public void setBookingTime(Date bookingTime) {
        this.bookingTime = bookingTime;
    }
}