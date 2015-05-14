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
	<div><table border="0" width="100%" cellspacing="0" cellpadding="2">
		<tr>
			<td class="main" width="90%" valign="top"><b>Please select your payment method below for this order:</b></td>
		</tr>
		<tr>
			<td colspan="2"><table border="0" width="100%" cellspacing="0" cellpadding="2">
				<tr class="moduleRow">
					<td class="main" colspan="3" nowrap>
						<font size="2" face="tahoma"><b>
							Credit Card or Paypal
							<img src="images/ccards/logo_ccVisa.gif"     border="0" title=" Visa " alt="Visa" align="bottom">
							<img src="images/ccards/logo_ccMC.gif"       border="0" title=" MasterCard " alt="MasterCard"      align="bottom">
							<img src="images/ccards/logo_ccDelta.gif" border="0" title=" Delta "  alt="Delta"        align="bottom">
							<img src="images/ccards/logo_ccDiscover.gif" border="0" title=" Discover "         alt="Discover"        align="bottom">
							<img src="images/ccards/logo_ccAmex.gif"     border="0" title=" American Express " 
							or
							<a style="cursor:hand" onclick="javascript:popup=window.open('https://www.paypal.com/uk/cgi-bin/webscr?cmd=xpt/cps/popup/OLCWhatIsPayPal-outside','popup','scrollbars,resizable,width=500,height=600,left=50,top=50'); popup.focus(); return false;">
								<img src="images/banner_intl.gif" border="0" title=" PayPal " alt="PayPal" border="0" align="bottom">
							</a>
						</b></font>
						<p class="helpText">Your credit card payment will be processed by PayPal. This does not require a Paypal account.</p>
					</td>
					<td class="main" align="right">
						<input type="radio" name="payment" value="paypal" CHECKED> &nbsp; 
					</td>
				</tr>
			</table></td>
		</tr>
		<tr>
			<td colspan="2"><table border="0" width="100%" cellspacing="0" cellpadding="2">
				<tr class="moduleRow">
					<td class="main" colspan="3" nowrap>
						<font size="2" face="tahoma"><b>Check or Money Order</b></font>
						<img src="images/check.gif" border=0 alt=" Send Us a Check " align="absmiddle">
					</td>
					<td class="main" align="right">
						<input type="radio" name="payment" value="moneyorder"> &nbsp; 
					</td>
				</tr>
			</table></td>
		</tr>
	</table></div>

	<div><button type="submit">Continue to Order Summary &amp; Confirmation</button></div>
</form>
</body>
</html>
