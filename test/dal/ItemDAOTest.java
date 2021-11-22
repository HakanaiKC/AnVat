/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.Item;
import model.Product;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author bekim
 */
public class ItemDAOTest {
    
    public ItemDAOTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of getItem method, of class ItemDAO.
     */
    @Test
    public void testGetItem1() {
        System.out.println("getItem");
        String user = "bbb";
        Product p = new Product("1","img.png","3000",30,"aaa"," ",1);
        Item i = new Item(p, 1, 3000);
        ItemDAO instance = new ItemDAO();
        Cart expResult = new Cart(user);
        expResult.addItem(i);
        Cart result = instance.getItem(user);
        assertEquals(expResult.toString(), result.toString());
        // TODO review the generated test code and remove the default call to fail.
    }
    
    @Test
    public void testGetItem2() {
        System.out.println("getItem");
        String user = "ccc";
        Cart expResult = new Cart(user);
        ItemDAO instance = new ItemDAO();
        Cart result = instance.getItem(user);
        assertEquals(expResult.toString(), result.toString());
        // TODO review the generated test code and remove the default call to fail.
    }
    
    @Test
    public void testGetItem3() {
        System.out.println("getItem");
        String user = " ";
        ItemDAO instance = new ItemDAO();
        Cart expResult = new Cart(user);
        Cart result = instance.getItem(user);
        assertEquals(expResult.toString(), result.toString());
        // TODO review the generated test code and remove the default call to fail.
    }
}
