package be.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String LOGIN_PAGE = "login.jsp";
    
    private static final String ORDER = "Order";
    private static final String ORDER_PAGE = "order.jsp";

    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "LoginController";

    private static final String SEARCH = "Search User";
    private static final String SEARCH_CONTROLLER = "SearchUserController";

    private static final String DELETE_ACCOUNT = "DeleteAccount";
    private static final String DELETE_ACCOUNT_CONTROLLER = "DeleteAccountController";

    private static final String UPDATE_ACCOUNT = "UpdateAccount";
    private static final String UPDATE_ACCOUNT_CONTROLLER = "UpdateAccountController";

    private static final String ACCOUNT = "Account";
    private static final String MAIN = "Main";
    private static final String LIST = "List";

    private static final String ADD_ACCOUNT = "AddAccount";
    private static final String ADD_ACCOUNT_CONTROLLER = "AddAccountController";

    private static final String EDIT_CART = "EditCart";
    private static final String EDIT_CART_CONTROLLER = "EditCartController";

    private static final String SIGNUP = "SignUp";
    private static final String SIGNUP_CONTROLLER = "SignUpController";

    private static final String BUY = "Buy";
    private static final String BUY_ACCOUNT_CONTROLLER = "BuyAccountController";

    private static final String GET_CART = "GetCart";
    private static final String GET_CART_CONTROLLER = "GetCartController";

    private static final String LOG_OUT = "LogOut";
    private static final String LOG_OUT_CONTROLLER = "LogOutController";

    private static final String GET_ACCOUNTS_CONTROLLER = "GetAccountsController";

    private static final String DETAIL = "Detail";
    private static final String GET_ACCOUNT_CONTROLLER = "GetAccountController";

    private static final String DELETE_USER = "DeleteUser";
    private static final String DELETE_USER_CONTROLLER = "DeleteUserController";

    private static final String UPDATE_USER = "UpdateUser";
    private static final String UPDATE_USER_CONTROLLER = "UpdateUserController";

    private static final String CHECKOUT = "Checkout";
    private static final String CHECKOUT_CONTROLLER = "CheckoutController";

    private static final String GET_ORDER_DETAILS = "GetOrderDetails";
    private static final String GET_ORDER_DETAILS_CONTROLLER = "GetOrderDetailController";

    private static final String DELETE_ORDER_DETAIL = "DeleteOrderDetail";
    private static final String DELETE_ORDER_DETAIL_CONTROLLER = "DeleteOrderDetailController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if (action == null) {
                url = LOGIN_PAGE;
            } else {
                switch (action) {
                    case LOGIN:
                        url = LOGIN_CONTROLLER;
                        break;
                    case SEARCH:
                        url = SEARCH_CONTROLLER;
                        break;
                    case DELETE_ACCOUNT:
                        url = DELETE_ACCOUNT_CONTROLLER;
                        break;
                    case UPDATE_ACCOUNT:
                        url = UPDATE_ACCOUNT_CONTROLLER;
                        break;
                    case ACCOUNT:
                        url = GET_ACCOUNTS_CONTROLLER;
                        break;
                    case ADD_ACCOUNT:
                        url = ADD_ACCOUNT_CONTROLLER;
                        break;
                    case LOG_OUT:
                        url = LOG_OUT_CONTROLLER;
                        break;
                    case EDIT_CART:
                        url = EDIT_CART_CONTROLLER;
                        break;
                    case MAIN:
                        url = GET_ACCOUNTS_CONTROLLER;
                        break;
                    case SIGNUP:
                        url = SIGNUP_CONTROLLER;
                        break;
                    case BUY:
                        url = BUY_ACCOUNT_CONTROLLER;
                        break;
                    case GET_CART:
                        url = GET_CART_CONTROLLER;
                        break;
                    case LIST:
                        url = GET_ACCOUNTS_CONTROLLER;
                        break;
                    case DETAIL:
                        url = GET_ACCOUNT_CONTROLLER;
                        break;
                    case DELETE_USER:
                        url = DELETE_USER_CONTROLLER;
                        break;
                    case UPDATE_USER:
                        url = UPDATE_USER_CONTROLLER;
                        break;
                    case CHECKOUT:
                        url = CHECKOUT_CONTROLLER;
                        break;
                    case GET_ORDER_DETAILS:
                        url = GET_ORDER_DETAILS_CONTROLLER;
                        break;
                    case DELETE_ORDER_DETAIL:
                        url = DELETE_ORDER_DETAIL_CONTROLLER;
                        break;
                    case ORDER:
                        url = ORDER_PAGE;
                        break;    
                    default:
                        request.setAttribute("ERROR", "Your role is not support");
                        break;
                }
            }

        } catch (Exception e) {
            log("Error at Main Controller: " + e.toString());
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
