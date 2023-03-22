package be.controller;

import be.shopping.AccountDAO;
import be.shopping.AccountDTO;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class AddAccountController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "listAccount.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = ERROR;
        try {
            AccountDAO acc = new AccountDAO();
            int id = acc.getMaxID();
            String imageLink = "";
            String rank = "";
            String desciption = "";
            int price = 0;
            try {
                DiskFileItemFactory factory = new DiskFileItemFactory();
                ServletContext servletContext = this.getServletConfig().getServletContext();
                File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
                factory.setRepository(repository);
                ServletFileUpload upload = new ServletFileUpload(factory);
                List<FileItem> items = upload.parseRequest(request);
                Iterator<FileItem> iter = items.iterator();
                HashMap<String, String> fields = new HashMap<>();
                int count = 0;
                while (iter.hasNext()) {
                    FileItem item = iter.next();
                    if (item.isFormField()) {
                        String value = item.getString();
                        switch (count) {
                            case 0:
                                rank = value;
                                break;
                            case 1:
                                desciption = value;
                                break;
                            case 2:
                                price = Integer.parseInt(value);
                                break;
                            default:
                                break;
                        }
                        fields.put(item.getName(), item.getString());
                        count++;
                    } else {
                        String filename = item.getName();
                        if (filename == null || filename.equals("")) {
                            break;
                        } else {
                            String storePath = servletContext.getRealPath("/uploads");
                            File uploadFile = new File(storePath + "/" + "Account" + id + ".png");
                            imageLink = "uploads/" + "Account" + id + ".png";
                            try {
                                item.write(uploadFile);
                            } catch (Exception ex) {
                                Logger.getLogger(AddAccountController.class.getName()).log(Level.SEVERE, null, ex);
                            }
                        }
                    }
                }
            } catch (FileUploadException ex) {
                Logger.getLogger(AddAccountController.class.getName()).log(Level.SEVERE, null, ex);
            }
            String name = "Account " + id;
            acc.addAccount(imageLink, name, rank, desciption, price);
            url = SUCCESS;
        } catch (NumberFormatException e) {
            log("Error at main controller: " + e.toString());
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
        String url = ERROR;
        try {
            AccountDAO acc = new AccountDAO();
            int id = acc.getMaxID();
            String imageLink = "";
            String rank = "";
            String desciption = "";
            int price = 0;
            try {
                DiskFileItemFactory factory = new DiskFileItemFactory();
                ServletContext servletContext = this.getServletConfig().getServletContext();
                File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
                factory.setRepository(repository);
                ServletFileUpload upload = new ServletFileUpload(factory);
                List<FileItem> items = upload.parseRequest(request);
                Iterator<FileItem> iter = items.iterator();
                HashMap<String, String> fields = new HashMap<>();
                int count = 0;
                while (iter.hasNext()) {
                    FileItem item = iter.next();
                    if (item.isFormField()) {
                        String value = item.getString();
                        switch (count) {
                            case 0:
                                rank = value;
                                break;
                            case 1:
                                desciption = value;
                                break;
                            case 2:
                                price = Integer.parseInt(value);
                                break;
                            default:
                                break;
                        }
                        fields.put(item.getName(), item.getString());
                        count++;
                    } else {
                        String filename = item.getName();
                        if (filename == null || filename.equals("")) {
                            break;
                        } else {
                            String storePath = servletContext.getRealPath("/uploads");
                            File uploadFile = new File(storePath + "/" + "Account" + id + ".png");
                            imageLink = "uploads/" + "Account" + id + ".png";
                            try {
                                item.write(uploadFile);
                            } catch (Exception ex) {
                                Logger.getLogger(AddAccountController.class.getName()).log(Level.SEVERE, null, ex);
                            }
                        }
                    }
                }
            } catch (FileUploadException ex) {
                Logger.getLogger(AddAccountController.class.getName()).log(Level.SEVERE, null, ex);
            }
            String name = "Account " + id;
            acc.addAccount(imageLink, name, rank, desciption, price);
            url = SUCCESS;
        } catch (NumberFormatException e) {
            log("Error at AddAccount controller: " + e.toString());
        } finally {
            AccountDAO accountDAO = new AccountDAO();
            ArrayList<AccountDTO> listAccount = accountDAO.getAll();
            request.setAttribute("listAccount", listAccount);
            request.getRequestDispatcher(url).forward(request, response);
        }
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
