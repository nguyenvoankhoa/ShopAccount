
package be.controller;

import be.shopping.AccountDAO;
import be.shopping.AccountDTO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class BuyAccountController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "cart.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            int id = Integer.parseInt(request.getParameter("id"));
            AccountDAO accountDAO = new AccountDAO();
            AccountDTO acc = accountDAO.findByID(id);
            ArrayList<AccountDTO> listAccount = (ArrayList) session.getAttribute("cart");
            if (listAccount == null) {
                listAccount = new ArrayList<>();
                listAccount.add(acc);
                int totalPrice = accountDAO.totalPrice(listAccount);
                session.setAttribute("total", totalPrice);
            } else {
                boolean checkAccount = accountDAO.findExistAccount(id, listAccount);
                if (!checkAccount) {
                    listAccount.add(acc);
                    int totalPrice = accountDAO.totalPrice(listAccount);
                    session.setAttribute("total", totalPrice);
                }
            }
            session.setAttribute("cart", listAccount);
            url = SUCCESS;
        } catch (NumberFormatException e) {
            log("Error at Buy Account controller: " + e.toString());
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
