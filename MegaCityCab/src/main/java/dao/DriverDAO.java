package dao;

import model.Driver;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import database.DatabaseConnection;

public class DriverDAO {
    private static DriverDAO instance;
    private final Connection connection;
    private static final Logger LOGGER = Logger.getLogger(DriverDAO.class.getName());

    private DriverDAO() {
        this.connection = DatabaseConnection.getInstance().getConnection();
    }

    public static DriverDAO getInstance() {
        if (instance == null) {
            synchronized (DriverDAO.class) {
                if (instance == null) {
                    instance = new DriverDAO();
                }
            }
        }
        return instance;
    }

    public boolean addDriver(Driver driver) {
        String query = "INSERT INTO drivers (DriverID, DriverName, DriverNIC, PhoneNumber, Address) " +
                       "VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, driver.getDriverID());
            stmt.setString(2, driver.getDriverName());
            stmt.setString(3, driver.getDriverNIC());
            stmt.setString(4, driver.getPhoneNumber());
            stmt.setString(5, driver.getAddress());

            int affectedRows = stmt.executeUpdate();
            if (affectedRows > 0) {
                ResultSet generatedKeys = stmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int generatedId = generatedKeys.getInt(1);
                    System.out.println("Driver added successfully! Generated Driver ID: " + generatedId);
                }
                return true;
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error adding driver to the database", e);
        }
        return false;
    }

    public List<Driver> getAllDrivers() {
        List<Driver> drivers = new ArrayList<>();
        String query = "SELECT * FROM drivers";

        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                Driver driver = new Driver();
                driver.setDriverID(rs.getInt("DriverID"));
                driver.setDriverName(rs.getString("DriverName"));
                driver.setDriverNIC(rs.getString("DriverNIC"));
                driver.setPhoneNumber(rs.getString("PhoneNumber"));
                driver.setAddress(rs.getString("Address"));

                drivers.add(driver);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error retrieving drivers from the database", e);
        }
        return drivers;
    }

    public boolean deleteDriver(int driverID) {
        String query = "DELETE FROM drivers WHERE DriverID = ?";

        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, driverID);

            int affectedRows = stmt.executeUpdate();
            if (affectedRows > 0) {
                System.out.println("Driver deleted successfully! Driver ID: " + driverID);
                return true;
            } else {
                System.out.println("No driver found with ID: " + driverID);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error deleting driver from the database", e);
        }
        return false;
    }
}