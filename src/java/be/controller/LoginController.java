
package be.controller;

import be.shopping.AccountDAO;
import be.shopping.AccountDTO;
import be.user.UserDAO;
import be.user.UserDTO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginController extends HttpServlet {

    private static final String ADMIN_PAGE = "admin.jsp";
    private static final String USER_PAGE = "main.jsp";
    private static final String UNSUCCESS = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url;
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        UserDAO userDAO = new UserDAO();
        UserDTO user = userDAO.signin(username, password);
        if (user == null) {
            request.setAttribute("message", "Sai tên đăng nhập hoặc mật khẩu");
            url = UNSUCCESS;
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("LOGIN_USER", user);
            AccountDAO accountDAO = new AccountDAO();
            ArrayList<AccountDTO> topAccount = accountDAO.getTopAccount();
            request.setAttribute("topAccount", topAccount);
            if (user.getRole() == 1) {
                url = ADMIN_PAGE;
            } else {
                url = USER_PAGE;
            }
        }
        request.getRequestDispatcher(url).forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
