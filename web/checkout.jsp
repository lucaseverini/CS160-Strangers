<!-- 
	checkout.jsp

    JSP for the checkout page
        
    SJSU - CS160 - Strangers
	May-5-2015
-->

<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<title>CarMatch</title>
	<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body>
	<%@ include file="header.jsp" %>
<h1 id="pageTitle">Vehicle Purchase Checkout</h1>

<form name="checkout_payment" action="" method="post">
	<h2>Billing Address</h2>
	<div>
		<!-- Assuming only accepting US addresses is OK -->
		<label><span class="labelText">Name:</span><input type="text" name="billingName"></label>
		<label><span class="labelText">Address Line 1:</span><input type="text" name="billingAddr1"></label>
		<label><span class="labelText">Address Line 2:</span><input type="text" name="billingAddr2"></label>
		<label><span class="labelText">City:</span><input type="text" name="billingCity"></label>
		<label><span class="labelText">State:</span><input type="text" name="billingState"></label>
		<label><span class="labelText">ZIP Code:</span><input type="text" name="billingZIP"></label>
	</div>
	<h2>Payment Method</h2>
	<div class="paymentMethod">
		<label><input type="radio" name="payment" value="paypal" CHECKED> Credit Card or PayPal</label>
		<div class="paymentImgs">
			<a href="https://www.paypal.com/us/webapps/mpp/pay-online">
				<img src="images/banner_intl.gif" border="0" title=" PayPal " alt="PayPal" border="0" align="bottom">
			</a>
			<img src="images/ccards/logo_ccVisa.gif" alt="Visa">
			<img src="images/ccards/logo_ccMC.gif" alt="MasterCard">
			<img src="images/ccards/logo_ccDelta.gif" alt="Delta">
			<img src="images/ccards/logo_ccDiscover.gif" alt="Discover">
			<img src="images/ccards/logo_ccAmex.gif" alt="American Express">
		</div>
		<div class="helpText">Your credit card payment will be processed by PayPal. This does not require a Paypal account.</div>
	</div>
	<div class="paymentMethod">
		<label><input type="radio" name="payment" value="checkmoneyorder"> Check or Money Order</label>
		<div class="paymentImgs">
			<img src="images/check.gif" alt="">
		</div>
	</div>

	<div><button type="submit">Continue to Order Summary &amp; Confirmation</button></div>
</form>
</body>
</html>
