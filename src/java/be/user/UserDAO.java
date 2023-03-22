package be.user;

import be.utils.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UserDAO extends DBContext {

    private static final String DELETE_USER = "DELETE Person WHERE id=?";
    private static final String UPDATE_USER = "UPDATE Person SET name=?, phone=?, role=? WHERE id=?";
    private static final String GET_LIST_USER
            = "SELECT id, username, password, name, phone, role FROM Person WHERE username like ?";
    private static final String INSERT_USER
            = "INSERT INTO Person(username, password, name, phone, role) values (?, ?, ?, ?, ?)";
    private static final String CHECK_USER
            = "SELECT id FROM Person WHERE username = ?";
    private static final String GET_USER
            = "SELECT id, username, password, name, phone, role FROM Person WHERE username = ? AND password = ?";
    private static final String GET_USER_GOOGLE
            = "SELECT id, username, password, name, phone, role FROM Person WHERE username = ? AND password = ?";

    public void signup(UserDTO person) {
        try {
            PreparedStatement ps = connection.prepareStatement(INSERT_USER);
            ps.setString(1, person.getUsername());
            ps.setString(2, person.getPassword());
            ps.setString(3, person.getName());
            ps.setString(4, person.getPhone());
            ps.setInt(5, 0);
            ps.execute();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean checkUsername(String username) {
        try {
            PreparedStatement ps = connection.prepareStatement(CHECK_USER);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return false;
            }
            rs.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return true;
    }

    public UserDTO signin(String username, String password) {
        try {
            PreparedStatement ps = connection.prepareStatement(GET_USER);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                UserDTO p = new UserDTO(rs.getString("username"), rs.getString("password"), rs.getString("name"), rs.getString("phone"), rs.getInt("role"), rs.getInt("id"));
                return p;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public UserDTO loginGoogle(String username, String password) {
        try {
            PreparedStatement ps = connection.prepareStatement(GET_USER_GOOGLE);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                UserDTO u = new UserDTO(rs.getString("username"), rs.getString("password"), rs.getString("name"), rs.getString("phone"), rs.getInt("role"), rs.getInt("id"));
                return u;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<UserDTO> getListUser(String search) {
        ArrayList<UserDTO> listUser = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(GET_LIST_USER);
            ps.setString(1, "%" + search + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                UserDTO p = new UserDTO(rs.getString("username"), "*****", rs.getString("name"), rs.getString("phone"), rs.getInt("role"), rs.getInt("id"));
                listUser.add(p);
            }
            return listUser;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean updateUser(UserDTO updateUser) {
        boolean checkUpdate = false;
        try {
            PreparedStatement ps = connection.prepareStatement(UPDATE_USER);
            ps.setString(1, updateUser.getName());
            ps.setString(2, updateUser.getPhone());
            ps.setInt(3, updateUser.getRole());
            ps.setInt(4, updateUser.getId());
            checkUpdate = ps.executeUpdate() > 0;
        } catch (SQLException e) {
        }
        return checkUpdate;
    }

    public boolean deleteUser(int userID) {
        boolean checkDelete = false;
        try {
            PreparedStatement ps = connection.prepareStatement(DELETE_USER);
            ps.setInt(1, userID);
            checkDelete = ps.executeUpdate() > 0;
        } catch (SQLException e) {
        }
        return checkDelete;
    }
}
