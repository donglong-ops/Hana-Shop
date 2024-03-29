/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vanlt.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vanlt.daos.CategoryDAO;
import vanlt.daos.FoodDAO;
import vanlt.dtos.RegistrationDTO;

/**
 *
 * @author AVITA
 */
@WebServlet(name = "DeleteFoodServlet", urlPatterns = {"/DeleteFoodServlet"})
public class DeleteFoodServlet extends HttpServlet {

    private final String ErrorPage = "errorPage.jsp";

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
        PrintWriter out = response.getWriter();

        String pageNum = request.getParameter("pageNum");
        String url = ErrorPage;

        HttpSession session = request.getSession();
        RegistrationDTO dto = (RegistrationDTO) session.getAttribute("USER");

        try {
            FoodDAO dao = new FoodDAO();
            String id = request.getParameter("ID");
            boolean result = dao.deleteFood(Integer.parseInt(id), dto.getId());
            if (result) {
                session.setAttribute("LISTCATE", new CategoryDAO().getAllCategory());
                url = "DispatcherController?btAction=Manager&pageNum=" + pageNum;
            }
        } catch (SQLException ex) {
            log("Error DelFood SQL: " + ex.getMessage());
        } catch (NamingException ex) {
            log("Error DelFood SQL: " + ex.getMessage());
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
