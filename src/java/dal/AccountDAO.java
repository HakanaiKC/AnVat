package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Account;

public class AccountDAO extends DBContext {

    //check tai khoan 
    public Account checkAcount(String user, String pass) {
        String sql = "select [user],pass,isAdmin from Account where [user]=? and pass=?";
        try {
            
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            
            if (rs.next()) {
                Account a = new Account();
                a.setUser(rs.getString("user"));
                a.setPass(rs.getString("pass"));
                a.setIsAdmin(rs.getString("isAdmin"));
                return a;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return null;
    }

    public int create(Account a) {
        String sql = "insert into account([user],pass,fullname,email,dob,phone,isAdmin,address) values(?,?,?,?,?,?,?,?)";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getUser());
            st.setString(2, a.getPass());
            st.setString(3, a.getFullname());
            st.setString(4, a.getEmail());
            st.setString(5, a.getDob());
            st.setString(6, a.getPhone());   
            st.setString(7, "user");
            st.setString(8, a.getAddress());
            
            return st.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return 0;
    }
    
    public Account checkExist(String username) {
        String sql = "select [user] from Account where [user]=?";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            
            if (rs.next()) {
                return new Account(username);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }
    
    public Account getAccount(String user) {
        String sql = "select * from account where [user]=?";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();
            
            if (rs.next()) {
                return new Account(rs.getString("user"),
                        rs.getString("pass"),
                        rs.getString("fullname"),
                        rs.getString("email"),
                        rs.getString("dob"),
                        rs.getString("phone"),
                        rs.getString("isAdmin"),
                        rs.getString("address")); 
                        
            }
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return null;
    }
}
