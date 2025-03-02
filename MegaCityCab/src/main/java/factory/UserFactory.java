package factory;

import model.User;
import util.PasswordUtil;

public class UserFactory {

    public static User createUser(String firstName, String lastName, String address, String nic, String email, String telephone, String password) {
        String hashedPassword = PasswordUtil.hashPassword(password);

        System.out.println("[UserFactory] Creating User: " + firstName + " " + lastName);
        
        return new User(0, firstName, lastName, email, nic, telephone, address, hashedPassword);
    }
}
