/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controllers;

import common.VerifyRecaptcha;
import java.io.IOException;
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
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    private static final String ERROR = "login.jsp";
    private static final String ADMIN = "ADMIN";
    private static final String ADMIN_PAGE = "SearchController";
    private static final String USER = "USER";
    private static final String USER_PAGE = "user.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            UserDAO dao = new UserDAO();
            UserDTO loginUser = dao.checkLogin(email, password);
            CategoryDAO categoryDAO = new CategoryDAO();
            List<CategoryDTO> listCategory = categoryDAO.getListCategory();
            ProductDAO productDAO = new ProductDAO();
            List<ProductDTO> listProduct = productDAO.getAllProduct();
            List<ProductDTO> listProductForUser = productDAO.getAllProductForUser();

            String resRecaptcha = request.getParameter("g-recaptcha-response");
            boolean verifyRe = VerifyRecaptcha.verify(resRecaptcha);
            if (verifyRe) {
                if (loginUser != null) {
                    String role = loginUser.getRole();
                    HttpSession session = request.getSession();
                    if (ADMIN.equals(role)) {
                        session.setAttribute("LOGIN_USER", loginUser);
                        session.setAttribute("GET_ALL_CATEGORY", listCategory);
                        session.setAttribute("GET_ALL_PRODUCT", listProduct);
                        url = ADMIN_PAGE;
                    } else if (USER.equals(role)) {
                        session.setAttribute("LOGIN_USER", loginUser);
                        session.setAttribute("GET_ALL_PRODUCT", listProductForUser);
                        session.setAttribute("GET_ALL_CATEGORY", listCategory);
                        url = USER_PAGE;
                    } else {
                        request.setAttribute("ERROR", "Your role is not supported !!");
                    }
                } else {
                    request.setAttribute("ERROR", "Incorrect email or password !!");
                }
            } else {
                request.setAttribute("ERROR", "Please verify recaptcha");
            }
        } catch (Exception e) {
            log("Error at LoginController" + e.toString());
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
