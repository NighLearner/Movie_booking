<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.model.Movie" %>
<%@ page import="com.example.model.SeatBooking" %>
<%@ page import="com.example.model.SeatBookingDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>

<%
    // Get the movie ID from request
    int movieId = Integer.parseInt(request.getParameter("movieId"));
    
    // Get movie details
    Movie movie = Movie.getMovieById(movieId);
    
    // Handle case where movie is null
    if (movie == null) {
        response.sendRedirect("index.jsp");
        return;
    }
    
    double seatPrice = movie.getPrice();
    
    // Get all booked seats for this movie
    List<SeatBooking> bookedSeats = SeatBookingDAO.getBookedSeats(movieId);
    
    // Create a map of booked seats for easy lookup
    Map<String, Boolean> bookedSeatsMap = new HashMap<>();
    for (SeatBooking booking : bookedSeats) {
        String key = booking.getRow() + "-" + booking.getColumn();
        bookedSeatsMap.put(key, true);
    }
    
    // Define seat matrix dimensions
    int rows = 10;
    int columns = 10;
%>

<!DOCTYPE html>
<html>
<head>
    <title>Select Seats - <%= movie.getTitle() %></title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f5f5f5;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        
        h1 {
            color: #333;
            margin-bottom: 20px;
        }
        
        .movie-details {
            margin-bottom: 30px;
            padding: 10px;
            background-color: #f9f9f9;
            border-radius: 5px;
        }
        
        .screen {
            background-color: #ddd;
            color: #333;
            padding: 10px;
            text-align: center;
            font-weight: bold;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        
        .seat-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 30px;
            overflow-x: auto;
        }
        
        .seat-row {
            display: flex;
            margin-bottom: 5px;
        }
        
        .row-label {
            min-width: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
        }
        
        .seat {
            width: 30px;
            height: 30px;
            margin: 2px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            border-radius: 3px;
        }
        
        .seat.available {
            background-color: #a6e1a6;
            border: 1px solid #74c365;
        }
        
        .seat.booked {
            background-color: #e57373;
            border: 1px solid #c62828;
            cursor: not-allowed;
        }
        
        .seat.selected {
            background-color: #64b5f6;
            border: 1px solid #1976d2;
        }
        
        .legend {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }
        
        .legend-item {
            display: flex;
            align-items: center;
            margin: 0 10px;
        }
        
        .legend-box {
            width: 15px;
            height: 15px;
            margin-right: 5px;
            border-radius: 3px;
        }
        
        .form-container {
            text-align: center;
        }
        
        .submit-btn {
            background-color: #4caf50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        
        .submit-btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Select Your Seats</h1>
        
        <div class="movie-details">
            <h2><%= movie.getTitle() %></h2>
            <p>Price: $<%= String.format("%.2f", seatPrice) %> per seat</p>
        </div>
        
        <div class="screen">SCREEN</div>
        
        <div class="legend">
            <div class="legend-item">
                <div class="legend-box" style="background-color: #a6e1a6; border: 1px solid #74c365;"></div>
                <span>Available</span>
            </div>
            <div class="legend-item">
                <div class="legend-box" style="background-color: #e57373; border: 1px solid #c62828;"></div>
                <span>Booked</span>
            </div>
            <div class="legend-item">
                <div class="legend-box" style="background-color: #64b5f6; border: 1px solid #1976d2;"></div>
                <span>Selected</span>
            </div>
        </div>
        
        <div class="seat-container">
            <!-- Column Numbers -->
            <div class="seat-row">
                <div class="row-label"></div>
                <% for (int col = 1; col <= columns; col++) { %>
                    <div class="seat" style="background-color: transparent; border: none; font-weight: bold;"><%= col %></div>
                <% } %>
            </div>
            
            <!-- Seat Matrix -->
            <% for (int row = 1; row <= rows; row++) { %>
                <div class="seat-row">
                    <div class="row-label"><%= (char)('A' + row - 1) %></div>
                    <% for (int col = 1; col <= columns; col++) { 
                        String seatKey = row + "-" + col;
                        boolean isBooked = bookedSeatsMap.containsKey(seatKey);
                    %>
                        <div class="seat <%= isBooked ? "booked" : "available" %>" 
                            data-row="<%= row %>" 
                            data-col="<%= col %>" 
                            onclick="<%= isBooked ? "" : "toggleSeat(this)" %>">
                            <%= col %>
                        </div>
                    <% } %>
                </div>
            <% } %>
        </div>
        
        <div class="form-container">
            <form action="BookingServlet" method="post" id="bookingForm">
                <input type="hidden" name="movieId" value="<%= movieId %>">
                <input type="hidden" name="selectedSeats" id="selectedSeats" value="">
                <input type="hidden" name="action" value="bookSeats">
                <p>Selected Seats: <span id="selectedSeatsDisplay">None</span></p>
                <p>Total Price: $<span id="totalPrice">0.00</span></p>
                <button type="submit" class="submit-btn">Confirm Booking</button>
            </form>
        </div>
    </div>
    
    <script>
        // Store selected seats
        let selectedSeats = [];
        const seatPrice = movie.getPrice(); // Fixed: use movie.getPrice() directly

        function toggleSeat(seat) {
            const row = seat.getAttribute('data-row');
            const col = seat.getAttribute('data-col');
            const seatId = row + '-' + col;
            
            if (seat.classList.contains('selected')) {
                // Deselect the seat
                seat.classList.remove('selected');
                seat.classList.add('available');
                
                // Remove from selected seats
                const index = selectedSeats.findIndex(s => s.id === seatId);
                if (index > -1) {
                    selectedSeats.splice(index, 1);
                }
            } else {
                // Select the seat
                seat.classList.remove('available');
                seat.classList.add('selected');
                
                // Add to selected seats
                selectedSeats.push({
                    row: row,
                    column: col,
                    id: seatId
                });
            }
            
            updateSelectedSeatsDisplay();
        }

        function updateSelectedSeatsDisplay() {
            const displayElement = document.getElementById('selectedSeatsDisplay');
            const seatsInput = document.getElementById('selectedSeats');
            const totalPriceElement = document.getElementById('totalPrice');
            
            if (selectedSeats.length === 0) {
                displayElement.textContent = 'None';
                seatsInput.value = '';
                totalPriceElement.textContent = '0.00';
            } else {
                // Format as: A1, A2, B5
                const formattedSeats = selectedSeats.map(seat => {
                    const rowLetter = String.fromCharCode(64 + parseInt(seat.row));
                    return rowLetter + seat.column;
                }).join(', ');
                
                displayElement.textContent = formattedSeats;
                
                // Format for form submission: 1-1,1-2,2-5
                seatsInput.value = selectedSeats.map(seat => `${seat.row}-${seat.column}`).join(',');
                
                // Calculate total price
                const totalPrice = (selectedSeats.length * seatPrice).toFixed(2);
                totalPriceElement.textContent = totalPrice;
            }
        }
    </script>
</body>
</html>