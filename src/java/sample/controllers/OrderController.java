/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.orderDetails.OrderDetailDAO;
import sample.orderDetails.OrderDetailDTO;
import sample.orders.OrderDAO;
import sample.orders.OrderDTO;
import sample.products.ProductDAO;
import sample.products.ProductDTO;
import sample.shop.Cart;
import sample.users.UserDAO;
import sample.users.UserDTO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "OrderController", urlPatterns = {"/OrderController"})
public class OrderController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "user.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            String userEmail = request.getParameter("userEmail");
            String userFullName = request.getParameter("userFullName");
            String userAddress = request.getParameter("userAddress");
            String userPhone = request.getParameter("userPhone");
            UserDAO userDAO = new UserDAO();
            UserDTO user = userDAO.getUser(userEmail);

            if (user == null) {
                boolean insertUser = userDAO.insertUser(userEmail, userFullName, userAddress, Integer.parseInt(userPhone));
            } else {
                boolean updateUser = userDAO.updateUser(user);
            }

            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("CART");
            double total = 0;
            if (cart != null) {
                if (cart.getCart().size() > 0) {
                    for (ProductDTO product : cart.getCart().values()) {
                        total += product.getPrice() * product.getQuantity();
                    }
                }
            }
            OrderDTO order = new OrderDTO(1, "", total, userEmail);

            OrderDAO orderDAO = new OrderDAO();
            boolean insertOrder = orderDAO.insertOrder(order);
            int orderID = orderDAO.getOrderID();
            OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
            ProductDAO productDAO = new ProductDAO();
            boolean insertOrderDetail;
            if (cart != null) {
                if (cart.getCart().size() > 0) {
                    for (ProductDTO product : cart.getCart().values()) {
                        OrderDetailDTO orderDetail = new OrderDetailDTO(0, product.getPrice(), product.getQuantity(), orderID, product.getProductID());
                        insertOrderDetail = orderDetailDAO.insertOrderDetail(orderDetail);

                        ProductDTO productBeforeUpdate = productDAO.getProduct(String.valueOf(product.getProductID()));

                        int quantityBeforeUpdate = productBeforeUpdate.getQuantity();
                        int quantityAfterUpdate = quantityBeforeUpdate - product.getQuantity();

                        productDAO.setNewQuantity(product, quantityAfterUpdate);
                    }
                }
            }
            url = SUCCESS;
        } catch (Exception e) {
            log("Error at OrderController : " + e.toString());
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
