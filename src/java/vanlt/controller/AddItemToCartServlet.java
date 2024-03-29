/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vanlt.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Map;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vanlt.bookingitem.BookingItemDAO;
import vanlt.cart.CartObject;
import vanlt.daos.FoodDAO;

/**
 *
 * @author AVITA
 */
@WebServlet(name = "AddItemToCartServlet", urlPatterns = {"/AddItemToCartServlet"})
public class AddItemToCartServlet extends HttpServlet {


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
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        String url = "";
        
        String foodId = request.getParameter("foodId");
        String searchName = request.getParameter("txtSearchName");
        String searchCate = request.getParameter("txtSearchCategory");
        String searchFromPrice = request.getParameter("txtFromPrice");
        String searchToPrice = request.getParameter("txtToPrice");
        String pageNumber = request.getParameter("pageNum");
        try {
            HttpSession session = request.getSession();
            if (session.getAttribute("USER") == null) {
                url = "login.jsp";
                return;
            }
            CartObject cart = (CartObject) session.getAttribute("CART");
            if (cart == null) {
                cart = new CartObject();
            }
            int id = -1;
            id = Integer.parseInt(foodId);
            BookingItemDAO bookingItemDAO = new BookingItemDAO();
            FoodDAO dao = new FoodDAO();
            int totalBooked = bookingItemDAO.countTotalBookedFood(id);
            Map<Integer, Integer> items = cart.getItems();
            int currentAmountInCart = 0;
            if (items != null) {
                Integer item = items.get(id);
                if (item != null) {
                    currentAmountInCart = item;
                }
            }

            int foodQuantity = dao.getFoodQuantity(id);
            if (foodQuantity >= totalBooked + currentAmountInCart) {
                url += "DispatcherController"
                        + "?btAction=Search"
                        + "&txtSearchName=" + searchName
                        + "&txtSearchCategory=" + searchCate
                        + "&txtFromPrice=" + searchFromPrice
                        + "&txtToPrice=" + searchToPrice
                        + "&pageNum=" + pageNumber;

                cart.addItemToCart(id);
                session.setAttribute("CART", cart);
            }
        } catch (SQLException ex) {
           log("Error AddTocart SQL: " + ex.getMessage());
        } catch (NamingException ex) {
           log("Error AddTocart Naming: " + ex.getMessage());
        } finally {
            response.sendRedirect(url);
            out.close();
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
        processRequest(request, response);
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
        processRequest(request, response);
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
