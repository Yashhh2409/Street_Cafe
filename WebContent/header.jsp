<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.shashi.service.impl.*, com.shashi.service.*"%>

<!DOCTYPE html>
<html>
<head>
<title>Logout Header</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="css/changes.css"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
 <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet'  type='text/css'>	
<Style>

.navbar-brand {
    font-family: 'Open Sans', sans-serif;
	font-weight: bold;
	color: white;
}


.navbar {
    color: #d5d5d5 !important;
    font-family: 'Open Sans', sans-serif;
    font-weight: bold;
}

.navbar-brand:hover {
  color: green;
}

.nav li a {
    color: #FFF;
    font-family: 'Open Sans', sans-serif;
    font-size: 18px;
    font-weight: bold;
}

.nav li a:hover {
    background-color: #4d0000;
    color: #FFF;
    font-family: 'Open Sans', sans-serif;
    font-size: 18px;
    font-weight: bold;
}

.dropdown-toggle {
color:white;
}



</Style>
	
</head>
<body style="background-color: #E6F9E6;">
	<!--Company Header Starting  -->
	<div class="container-fluid text-center"
		style="margin-top: 50px; background-color: #A52A2A; color: white; padding: 5px;">
		<h2>Street Cafe</h2>
		<h6>"Street Cafe : Crafting Moments, One Sip at a Time"</h6>
		<form class="form-inline" action="index.jsp" method="get">
			<div class="input-group">
				<input type="text" class="form-control" size="50" name="search"
					placeholder="Search Items" required>
				<div class="input-group-btn">
					<input type="submit" class="btn btn-danger" value="Search" />
				</div>
			</div>
		</form>
		<p align="center"
			style="color: blue; font-weight: bold; margin-top: 5px; margin-bottom: 5px;"
			id="message"></p>
	</div>
	<!-- Company Header Ending -->

	<%
	/* Checking the user credentials */
	String userType = (String) session.getAttribute("usertype");
	if (userType == null) { //LOGGED OUT
	%>

	<!-- Starting Navigation Bar -->
	<nav class="navbar navbar-expand-md navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp"><span
					class="glyphicon glyphicon-home">&nbsp;</span>Street Cafe</a>
			</div>
			<div class="collapse navbar-collapse justify-content-center" id="myNavbar">
			
			
				<ul class="nav navbar-nav navbar-right">
					<li><a href="index.jsp"><span
					class="glyphicon">&nbsp;</span>Products</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Category <span class="cart"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="index.jsp?type=hotcoffee">Hot Coffee</a></li>
							<li><a href="index.jsp?type=coldcoffee">Cold Coffee</a></li>
							<li><a href="index.jsp?type=snacks">Snacks</a></li>
							<li><a href="index.jsp?type=desserts">Desserts</a></li>
							<li><a href="index.jsp?type=colddrinks">Cold Drinks</a></li>
						</ul>
					<li><a href="register.jsp">Register</a></li>
					<li><a href="login.jsp">Login</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<%
	} else if ("customer".equalsIgnoreCase(userType)) { //CUSTOMER HEADER

	int notf = new CartServiceImpl().getCartCount((String) session.getAttribute("username"));
	%>
	<nav class="navbar navbar-expand-md navbar-fixed-top">

		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="userHome.jsp"><span
					class="glyphicon glyphicon-home">&nbsp;</span>Street Cafe</a>
			</div>

			<div class="collapse navbar-collapse justify-content-center" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="userHome.jsp"><span
							class="glyphicon" style="margin-left: 5px;">Products</span></a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Category <span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="userHome.jsp?type=hotcoffee">Hot Coffee</a></li>
							<li><a href="userHome.jsp?type=coldcoffee">Cold Coffee</a></li>
							<li><a href="userHome.jsp?type=snacks">Snacks</a></li>
							<li><a href="userHome.jsp?type=desserts">Desserts</a></li>
							<li><a href="userHome.jsp?type=colddrinks">Cold Drinks</a></li>
						</ul></li>
					<%
					if (notf == 0) {
					%>
					<li><a href="cartDetails.jsp"> <span
							class="glyphicon glyphicon-shopping-cart"></span>Cart
					</a></li>

					<%
					} else {
					%>
					<li><a href="cartDetails.jsp"
						style="margin: 14px; padding: 0px;" id="mycart">Cart<i
							data-count="<%=notf%>">
						</i></a></li>
					<%
					}
					%>
					<li><a href="orderDetails.jsp">Orders</a></li>
					<li><a href="userProfile.jsp">Profile</a></li>
					<li><a href="./LogoutSrv">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<%
	} else { //ADMIN HEADER
	%>
	<nav class="navbar navbar-expand-md navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="adminViewProduct.jsp"><span
					class="glyphicon glyphicon-home">&nbsp;</span>Street Cafe</a>
			</div>
			<div class="collapse navbar-collapse justify-content-center" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="adminViewProduct.jsp" style="margin-left: 5px;">Products</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Category <span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="adminViewProduct.jsp?type=hotcoffee">Hot Coffee</a></li>
							<li><a href="adminViewProduct.jsp?type=coldcoffee">Cold Coffee</a></li>
							<li><a href="adminViewProduct.jsp?type=snacks">Snacks</a></li>
							<li><a href="adminViewProduct.jsp?type=desserts">Desserts</a></li>
							<li><a href="adminViewProduct.jsp?type=colddrinks">Cold Drinks</a></li>
						</ul></li>
					<li><a href="adminStock.jsp">Stock</a></li>
					<li><a href="shippedItems.jsp">Shipped</a></li>
					<li><a href="unshippedItems.jsp">Orders</a></li>
					<!-- <li><a href=""> <span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;Cart</a></li> -->
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Update Items <span
							class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="addProduct.jsp">Add Product</a></li>
							<li><a href="removeProduct.jsp">Remove Product</a></li>
							<li><a href="updateProductById.jsp">Update Product</a></li>
						</ul></li>
					<li><a href="./LogoutSrv">Logout</a></li>

				</ul>
			</div>
		</div>
	</nav>
	<%
	}
	%>
	<!-- End of Navigation Bar -->
</body>
</html>