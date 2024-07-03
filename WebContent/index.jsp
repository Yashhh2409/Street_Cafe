<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.shashi.service.impl.*, com.shashi.service.*,com.shashi.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>

<title>Street Cafe</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css2?family=Turret+Road:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/changes.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
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
margin-left: 250px;
display: flex;
width: 1050px;
overflow-x: auto;
scroll-snap-type: x mandatory;
scroll-behavior: smooth;
-webkit-overflow-scrolling: touch;
padding: 20px;
}

.product-card {
  flex: 0 0 auto;
  width: 250px;
  height: 354px;
  margin-right: 20px;
  scroll-snap-align: start;
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
  font-size: 20px;
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



.slider-button {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  width: 30px;
  height: 30px;
  background-color: #fff;
  border: none;
  border-radius: 50%;
  font-size: 20px;
  font-weight: bold;
  cursor: pointer;
}

.slider-button.left {
  left: 130px;
  margin-top: 70px;
}

.slider-button.right {
  right: 130px;
  margin-top: 70px;
}

  </style>
  
  
</head>
<body >

	<%
	/* Checking the user credentials */
	String userName = (String) session.getAttribute("username");
	String password = (String) session.getAttribute("password");
	String userType = (String) session.getAttribute("usertype");

	boolean isValidUser = true;

	if (userType == null || userName == null || password == null || !userType.equals("customer")) {

		isValidUser = false;
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
	<div class="text-center" id="message"
		style="color: black; font-size: 14px; font-weight: bold;"></div>
	
	
<!-- -------------------	NEW PRODUCT CARD SLIDER START ------------------- -->

<div class="product-slider">
   <% for (ProductBean product : products) { int cartQty=new CartServiceImpl().getCartItemCount(userName,
      product.getProdId()); %>
      <div class="product-card">
         <img src="./ShowImage?pid=<%=product.getProdId()%>" alt="Product 1">
         <h3>
            <%=product.getProdName()%>
         </h3>
         <% String description=product.getProdInfo(); description=description.substring(0,
            Math.min(description.length(), 100)); %>
            <p>
               <%=description%>
            </p>
            <p class="price">Rs <%=product.getProdPrice()%>
            </p>
            <form method="post">
               <% if (cartQty==0) { %>
                  <button type="submit" formaction="./AddtoCart?uid=<%=userName%>&pid=<%=product.getProdId()%>&pqty=1"
                     class="btn btn-success">Add to Cart</button>
                  &nbsp;&nbsp;&nbsp;
                  <button type="submit" formaction="./AddtoCart?uid=<%=userName%>&pid=<%=product.getProdId()%>&pqty=1"
                     class="btn btn-primary">Buy Now</button>
                  <% } else { %>
                     <button type="submit"
                        formaction="./AddtoCart?uid=<%=userName%>&pid=<%=product.getProdId()%>&pqty=0"
                        class="btn btn-danger">Remove From Cart</button>
                     &nbsp;&nbsp;&nbsp;
                     <button type="submit" formaction="cartDetails.jsp" class="btn btn-success">Checkout</button>
                     <% } %>
            </form>
      </div>
      <% } %>
</div>

<button class="slider-button left">&#8249;</button>
<button class="slider-button right">&#8250;</button>

<!-- -------------------	NEW PRODUCT CARD SLIDER CLOSE ------------------- -->



<%@ include file="footer.html"%>

</body>
<script>
  const slider = document.querySelector('.product-slider');
const sliderButtons = document.querySelectorAll('.slider-button');
let scrollAmount = 0;
let sliderWidth = slider.offsetWidth;
let cardMargin = parseInt(window.getComputedStyle(document.querySelector('.product-card')).marginRight);

sliderButtons.forEach(button => {
  button.addEventListener('click', function() {
    if (this.classList.contains('left')) {
      scrollAmount -= (sliderWidth + cardMargin);
      if (scrollAmount < 0) {
        scrollAmount = 0;
      }
    } else if (this.classList.contains('right')) {
      scrollAmount += (sliderWidth + cardMargin);
      if (scrollAmount > slider.scrollWidth - sliderWidth) {
        scrollAmount = slider.scrollWidth - sliderWidth;
      }
    }
    slider.scrollTo({
      top: 0,
      left: scrollAmount,
      behavior: 'smooth'
    });
  });
});

window.addEventListener('resize', function() {
  sliderWidth = slider.offsetWidth;
});

</script>
</html>