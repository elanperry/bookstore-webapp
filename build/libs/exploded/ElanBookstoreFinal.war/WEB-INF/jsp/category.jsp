<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>

<link rel="stylesheet" type="text/css" href="<c:url value="/css/category.css"/>">

<!doctype html>
<html>
<head>
    <title>Bookstore Category Page</title>
    <meta charset="utf-8">
    <meta name="description" content="The category page for a bookstore">

    <!--
        normalize-and-reset.css.css is a basic CSS reset; useful for starting from ground zero.
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
    <link rel="stylesheet" href="<c:url value="/css/category.css"/>">

</head>

<body>
<jsp:useBean id="p" scope="request" type="viewmodel.CategoryViewModel"/>
<jsp:include page="header.jsp"/>
<main>
    <section id="categoryPage">
        <ul id="categoryNav">
            <a id="categoryNavHeader"> Categories: </a>
            <!-- category buttons -->
            <c:forEach var="category" items="${p.categories}">
                <c:choose>
                    <c:when test="${p.selectedCategory.name==category.name}">
                        <li class="selectedCategory">${p.selectedCategory.name}</li>
                    </c:when>
                    <c:otherwise>
                        <li class="unselectedCategory">
                            <a class="unselectedCategoryLink" href="category?category=${category.name}">${category.name}</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </ul>
            <section id="categoryMain">
                <! -- books in selected category -->
                <ul id="bookList">
                    <c:forEach var="book" items="${p.selectedCategoryBooks}">
                    <li class="bookBlock">
                        <c:set var="bookImageFileName">
                            <my:ImageName bookTitle="${book.title}"/>
                        </c:set>
                        <div class="bookImage">
                            <a href="category.jsp">
                                <img src="${initParam.bookImages}${bookImageFileName}.gif" alt="${bookImageFileName}"/>
                            </a>
                        </div>
                        <div class="bookInfoAndButtons">
                            <ul class = "bookInfo">
                                <li class="bookTitle">${book.title}</li>
                                <li class="bookAuthor">${book.author}</li>
                                <li class="bookPrice">$${book.price/100}</li>
                            </ul>
                            <div class="bookButtons">
                                <c:if test="${book.isPublic}">
                                    <img class="readNow" src="${initParam.siteImages}literature-24.png" alt="Read icon"/>
                                </c:if>
                                <button class="addToCart"
                                        data-book-id="${book.bookId}"
                                        data-action="add">
                                    &plus; Add
                                </button>
                            </div>
                        </div>
                        </li>
                    </c:forEach>

                </ul>
            </section>
    </section>
    <jsp:include page="footer.jsp"/>
</main>
<script src="<c:url value="/js/ajax-functions.js"/>" type="text/javascript"></script>
<script>
    var addToCartButtons = document.getElementsByClassName("addToCart");
    for (var i = 0; i < addToCartButtons.length; i++) {
        addToCartButtons[i].addEventListener("click", function(event) {
            addToCartEvent(event.target) });
    }

    function addToCartEvent(button) {
        var data = {"bookId":button.dataset.bookId,
            "action":button.dataset.action
        };
        ajaxPost('category', data, function(text, xhr) {
            addToCartCallback(text, xhr)
        });
    }

    function addToCartCallback(responseText, xhr) {
        var cartCount = JSON.parse(responseText).cartCount;
        document.getElementById('cartCount').textContent = '' + '(' + cartCount + ')';
    }
</script>
</body>
</html>
