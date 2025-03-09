package dao;

import model.Vehicle;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import database.DatabaseConnection;

public class VehicleDAO {
    private static VehicleDAO instance;
    private final Connection connection;
    private static final Logger LOGGER = Logger.getLogger(VehicleDAO.class.getName());

    private VehicleDAO() {
        this.connection = DatabaseConnection.getInstance().getConnection();
    }

    public static VehicleDAO getInstance() {
        if (instance == null) {
            synchronized (VehicleDAO.class) {
                if (instance == null) {
                    instance = new VehicleDAO();
                }
            }
        }
        return instance;
    }

    public boolean addVehicle(Vehicle vehicle) {
        String query = "INSERT INTO vehicles (vehicleID, vehicleName, model, brand, year, registrationNumber, " +
                       "seatingCapacity, fuelType, ratePerDay) " +
                       "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, vehicle.getVehicleID());
            stmt.setString(2, vehicle.getVehicleName());
            stmt.setString(3, vehicle.getModel());
            stmt.setString(4, vehicle.getBrand());
            stmt.setString(5, vehicle.getYear());
            stmt.setString(6, vehicle.getRegistrationNumber());
            stmt.setInt(7, vehicle.getSeatingCapacity());
            stmt.setString(8, vehicle.getFuelType());
            stmt.setDouble(9, vehicle.getRatePerDay());

            int affectedRows = stmt.executeUpdate();
            if (affectedRows > 0) {
                ResultSet generatedKeys = stmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int generatedId = generatedKeys.getInt(1);
                    System.out.println("Vehicle added successfully! Generated Vehicle ID: " + generatedId);
                }
                return true;
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error adding vehicle to the database", e);
        }
        return false;
    }

    // New method to retrieve all vehicles
    public List<Vehicle> getAllVehicles() {
        List<Vehicle> vehicles = new ArrayList<>();
        String query = "SELECT * FROM vehicles";

        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                Vehicle vehicle = new Vehicle();
                vehicle.setVehicleID(rs.getInt("vehicleID"));
                vehicle.setVehicleName(rs.getString("vehicleName"));
                vehicle.setModel(rs.getString("model"));
                vehicle.setBrand(rs.getString("brand"));
                vehicle.setYear(rs.getString("year"));
                vehicle.setRegistrationNumber(rs.getString("registrationNumber"));
                vehicle.setSeatingCapacity(rs.getInt("seatingCapacity"));
                vehicle.setFuelType(rs.getString("fuelType"));
                vehicle.setRatePerDay(rs.getDouble("ratePerDay"));

                vehicles.add(vehicle);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error retrieving vehicles from the database", e);
        }
        return vehicles;
    }
    
    public boolean deleteVehicle(int vehicleID) {
        String query = "DELETE FROM vehicles WHERE vehicleID = ?";

        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, vehicleID);

            int affectedRows = stmt.executeUpdate();
            if (affectedRows > 0) {
                System.out.println("Vehicle deleted successfully! Vehicle ID: " + vehicleID);
                return true;
            } else {
                System.out.println("No vehicle found with ID: " + vehicleID);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error deleting vehicle from the database", e);
        }
        return false;
    }

}
