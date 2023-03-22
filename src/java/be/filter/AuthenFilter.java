/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package be.filter;

import be.user.UserDTO;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
public class AuthenFilter implements Filter {

    private static final boolean debug = true;
    List<String> US_RESOURCES;
    List<String> AD_RESOURCES;
    List<String> NON_AUTHEN_RESOURCES;
    private static final int AD = 1;
    private static final String LOGIN_PAGE = "login.jsp";
    private FilterConfig filterConfig = null;

    public AuthenFilter() {

        AD_RESOURCES = new ArrayList<>();
        AD_RESOURCES.add("admin.jsp");
        AD_RESOURCES.add("orderDetail.jsp");
        AD_RESOURCES.add("addAccount.jsp");
        AD_RESOURCES.add("listAccount.jsp");
        AD_RESOURCES.add("updateAccount.jsp");
        AD_RESOURCES.add("AddAccountController");
        AD_RESOURCES.add("UpdateAccountController");
        AD_RESOURCES.add("DeleteAccountController");
        AD_RESOURCES.add("DeleteUserController");
        AD_RESOURCES.add("SearchUserController");
        AD_RESOURCES.add("UpdateUserController");
        AD_RESOURCES.add("GetOrderDetailController");
        AD_RESOURCES.add("DeleteOrderDetailController");
        NON_AUTHEN_RESOURCES = new ArrayList<>();
        NON_AUTHEN_RESOURCES.add("order.jsp");
        NON_AUTHEN_RESOURCES.add("orderSuccess.jsp");
        NON_AUTHEN_RESOURCES.add("error.jsp");
        NON_AUTHEN_RESOURCES.add("login.jsp");
        NON_AUTHEN_RESOURCES.add("signup.jsp");
        NON_AUTHEN_RESOURCES.add("deposite.jsp");
        NON_AUTHEN_RESOURCES.add(".png");
        NON_AUTHEN_RESOURCES.add(".jpg");
        NON_AUTHEN_RESOURCES.add(".gif");
        NON_AUTHEN_RESOURCES.add(".css");
        NON_AUTHEN_RESOURCES.add("MainController");
        NON_AUTHEN_RESOURCES.add("LoginController");
        NON_AUTHEN_RESOURCES.add("EditCartController");
        NON_AUTHEN_RESOURCES.add("SignUpController");
        NON_AUTHEN_RESOURCES.add("SignUpGoogleHandler");
        NON_AUTHEN_RESOURCES.add("LogOutController");
        NON_AUTHEN_RESOURCES.add("GetAccountsController");
        NON_AUTHEN_RESOURCES.add("GetAccountController");
        NON_AUTHEN_RESOURCES.add("BuyAccountController");
        NON_AUTHEN_RESOURCES.add("GetCartController");
        NON_AUTHEN_RESOURCES.add("LoginGoogleHandler");
        NON_AUTHEN_RESOURCES.add("CheckoutController");

    }

    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("AuthenFilter:DoBeforeProcessing");
        }

    }

    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("AuthenFilter:DoAfterProcessing");
        }

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        try {
            HttpServletRequest req = (HttpServletRequest) request;
            HttpServletResponse res = (HttpServletResponse) response;

            String uri = req.getRequestURI();
            int index = uri.lastIndexOf("/");
            String resource = uri.substring(index + 1);
            boolean checkContain = false;
            for (String value : NON_AUTHEN_RESOURCES) {
                if (uri.contains(value)) {
                    checkContain = true;
                    break;
                }
            }

            if (checkContain) {
                chain.doFilter(request, response);
            } else {
                HttpSession session = req.getSession();
                //Xác thực
                if (session == null || session.getAttribute("LOGIN_USER") == null) {
                    res.sendRedirect(LOGIN_PAGE);
                } else {
                    //Phân quyền
                    UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                    int roleID = loginUser.getRole();
                    if (AD == roleID && AD_RESOURCES.contains(resource)) {
                        chain.doFilter(request, response);
                    } else {
                        res.sendRedirect(LOGIN_PAGE);

                    }
                }
            }
        } catch (IOException | ServletException e) {
        }

    }

    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    public void destroy() {
    }

    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {
                log("AuthenFilter:Initializing filter");
            }
        }
    }

    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("AuthenFilter()");
        }
        StringBuffer sb = new StringBuffer("AuthenFilter(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }

    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);

        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                // PENDING! Localize this for next official release
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");
                pw.print(stackTrace);
                pw.print("</pre></body>\n</html>"); //NOI18N
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }

    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }

    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }

}
