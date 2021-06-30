/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vanlt.daos;

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
import vanlt.dtos.FoodDto;

/**
 *
 * @author AVITA
 */
public class FoodDAO implements Serializable {

    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;

    public FoodDAO() {
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

    public String getCategoryName(int cate_id) throws SQLException, NamingException {
        String cateName = null;
        try {
            String sql = "select c.Name from Category c where c.Id = ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, cate_id);
            rs = preStm.executeQuery();
            while (rs.next()) {
                cateName = rs.getString("Name");
            }
        } finally {
            closeConnection();
        }
        return cateName;

    }

    public int countTotalFood(String foodname, int categoriID, float toPrice, float fromPrice) throws SQLException, NamingException {
        int count = 2;
        int countPage = 0;
        try {
            String sql = "SELECT COUNT(foodId) as totalRows from Food F "
                    + "   WHERE F.statusId = 1 and F.quantity > ? "
                    + " And F.quantity > (SELECT Count(B.Amount) AS Amount "
                    + " From BookingDetail B "
                    + " Where B.FoodId = F.foodId) ";
            if (foodname != null) {
                sql += "And F.foodname like ? ";
            }
            if (categoriID > 0) {
                sql += "And F.categoriId = ? ";
            }
            if (fromPrice >= 0) {
                sql += "And F.foodPrice >= ?  ";
            }
            if (toPrice > 0 && toPrice >= fromPrice) {
                sql += "And F.foodPrice <= ?";
            }
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, 0);
            if (foodname != null) {
                preStm.setString(count, "%" + foodname + "%");
                count++;
            }
            if (categoriID > 0) {
                preStm.setInt(count, categoriID);
                count++;
            }
            if (fromPrice > 0) {
                preStm.setFloat(count, fromPrice);
                count++;
            }
            if (toPrice > 0 && toPrice >= fromPrice) {
                preStm.setFloat(count, toPrice);
                count++;
            }

            rs = preStm.executeQuery();
            if (rs.next()) {
                countPage = rs.getInt("totalRows");
            }
        } finally {
            closeConnection();
        }
        return countPage;
    }

    public int countTotalFood() throws SQLException, NamingException {
        int countPage = 0;
        try {
            String sql = "SELECT COUNT(foodId) as totalRows from Food F "
                    + "   WHERE F.statusId = 1 "
                    + "   AND F.quantity >  ? "
                    + " And F.quantity > (SELECT Count(B.Amount) AS Amount "
                    + " From BookingDetail B "
                    + " Where B.FoodId = F.foodId) ";

            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, 0);
            rs = preStm.executeQuery();
            if (rs.next()) {
                countPage = rs.getInt("totalRows");
            }
        } finally {
            closeConnection();
        }
        return countPage;
    }

    public List<FoodDto> searchFoodPaging(String foodname, int cate_id, float toPrice, float fromPrice) throws SQLException, NamingException {
        return searchFoodPaging(foodname, cate_id, toPrice, fromPrice, 1);
    }

    public List<FoodDto> searchFoodPaging(String foodname, int categoriID, float toPrice, float fromPrice, int pageNumber) throws SQLException, NamingException {
        List<FoodDto> result = new ArrayList<>();
        int pageSize = 5;
        int count = 2;
        try {
            String sql = "SELECT F.foodId, F.foodname , F.foodPrice , F.quantity, F.description, F.createDate , F.categoriId , F.imageLink "
                    + "    From Food F "
                    + "    WHERE F.statusId = 1 "
                    + "    AND F.quantity >  ? "
                    + " And F.quantity > (SELECT Count(B.Amount) AS Amount "
                    + " From BookingDetail B "
                    + " Where B.FoodId = F.foodId) ";
            if (foodname != null) {
                sql += "And F.foodname like ? ";
            }
            if (categoriID > 0) {
                sql += "And F.categoriId = ? ";
            }

            if (fromPrice >= 0) {
                sql += "And F.foodPrice >= ? ";
            }
            if (toPrice > 0 && toPrice >= fromPrice) {
                sql += "And F.foodPrice <= ? ";
            }
            sql += "ORDER BY foodId "
                    + "OFFSET ? ROWS "
                    + "FETCH NEXT ? ROWS ONLY";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, 0);

            if (foodname != null) {
                preStm.setString(count, "%" + foodname + "%");
                count++;
            }
            if (categoriID > 0) {
                preStm.setInt(count, categoriID);
                count++;
            }
            if (fromPrice > 0) {
                preStm.setFloat(count, fromPrice);
                count++;
            }
            if (toPrice > 0 && toPrice >= fromPrice) {
                preStm.setFloat(count, toPrice);
                count++;
            }
            preStm.setInt(count, pageSize * (pageNumber - 1));
            preStm.setInt(count + 1, pageSize);
            rs = preStm.executeQuery();
            while (rs.next()) {
                int foodId = rs.getInt("foodId");
                String foodName = rs.getString("foodname");
                float foodPrice = rs.getFloat("foodPrice");
                int quantity = rs.getInt("quantity");
                String des = rs.getString("description");
                Date createDate = rs.getDate("createDate");
                int cate_id = rs.getInt("categoriId");
                String imageLink = rs.getString("imageLink");

                FoodDto dto = new FoodDto(foodId, foodName, foodPrice, quantity, cate_id, createDate, des, imageLink);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<FoodDto> foodPaging(int pageNumber) throws SQLException, NamingException {
        List<FoodDto> result = new ArrayList<>();
        int pageSize = 5;
        try {
            String sql = "SELECT F.foodId, F.foodname , F.foodPrice , F.quantity, F.description, F.createDate , F.categoriId , F.imageLink\n"
                    + "    From Food F "
                    + "    WHERE F.statusId = 1 "
                    + "    AND F.quantity >  ? "
                    + " And F.quantity > (SELECT Count(B.Amount) AS Amount "
                    + " From BookingDetail B "
                    + " Where B.FoodId = F.foodId) "
                    + " ORDER BY foodId "
                    + " OFFSET ? ROWS "
                    + " FETCH NEXT ? ROWS ONLY";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, 0);
            preStm.setInt(2, pageSize * (pageNumber - 1));
            preStm.setInt(3, pageSize);
            rs = preStm.executeQuery();
            while (rs.next()) {
                int foodId = rs.getInt("foodId");
                String foodName = rs.getString("foodname");
                float foodPrice = rs.getFloat("foodPrice");
                int quantity = rs.getInt("quantity");
                String des = rs.getString("description");
                Date createDate = rs.getDate("createDate");
                int cate_id = rs.getInt("categoriId");
                String imageLink = rs.getString("imageLink");

                FoodDto dto = new FoodDto(foodId, foodName, foodPrice, quantity, cate_id, createDate, des, imageLink);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public FoodDto getFoodByID(int foodID) throws SQLException, NamingException {
        FoodDto result = null;
        try {
            String sql = "  SELECT F.foodId, F.foodname , F.foodPrice , F.quantity, F.description, F.createDate , F.categoriId , F.imageLink "
                    + "   From Food F  "
                    + "   WHERE F.statusId = 1 and f.foodId =  ? ";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, foodID);
            rs = preStm.executeQuery();
            if (rs.next()) {
                int foodId = rs.getInt("foodId");
                String foodName = rs.getString("foodname");
                float foodPrice = rs.getFloat("foodPrice");
                int quantity = rs.getInt("quantity");
                String des = rs.getString("description");
                Date createDate = rs.getDate("createDate");
                int cate_id = rs.getInt("categoriId");
                String imageLink = rs.getString("imageLink");

                result = new FoodDto(foodId, foodName, foodPrice, quantity, cate_id, createDate, des, imageLink);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public int getFoodQuantity(int foodID) throws SQLException, NamingException {
        int res = 0;
        try {
            String sql = "SELECT quantity FROM Food Where foodId = ? ";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, foodID);
            rs = preStm.executeQuery();
            if (rs.next()) {
                res = rs.getInt("quantity");
            }
        } finally {
            closeConnection();
        }
        return res;
    }

    public boolean insertFood(FoodDto dto) throws SQLException, NamingException {
        boolean result = false;
        Timestamp currentDate = new Timestamp(System.currentTimeMillis());
        try {
            String sql = " INSERT INTO Food (foodname, foodPrice, quantity, categoriId, description, createDate, imageLink ,statusId) "
                    + " VALUES(?, ?, ?, ?, ?, ?, ?, ?) ;";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getFoodname());
            preStm.setFloat(2, dto.getFoodprice());
            preStm.setInt(3, dto.getQuantity());
            preStm.setInt(4, dto.getCategoriID());
            preStm.setString(5, dto.getDescription());
            preStm.setTimestamp(6, currentDate);
            preStm.setString(7, dto.getImageLink());
            preStm.setInt(8, 1);
            result = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean deleteFood(int foodId, int userID) throws SQLException, NamingException {
        Timestamp currentDate = new Timestamp(System.currentTimeMillis());
        boolean result = false;
        try {
            String sql = " UPDATE Food SET statusId = 2 , updateDate = ? , userId= ?  WHERE foodId = ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setTimestamp(1, currentDate);
            preStm.setInt(2, userID);
            preStm.setInt(3, foodId);
            result = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean updateFood(FoodDto dto) throws SQLException, NamingException {
        boolean result = false;
        Timestamp currentDate = new Timestamp(System.currentTimeMillis());
        try {
            String sql = "UPDATE Food SET foodname = ? , foodPrice = ? , quantity = ? , "
                    + " description = ? , imageLink = ? , categoriId = ? , updateDate = ?, userId = ? "
                    + " WHERE foodId = ? ";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getFoodname());
            preStm.setFloat(2, dto.getFoodprice());
            preStm.setInt(3, dto.getQuantity());
            preStm.setString(4, dto.getDescription());
            preStm.setString(5, dto.getImageLink());
            preStm.setInt(6, dto.getCategoriID());
            preStm.setTimestamp(7, currentDate);
            preStm.setInt(8, dto.getUserId());
            preStm.setInt(9, dto.getFoodId());
            result = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }
}
