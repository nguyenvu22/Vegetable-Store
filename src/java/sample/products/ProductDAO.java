/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.products;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.categories.CategoryDTO;
import sample.utils.DBUtils;

/**
 *
 * @author Admin
 */
public class ProductDAO {

    private static final String GET_PRODUCT = "SELECT productID, productName, image, price, quantity, importDate, usingDate, categoryName FROM tblProduct P, tblCategory C WHERE P.categoryID = C.categoryID AND productID = ? AND P.status = 1";
//
    private static final String GET_ALL_PRODUCT_V1 = "SELECT productID, productName, image, price, quantity, importDate, usingDate, categoryName FROM tblProduct P, tblCategory C WHERE P.categoryID = C.categoryID AND DATEDIFF(day, GETDATE(), P.usingDate) >= 0 AND P.quantity > 0 AND P.status = 1";

    private static final String GET_ALL_PRODUCT = "SELECT productID, productName, image, price, quantity, importDate, usingDate, categoryName FROM tblProduct P, tblCategory C WHERE P.categoryID = C.categoryID AND P.quantity > 0 AND P.status = 1";

    private static final String GET_PRODUCT_BY_CATEGORYID = "SELECT productID, productName, image, price, quantity, importDate, usingDate, categoryName FROM tblProduct P, tblCategory C WHERE P.categoryID = C.categoryID AND C.categoryID = ? AND DATEDIFF(day, GETDATE(), P.usingDate) >= 0 AND P.quantity > 0 AND P.status = 1";
//
    private static final String SEARCH_V1 = "SELECT productID, productName, image, price, quantity, importDate, usingDate, categoryName FROM tblProduct P, tblCategory C WHERE P.categoryID = C.categoryID AND P.productName like ? AND DATEDIFF(day, GETDATE(), P.usingDate) >= 0 AND P.quantity > 0 AND P.status = 1";

    private static final String SEARCH = "SELECT productID, productName, image, price, quantity, importDate, usingDate, categoryName FROM tblProduct P, tblCategory C WHERE P.categoryID = C.categoryID AND P.productName like ? AND P.status = 1";

    private static final String DELETE = "UPDATE tblProduct SET status = 0 WHERE ProductID = ?";

    private static final String UPDATE = "UPDATE tblProduct SET productName = ?, image = ?, price = ?, quantity = ?, importDate = ?, usingDate = ? WHERE ProductID = ?";

    private static final String CREATE = "INSERT INTO tblProduct(productName, image, price, quantity, importDate, usingDate, categoryID, status) VALUES(?,?,?,?,?,?,?,?)";

    private static final String SET_NEW_QUANTITY = "UPDATE tblProduct SET quantity = ? WHERE ProductID = ?";

    public boolean setNewQuantity(ProductDTO product, int quantity) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SET_NEW_QUANTITY);
                ptm.setInt(1, quantity);
                ptm.setInt(2, product.getProductID());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean createProduct(ProductDTO product, int categoryID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE);
                ptm.setString(1, product.getProductName());
                ptm.setString(2, product.getImage());
                ptm.setDouble(3, product.getPrice());
                ptm.setInt(4, product.getQuantity());
                ptm.setString(5, product.getImportDate());
                ptm.setString(6, product.getUsingDate());
                ptm.setInt(7, categoryID);
                ptm.setString(8, "1");
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean updateProduct(ProductDTO product) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, product.getProductName());
                ptm.setString(2, product.getImage());
                ptm.setString(3, String.valueOf(product.getPrice()));
                ptm.setString(4, String.valueOf(product.getQuantity()));
                ptm.setString(5, product.getImportDate());
                ptm.setString(6, product.getUsingDate());
                ptm.setString(7, String.valueOf(product.getProductID()));
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean deleteProduct(String productID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1, productID);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public List<ProductDTO> getListProduct(String search) throws SQLException {
        List<ProductDTO> listProduct = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int productID = rs.getInt("productID");
                    String productName = rs.getString("productName");
                    String image = rs.getString("image");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String importDate = rs.getString("importDate");
                    String usingDate = rs.getString("usingDate");
                    String categoryName = rs.getString("categoryName");
                    listProduct.add(new ProductDTO(productID, productName, image, price, quantity, importDate, usingDate, categoryName));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listProduct;
    }

    public List<ProductDTO> getListProductForUser(String search) throws SQLException {
        List<ProductDTO> listProduct = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_V1);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int productID = rs.getInt("productID");
                    String productName = rs.getString("productName");
                    String image = rs.getString("image");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String importDate = rs.getString("importDate");
                    String usingDate = rs.getString("usingDate");
                    String categoryName = rs.getString("categoryName");
                    listProduct.add(new ProductDTO(productID, productName, image, price, quantity, importDate, usingDate, categoryName));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listProduct;
    }

//==================================
    public List<ProductDTO> getProductByCategory(int categoryID) throws SQLException {
        List<ProductDTO> listProduct = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_PRODUCT_BY_CATEGORYID);
                ptm.setInt(1, categoryID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int productID = rs.getInt("productID");
                    String productName = rs.getString("productName");
                    String image = rs.getString("image");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String importDate = rs.getString("importDate");
                    String usingDate = rs.getString("usingDate");
                    String categoryName = rs.getString("categoryName");
                    listProduct.add(new ProductDTO(productID, productName, image, price, quantity, importDate, usingDate, categoryName));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listProduct;
    }

    public List<ProductDTO> getAllProductForUser() throws SQLException {
        List<ProductDTO> listProduct = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_PRODUCT_V1);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int productID = rs.getInt("productID");
                    String productName = rs.getString("productName");
                    String image = rs.getString("image");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String importDate = rs.getString("importDate");
                    String usingDate = rs.getString("usingDate");
                    String categoryName = rs.getString("categoryName");
                    listProduct.add(new ProductDTO(productID, productName, image, price, quantity, importDate, usingDate, categoryName));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listProduct;
    }

    public List<ProductDTO> getAllProduct() throws SQLException {
        List<ProductDTO> listProduct = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_PRODUCT);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int productID = rs.getInt("productID");
                    String productName = rs.getString("productName");
                    String image = rs.getString("image");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String importDate = rs.getString("importDate");
                    String usingDate = rs.getString("usingDate");
                    String categoryName = rs.getString("categoryName");
                    listProduct.add(new ProductDTO(productID, productName, image, price, quantity, importDate, usingDate, categoryName));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listProduct;
    }

    public ProductDTO getProduct(String productID) throws SQLException {
        ProductDTO product = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_PRODUCT);
                ptm.setString(1, productID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productName = rs.getString("productName");
                    String image = rs.getString("image");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String importDate = rs.getString("importDate");
                    String usingDate = rs.getString("usingDate");
                    String categoryName = rs.getString("categoryName");
                    product = new ProductDTO(Integer.parseInt(productID), productName, image, price, quantity, importDate, usingDate, categoryName);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return product;
    }
}
