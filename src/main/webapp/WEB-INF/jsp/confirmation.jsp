<%--
  Created by IntelliJ IDEA.
  User: Elan
  Date: 7/26/2018
  Time: 10:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<jsp:useBean id="p" scope="request" type="viewmodel.ConfirmationViewModel"/>

<html>
<head>
    <title>My Bookstore - Confirmation</title>
    <meta charset="utf-8">
    <meta name="description" content="The confirmation page for My Bookstore">

    <!--
     normalize-and-reset.css.css is a basic CSS reset; useful for starting from ground zero.
     always include this first.
 -->

    <link rel="stylesheet" type="text/css" href="<c:url value="/css/normalize-and-reset.css"/>">

    <!--
        cascading appropriately, we have:

        main.css    --  all things common
        header.css  --  header-specific rules
        footer.css  --  footer-specific rules
        <page>.css  --  page-specific rules
        extras.css  --  extras you may want
    -->

    <link rel="stylesheet" type="text/css" href="<c:url value="/css/main.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/header.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/footer.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/confirmation.css"/>">

</head>
<body class="home">
    <jsp:include page="header.jsp"/>

    <section id="confirmationMain">
    <div id="confirmationUpper">

        <br>
        <br>
        <p id="confirmationHeader">Confirmation</p>
        <br>

        <div id="confirmationNumDate">
            <p>Your confirmation number is: ${p.orderDetails.order.confirmationNumber}</p>
            <br>
            <p> ${p.orderConfirmationDate}</p>
            <br>
            <br>
        </div>
    </div>

        <div id="confirmationDetailsAndInfo">

        <table id="confirmationDetails">
            <tr>
                <th>Book</th>
                <th>Quantity</th>
                <th>Price</th>
            </tr>
            <c:forEach var="lineItem" items="${p.orderDetails.lineItems}" varStatus="iter">
            <tr>
                <td>
                    ${p.orderDetails.books[iter.index].title}
                </td>
                <td>
                    ${p.orderDetails.lineItems[iter.index].quantity}
                </td>
                <td>
                    $${(p.orderDetails.books[iter.index].price*p.orderDetails.lineItems[iter.index].quantity)/100}
                </td>
            </tr>
            </c:forEach>
            <tr>
                <td style="font-style: italic">Delivery Surcharge</td>
                <td></td>
                <td>$${p.cart.surcharge/100}0</td>
            </tr>
            <tr id = total>
                <td>Total</td>
                <td></td>
                <td>$${(p.orderDetails.order.amount + p.cart.surcharge)/100}</td>
            </tr>
        </table>

            <div id="customerInfo">
                <p id="customerInfoHeader">Customer Information</p>
                <div style="display: inline-block; text-align: left">
                <p>${p.orderDetails.customer.customerName} (${p.orderDetails.customer.email}</p>
                   <p>${p.orderDetails.customer.address}</p>
                <p>**** **** **** ${p.orderDetails.customer.ccNumLastFour} (${p.orderDetails.customer.ccExpStripped})</p>
                </div>
            </div>
        </div>
    </section>

    <jsp:include page="footer.jsp"/>


</body>
</html>
