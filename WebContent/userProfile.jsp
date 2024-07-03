<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.shashi.service.impl.*, com.shashi.service.*,com.shashi.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Profile Details</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/changes.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<Style>
body {
background-image: url(images/form_bg.jpg);
background-size: auto;
background-repeat: repeat-y;
}

   .container-body {
      background-color: grey;
    }
    .profile-card {
      background-color: #d3a055; /* brown theme */
      padding: 20px;
      border-radius: 10px;
      margin-bottom: 20px;
    }
    .profile-value {
      margin-bottom: 10px;
    }
    .hr-line {
      border-top: 1px solid #fff; /* white color */
      margin: 10px 0;
    }

</Style>
</head>
<body>

	<%
	/* Checking the user credentials */
	String userName = (String) session.getAttribute("username");
	String password = (String) session.getAttribute("password");

	if (userName == null || password == null) {

		response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");
	}

	UserService dao = new UserServiceImpl();
	UserBean user = dao.getUserDetails(userName, password);
	if (user == null)
		user = new UserBean("Test User", 98765498765L, "test@gmail.com", "ABC colony, Patna, bihar", 87659, "lksdjf");
	%>



	<jsp:include page="header.jsp" />
<div class="container-body">
	<div class="container">
		<div class="row">
			<div class="col">
				<nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
					<ol class="breadcrumb mb-0">
						<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
						<li class="breadcrumb-item"><a href="profile.jsp">User
								Profile</a></li>
					</ol>
				</nav>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-4">
				<div class="card mb-4">
					<div class="card-body text-center">
						<img src="images/profileimg.png" class="rounded-circle img-fluid"
							style="width: 150px;">
						<h5 class="my-3" style="color: white; font-size: 14px; font-weight: 700;">
							Hello,
							<%=user.getName()%>
							here!!
						</h5>
						<!-- <p class="text-muted mb-1">Full Stack Developer</p>
						<p class="text-muted mb-4">Bay Area, San Francisco, CA</p> -->
					</div>
				</div>
			</div>
			
			
			
			<!-- cjvccjjnccncjkcc -->
			
<div class="container">
  <div class="row">
    <div class="col-md-6 mx-auto">
      <div class="profile-card">
        <div class="profile-value">
          <span class="profile-key"><strong>Full Name:</strong>&nbsp;&nbsp;&nbsp;</span><%=user.getName()%>
        </div>
        <hr class="hr-line">
        <div class="profile-value">
          <span class="profile-key"><strong>Email:</strong>&nbsp;&nbsp;&nbsp;</span><%=user.getEmail()%>
        </div>
        <hr class="hr-line">
        <div class="profile-value">
          <span class="profile-key"><strong>Phone:</strong>&nbsp;&nbsp;&nbsp;</span><%=user.getMobile()%>
        </div>
        <hr class="hr-line">
        <div class="profile-value">
          <span class="profile-key"><strong>Address:</strong>&nbsp;&nbsp;&nbsp;</span><%=user.getAddress()%>
        </div>
        <hr class="hr-line">
        <div class="profile-value">
          <span class="profile-key"><strong>Pincode:</strong>&nbsp;&nbsp;&nbsp;</span><%=user.getPinCode()%>
        </div>
        <hr class="hr-line">
        <!-- Add more profile details as necessary -->
      </div>
    </div>
  </div>
</div>
		</div>	
			<!-- cjvccjjnccncjkcc -->
			
			
		
			
		</div>
	</div>

	<br>
	<br>
	<br>

	<%@ include file="footer.html"%>

</body>
</html>