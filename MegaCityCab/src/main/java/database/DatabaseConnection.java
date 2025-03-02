package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    // Singleton instance
    private static volatile DatabaseConnection instance;

    // Database connection details
    private final String jdbcURL = "jdbc:mysql://localhost:3307/megacitycab";
    private final String dbUser = "root";
    private final String dbPassword = "";

    // Database connection object
    private Connection connection;

    // Private constructor to prevent external instantiation
    private DatabaseConnection() {
        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Establish the database connection
            this.connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            System.out.println("Database connection established successfully.");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to initialize database connection.", e);
        }
    }

    // Thread-safe Singleton getInstance() method
    public static DatabaseConnection getInstance() {
        if (instance == null) {
            synchronized (DatabaseConnection.class) {
                if (instance == null) {
                    instance = new DatabaseConnection();
                }
            }
        }
        return instance;
    }

    // Method to get the database connection
    public Connection getConnection() {
        return connection;
    }

    // Method to close the database connection
    public void closeConnection() {
        if (connection != null) {
            try {
                connection.close();
                System.out.println("Database connection closed successfully.");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}