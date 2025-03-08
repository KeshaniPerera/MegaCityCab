package servlets;

import dao.UserDAO;
import model.User;
import util.PasswordUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/signIn")
public class SignInServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final UserDAO userDAO = UserDAO.getInstance(); // Singleton DAO

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        System.out.println("[SignInServlet] Email: " + email);
        System.out.println("[SignInServlet] Password: " + password);
        
        if (email == null || password == null) {
            System.out.println("[SignInServlet] Email or Password is null. Check form submission.");
            response.getWriter().write("failure");
            return;
        }

        // Check for admin credentials
        if ("admin@megacitycabs".equals(email) && "123".equals(password)) {
            System.out.println("[SignInServlet] Admin login successful for: " + email);

            HttpSession session = request.getSession();
            session.setAttribute("user_email", email);
            session.setAttribute("user_role", "admin");

            response.getWriter().write("admin");
            return;
        }

        // Fetch User from Database
        User user = userDAO.getUserByEmail(email);
        if (user == null) {
            System.out.println("[SignInServlet] No user found for email: " + email);
            response.getWriter().write("failure");
            return;
        }

        System.out.println("[SignInServlet] User found: " + user.getEmail());

        // Hash input password for comparison
        String inputHashedPassword = PasswordUtil.hashPassword(password);
        System.out.println("[SignInServlet] Hashed Input Password: " + inputHashedPassword);
        System.out.println("[SignInServlet] Stored Hash in DB: " + user.getPassword());

        // Compare Passwords
        if (inputHashedPassword.equals(user.getPassword())) {
            System.out.println("[SignInServlet] Login successful for: " + email);

            HttpSession session = request.getSession();
            session.setAttribute("user_email", email);
            session.setAttribute("user_role", "customer");

            response.getWriter().write("customer");
        } else {
            System.out.println("[SignInServlet] Password mismatch for email: " + email);
            response.getWriter().write("failure");
        }
    }
}