package be.order;

import be.shopping.AccountDTO;
import be.utils.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class OrderDAO extends DBContext {

    private static final String GET_ORDER_DETAIL
            = "SELECT o.name, o.email, o.phone, o.urlFB, o.note, d.OrderID, a.accountName, a.id FROM OrderDetail AS d \n"
            + "JOIN Account AS a ON d.AccountID = a.id JOIN Orders as o ON o.OrderID = d.OrderID";
    private static final String GET_ORDER
            = "SELECT name, email, phone, urlFB, note FROM Orders";
    private static final String INSERT_ORDER
            = "INSERT INTO Orders (name, email, phone, urlFB, note) VALUES (?, ?, ?, ?, ?)";
    private static final String INSERT_ORDER_DETAIL
            = "INSERT INTO OrderDetail (OrderID, AccountID) VALUES (?, ?)";
    private static final String GET_ORDER_ID
            = "SELECT max(OrderID) as id FROM Orders";
    private static final String DELETE_ORDER_DETAIL
            = "DELETE FROM OrderDetail WHERE OrderID = ? AND AccountID = ?";

    public boolean insertOrder(OrderDTO orderDTO) {
        try {
            PreparedStatement ps = connection.prepareStatement(INSERT_ORDER);
            ps.setString(1, orderDTO.getName());
            ps.setString(2, orderDTO.getEmail());
            ps.setString(3, orderDTO.getPhone());
            ps.setString(4, orderDTO.getUrlFB());
            ps.setString(5, orderDTO.getNote());
            ps.execute();
            ps.close();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public int getOrderID() {
        try {
            PreparedStatement ps = connection.prepareStatement(GET_ORDER_ID);
            ResultSet rs = ps.executeQuery();
            rs.next();
            int id = rs.getInt("id");
            return id;
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public boolean insertOrderDetail(int orderID, ArrayList<AccountDTO> listAccount) {
        try {
            for (AccountDTO acc : listAccount) {
                PreparedStatement ps = connection.prepareStatement(INSERT_ORDER_DETAIL);
                ps.setInt(1, orderID);
                ps.setInt(2, acc.getId());
                ps.execute();
            }

            return true;
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean deleteOrder(int orderID, int accountID) {
        try {
            PreparedStatement ps = connection.prepareStatement(DELETE_ORDER_DETAIL);
            ps.setInt(1, orderID);
            ps.setInt(2, accountID);
            ps.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public ArrayList<OrderDTO> getOrder() {
        ArrayList<OrderDTO> listOrder = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(GET_ORDER);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDTO orderDTO = new OrderDTO(
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getString("urlFB"),
                        rs.getString("note"));
                listOrder.add(orderDTO);
            }
            ps.close();
            rs.close();
            return listOrder;
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<OrderDetailDTO> getOrderDetail() {
        ArrayList<OrderDetailDTO> orderDetails = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(GET_ORDER_DETAIL);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetailDTO orderDetail = new OrderDetailDTO(
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getString("urlFB"),
                        rs.getString("note"),
                        rs.getString("accountName"),
                        rs.getInt("OrderID"),
                        rs.getInt("id")
                );
                orderDetails.add(orderDetail);
            }
            ps.close();
            rs.close();
            return orderDetails;
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
