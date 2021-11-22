/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import model.Account;
import org.junit.After;
import org.junit.AfterClass;
import static org.junit.Assert.assertEquals;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

/**
 *
 * @author bekim
 */
public class AccountDAOTest {
    
    public AccountDAOTest() {
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

    public boolean equals(Object o){
        return (getClass() == o.getClass());           
    }
    @Test
    public void testCheckAcount1() {
        System.out.println("checkAcount");
        String user = "bbb";
        String pass = "1234";
        AccountDAO instance = new AccountDAO();
        Account expResult = new Account(user, pass, "user");
        Account result = instance.checkAcount(user, pass);
        //expResult.equals(result);
        assertEquals(expResult.toString(), result.toString());
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }
    
    @Test
    public void testCheckAcount2() {
        System.out.println("checkAcount");
        String user = "aaaaaaa";
        String pass = "sakjdh";
        AccountDAO instance = new AccountDAO();
        Account expResult = null;
        Account result = instance.checkAcount(user, pass);
        //expResult.equals(result);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }
    
    @Test
    public void testCheckAcount3() {
        System.out.println("checkAcount");
        String user = null;
        String pass = null;
        AccountDAO instance = new AccountDAO();
        Account expResult = null;
        Account result = instance.checkAcount(user, pass);
        //expResult.equals(result);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of create method, of class AccountDAO.
     */

    @Test
    public void testCreate1() {
        System.out.println("create");
        Account a = new Account("aaassss", "123", "Cuongcuong", "bekim17@gmail.com", "abc", "abc","user","BigC");
        AccountDAO instance = new AccountDAO();
        int expResult = 0;
        int result = instance.create(a);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }
    
    @Test
    public void testCreate2() {
        System.out.println("create");
        Account a = new Account("đật", "123", "Cuongcuong", "bekim17@gmail.com", "2001-14-11", "ccc","user","BigC");
        AccountDAO instance = new AccountDAO();
        int expResult = 1;
        int result = instance.create(a);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of checkExist method, of class AccountDAO.
     */
    @Test
    public void testCheckExist1() {
        System.out.println("checkExist");
        String username = "bbb";
        AccountDAO instance = new AccountDAO();
        Account expResult = new Account(username);
        Account result = instance.checkExist(username);
        //expResult.equals(result);
        assertEquals(expResult.toString(), result.toString());
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }
    
    @Test
    public void testCheckExist2() {
        System.out.println("checkExist");
        String username = "aaaaaaaa";
        AccountDAO instance = new AccountDAO();
        Account expResult = null;
        Account result = instance.checkExist(username);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }
    
    @Test
    public void testCheckExist3() {
        System.out.println("checkExist");
        String username = null;
        AccountDAO instance = new AccountDAO();
        Account expResult = null;
        Account result = instance.checkExist(username);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of getAccount method, of class AccountDAO.
     */
    @Test
    public void testGetAccount1() {
        System.out.println("getAccount");
        String user = null;
        AccountDAO instance = new AccountDAO();
        Account expResult = null;
        Account result = instance.getAccount(user);
        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
    }    
    
       @Test
    public void testGetAccount2() {
        System.out.println("getAccount");
        String user = "bbb";
        String pass = "1234";
        String fullname = "đạt idol";
        String email = "bekimcuong17@gmail.com";
        String dob = "2009-06-02";
        String phone = "1982379827";
        String isAdmin = "user";
        String address = "sông Tô Lịch";
        AccountDAO instance = new AccountDAO();
        Account expResult = new Account(user, pass, fullname, email, dob, phone, isAdmin, address);
        Account result = instance.getAccount(user);
        assertEquals(expResult.toString(), result.toString());
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
    }    
}
