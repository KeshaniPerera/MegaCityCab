package dao;
import model.Booking;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import database.DatabaseConnection;

public class BookingDAO {
    private static BookingDAO instance;
    private final Connection connection;
    private static final Logger LOGGER = Logger.getLogger(BookingDAO.class.getName());

    private BookingDAO() {
        this.connection = DatabaseConnection.getInstance().getConnection();
    }

    public static BookingDAO getInstance() {
        if (instance == null) {
            synchronized (BookingDAO.class) {
                if (instance == null) {
                    instance = new BookingDAO();
                }
            }
        }
        return instance;
    }

    // Insert New Booking
    public boolean addBooking(Booking booking) {
        String query = "INSERT INTO bookings (bookingID, customerID, vehicleType, vehicleID, driverID, rentalDate, rentalTime, " +
                "returnDate, pickupLocation, returnLocation, bill, bookingStatus, paymentStatus) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"; // 13 Placeholders

        try (PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, booking.getBookingID());
            stmt.setInt(2, booking.getCustomerID());
            stmt.setString(3, booking.getVehicleType()); // Added vehicleType
            stmt.setInt(4, booking.getVehicleID());
            stmt.setInt(5, booking.getDriverID());
            stmt.setString(6, booking.getRentalDate());
            stmt.setString(7, booking.getRentalTime());
            stmt.setString(8, booking.getReturnDate());
            stmt.setString(9, booking.getPickupLocation());
            stmt.setString(10, booking.getReturnLocation());
            stmt.setDouble(11, booking.getBill());
            stmt.setString(12, booking.getBookingStatus());
            stmt.setString(13, booking.getPaymentStatus());

            int affectedRows = stmt.executeUpdate();
            if (affectedRows > 0) {
                System.out.println("Booking added successfully! Booking ID: " + booking.getBookingID());
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Retrieve All Bookings
    public List<Booking> getAllBookings() {
        List<Booking> bookings = new ArrayList<>();
        String query = "SELECT * FROM bookings";

        try (PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Booking booking = new Booking();
                booking.setBookingID(rs.getInt("bookingID"));
                booking.setCustomerID(rs.getInt("customerID"));
                booking.setVehicleType(rs.getString("vehicleType")); // Added vehicleType
                booking.setVehicleID(rs.getInt("vehicleID"));
                booking.setDriverID(rs.getInt("driverID"));
                booking.setRentalDate(rs.getString("rentalDate"));
                booking.setRentalTime(rs.getString("rentalTime"));
                booking.setReturnDate(rs.getString("returnDate"));
                booking.setPickupLocation(rs.getString("pickupLocation"));
                booking.setReturnLocation(rs.getString("returnLocation"));
                booking.setBill(rs.getDouble("bill"));
                booking.setBookingStatus(rs.getString("bookingStatus"));
                booking.setPaymentStatus(rs.getString("paymentStatus"));

                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }

    // Retrieve Booking by ID
    public Booking getBookingById(int bookingID) {
        String query = "SELECT * FROM bookings WHERE bookingID = ?";
        Booking booking = null;

        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, bookingID);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                booking = new Booking();
                booking.setBookingID(rs.getInt("bookingID"));
                booking.setCustomerID(rs.getInt("customerID"));
                booking.setVehicleType(rs.getString("vehicleType")); // Added vehicleType
                booking.setVehicleID(rs.getInt("vehicleID"));
                booking.setDriverID(rs.getInt("driverID"));
                booking.setRentalDate(rs.getString("rentalDate"));
                booking.setRentalTime(rs.getString("rentalTime"));
                booking.setReturnDate(rs.getString("returnDate"));
                booking.setPickupLocation(rs.getString("pickupLocation"));
                booking.setReturnLocation(rs.getString("returnLocation"));
                booking.setBill(rs.getDouble("bill"));
                booking.setBookingStatus(rs.getString("bookingStatus"));
                booking.setPaymentStatus(rs.getString("paymentStatus"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return booking;
    }

    // Update Booking
    public boolean updateBooking(Booking booking) {
        String query = "UPDATE bookings SET customerID = ?, vehicleType = ?, vehicleID = ?, driverID = ?, rentalDate = ?, rentalTime = ?, " +
                "returnDate = ?, pickupLocation = ?, returnLocation = ?, bill = ?, bookingStatus = ?, paymentStatus = ? " +
                "WHERE bookingID = ?";

        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, booking.getCustomerID());
            stmt.setString(2, booking.getVehicleType()); // Added vehicleType
            stmt.setInt(3, booking.getVehicleID());
            stmt.setInt(4, booking.getDriverID());
            stmt.setString(5, booking.getRentalDate());
            stmt.setString(6, booking.getRentalTime());
            stmt.setString(7, booking.getReturnDate());
            stmt.setString(8, booking.getPickupLocation());
            stmt.setString(9, booking.getReturnLocation());
            stmt.setDouble(10, booking.getBill());
            stmt.setString(11, booking.getBookingStatus());
            stmt.setString(12, booking.getPaymentStatus());
            stmt.setInt(13, booking.getBookingID());

            int affectedRows = stmt.executeUpdate();
            if (affectedRows > 0) {
                System.out.println("Booking updated successfully! Booking ID: " + booking.getBookingID());
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete Booking
    public boolean deleteBooking(int bookingID) {
        String query = "DELETE FROM bookings WHERE bookingID = ?";

        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, bookingID);

            int affectedRows = stmt.executeUpdate();
            if (affectedRows > 0) {
                System.out.println("Booking deleted successfully! Booking ID: " + bookingID);
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}