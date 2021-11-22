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
public class Product implements Serializable{
    private String image,price,title,description,id;
    private Category cid; //:) jsp lay tu day
    private int cateid,quantity;

    public Product(String id, String image, String price, String title, String description, int quantity) {
        this.id = id;
        this.image = image;
        this.price = price;
        this.title = title;
        this.description = description;
        this.quantity = quantity;
    }

    public Product(String id, String image, String price, String title, String description, int quantity, Category cid) {
        this.id = id;
        this.image = image;
        this.price = price;
        this.title = title;
        this.description = description;
        this.quantity = quantity;
        this.cid = cid;
    }

    public Product() {
    }

    public Product(String id, String image, String price, int quantity, String title, String description, int cateid) {
        this.id = id;
        this.image = image;
        this.price = price;
        this.quantity = quantity;
        this.title = title;
        this.description = description;        
        this.cateid = cateid;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Category getCid() {
        return cid;
    }

    public void setCid(Category cid) {
        this.cid = cid;
    }

    public int getCateid() {
        return cateid;
    }

    public void setCateid(int cateid) {
        this.cateid = cateid;
    }

    @Override
    public String toString() {
        return "Product{" + "image=" + image + ", price=" + price + ", title=" + title + ", description=" + description + ", quantity=" + quantity + ", id=" + id + ", cid=" + cid + ", cateid=" + cateid + '}';
    }

    
}
