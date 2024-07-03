package com.shashi.utility;

import jakarta.mail.MessagingException;

public class MailMessage {
	public static void registrationSuccess(String emailId, String name) {
		String recipient = emailId;
		String subject = "Registration Successfull";
		String htmlTextMessage = "" + "<html>" + "<body>"
				+ "<h2 style='color:green;'>Welcome to Street Cafe</h2>" + "" + "Hi " + name + ","
				+ "<br><br>Thanks for singing up with Street Cafe.<br>"
				+ "Thank You for Choosing Street Cafe Shop! We wanted to take a moment to express our heartfelt gratitude for choosing Street Cafe Shop"
				+ "<br>as your go-to spot for delicious beverages, delightful treats, and memorable moments. Your patronage means the world to us, and we are deeply grateful for your support."
				+ "<br><br>Our Street Cafe is growing in a larger amount these days and we are in high demand so we thanks all of you for "
				+ "making us up to that level. At Street Cafe Shop, we are committed to providing you with exceptional service, quality products, and an inviting atmosphere where you can relax,"
				+ "unwind, and savor the simple joys of life.<br><br>As a Welcome gift for our New Customers we are providing additional 10% OFF Upto 100 Rs for the first product purchase. "
				+ "<br>To avail this offer you only have "
				+ "to enter the promo code given below.<br><br><br> PROMO CODE: " + "STREET100<br><br><br>"
				+ "Have a good day!<br>" + "" + "</body>" + "</html>";
		try {
			JavaMailUtil.sendMail(recipient, subject, htmlTextMessage);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void transactionSuccess(String recipientEmail, String name, String transId, double transAmount) {
		String recipient = recipientEmail;
		String subject = "Your Order from Street Cafe Shop Has Been Successfully Placed!";
		String htmlTextMessage = "<html>" + "  <body>" + "    <p>" + "      Hey " + name + ",<br/><br/>"
				+ "      We are delighted to inform you that your order has been successfully placed at Street Cafe Shop!" + "      <br/><br/>"
				+ "      Thank you for choosing us to satisfy your cravings and for allowing us the opportunity to serve you."
				+ "<br/><h6>Please Note that this is a demo projet Email and you have not made any real transaction with us till now!</h6>"
				+ "      <br/>" + "      Here is Your Transaction Details:<br/>" + "      <br/>"
				+ "      <font style=\"color:red;font-weight:bold;\">Order Id:</font>"
				+ "      <font style=\"color:green;font-weight:bold;\">" + transId + "</font><br/>" + "      <br/>"
				+ "      <font style=\"color:red;font-weight:bold;\">Amount Paid:</font> <font style=\"color:green;font-weight:bold;\">"
				+ transAmount + "</font>" + "      <br/><br/>" + "      Thanks for shopping with us!<br/><br/>"
				+ "      Come Shop Again! <br/<br/> <font style=\"color:green;font-weight:bold;\">Street Cafe.</font>"
				+ "    </p>" + "    " + "  </body>" + "</html>";

		try {
			JavaMailUtil.sendMail(recipient, subject, htmlTextMessage);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	public static void orderShipped(String recipientEmail, String name, String transId, double transAmount) {
		String recipient = recipientEmail;
		String subject = "Hurray!!, Your Order from Street Cafe Shop Has Been Shipped!";
		String htmlTextMessage = "<html>" + "  <body>" + "    <p>" + "      Hey " + name + ",<br/><br/>"
				+ "      We are glad that you shop with Street Cafe!" + "      <br/><br/>"
				+ "      We appreciate your patience and understanding as we worked to prepare and dispatch your order with care."
				+ "<br/><h6>Please Note that this is a demo projet Email and you have not made any real transaction with us till now!</h6>"
				+ "      <br/>" + "      Here is Your Transaction Details:<br/>" + "      <br/>"
				+ "      <font style=\"color:red;font-weight:bold;\">Order Id:</font>"
				+ "      <font style=\"color:green;font-weight:bold;\">" + transId + "</font><br/>" + "      <br/>"
				+ "      <font style=\"color:red;font-weight:bold;\">Amount Paid:</font> <font style=\"color:green;font-weight:bold;\">"
				+ transAmount + "</font>" + "      <br/><br/>" + "      Thanks for shopping with us!<br/><br/>"
				+ "      Come Shop Again! <br/<br/> <font style=\"color:green;font-weight:bold;\">Street Cafe.</font>"
				+ "    </p>" + "    " + "  </body>" + "</html>";

		try {
			JavaMailUtil.sendMail(recipient, subject, htmlTextMessage);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	public static void productAvailableNow(String recipientEmail, String name, String prodName, String prodId) {
		String recipient = recipientEmail;
		String subject = "Product " + prodName + " is Now Available at Street Cafe";
		String htmlTextMessage = "<html>" + "  <body>" + "    <p>" + "      Hey " + name + ",<br/><br/>"
				+ "      We are glad that you shop with Street Cafe!" + "      <br/><br/>"
				+ "      As per your recent browsing history, we seen that you were searching for an item that was not available in sufficient amount"
				+ " at that time. <br/><br/>"
				+ "We are glad to say that the product named <font style=\"color:green;font-weight:bold;\">" + prodName
				+ "</font> with " + "product Id <font style=\"color:green;font-weight:bold;\">" + prodId
				+ "</font> is now available to shop in our Cafe Shop!"
				+ "<br/><h6>Please Note that this is a demo projet Email and you have not made any real transaction with us and not ordered anything till now!</h6>"
				+ "      <br/>" + "      Here is The product detail which is now available to shop:<br/>"
				+ "      <br/>"
				+ "      <font style=\"color:red;font-weight:bold;\">Product Id: </font><font style=\"color:green;font-weight:bold;\">"
				+ prodId + " " + "      </font><br/>" + "      <br/>"
				+ "      <font style=\"color:red;font-weight:bold;\">Product Name: </font> <font style=\"color:green;font-weight:bold;\">"
				+ prodName + "</font>" + "      <br/><br/>" + "      Thanks for shopping with us!<br/><br/>"
				+ "      Come Shop Again! <br/<br/><br/> <font style=\"color:green;font-weight:bold;\">Street Cafe.</font>"
				+ "    </p>" + "    " + "  </body>" + "</html>";

		try {
			JavaMailUtil.sendMail(recipient, subject, htmlTextMessage);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	public static String sendMessage(String toEmailId, String subject, String htmlTextMessage) {
		try {
			JavaMailUtil.sendMail(toEmailId, subject, htmlTextMessage);
		} catch (MessagingException e) {
			e.printStackTrace();
			return "FAILURE";
		}
		return "SUCCESS";
	}
}
