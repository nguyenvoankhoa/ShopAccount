/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package be.controller;

import be.shopping.AccountDAO;
import be.shopping.AccountDTO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class GetAccountsController extends HttpServlet {

    private static final String ERROR = "error.jsp";

    private static final String MAIN = "Main";
    private static final String MAIN_PAGE = "main.jsp";

    private static final String ADD_ACCOUNT = "AddAccount";

    private static final String ACCOUNT = "Account";
    private static final String ACCOUNT_PAGE = "account.jsp";

    private static final String LIST = "List";
    private static final String EDIT_ACCOUNT_PAGE = "listAccount.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if (null != action) {
                AccountDAO accountDAO = new AccountDAO();
                switch (action) {
                    case ACCOUNT:
                        ArrayList<AccountDTO> listAccount = accountDAO.getAll();
                        request.setAttribute("listAccount", listAccount);
                        url = ACCOUNT_PAGE;
                        break;
                    case LIST:
                        ArrayList<AccountDTO> listAccount1 = accountDAO.getAll();
                        request.setAttribute("listAccount", listAccount1);
                        url = EDIT_ACCOUNT_PAGE;
                        break;
                    case MAIN:
                        ArrayList<AccountDTO> topAccount = accountDAO.getTopAccount();
                        request.setAttribute("topAccount", topAccount);
                        url = MAIN_PAGE;
                        break;
                    case ADD_ACCOUNT:
                        ArrayList<AccountDTO> listAccount2 = accountDAO.getAll();
                        request.setAttribute("listAccount", listAccount2);
                        url = EDIT_ACCOUNT_PAGE;
                        break;
                    default:
                        break;
                }
            }
        } catch (Exception e) {
            log("Error at Get Accounts controller: " + e.toString());
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
