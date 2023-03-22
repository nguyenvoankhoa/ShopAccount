package be.controller;

import be.shopping.AccountDAO;
import be.shopping.AccountDTO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateAccountController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "listAccount.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String url = ERROR;
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String rank = request.getParameter("rank");
            String desciption = request.getParameter("description");
            int price = Integer.parseInt(request.getParameter("price"));
            AccountDAO accountDAO = new AccountDAO();
            accountDAO.updateAccount(id, rank, desciption, price);
            url = SUCCESS;
            ArrayList<AccountDTO> listAccount = accountDAO.getAll();
            request.setAttribute("listAccount", listAccount);
        } catch (NumberFormatException e) {
            log("Error at Update Account controller: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
