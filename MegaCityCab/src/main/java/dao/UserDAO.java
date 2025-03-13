package dao;

import model.User;
import database.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
    private static UserDAO instance; 
    private final Connection connection;

    private UserDAO() {
        this.connection = DatabaseConnection.getInstance().getConnection();
    }

    public static UserDAO getInstance() {
        if (instance == null) {
            synchronized (UserDAO.class) {
                if (instance == null) {
                    instance = new UserDAO();
                }
            }
        }
        return instance;
    }

    // REGISTER USER
    public boolean registerUser(User user) {
        String query = "INSERT INTO users (FirstName, LastName, Email, NIC, Telephone, Address, Password) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, user.getFirstName());
            stmt.setString(2, user.getLastName());
            stmt.setString(3, user.getEmail());
            stmt.setString(4, user.getNIC());
            stmt.setString(5, user.getTelephone());
            stmt.setString(6, user.getAddress());
            stmt.setString(7, user.getPassword());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // GET USER BY EMAIL
    public User getUserByEmail(String email) {
        String query = "SELECT UserID, FirstName, LastName, Email, NIC, Telephone, Address, Password FROM users WHERE Email = ?";

        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return new User(
                        rs.getInt("UserID"),
                        rs.getString("FirstName"),
                        rs.getString("LastName"),
                        rs.getString("Email"),
                        rs.getString("NIC"),
                        rs.getString("Telephone"),
                        rs.getString("Address"),
                        rs.getString("Password")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // CHECK IF AN EMAIL ALREADY EXISTS
    public boolean isDuplicateEmail(String email) {
        String sql = "SELECT COUNT(*) FROM users WHERE Email = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            return rs.next() && rs.getInt(1) > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // CHECK IF NIC NUMBER ALREADY EXISTS
    public boolean isDuplicateNIC(String nic) {
        String sql = "SELECT COUNT(*) FROM users WHERE NIC = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, nic);
            ResultSet rs = stmt.executeQuery();
            return rs.next() && rs.getInt(1) > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
