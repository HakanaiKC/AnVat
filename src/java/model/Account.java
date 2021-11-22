/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class Account implements Serializable{
    private String user,pass,fullname,email,dob,phone,isAdmin,address;

    public Account(String user, String pass,String isAdmin) {
        this.user = user;
        this.pass = pass;
        this.isAdmin= isAdmin;
    }
    
    public Account() {
    }

    public Account(String user) {
        this.user = user;
    }
    
    public Account(String user, String pass, String fullname, String email, String dob, String phone,String isAdmin,String address) {
        this.user = user;
        this.pass = pass;
        this.fullname = fullname;
        this.email = email;
        this.dob = dob;
        this.phone = phone;
        this.isAdmin = isAdmin;
        this.address = address;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(String isAdmin) {
        this.isAdmin = isAdmin;
    } 
    
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "Account{" + "user=" + user + ", pass=" + pass + ", fullname=" + fullname + ", email=" + email + ", dob=" + dob + ", phone=" + phone + ", isAdmin=" + isAdmin + ", address=" + address + '}';
    }
}
