<%@page import="sample.products.ProductError"%>
<%@page import="sample.categories.CategoryDTO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="./template_create/index.css">
    </head>
    <body>
        <%
            ProductError productError = (ProductError) request.getAttribute("PRODUCT_ERROR");
            if (productError == null) {
                productError = new ProductError();
            }
            String success = (String) request.getAttribute("CREATE_SUCCESS");
        %>
        <div class="card-container">
            <div class="card u-clearfix">
                <div class="card-body">
                    <span class="card-number card-circle subtle">+1</span>
                    <%
                        if (success != null) {
                    %>

                    <span style="color: green; font-weight: 400; margin-left: 10px; font-weight: 400"> <%= success%> </span>

                    <%
                        }
                    %>
                    <p class="card-author subtle">Adding 1 product</p>
                    <h2 class="card-title">What's in that new product?</h2>
                    <span class="card-description subtle">Input new product's information :</span>
                    <form action="MainController" method="POST">
                        <h3>Product Name :</h3>
                        <input style="border-radius: 5px" type="text" name="productName" required=""> 
                        <p style="color: red; margin-left: 10px"><%= productError.getProductNameError()%></p>
                        <h3>Image src :</h3>
                        <input style="border-radius: 5px" type="text" name="image" required="">
                        <h3>Price :</h3>
                        <input style="border-radius: 5px" type="number" name="price" required="" step =?0.1"> <span>VND</span> 
                        <p style="color: red; margin-left: 10px"><%= productError.getPriceError()%></p>
                        <h3>Quantity :</h3>
                        <input style="border-radius: 5px" type="number" name="quantity" required=""> 
                        <p style="color: red; margin-left: 10px"><%= productError.getQuantityError()%></p>
                        <h3>Import Date :</h3>
                        <input style="border-radius: 5px" type="date" name="importDate" required="">
                        <h3>Using Date :</h3>
                        <input style="border-radius: 5px" type="date" name="usingDate" required="">
                        <h3>Category :</h3>
                        <select style="padding: 6px 10px; border-radius: 5px" name="category">
                            <%
                                List<CategoryDTO> categoryList = (List<CategoryDTO>) session.getAttribute("GET_ALL_CATEGORY");
                                for (CategoryDTO category : categoryList) {
                            %>

                            <option value="<%= category.getCategoryID()%>"><%= category.getCategoryName()%></option>

                            <%
                                }
                            %>
                        </select>

                        <div>
                            <input style="color: white; background-color: #7ace4c; padding: 15px 25px; border-radius: 5px; margin-left: 45%; margin-top: 10px" type="submit" name="action" value="Create">
                        </div>
                        
                        <div style="margin-top: 40px">
                            <a style="color: white; background-color: black; padding: 10px 30px;" href="MainController?action=MoveToAdminPage">Back to ADMIN page</a>
                        </div>
                        
                    </form>
                </div>
                <img src="template_create/recipe.jpg" alt="" class="card-media" />
            </div>
            <div class="card-shadow"></div>
        </div>
    </body>
</html>