<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Register</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/changes.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<Style>
body {
background-image: url(images/form_bg.jpg);
background-size: auto;
background-repeat: repeat-y;
}
</Style>
</head>
<body>

	<%@ include file="header.jsp"%>
	<%
	String message = request.getParameter("message");
	%>
	<div class="container" style="margin-top: 10px;">
		<div class="row"
			style="margin-top: 5px; margin-left: 5px; margin-right: 5px;">

			<form action="./RegisterSrv" method="post"
				class="col-md-6 col-md-offset-3"
				style="border: 2px solid black; border-radius: 10px; background-color: grey; padding: 30px;">
				<div style="font-weight: bold;" class="text-center">
					<h2 style="color: black; font-weight: bold;">Sign in</h2>
					<%
					if (message != null) {
					%>
					<p style="color: red;">
						<%=message%>
					</p>
					<%
					}
					%>
				</div>
				<div></div>
				<div class="row">
					<div class="col-md-6 form-group">
						<label for="username">Name</label>
    <input type="text" name="username" style="border-bottom: 2px solid red;" class="form-control" id="first_name" pattern="[A-Za-z\s]+" title="Please enter a valid name (letters and spaces only)" required>

      
					</div>
					<div class="col-md-6 form-group">
						<label for="last_name">Email</label> <input type="email"
							name="email" style="border-bottom: 2px solid red;" class="form-control" id="last_name" name="last_name"
							required>
					</div>
				</div>
				<div class="form-group">
					<label for="last_name">Address</label>
					<textarea name="address" style="border-bottom: 2px solid red;" class="form-control" id="last_name"
						name="last_name" required></textarea>
				</div>
				<div class="row">
    	<div class="col-md-6 form-group">
        <label for="mobile">Mobile</label>
        <input type="text" name="mobile" style="border-bottom: 2px solid red;" class="form-control" id="mobile" required pattern="[0-9]{10}" title="Please enter a 10 digit mobile number">
        <!-- pattern="[0-9]{10}" is a regular expression that allows only 10 digits -->
    </div>
	
		<!-- 			<div class="col-md-6 form-group">
						<label for="last_name">Pin Code</label> <input type="number"
							name="pincode" style="border-bottom: 2px solid red;" class="form-control" id="last_name"
							name="last_name" required>
					</div>-->
					
					<div class="col-md-6 form-group">
    <label for="pincode">Pin Code</label>
    <input type="text" name="pincode" style="border-bottom: 2px solid red;" class="form-control" id="pincode" required pattern="[0-9]{6}" title="Please enter a 6 digit pin code">
    <!-- pattern="[0-9]{6}" is a regular expression that allows only 6 digits -->
</div>

				</div>
				<div class="row">
					<div class="col-md-6 form-group">
						<label for="last_name">Password</label> <input type="password"
							name="password" style="border-bottom: 2px solid red;" class="form-control" id="last_name"
							name="last_name" required>
					</div>
					<div class="col-md-6 form-group">
						<label for="last_name">Confirm Password</label> <input
							type="password" name="confirmPassword" style="border-bottom: 2px solid red;" class="form-control"
							id="last_name" name="last_name" required>
					</div>
				</div>
				<div class="row text-center">
					<div class="col-md-6" style="margin-bottom: 2px;">
						<button type="Reset" class="btn btn-danger">Reset</button>
					</div>
					<div class="col-md-6">
						<button type="submit" class="btn btn-success">Register</button>
					</div>
				</div>
			</form>
		</div>
	</div>


	<%@ include file="footer.html"%>
</body>
</html>