/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.orderDetails;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import sample.utils.DBUtils;

/**
 *
 * @author Admin
 */
public class OrderDetailDAO {

    private static final String INSERT_ORDER_DETAIL = "INSERT INTO tblOrderDetail(price, quantity, orderID, productID, status) VALUES(?, ?, ?, ?, 1)";

    public boolean insertOrderDetail(OrderDetailDTO orderDetail) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT_ORDER_DETAIL);
                ptm.setDouble(1, orderDetail.getPrice());
                ptm.setInt(2, orderDetail.getQuantity());
                ptm.setInt(3, orderDetail.getOrderID());
                ptm.setInt(4, orderDetail.getProductID());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

}
