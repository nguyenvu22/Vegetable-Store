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
import sample.categories.CategoryDAO;
import sample.categories.CategoryDTO;
import sample.products.ProductDAO;
import sample.products.ProductDTO;
import sample.products.ProductError;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CreateController", urlPatterns = {"/CreateController"})
public class CreateController extends HttpServlet {

    private static final String ERROR = "create.jsp";
    private static final String SUCCESS = "create.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = ERROR;
        ProductError productError = new ProductError();
        try {
            String productName = request.getParameter("productName");
            String image = request.getParameter("image");
            String price = request.getParameter("price");
            String quantity = request.getParameter("quantity");
            String importDate = request.getParameter("importDate");
            String usingDate = request.getParameter("usingDate");
            String category = request.getParameter("category");
            ProductDAO produtcDAO = new ProductDAO();
            boolean checkValidation = true;
            if (productName.length() < 2 || productName.length() > 20) {
                productError.setProductNameError("Product Name must be between 2 and 20");
                checkValidation = false;
            }
            if (Double.parseDouble(price) <= 0) {
                productError.setPriceError("Price can not be less than 0");
                checkValidation = false;
            }
            if (Integer.parseInt(quantity) <= 0) {
                productError.setQuantityError("Quantity can not be less than 0");
                checkValidation = false;
            }
            if (checkValidation == true) {
                ProductDTO product = new ProductDTO(0, productName, image, Double.parseDouble(price), Integer.parseInt(quantity), importDate, usingDate, category);
                boolean checkCreate = produtcDAO.createProduct(product, Integer.parseInt(category));
                if (checkCreate) {
                    url = SUCCESS;
                    request.setAttribute("CREATE_SUCCESS", "Adding successfully");
                }
            } else {
                request.setAttribute("PRODUCT_ERROR", productError);
            }
        } catch (Exception e) {
            log("Error at CreateController" + e.toString());
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
