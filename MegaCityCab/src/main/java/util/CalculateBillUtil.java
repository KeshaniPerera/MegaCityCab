package util;

import model.Locations;

public class CalculateBillUtil {

    // Define a constant rate per kilometer (you can change this rate)
    private static final double RATE_PER_KM = 10.0;

    // Method to calculate the bill based on pickup and drop locations
    public static double calculateBill(String pickup, String drop) {
        double distance = Locations.getDistance(pickup, drop);
        if (distance == 0.0) {
            return 0.0;  // No valid distance found
        }
        // Calculate the bill based on the distance and the rate per km
        return distance * RATE_PER_KM;
    }
}
