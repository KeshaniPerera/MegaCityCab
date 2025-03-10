package model;

public class Driver {
    private int DriverID; 
    private String DriverName;
    private String DriverNIC;
    private String PhoneNumber;
    private String Address;

    public int getDriverID() {
        return DriverID;
    }

    public void setDriverID(int driverID) {
        this.DriverID = driverID;
    }

    public String getDriverName() {
        return DriverName;
    }

    public void setDriverName(String driverName) {
        this.DriverName = driverName;
    }

    public String getDriverNIC() {
        return DriverNIC;
    }

    public void setDriverNIC(String driverNIC) {
        this.DriverNIC = driverNIC;
    }

    public String getPhoneNumber() {
        return PhoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.PhoneNumber = phoneNumber;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        this.Address = address;
    }
}