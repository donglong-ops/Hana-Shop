/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vanlt.daos;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import vanlt.conn.MyConnection;
import vanlt.dtos.RoleDTO;
import vanlt.dtos.RegistrationDTO;
import vanlt.dtos.StatusDTO;

/**
 *
 * @author AVITA
 */
public class RegistrationDAO implements Serializable {

    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;

    public RegistrationDAO() {
    }

    public void closeConnection() throws SQLException {
        if (rs != null) {
            rs.close();
        }
        if (preStm != null) {
            preStm.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
    
    public RegistrationDTO checkLogin(String email, String password) throws SQLException, NamingException {
        RegistrationDTO result = null;
        try {
            String SQL = "SELECT Re.ID , Email ,Password,Fullname,R.ID  AS RoleID, R.Name AS RoleName "
                    + " FROM Registration  Re JOIN Role R ON Re.RoleID  = R.ID "
                    + " WHERE Email = ? And Password = ? ";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(SQL);
            preStm.setString(1, email);
            preStm.setString(2, password);
            rs = preStm.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("ID");
                String fullname = rs.getString("Fullname");
                int roleID = rs.getInt("RoleID");
                String roleName = rs.getString("RoleName");
                result = new RegistrationDTO(id, email, password, fullname, new RoleDTO(roleID, roleName), new StatusDTO(1));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            closeConnection();
        }
        return result;
    }

    public int insertAccountWithGoogle(String email, String fullname, int roleID, int statusID, String avatar) throws SQLException, NamingException {
        int id = -1;
        try {
            String sql = "INSERT INTO Registration (Email, Fullname, RoleID, StatusID, Avatar) "
                    + " OUTPUT Inserted.ID "
                    + " VALUES (?, ?, ?, ?, ?)";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, email);
            preStm.setString(2, fullname);
            preStm.setInt(3, roleID);
            preStm.setInt(4, statusID);
            preStm.setString(5, avatar);
            rs = preStm.executeQuery();
            if (rs.next()) {
                id = rs.getInt("ID");
            }

        } finally {
            closeConnection();
        }
        return id;
    }

    public RegistrationDTO checkLoginWithGoogle(String emailUser) throws SQLException, NamingException {
        RegistrationDTO result = null;
        try {
            String sql = "SELECT Re.ID , Email ,Password,Fullname,R.ID  AS RoleID, R.Name AS RoleName "
                    + " FROM Registration  Re JOIN Role R ON Re.RoleID  = R.ID "
                    + " WHERE Email = ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, emailUser);
            rs = preStm.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("ID");
                String fullname = rs.getString("Fullname");
                int roleID = rs.getInt("RoleID");
                String roleName = rs.getString("RoleName");
                result = new RegistrationDTO(id, emailUser, "null", fullname, new RoleDTO(roleID, roleName), new StatusDTO(1));
            }
        } finally {
            closeConnection();
        }
        return result;
    }
}
