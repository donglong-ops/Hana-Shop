/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vanlt.booking;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import vanlt.conn.MyConnection;

/**
 *
 * @author AVITA
 */
public class BookingDAO implements Serializable {

    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;

    public BookingDAO() {
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

    public int insertBookingFood(BookingDTO dto) throws SQLException, NamingException {
        int id = -1;
        try {
            String sql = "INSERT INTO [dbo].[Booking](UserId , ImportedDate, Total) "
                    + "  OUTPUT Inserted.Id "
                    + "  VALUES(?, ?, ?)";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);

            preStm.setInt(1, dto.getUserId());
            preStm.setTimestamp(2, new Timestamp(System.currentTimeMillis()));
            preStm.setFloat(3, dto.getTotal());
            rs = preStm.executeQuery();
            if (rs.next()) {
                id = rs.getInt("Id");
            }
        } finally {
            closeConnection();
        }
        return id;
    }

    public List<BookingDTO> allBookingUser(int userID) throws SQLException, NamingException {
        ArrayList<BookingDTO> list = new ArrayList<>();
        try {
            String sql = " select b.Id as MaDonHang, b.ImportedDate , b.Total  "
                        + " from Booking b  "
                        + " where b.UserId = ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);

            preStm.setInt(1, userID);
            rs = preStm.executeQuery();
            while (rs.next()) {
                int bookingID = rs.getInt("MaDonHang");
                Timestamp importDate = rs.getTimestamp("ImportedDate");
                float total = rs.getFloat("Total");
                
                list.add(new BookingDTO(bookingID, userID, importDate, total));
            }
        } finally {
            closeConnection();
        }
        return list;
    }

}