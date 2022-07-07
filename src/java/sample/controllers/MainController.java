/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class MainController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "LoginController";
    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    private static final String SEARCH = "Search";
    private static final String SEARCH_CONTROLLER = "SearchController";
    private static final String DELETE = "Delete";
    private static final String DELETE_CONTROLLER = "DeleteController";
    private static final String UPDATEV1 = "UpdateV1";
    private static final String UPDATEV1_CONTROLLER = "UpdateV1Controller";
    private static final String UPDATE = "Update";
    private static final String UPDATE_CONTROLLER = "UpdateController";
    private static final String CREATE = "Create";
    private static final String CREATE_CONTROLLER = "CreateController";
    private static final String CLASSIFY = "Classify";
    private static final String CLASSIFY_CONTROLLER = "ClassifyController";
    private static final String FIND = "Find";
    private static final String FIND_CONTROLLER = "FindController";
    private static final String ADD = "Add";
    private static final String ADD_CONTROLLER = "AddController";
    private static final String REMOVE = "Remove";
    private static final String REMOVE_CONTROLLER = "RemoveController";
    private static final String PUT = "Put";
    private static final String PUT_CONTROLLER = "PutController";
    private static final String ORDER = "Order";
    private static final String ORDER_CONTROLLER = "OrderController";
    private static final String SIGNUP = "Signup";
    private static final String SIGNUP_CONTROLLER = "SignupController";
    private static final String VERIFY = "Verify";
    private static final String VERIFY_CONTROLLER = "VerifyController";

    private static final String MOVE_TO_USER_PAGE = "MoveToUserPage";
    private static final String MOVE_TO_USER_PAGE_CONTROLLER = "MoveToUserPageController";
    private static final String MOVE_TO_CART_PAGE = "MoveToCartPage";
    private static final String MOVE_TO_CART_PAGE_CONTROLLER = "MoveToCartPageController";
    private static final String MOVE_TO_CHECKOUT_PAGE = "MoveToCheckoutPage";
    private static final String MOVE_TO_CHECKOUT_PAGE_CONTROLLER = "MoveToCheckoutPageController";

    private static final String MOVE_TO_CREATE_PRODUCT = "MoveToCreateProduct";
    private static final String MOVE_TO_CREATE_PRODUCT_CONTROLLER = "MoveToCreateProductController";
    private static final String MOVE_TO_ADMIN_PAGE = "MoveToAdminPage";
    private static final String MOVE_TO_ADMIN_PAGE_CONTROLLER = "MoveToAdminPageController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if (LOGIN.equals(action)) {
                url = LOGIN_CONTROLLER;
            } else if (LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLLER;
            } else if (SEARCH.equals(action)) {
                url = SEARCH_CONTROLLER;
            } else if (DELETE.equals(action)) {
                url = DELETE_CONTROLLER;
            } else if (UPDATEV1.equals(action)) {
                url = UPDATEV1_CONTROLLER;
            } else if (UPDATE.equals(action)) {
                url = UPDATE_CONTROLLER;
            } else if (CREATE.equals(action)) {
                url = CREATE_CONTROLLER;
            } else if (CLASSIFY.equals(action)) {
                url = CLASSIFY_CONTROLLER;
            } else if (FIND.equals(action)) {
                url = FIND_CONTROLLER;
            } else if (ADD.equals(action)) {
                url = ADD_CONTROLLER;
            } else if (REMOVE.equals(action)) {
                url = REMOVE_CONTROLLER;
            } else if (PUT.equals(action)) {
                url = PUT_CONTROLLER;
            } else if (ORDER.equals(action)) {
                url = ORDER_CONTROLLER;
            } else if (SIGNUP.equals(action)) {
                url = SIGNUP_CONTROLLER;
            } else if (VERIFY.equals(action)) {
                url = VERIFY_CONTROLLER;
            } else if (MOVE_TO_USER_PAGE.equals(action)) {
                url = MOVE_TO_USER_PAGE_CONTROLLER;
            } else if (MOVE_TO_CART_PAGE.equals(action)) {
                url = MOVE_TO_CART_PAGE_CONTROLLER;
            } else if (MOVE_TO_CHECKOUT_PAGE.equals(action)) {
                url = MOVE_TO_CHECKOUT_PAGE_CONTROLLER;
            } else if (MOVE_TO_CREATE_PRODUCT.equals(action)) {
                url = MOVE_TO_CREATE_PRODUCT_CONTROLLER;
            } else if (MOVE_TO_ADMIN_PAGE.equals(action)) {
                url = MOVE_TO_ADMIN_PAGE_CONTROLLER;
            }
        } catch (Exception e) {
            log("Error at MainController" + e.toString());
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
