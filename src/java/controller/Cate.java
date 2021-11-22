/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;

/**
 *
 * @author Admin
 */
public class Cate extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CateServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CateServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String id_raw = request.getParameter("cid");
        int id;
        if (id_raw == null) {
            id = 1;
        } else {
            id = Integer.parseInt(id_raw);
        }
        ProductDAO db = new ProductDAO();
        List<Product> list = db.searchCate(id);
        int page, numperpage = 4;
        String page_raw = request.getParameter("page");
        if (page_raw == null) {
            page = 1;
        } else {
            page = Integer.parseInt(page_raw);
        }
        int start, end;
        start = (page - 1) * numperpage;
        if (page * numperpage > list.size()) {
            end = list.size();
        } else {
            end = page * numperpage;
        }
        List<Product> arr = db.getProductByPage(list, start, end);
        int size = list.size();
        int pagenum = (size % 4 == 0) ? (size / 4) : (size / 4 + 1);
        request.setAttribute("num2", pagenum);
        request.setAttribute("page", page);
        request.setAttribute("data", arr);
        request.setAttribute("cid", id);
        request.getRequestDispatcher("cate.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
