<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!doctype html>
<html>
<head>
    <title>Cart</title>
    <meta charset="utf-8">
    <meta name="description" content="The cart page">

    <!--
    normalize-and-reset.css is a basic CSS reset; useful for starting from ground zero.
    always include this first.
-->

    <link rel="stylesheet" href="<c:url value="/css/normalize-and-reset.css"/>">

    <!--
        cascading appropriately, we have:

        main.css    --  all things common
        header.css  --  header-specific rules
        footer.css  --  footer-specific rules
        <page>.css  --  page-specific rules
        extras.css  --  extras you may want
    -->

    <link rel="stylesheet" href="<c:url value="/css/main.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/header.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/footer.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/cart.css"/>">

</head>
<body>
<jsp:useBean id="p" scope="request" type="viewmodel.CartViewModel"/>

<main>
    <jsp:include page="header.jsp"/>

    <section id="cartMain">
    <c:set var="continue_shopping_location">
        <c:choose>
            <c:when test="${p.hasSelectedCategory}">
            category?category=${p.selectedCategory.name}
            </c:when>
            <c:otherwise>
            home
            </c:otherwise>
        </c:choose>
    </c:set>
        <div id="cartButtons">
            <c:url var="continue_shopping_url" value="${continue_shopping_location}"/>
            <button class="boldButton"><a href="${continue_shopping_url}" class="boldButtonContent">Continue shopping</a></button>
            <button class="boldButton">
                <a href="checkout" class="boldButtonContent">Proceed to checkout
                    <input type = "hidden" name="category" value=""/>
                </a></button>
        </div>
    <c:choose>
        <c:when test="${p.cart.numberOfItems == 1}">
        <p>Your shopping cart contains ${p.cart.numberOfItems} item</p>
        </c:when>
        <c:when test="${p.cart.numberOfItems > 1}">
        <p>Your shopping cart contains ${p.cart.numberOfItems} items</p>
        </c:when>
        <c:otherwise>
        <p>Your shopping cart appears to be empty</p>
        </c:otherwise>
    </c:choose>

        <c:if test="${p.cart.numberOfItems >= 1}">
        <table id="cartTable">
            <tr>
                <th>Book</th>
                <th>Quantity</th>
                <th>Price</th>
                <th></th>
            </tr>
            <c:forEach var="cartItem" items="${p.cart.items}" varStatus="iter">
                <tr>
                    <td>${cartItem.book.title}</td>
                    <td>${cartItem.quantity}</td>
                    <td>$${cartItem.book.price/100}</td>
                    <td>
                        <div class="incrDecrDiv">
                            <form action="cart" method="post">
                                <input type="hidden" name="bookId" value="${cartItem.bookId}"/>
                                <input type="hidden" name="action" value="increment"/>
                                <input class="addMinusButtons" type="submit" name="submit" value="&plus;"/>
                            </form>
                            <form action="cart" method="post">
                                <input type="hidden" name="bookId" value="${cartItem.bookId}"/>
                                <input type="hidden" name="action" value="decrement"/>
                                <input class="addMinusButtons" type="submit" name="submit" value="&minus;"/>
                            </form>

                        </div>
                    </td>
                </tr>
            </c:forEach>
        </table>

        <p>Subtotal: $${p.cart.subtotal/100}</p>
    </c:if>

</main>

    <jsp:include page="footer.jsp"/>

</body>
</html>
