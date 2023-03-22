package be.controller;

import be.user.UserDAO;
import be.user.UserDTO;
import be.user.UserError;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SignUpController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "login.jsp";
    private static final String SIGNUP_PAGE = "signup.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        UserError userError = new UserError();
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");

            boolean checkValidate = true;
            if (username.length() > 20 || username.length() < 2) {
                userError.setUsernameE("Tên đăng nhập lớn hơn 2 ký tự");
                checkValidate = false;
            }
            if (password.length() > 20 || password.length() < 2) {
                userError.setPasswordE("Mật khẩu lớn hơn 2 ký tự");
                checkValidate = false;
            }
            if (name.length() > 20 || name.length() < 2) {
                userError.setNameE("Tên lớn hơn 2 ký tự");
                checkValidate = false;
            }
            if (checkValidate) {
                UserDAO userDAO = new UserDAO();
                boolean checkUsername = userDAO.checkUsername(username);
                if (checkUsername) {
                    UserDTO p = new UserDTO(username, password, name, phone);
                    userDAO.signup(p);
                    url = SUCCESS;
                } else {
                    request.setAttribute("message", "Tên đăng nhập đã tồn tại");
                    url = SIGNUP_PAGE;
                }
            } else {
                request.setAttribute("ERROR", userError);
                url = SIGNUP_PAGE;
            }

        } catch (Exception e) {
            log("Error at Sign Up controller: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
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
