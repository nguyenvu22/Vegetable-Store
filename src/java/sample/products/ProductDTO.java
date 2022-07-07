/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.products;

/**
 *
 * @author Admin
 */
public class ProductDTO {

    private int productID;
    private String productName;
    private String image;
    private double price;
    private int quantity;
    private String importDate;
    private String usingDate;
    private String category;

    public ProductDTO() {
        this.productID = 0;
        this.productName = "";
        this.image = "";
        this.price = 0;
        this.quantity = 0;
        this.importDate = "";
        this.usingDate = "";
        this.category = "";
    }

    public ProductDTO(int productID, String productName, String image, double price, int quantity, String importDate, String usingDate, String category) {
        this.productID = productID;
        this.productName = productName;
        this.image = image;
        this.price = price;
        this.quantity = quantity;
        this.importDate = importDate;
        this.usingDate = usingDate;
        this.category = category;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImportDate() {
        return importDate;
    }

    public void setImportDate(String importDate) {
        this.importDate = importDate;
    }

    public String getUsingDate() {
        return usingDate;
    }

    public void setUsingDate(String usingDate) {
        this.usingDate = usingDate;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

}
