<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<jsp:useBean id="p" scope="request" type="viewmodel.CheckoutViewModel"/>

<!doctype html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="<c:url value="/js/jquery.validate.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/js/additional-methods.js"/>" type="text/javascript"></script>

    <title>My Bookstore - Checkout</title>
    <meta charset="utf-8">
    <meta name="description" content="The checkout page for My Bookstore">

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
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/checkout.css"/>">

</head>

<body class="home">
<main>
    <jsp:include page="header.jsp"/>

    <section id="checkoutMain">


        <br>
        <br>
        <p style="font-size: 32px;">Checkout</p>
        <br>
        <br>

        <div id="checkoutFormErrors">
            <c:if test="${p.hasValidationError}">
                <c:if test="${p.customerForm.hasNameError}">
                    ${p.customerForm.nameErrorMessage}<br>
                </c:if>
                <c:if test="${p.customerForm.hasAddressError}">
                    ${p.customerForm.addressErrorMessage}<br>
                </c:if>
                <c:if test="${p.customerForm.hasPhoneError}">
                    ${p.customerForm.phoneErrorMessage}<br>
                </c:if>
                <c:if test="${p.customerForm.hasEmailError}">
                    ${p.customerForm.emailErrorMessage}<br>
                </c:if>
                <c:if test="${p.customerForm.hasCcNumberError}">
                    ${p.customerForm.ccNumberErrorMessage}<br>
                </c:if>
            </c:if>
            <c:if test="${p.hasTransactionError}">
                Transactions have not been implemented yet.<br>
            </c:if>
        </div>
        <div id="checkoutFormAndInfo">
            <div id="checkoutFormBox">
                <form action="<c:url value='checkout'/>" method="post">
                    <table id="checkoutForm">

                        <tr>
                        <th>
                        </th>
                        <th>
                        </th>
                        </tr>
                        <tr>

                            <td>
                    Name
                            </td>
                            <td>
                    <input class="textField" type="text" size="20" maxlength="45" name="name"
                           value="${p.customerForm.name}"><br>
                            </td>
                        </tr>
                        <tr>
                            <td>
                    Address
                            </td>
                            <td>
                    <input class="textField" type="text" size="20" maxlength="45" name="address"
                           value="${p.customerForm.address}"><br>
                        </td>
                        </tr>
                        <tr>
                            <td>
                    Phone
                            </td>
                            <td>
                    <input class="textField" type="text" size="20" maxlength="45" id="phone" name="phone"
                           value="${p.customerForm.phone}"><br>
                            </td>
                        </tr>
                        <tr>
                            <td>
                    Email
                            </td>
                            <td>
                    <input class="textField" type="text" size="20" maxlength="45" name="email"
                           value="${p.customerForm.email}"><br>
                            </td>
                        </tr>
                        <tr>
                            <td>
                    Credit card
                            </td>
                            <td>
                    <input class="textField" type="text" size="20" maxlength="45" name="ccNumber">
                            </td>
                        </tr>
                    <br>
                        <tr>
                            <td>
                    Exp. date
                            </td>
                            <td>
                    <select class="selectMenu" name="ccMonth">
                        <c:set var="montharr"
                               value="${['January','February','March','April','May','June','July','August','September','October','November','December']}"/>
                        <c:forEach begin="1" end="12" var="month">
                            <option value="${month}"
                                    <c:if test="${p.customerForm.ccMonth eq month}">selected</c:if>>
                                    ${month}-${montharr[month - 1]}
                            </option>
                        </c:forEach>
                    </select>
                    <select class="selectMenu" name="ccYear">
                        <c:forEach begin="2018" end="2027" var="year">
                            <option value="${year}"
                                    <c:if test="${p.customerForm.ccYear eq year}">selected</c:if>>
                                    ${year}
                            </option>
                        </c:forEach>
                    </select>
                            </td>
                    </tr>
                        <tr>
                        </tr>
                        <tr>
                        <td>
                        <input id="boldSubmitButton" type="submit" value="Submit">
                        </td>
                        </tr>
                    </table>
                </form>
            </div>
            <div id="checkoutInfo">
        <span id="checkoutInfoText">
            Your credit card will be charged <strong>$${p.cart.subtotal/100 + 5}</strong><br>
            (<strong>$${p.cart.subtotal/100}</strong> + <strong>$5.00</strong> shipping)
        </span>
                <br>
                <br>
                <br>
            </div>
        </div>
    </section>

    <script type="text/javascript">
        $(document).ready(function(){
            $("#checkoutForm").validate({
                rules: {
                    name: {
                        required: true
                    },
                    email: {
                        required: true,
                        email: true
                    },
                    phone: {
                        required: true,
                        phoneUS: true,
                        minlength: 10
                    },
                    address: {
                        required: true
                    },
                    ccNumber: {
                        required: true,
                        creditcard: true
                    }
                }
            });
        });
    </script>
    <jsp:include page="footer.jsp"/>
</main>
</body>
</html>
