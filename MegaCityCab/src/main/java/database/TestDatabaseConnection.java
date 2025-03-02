package database;

import database.DatabaseConnection;
import java.sql.Connection;
import java.sql.SQLException;

public class TestDatabaseConnection {
    public static void main(String[] args) {
        try {
            // Get the database connection instance
            DatabaseConnection dbInstance = DatabaseConnection.getInstance();
            Connection connection = dbInstance.getConnection();

            // Check if connection is valid
            if (connection != null && !connection.isClosed()) {
                System.out.println("✅ Database connection is successful!");
            } else {
                System.out.println("❌ Failed to establish database connection.");
            }

            // Close connection
            dbInstance.closeConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
