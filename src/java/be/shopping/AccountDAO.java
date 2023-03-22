package be.shopping;

import be.utils.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AccountDAO extends DBContext {

private static final String GET_TOP_ACCOUNT
            = "SELECT id, imageLink, accountName, rank, description, price from Account "
        + "WHERE price IN(SELECT TOP 3 price FROM Account ORDER BY price DESC)";
    private static final String GET_LIST_ACCOUNT
            = "SELECT id, imageLink, accountName, rank, description, price FROM Account";
    private static final String UPDATE_ACCOUNT
            = "UPDATE Account SET rank = ?, description = ?, price = ? WHERE id = ?";
    private static final String DELETE_ACCOUNT
            = "DELETE FROM Account WHERE id = ?";
    private static final String GET_MAX_ID
            = "SELECT max(id) as id FROM Account";
    private static final String GET_ACCOUNT
            = "SELECT id, imageLink, accountName, rank, description, price FROM Account WHERE id = ?";
    private static final String INSERT_ACCOUNT
            = "INSERT INTO Account (imageLink, accountName, rank, description, price) VALUES (?, ?, ?, ?, ?)";

    public int getMaxID() {
        try {
            PreparedStatement ps = connection.prepareStatement(GET_MAX_ID);
            ResultSet rs = ps.executeQuery();
            rs.next();
            int id = rs.getInt("id") + 1;
            return id;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public AccountDTO findByID(int id) {
        try {
            PreparedStatement ps = connection.prepareStatement(GET_ACCOUNT);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                AccountDTO acc = new AccountDTO(rs.getInt("id"), rs.getString("imageLink"), rs.getString("accountName"), rs.getString("rank"), rs.getString("description"), rs.getInt("price"));
                return acc;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void addAccount(String imageLink, String accountName, String rank, String description, int price) {
        try {
            PreparedStatement ps = connection.prepareStatement(INSERT_ACCOUNT);
            ps.setString(1, imageLink);
            ps.setString(2, accountName);
            ps.setString(3, rank);
            ps.setString(4, description);
            ps.setInt(5, price);
            ps.execute();
            ps.close();

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<AccountDTO> getAll() {
        try {
            ArrayList<AccountDTO> list = new ArrayList<>();
            PreparedStatement ps = connection.prepareStatement(GET_LIST_ACCOUNT);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                AccountDTO acc = new AccountDTO(rs.getInt("id"), rs.getString("imageLink"), rs.getString("accountName"), rs.getString("rank"), rs.getString("description"), rs.getInt("price"));
                list.add(acc);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public ArrayList<AccountDTO> getTopAccount() {
        try {
            ArrayList<AccountDTO> list = new ArrayList<>();
            PreparedStatement ps = connection.prepareStatement(GET_TOP_ACCOUNT);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                AccountDTO acc = new AccountDTO(rs.getInt("id"), rs.getString("imageLink"), rs.getString("accountName"), rs.getString("rank"), rs.getString("description"), rs.getInt("price"));
                list.add(acc);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updateAccount(int id, String rank, String description, int price) {
        try {
            PreparedStatement ps = connection.prepareStatement(UPDATE_ACCOUNT);
            ps.setString(1, rank);
            ps.setString(2, description);
            ps.setInt(3, price);
            ps.setInt(4, id);
            ps.execute();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteAccount(int id) {
        try {
            PreparedStatement ps = connection.prepareStatement(DELETE_ACCOUNT);
            ps.setInt(1, id);
            ps.execute();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean findExistAccount(int id, ArrayList<AccountDTO> list) {
        boolean check = false;
        for (AccountDTO acc : list) {
            if (acc.getId() == id) {
                check = true;
            }
        }
        return check;
    }

    public ArrayList<AccountDTO> removeAccount(String name, ArrayList<AccountDTO> list) {
        ArrayList<AccountDTO> listAccount = list;
        for (int i = 0; i < listAccount.size(); i++) {
            if (listAccount.get(i).getAccountName().equals(name)) {
                listAccount.remove(listAccount.get(i));
            }
        }
        return listAccount;
    }
    public int totalPrice(ArrayList<AccountDTO> list) {
        int total =0;
        total = list.stream().map((acc) -> acc.getPrice()).reduce(total, Integer::sum);
        return total;
    }

}
