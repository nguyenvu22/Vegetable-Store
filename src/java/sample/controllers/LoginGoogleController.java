/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controllers;

import common.GoogleUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.categories.CategoryDAO;
import sample.categories.CategoryDTO;
import sample.products.ProductDAO;
import sample.products.ProductDTO;
import sample.users.UserDAO;
import sample.users.UserDTO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "LoginGoogleController", urlPatterns = {"/LoginGoogleController"})
public class LoginGoogleController extends HttpServlet {

    private static final String ERROR = "login.jsp";
    private static final String SUCCESS = "user.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            String code = request.getParameter("code");
            String accessToken = GoogleUtils.getToken(code);
            UserDTO user = GoogleUtils.getUserInfo(accessToken);

            UserDAO userDAO = new UserDAO();
            boolean checkDuplicate = userDAO.checkDuplicate(user.getEmail());
            if (checkDuplicate) {
                user = userDAO.getUser(user.getEmail());
            } else {
                user = new UserDTO(user.getEmail(), "USER");
            }

            String[] splitEmail = user.getEmail().split("@");
            String getNameFromEmail = splitEmail[0];

            CategoryDAO categoryDao = new CategoryDAO();
            List<CategoryDTO> listCategory = categoryDao.getListCategory();
            ProductDAO productDao = new ProductDAO();
            List<ProductDTO> listProduct = productDao.getAllProduct();

            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("LOGIN_USER", user);
                session.setAttribute("GET_ALL_PRODUCT", listProduct);
                session.setAttribute("GET_ALL_CATEGORY", listCategory);
                session.setAttribute("NAME_FROM_EMAIL", getNameFromEmail);
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at LoginGoogleServlet: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
