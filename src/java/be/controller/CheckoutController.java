/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package be.controller;

import be.order.OrderDAO;
import be.order.OrderDTO;
import be.shopping.AccountDTO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
public class CheckoutController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "orderSuccess.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String urlFB = request.getParameter("urlFB");
            String note = request.getParameter("note");
            OrderDTO orderDTO = new OrderDTO(name, email, phone, urlFB, note);
            OrderDAO dao = new OrderDAO();
            boolean check = dao.insertOrder(orderDTO);
            HttpSession session = request.getSession();
            ArrayList<AccountDTO> cart = (ArrayList) session.getAttribute("cart");
            if (cart != null) {
                boolean checkInsertDetail = dao.insertOrderDetail(dao.getOrderID(), cart);
                if (check && checkInsertDetail) {
                    url = SUCCESS;
                    session.removeAttribute("cart");
                }
            }
        } catch (Exception e) {
            log("Error at Checkout controller: " + e.toString());
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
