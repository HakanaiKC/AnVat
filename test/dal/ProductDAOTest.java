/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.Category;
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
public class ProductDAOTest {

    public ProductDAOTest() {
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
     * Test of search method, of class ProductDAO.
     */
    @Test
    public void testSearch1() {
        System.out.println("search");
        String title = "da";
        ProductDAO instance = new ProductDAO();
        List<Product> list = new ArrayList<>();
        List<Product> expResult = new ArrayList<>();
        Product p1 = new Product();
        p1.setId("12");
        p1.setImage("img12.png");
        p1.setPrice("3000.00");
        p1.setTitle("Dango (1 suất/5 cái)");
        p1.setCateid(0);
        p1.setQuantity(1000);
        p1.setDescription("Bánh dango được làm từ bộp nếp, dẻo dẻo như bánh dày, được ăn cùng với nước sốt đường nâu hoặc nước tương ngọt đặc biệt.");
        list.add(p1);

        Product p2 = new Product();
        p2.setId("23");
        p2.setImage("img23.png");
        p2.setPrice("22000.00");
        p2.setTitle("Odaeng (1 suất/5 cái)");
        p2.setCateid(0);
        p2.setQuantity(993);
        p2.setDescription("Odaeng là món ngon có thành phần chính là cá, bột, trứng và được xiên que. Đi dọc trên những dãy phố ăn uống Hàn Quốc, bạn sẽ dễ dàng bắt gặp hình ảnh những quầy hàng với hàng trăm xiên chả cá nóng hổi với nước dùng hải sản bốc khói ngùn ngụt.");
        list.add(p2);

        Product p3 = new Product();
        p3.setId("26");
        p3.setImage("img26.png");
        p3.setPrice("60000.00");
        p3.setTitle("Sundae (1 gói)");
        p3.setCateid(0);
        p3.setQuantity(1000);
        p3.setDescription("Món dồi Sundae được làm bằng cách nhồi hỗn hợp tiết heo, hành, tỏi, thịt heo băm nhỏ, miến vào trong ruột non và ruột già muối, sau đó đem hấp lên để giữ nguyên vị ngon, ngọt của các thành phần. ");
        list.add(p3);

        expResult.addAll(list);
        List<Product> result = instance.search(title);
        assertEquals(expResult.toString(), result.toString());
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }
    
    @Test
    public void testSearch2() {
        System.out.println("search");
        String title = "dango";
        ProductDAO instance = new ProductDAO();
        List<Product> list = new ArrayList<>();
        List<Product> expResult = new ArrayList<>();
        Product p1 = new Product();
        p1.setId("12");
        p1.setImage("img12.png");
        p1.setPrice("3000.00");
        p1.setTitle("Dango (1 suất/5 cái)");
        p1.setCateid(0);
        p1.setQuantity(1000);
        p1.setDescription("Bánh dango được làm từ bộp nếp, dẻo dẻo như bánh dày, được ăn cùng với nước sốt đường nâu hoặc nước tương ngọt đặc biệt.");
        list.add(p1);
        
        expResult.addAll(list);
        List<Product> result = instance.search(title);
        assertEquals(expResult.toString(), result.toString());
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }
    
    @Test
    public void testSearch3() {
        System.out.println("search");
        String title = "mochi";
        ProductDAO instance = new ProductDAO();
        List<Product> expResult = new ArrayList<>();
        List<Product> result = instance.search(title);
        assertEquals(expResult.toString(), result.toString());
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of getProductByID method, of class ProductDAO.
     */
    @Test
    public void testGetProductByID1() {
        System.out.println("getProductByID");
        String id = null;
        ProductDAO instance = new ProductDAO();
        Product expResult = null;
        Product result = instance.getProductByID(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    public void testGetProductByID2() {
        System.out.println("getProductByID");
        String id = "1";
        ProductDAO instance = new ProductDAO();
        Product expResult = new Product("1", "img.png", "3000", 30, "aaa", "something something", 1);
        Product result = instance.getProductByID(id);
        assertEquals(expResult.toString(), result.toString());
        // TODO review the generated test code and remove the default call to fail.
    }

    @Test
    public void testGetProductByID3() {
        System.out.println("getProductByID");
        String id = "0";
        ProductDAO instance = new ProductDAO();
        Product expResult = null;
        Product result = instance.getProductByID(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of searchCate method, of class ProductDAO.
     */
    @Test
    public void testSearchCate1() {
        System.out.println("searchCate");
        int cid = 5;
        ProductDAO instance = new ProductDAO();
        List<Product> expResult = new ArrayList<>();
        List<Product> result = instance.searchCate(cid);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of delete method, of class ProductDAO.
     */
    @Test
    public void testDelete() {
        System.out.println("delete");
        String id = "bbb";
        ProductDAO instance = new ProductDAO();
        int expResult = 0;
        int result = instance.delete(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    @Test
    public void testDelete2() {
        System.out.println("delete");
        String id = "2";
        ProductDAO instance = new ProductDAO();
        int expResult = 0;
        int result = instance.delete(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    @Test
    public void testDelete4() {
        System.out.println("delete");
        String id = "29";
        ProductDAO instance = new ProductDAO();
        int expResult = 1;
        int result = instance.delete(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of update method, of class ProductDAO.
     */
    @Test
    public void testUpdate1() {
        System.out.println("update");
        Product s = new Product("1", "img.png", "8000", 30, "aaa", "something something", 1);
        ProductDAO instance = new ProductDAO();
        int expResult = 1;
        int result = instance.update(s);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    @Test
    public void testUpdate2() {
        System.out.println("update");
        Product s = new Product("", "", "", "", "", 0);
        ProductDAO instance = new ProductDAO();
        int expResult = 0;
        int result = instance.update(s);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    @Test
    public void testUpdate3() {
        System.out.println("update");
        Product s = new Product("999", "img.png", "30000", "Lorem", "aaaaaaaaaaaaa", 1);
        ProductDAO instance = new ProductDAO();
        int expResult = 0;
        int result = instance.update(s);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    @Test
    public void testUpdate4() {
        System.out.println("update");
        Product s = new Product("1", "img.png", "3000", 30, "aaa", " ", 1);
        ProductDAO instance = new ProductDAO();
        int expResult = 1;
        int result = instance.update(s);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of insert method, of class ProductDAO.
     */
    @Test
    public void testInsert() {
        System.out.println("insert");
        Product p = new Product("", "", "", "", "", 0);
        ProductDAO instance = new ProductDAO();
        int expResult = 0;
        int result = instance.insert(p);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }
    
    @Test
    public void testInsert2() {
        System.out.println("insert");
        Product p = new Product("1", "img.png", "3000", 30, "aaa", "something something", 1);
        ProductDAO instance = new ProductDAO();
        int expResult = 0;
        int result = instance.insert(p);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }
    
    @Test
    public void testInsert3() {
        System.out.println("insert");
        Product p = new Product("29", "img.png", "ccc", "Lorem", "aaaaaaaaaaaaa", 9999);
        ProductDAO instance = new ProductDAO();
        int expResult = 0;
        int result = instance.insert(p);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of exsited method, of class ProductDAO.
     */
    @Test
    public void testExsited1() {
        System.out.println("exsited");
        String id = "3";
        ProductDAO instance = new ProductDAO();
        Product expResult = new Product("3", "img3.png", "30000.00", 1000, "Cổ cánh vịt (1 túi)", "Nếu bạn thích những món ăn ít thịt, nhiều xương vậy thì hãy nếm thử cổ cánh vịt. Món ăn này được chế biến mang đậm vị vịt quay Bắc Kinh.", 1);
        Product result = instance.exsited(id);
        assertEquals(expResult.toString(), result.toString());
        // TODO review the generated test code and remove the default call to fail.
    }

    @Test
    public void testExsited2() {
        System.out.println("exsited");
        String id = "BBB";
        ProductDAO instance = new ProductDAO();
        Product expResult = null;
        Product result = instance.exsited(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    @Test
    public void testExsited3() {
        System.out.println("exsited");
        String id = null;
        ProductDAO instance = new ProductDAO();
        Product expResult = null;
        Product result = instance.exsited(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    @Test
    public void testExsited4() {
        System.out.println("exsited");
        String id = "999";
        ProductDAO instance = new ProductDAO();
        Product expResult = null;
        Product result = instance.exsited(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }
}
