package com.example.model;

public class Movie {
    private String title;
    private String showTime;
    private String[] seatTypes = {"Gold", "Silver", "Platinum"};
    
    public Movie(String title, String showTime) {
        this.title = title;
        this.showTime = showTime;
    }
    
    // Getters and Setters
    public String getTitle() {
        return title;
    }
    
    public String getShowTime() {
        return showTime;
    }
    
    public String[] getSeatTypes() {
        return seatTypes;
    }
}