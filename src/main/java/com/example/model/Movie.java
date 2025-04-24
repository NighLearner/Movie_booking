package com.example.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Movie {
    private static Map<Integer, Movie> movieDatabase = new HashMap<>();
    private static int nextId = 1;
    
    static {
        // Initialize with some sample movies
        addMovie(new Movie("Inception", "A thief who steals corporate secrets through dream-sharing technology.", "7:30 PM", 12.99));
        addMovie(new Movie("The Shawshank Redemption", "Two imprisoned men bond over a number of years.", "6:00 PM", 10.99));
        addMovie(new Movie("The Dark Knight", "Batman fights the menace known as the Joker.", "8:45 PM", 11.99));
    }
    
    private static void addMovie(Movie movie) {
        movie.id = nextId++;
        movieDatabase.put(movie.id, movie);
    }
    
    private int id;
    private String title;
    private String description;
    private String showTime;
    private double price;
    private String[] seatTypes = {"Gold", "Silver", "Platinum"};
    
    public Movie(String title, String description, String showTime, double price) {
        this.title = title;
        this.description = description;
        this.showTime = showTime;
        this.price = price;
    }
    
    // Static methods to access the movie database
    public static Movie getMovieById(int id) {
        return movieDatabase.get(id);
    }
    
    public static List<Movie> getAllMovies() {
        return new ArrayList<>(movieDatabase.values());
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
    
    @Override
    public String toString() {
        return title;
    }
}