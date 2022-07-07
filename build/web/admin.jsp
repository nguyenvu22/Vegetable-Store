<%@page import="sample.users.UserDTO"%>
<%@page import="sample.products.ProductDTO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Page</title>
        <link href="template_admin/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="template_admin/style.css" rel="stylesheet">
    </head>
    <body>

        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null) {
                loginUser = new UserDTO();
            }
            if (loginUser == null || !loginUser.getRole().equals("ADMIN")) {
                response.sendRedirect("login.jsp");
                return;
            }
            String search = request.getParameter("search");
            if (search == null) {
                search = "Search...";
            }
            String messageV1 = (String) request.getAttribute("DELETE_SUCCESS_MESS");
            String messageV2 = (String) request.getAttribute("UPDATE_SUCCESS_MESS");
        %>

        <div>
            <nav>
                <div class="navbar-header">
                    <ul class="nav navbar-top-links navbar-right pull-right">
                        <li>
                            <!--search nè-->
                            <form action="MainController" class="app-search hidden-sm hidden-xs m-r-10" method="POST">
                                <input type="text" name="search" placeholder="<%= search%>" class="form-control"> 
                                <input type="submit" name="action" value="Search" class="btn btn-success">
                            </form>
                        </li>
                        <li>
                            <a class="profile-pic" href="#"> <img src="template_admin/user.jpg" alt="user-img" width="36" class="img-circle"><b class="hidden-xs"> <%= loginUser.getFullName()%> </b></a>
                        </li>
                    </ul>
                </div>
            </nav>
            <div style="background-image: linear-gradient(to bottom right, yellow, blue)" class="navbar-default sidebar" role="navigation">
                <h4 style="text-align: center; background-color: orange; color: white; font-weight: 600; padding: 20px; margin: 20px; border: 3px solid white;">Welcome to admin section</h4>
                <div>
                    <ul style="list-style-type: none; font-size: 20px; padding: 0 25px">
                        <li style="padding: 70px 0;">
                            <button style="width: 100%" class="btn btn-info">
                                <a style="color: white" href="MainController?action=MoveToCreateProduct">Add a new product </a>                    
                            </button>
                        </li>
                    </ul>
                </div>
                <div style="text-align: center; margin-top: 150%">
                    <button class="btn btn-warning">
                        <a style="color: white" href="MainController?action=Logout">Logout</a>
                    </button>
                </div>
            </div>
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12 col-lg-12 col-sm-12">
                            <div style="background-color: white; padding: 20px;">
                                <h2 style="text-align: center; font-weight: 600;">Products available in store</h2>
                                <div>

                                    <%
                                        List<ProductDTO> listProduct = null;
                                        List<ProductDTO> listProductSearching = (List<ProductDTO>) request.getAttribute("LIST_PRODUCT");
                                        List<ProductDTO> listAllProduct = (List<ProductDTO>) session.getAttribute("GET_ALL_PRODUCT");
                                        if (listProductSearching == null) {
                                            listProduct = listAllProduct;
                                        } else {
                                            listProduct = listProductSearching;
                                        }
                                        if (listProduct != null) {
                                            if (listProduct.size() > 0) {
                                    %>

                                    <table class="table" style="text-align: center">
                                        <thead>
                                            <tr >
                                                <th style="text-align: center">No</th>
                                                <th style="text-align: center">Product ID</th>
                                                <th style="text-align: center">Product Name</th>
                                                <th style="text-align: center">Price</th>
                                                <th style="text-align: center">Quantity</th>
                                                <th style="text-align: center">Category</th>
                                                <th style="text-align: center">Import date</th>
                                                <th style="text-align: center">Using date</th>
                                                <th style="text-align: center">Image</th>
                                                <th style="text-align: center">Update</th>
                                                <th style="text-align: center">Delete</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                int count = 1;
                                                for (ProductDTO product : listProduct) {
                                            %>

                                            <tr>
                                                <td><%= count++%></td>
                                                <td><%= product.getProductID()%></td>
                                                <td><%= product.getProductName()%></td>
                                                <td><%= product.getPrice()%></td>
                                                <td><%= product.getQuantity()%></td>
                                                <td><%= product.getCategory()%></td>
                                                <td><%= product.getImportDate()%></td>
                                                <td><%= product.getUsingDate()%></td>
                                                <td><img style="width: 50%" src="<%= product.getImage()%>" alt="alt"/></td>
                                                <td><button class="btn btn-success"> <a style="color: white" href="MainController?action=UpdateV1&productID=<%= product.getProductID()%>">Update</a> </button></td>
                                                <td><button class="btn btn-danger"> <a style="color: white" href="MainController?action=Delete&productID=<%= product.getProductID()%>">Delete</a> </button></td>
                                            </tr>

                                            <%
                                                }
                                            %>

                                        </tbody>
                                    </table>

                                    <%
                                            }
                                        }
                                    %>

                                </div>
                            </div>

                            <%
                                if (messageV1 != null) {
                            %>
                            <h2 style="color: white; background-color: greenyellow; text-align: center; border: 2px solid black; margin: 50px 30%; padding: 10px"><%= messageV1%></h2>
                            <p style="text-align: center">-- You can continue searching --</p>
                            <%
                                }
                            %>

                            <%
                                ProductDTO product = (ProductDTO) request.getAttribute("UPDATE_PRODUCT");
                                if (product != null) {
                            %>


                            <div style="background-color: #d9edf7; margin: 50px 25% 0 25%; padding: 50px; border: 3px solid black; border-radius: 15px">
                                <form action="MainController" method="POST">
                                    <h1 style="text-align: center; color: blue; font-weight: 500; margin: 0 0 0 10px">UPDATE</h1>
                                    <p style="font-weight: 500">
                                        Product ID : </br><input style="width: 60%; border-radius: 5px" type="text" name="productId" readonly="" value="<%= product.getProductID()%>">
                                    </p>
                                    <p style="font-weight: 500">
                                        Product Name : </br><input style="width: 60%; border-radius: 5px" type="text" name="productName" value="<%= product.getProductName()%>">
                                    </p>
                                    <p style="font-weight: 500">
                                        Image src : </br><input style="width: 60%; border-radius: 5px" type="text" name="image" value="<%= product.getImage()%>">
                                    </p>
                                    <p style="font-weight: 500">
                                        Price : </br><input style="width: 60%; border-radius: 5px" type="text" name="price" value="<%= product.getPrice()%>">
                                    </p>
                                    <p style="font-weight: 500">
                                        Quantity : </br><input style="width: 60%; border-radius: 5px" type="text" name="quantity" value="<%= product.getQuantity()%>">
                                    </p>
                                    <p style="font-weight: 500">
                                        ImportDate : </br><input style="width: 60%; border-radius: 5px" type="text" name="importDate" value="<%= product.getImportDate()%>">
                                    </p>
                                    <p style="font-weight: 500">
                                        UsingDate : </br><input style="width: 60%; border-radius: 5px" type="text" name="usingDate" value="<%= product.getUsingDate()%>">
                                    </p>
                                    <p style="font-weight: 500">
                                        Category Name : </br><input style="width: 60%; border-radius: 5px" type="text" name="categoryName" readonly="" value="<%= product.getCategory()%>">
                                    </p>
                                    <input class="btn btn-info" type="submit" name="action" value="Update">
                                </form>
                            </div>

                            <%
                                }
                            %>

                            <%
                                if (messageV2 != null) {
                            %>
                            <h2 style="color: white; background-color: greenyellow; text-align: center; border: 2px solid black; margin: 50px 30%; padding: 10px"><%= messageV2%></h2>
                            <p style="text-align: center">-- You can continue searching --</p>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>