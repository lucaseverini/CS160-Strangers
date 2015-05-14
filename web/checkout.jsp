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
	<div><table border="0" width="100%" cellspacing="0" cellpadding="0" bgcolor="#F0F8FF">
		<tr>
			<td class="pageHeading"><table cellpadding=0 cellspacing=4 border=0><td valign=middle><img src=images/secure.gif alt=secure></td><td valign=middle><font face="arial" size="4" color="#888888">Payment Information</td></tr></table></td>
			<td class="pageHeading" align="right"><img src=images/secure.gif alt=secure></td>
		</tr>
	</table></div>
	<div><span class="ch"><b>Billing Address</b></span></div>
	<div><table border="0" width="100%" cellspacing="0" cellpadding="2">
		<tr>
			<td class="main" width="50%" valign="top">
				Please choose from your address book where you would like the invoice to be sent to.<br><br>
				<a href=""><img src="images/buttons/button_change_address.gif" border="0" alt="Change Address" title=" Change Address " width="197" height="32"></a>
			</td>
			<td align="right" width="50%" valign="top"><table border="0" cellspacing="0" cellpadding="2">
				<tr>
					<td class="main" align="center" valign="top"><b>Billing Address:</b><br><img src="images/arrow_south_east.gif" border="0" alt="" width="50" height="31"></td>
					<td class="main" valign="top">Luca Severini<br> 333 Escuela Ave<br> Apt. 305<br> Mountain View, CA    94040<br> United States</td>
				</tr>
			</table></td>
		</tr>
	</table></div>
	<div><span class="ch"><b>Payment Method</b></span></div>
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
						<br>
						You do not need to have a PayPal account if you want to pay by credit card.
						<script>
							document.writeln('<a style="cursor:hand" onclick="javascript:popup=window.open('
								+ '\'CreditCardExplain.html\',\'popup\','
								+ '\'scrollbars,resizable,width=500,height=600,left=50,top=50\'); popup.focus(); return false;">'
								+ '<font color="blue"><u>[more info]</u></font></a>');
						</script>
						<noscript>
							<a href="CreditCardExplain.html" target="_blank"><font color="blue"><u>[more info]</u></font></a>
						</noscript>
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

	<div><table border="0" width="100%" cellspacing="0" cellpadding="2">
		<tr>
			<td class="main"><font size=3 face=arial color=black>Click <b>continue</b> button to view order summary and confirm</td>
			<td class="main" align="right"><input type="image" src="images/buttons/button_continue.gif" border="0" alt="Continue" title=" Continue "></td>
		</tr>
	</table></div>
</form>
</body>
</html>
