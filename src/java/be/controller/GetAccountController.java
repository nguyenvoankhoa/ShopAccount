/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package be.controller;

import be.shopping.AccountDAO;
import be.shopping.AccountDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class GetAccountController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String DETAIL = "Detail";
    private static final String DETAIL_PAGE = "detail.jsp";
    private static final String UPDATE = "Update";
    private static final String UPDATE_ACCOUNT_PAGE = "updateAccount.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            int id = Integer.parseInt(request.getParameter("id"));
            AccountDAO accountDAO = new AccountDAO();
            AccountDTO acc = accountDAO.findByID(id);
            request.setAttribute("account", acc);
            if (DETAIL.equals(action)) {
                url = DETAIL_PAGE;
            } else if (UPDATE.equals(action)) {
                url = UPDATE_ACCOUNT_PAGE;
            }
        } catch (NumberFormatException e) {
            log("Error at Get Account controller: " + e.toString());
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
