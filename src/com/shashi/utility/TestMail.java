package com.shashi.utility;

import jakarta.mail.MessagingException;

public class TestMail {
	public static void main(String[] args) {
		try {
			String recipient = "streetcafebusiness@gmail.com";
			String subject = "Mail Configuration Successfull";
			String htmlTextMessage = "" + "<html>"
					+ "<h2 style='color:green;'>Welcome to Street Cafe</h2>" + "" + "Hi" + ","
					+ "<br><br>Thanks for singing up with Street Cafe.<br>"
					+ "Thank You for Choosing Street Cafe Shop! We wanted to take a moment to express our heartfelt gratitude for choosing Street Cafe Shop"
					+ "<br>as your go-to spot for delicious beverages, delightful treats, and memorable moments. Your patronage means the world to us, and we are deeply grateful for your support."
					+ "<br><br>Our Street Cafe is growing in a larger amount these days and we are in high demand so we thanks all of you for "
					+ "making us up to that level. At Street Cafe Shop, we are committed to providing you with exceptional service, quality products, and an inviting atmosphere where you can relax,"
					+ "unwind, and savor the simple joys of life.<br><br>As a Welcome gift for our New Customers we are providing additional 10% OFF Upto 100 Rs for the first product purchase. "
					+ "<br>To avail this offer you only have "
					+ "to enter the promo code given below.<br><br><br> PROMO CODE: " + "STREET100<br><br><br>"
					+ "Have a good day!<br>" + "" + "</body>" + "</html>";
			JavaMailUtil.sendMail(recipient, subject, htmlTextMessage);
			System.out.println("Mail Sent Successfully!");

		} catch (MessagingException e) {
			System.out.println("Mail Sending Failed With Error: " + e.getMessage());
			e.printStackTrace();
		}
	}

}
