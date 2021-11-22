/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import model.Cart;
import model.Item;
import model.Account;
import model.Order;

/**
 *
 * @author Admin
 */
public class OrderDAO extends DBContext {
    
    public void addOrder(Order order, Cart cart) {
        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();
        try {
            //add vào bảng Order
            String sql = "insert into cart values(?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, order.getUserName());
            st.setString(3, date);
            st.setDouble(2, order.getTotalMoney());
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
        try {
            //lấy ra id của Order vừa add
            String sql1 = "select top 1 Id from cart order by Id desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();

            //add vào bảng orderdetail
            if (rs.next()) {
                int oid = rs.getInt(1);
                for (Item i : cart.getItems()) {
                    String sql2 = "insert into OrderDetails values(?,?,?,?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);

                    st2.setString(2, i.getProduct().getId());
                    st2.setInt(1, oid);
                    st2.setInt(3, i.getQuantity());
                    st2.setDouble(4, i.getPrice());
                    st2.executeUpdate();
                }
            }

        } catch (SQLException e) {
            System.out.println("Them vao detail nhung o ngoai");
        }

        //update so luong trong bang Product sau khi ban
        String sql3 = "update Product set quantity = quantity - ? "
                + "where id = ?";
        for (Item i : cart.getItems()) {
            try {
                PreparedStatement st3 = connection.prepareStatement(sql3);

                st3.setInt(1, i.getQuantity());
                st3.setString(2, i.getProduct().getId());
                st3.executeUpdate();
            } catch (SQLException e) {
                System.out.println("update storage");
            }

        }

    }
}
