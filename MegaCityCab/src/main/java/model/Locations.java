package model;

import java.util.HashMap;
import java.util.Map;

public class Locations {
    public static Map<String, Map<String, Double>> getLocationDistances() {
        Map<String, Map<String, Double>> distances = new HashMap<>();

        distances.put("Colombo", new HashMap<>());
        distances.get("Colombo").put("Kollupitiya", 3.0);
        distances.get("Colombo").put("Bambalapitiya", 5.0);
        distances.get("Colombo").put("Nugegoda", 9.0);
        distances.get("Colombo").put("Battaramulla", 11.0);
        distances.get("Colombo").put("Dehiwala", 10.0);
        
        distances.put("Nugegoda", new HashMap<>());
        distances.get("Nugegoda").put("Colombo", 9.0);
        distances.get("Nugegoda").put("Dehiwala", 6.0);
        distances.get("Nugegoda").put("Battaramulla", 5.0);

        distances.put("Dehiwala", new HashMap<>());
        distances.get("Dehiwala").put("Colombo", 10.0);
        distances.get("Dehiwala").put("Nugegoda", 6.0);

        return distances;
    }

    public static double getDistance(String pickup, String drop) {
        Map<String, Map<String, Double>> distances = getLocationDistances();
        return distances.getOrDefault(pickup, new HashMap<>()).getOrDefault(drop, 0.0);
    }
}
