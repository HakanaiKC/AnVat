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
import model.Product;

/**
 *
 * @author Admin
 */
public class ItemDAO extends DBContext {

    public Cart getItem(String user) {
        Cart item = new Cart(user);
        String sql = "SELECT * FROM dbo.product p INNER JOIN dbo.cartdetail ct ON p.ID = ct.ProductId where userName = ?";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();
            
            while (rs.next()) {
                Product p = new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7));
                int quantity = rs.getInt(11);
                Double price = Double.parseDouble(p.getPrice());
                Item t = new Item(p, quantity, price);
                item.addItem(t);
            }
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return item;
    }

    public void updateCart(Cart item) {
        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();
        String sql1 = "DELETE FROM dbo.cartdetail WHERE userName = ?";
        try {
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setString(1, item.getUser());
            System.out.println(item.getUser());
            st1.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        for (int i = 0; i < item.getItems().size(); i++) {
            String sql2 = "SET NOCOUNT ON INSERT INTO dbo.cartdetail VALUES (?,?,?,?,?,?)";
            Item t = item.getItems().get(i);
         
            try {
                PreparedStatement st2 = connection.prepareStatement(sql2);
                st2.setString(1, t.getProduct().getImage());
                st2.setString(2, item.getUser());
                st2.setString(3, t.getProduct().getId());

                st2.setInt(4, t.getQuantity());
                st2.setDouble(5, t.getPrice());
                st2.setDouble(6, t.getPrice() * t.getQuantity());
                st2.executeUpdate();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
    }

}
