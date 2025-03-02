package servlets;

import dao.UserDAO;
import model.User;
import factory.UserFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.regex.Pattern;

@WebServlet("/SignUp")
public class SignUpServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final UserDAO userDAO = UserDAO.getInstance();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        // Extract form data
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String address = request.getParameter("address");
        String nic = request.getParameter("nic");
        String email = request.getParameter("email");
        String telephone = request.getParameter("telephone");
        String password = request.getParameter("password");

        // Debug: Print all form data
        System.out.println("Form Data Received:");
        System.out.println("First Name: " + firstName);
        System.out.println("Last Name: " + lastName);
        System.out.println("Address: " + address);
        System.out.println("NIC: " + nic);
        System.out.println("Email: " + email);
        System.out.println("Telephone: " + telephone);
        System.out.println("Password: " + password);

        // Create user object
        User user = UserFactory.createUser(firstName, lastName, address, nic, email, telephone, password);

        // Register user
        if (userDAO.registerUser(user)) {
            System.out.println("Employee Registered Successfully: " + email);
            request.setAttribute("message", "Registration Successful!");
        } else {
            System.out.println("Registration FAILED for: " + email);
            request.setAttribute("message", "Registration Failed!");
        }

        // Forward the request back to signup.jsp
        request.getRequestDispatcher("/authentication/signUp.jsp").forward(request, response);
    }
}