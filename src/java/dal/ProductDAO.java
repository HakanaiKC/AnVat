/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author Admin
 */
public class ProductDAO extends DBContext {

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product";
        
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("id"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getString("price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setTitle(rs.getString("title"));
                p.setDescription(rs.getString("description"));
                p.setCateid(rs.getInt("cateid"));
                list.add(p);
            }
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return list;
    }

    public List<Product> getProductByPage(List<Product> list, int start, int end) {
        List<Product> t = new ArrayList<>();
        for (int i = start; i < end; i++) {
            t.add(list.get(i));
        }
        return t;
    }

    public List<Product> search(String title) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product where title like N'%" + title + "%'";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("id"));
                p.setTitle(rs.getString("title"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getString("price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setDescription(rs.getString("description"));
                list.add(p);
            }
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return list;
    }

    public Product getProductByID(String id) {
        String sql = "select * from Product where id=?";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            
            if (rs.next()) {
                return new Product(rs.getString("id"),
                        rs.getString("image"),
                        rs.getString("price"),
                        rs.getInt("quantity"),
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getInt("cateid"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return null;
    }

    public List<Product> searchCate(int cid) {
        List<Product> list = new ArrayList<>();
        String sql = "select id,[image],price,title,[description],quantity from product\n"
                + "full outer join Category on product.cateID=Category.cid\n"
                + "where cateID=?";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("id"));
                p.setTitle(rs.getNString("title"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getString("price"));                
                p.setDescription(rs.getNString("description"));
                p.setQuantity(rs.getInt("quantity"));
                list.add(p);
            }
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return list;
    }

    public int delete(String id) {
        String sql = "delete from product where id=?";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            return st.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return 0;
    }

    public int update(Product s) {
        String sql = "update product set image=?,price=?,quantity=?,title=?,description=?,cateID=? where id=?";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, s.getImage());
            st.setString(2, s.getPrice());
            st.setInt(3, s.getQuantity());
            st.setNString(4, s.getTitle());
            st.setNString(5, s.getDescription());
            st.setInt(6, s.getCateid());
            st.setString(7, s.getId());
            return st.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return 0;
    }
    
    public static void main(String[] args) {
        ProductDAO dao=new ProductDAO();
        Product s = new Product("1", "img.png", "3000", 30, "aaa", "something something", 1);
        System.out.println(dao.update(s));
    }

    public int insert(Product s) {
        String sql = "SET NOCOUNT ON insert into product values(?,?,?,?,?,?,?)";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, s.getId());
            st.setString(2, s.getImage());
            st.setString(3, s.getPrice());
            st.setInt(4, s.getQuantity());
            st.setNString(5, s.getTitle());
            st.setNString(6, s.getDescription());
            st.setInt(7, s.getCateid());
            return st.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return 0;
    }

    public Product exsited(String id) {
        String sql = "select * from Product where id=?";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            
            if (rs.next()) {
                Product s = new Product();
                s.setId(rs.getString("id"));
                s.setTitle(rs.getString("title"));
                s.setImage(rs.getString("image"));
                s.setPrice(rs.getString("price"));
                s.setQuantity(rs.getInt("quantity"));
                s.setDescription(rs.getString("description"));
                s.setCateid(rs.getInt("cateid"));
                return s;
            }
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return null;
    }

    public List<Product> getCateProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select p.[image],p.price,p.quantity,p.title,p.[description],c.cid,c.cname from product p\n"
                + "inner join Category c on p.cateID=c.cid";
        
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("id"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getString("price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setTitle(rs.getNString("title"));
                p.setDescription(rs.getNString("description"));
                Category c = new Category(rs.getInt("cid"), rs.getNString("cname"));
                p.setCid(c);
                list.add(p);
            }
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return list;
    }

    public List<Product> getProductTop() {
        List<Product> list = new ArrayList<>();
        String sql = "select top 4 * from product order by quantity desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("id"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getString("price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setTitle(rs.getString("title"));
                p.setDescription(rs.getString("description"));
                p.setCateid(rs.getInt("cateid"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }
}
