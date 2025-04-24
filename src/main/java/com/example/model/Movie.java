package com.example.model;

import java.util.Arrays;
import java.util.List;

public class Movie {
    private int id;
    private String title;
    private String description;
    private String showTime;
    private double price;
    private String[] seatTypes = {"Gold", "Silver", "Platinum"};
    
    // Sample movie data (in a real app this would come from a database)
    private static final Movie[] MOVIES = {
        new Movie(1, "Avengers: Endgame", "Epic conclusion to the Infinity Saga", "7:00 PM", 12.99),
        new Movie(2, "The Lion King", "Live-action remake of the Disney classic", "5:30 PM", 10.99),
        new Movie(3, "Joker", "The story of the infamous villain", "8:30 PM", 11.99)
    };
    
    public Movie(int id, String title, String description, String showTime, double price) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.showTime = showTime;
        this.price = price;
    }
    
    // Static methods to retrieve movies
    public static Movie getMovieById(int id) {
        for (Movie movie : MOVIES) {
            if (movie.getId() == id) {
                return movie;
            }
        }
        return null;
    }
    
    public static List<Movie> getAllMovies() {
        return Arrays.asList(MOVIES);
    }
    
    // Getters and Setters
    public int getId() {
        return id;
    }
    
    public String getTitle() {
        return title;
    }
    
    public String getDescription() {
        return description;
    }
    
    public String getShowTime() {
        return showTime;
    }
    
    public double getPrice() {
        return price;
    }
    
    public String[] getSeatTypes() {
        return seatTypes;
    }
}