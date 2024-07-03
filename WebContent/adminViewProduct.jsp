<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.shashi.service.impl.*, com.shashi.service.*,com.shashi.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<title>View Products</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/changes.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	

<style>
   
body {
background-image: url(images/form_bg.jpg);
background-size: 100vw;
background-repeat: repeat-y;
}

.product-slider {
  display: grid;
  grid-template-columns: repeat(4, 0.1fr);
  margin-left: 50px;
}

.product-card {
  width: 300px;
  height: 354px;
  margin: 20px 20px 20px 20px;
  background-color: #fff;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
  border-radius: 10px;
  text-align: center;
}

.product-card img {
  width: 100%;
  height: 200px;
  object-fit: cover;
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
}

.product-card h3 {
  margin-top: 10px;
  font-size: 15px;
  font-weight: bold;
}

.product-card p {
  margin-top: 5px;
  font-size: 14px;
  color: grey;
}

.product-card .price {
  color: red;
  font-size: 15px;
  font-weight: bold;
}
</style>
</head>
<body style="background-image: url(images/form_bg.jpg);">

	<%
	/* Checking the user credentials */
	String userName = (String) session.getAttribute("username");
	String password = (String) session.getAttribute("password");
	String userType = (String) session.getAttribute("usertype");

	if (userType == null || !userType.equals("admin")) {

		response.sendRedirect("login.jsp?message=Access Denied, Login as admin!!");

	}

	else if (userName == null || password == null) {

		response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");

	}
	ProductServiceImpl prodDao = new ProductServiceImpl();
	List<ProductBean> products = new ArrayList<ProductBean>();

	String search = request.getParameter("search");
	String type = request.getParameter("type");
	String message = "All Products";
	if (search != null) {
		products = prodDao.searchAllProducts(search);
		message = "Showing Results for '" + search + "'";
	} else if (type != null) {
		products = prodDao.getAllProductsByType(type);
		message = "Showing Results for '" + type + "'";
	} else {
		products = prodDao.getAllProducts();
	}
	if (products.isEmpty()) {
		message = "No items found for the search '" + (search != null ? search : type) + "'";
		products = prodDao.getAllProducts();
	}
	%>



	<jsp:include page="header.jsp" />

	<div class="text-center"
		style="color: white; font-size: 25px; font-weight: bold; margin-top: 10px;"><%=message%></div>
		
		
		
<!-- NEW ITEM LIST START -->

<div class="product-slider">
<%
			for (ProductBean product : products) {
			%>
      <div class="product-card">
         <img src="./ShowImage?pid=<%=product.getProdId()%>" alt="Product 1">
         <h3> <%=product.getProdName()%>
            (
			  <%=product.getProdId()%>
			)
         </h3>
         
            <p> <%=product.getProdInfo()%> </p>
            <p class="price">Rs <%=product.getProdPrice()%> </p>
            <form method="post">
						<button type="submit"
							formaction="./RemoveProductSrv?prodid=<%=product.getProdId()%>"
							class="btn btn-danger">Remove Product</button>
						&nbsp;&nbsp;&nbsp;
						<button type="submit"
							formaction="updateProduct.jsp?prodid=<%=product.getProdId()%>"
							class="btn btn-primary">Update Product</button>
					</form>
      </div>
      <% } %>
</div>
      	
<!-- NEW ITEM LIST END-->		 
		
		
	

	<%@ include file="footer.html"%>

</body>
</html>