package model;

public class User {
    private int UserID; // Field names with uppercase letters
    private String FirstName;
    private String LastName;
    private String Email;
    private String NIC;
    private String Telephone;
    private String Address;
    private String Password;

    // Constructor with UserID (useful for fetching from DB)
    public User(int userID, String firstName, String lastName, String email, String NIC, String telephone, String address, String password) {
        this.UserID = userID; // Corrected to match field names
        this.FirstName = firstName;
        this.LastName = lastName;
        this.Email = email;
        this.NIC = NIC;
        this.Telephone = telephone;
        this.Address = address;
        this.Password = password;
    }

    // Constructor without UserID (useful for creating new users)
    public User(String firstName, String lastName, String email, String NIC, String telephone, String address, String password) {
        this.FirstName = firstName; // Corrected to match field names
        this.LastName = lastName;
        this.Email = email;
        this.NIC = NIC;
        this.Telephone = telephone;
        this.Address = address;
        this.Password = password;
    }

    // Getters and Setters
    public int getUserID() { return UserID; }
    public void setUserID(int userID) { this.UserID = userID; }

    public String getFirstName() { return FirstName; }
    public void setFirstName(String firstName) { this.FirstName = firstName; }

    public String getLastName() { return LastName; }
    public void setLastName(String lastName) { this.LastName = lastName; }

    public String getEmail() { return Email; }
    public void setEmail(String email) { this.Email = email; }

    public String getNIC() { return NIC; }
    public void setNIC(String NIC) { this.NIC = NIC; }

    public String getTelephone() { return Telephone; }
    public void setTelephone(String telephone) { this.Telephone = telephone; }

    public String getAddress() { return Address; }
    public void setAddress(String address) { this.Address = address; }

    public String getPassword() { return Password; }
    public void setPassword(String password) { this.Password = password; }

    @Override
    public String toString() {
        return "User{" +
                "UserID=" + UserID +
                ", FirstName='" + FirstName + '\'' +
                ", LastName='" + LastName + '\'' +
                ", Email='" + Email + '\'' +
                ", NIC='" + NIC + '\'' +
                ", Telephone='" + Telephone + '\'' +
                ", Address='" + Address + '\'' +
                ", Password='" + Password + '\'' +
                '}';
    }
}