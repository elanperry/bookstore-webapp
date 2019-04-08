<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!doctype html>
<html>
<head>
    <title>My Bookstore</title>
    <meta charset="utf-8">
    <meta name="description" content="The homepage for My Bookstore">

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
    <link rel="stylesheet" href="<c:url value="/css/homepage.css"/>">

</head>

<body>
<jsp:useBean id="p" scope="request" type="viewmodel.HomepageViewModel"/>
<main>
    <jsp:include page="header.jsp"/>
    <section id="upperHome">
        <img id=banner src="${initParam.siteImages}banner1.png" alt="Banner image" />
        <img id="bannerText" src="${initParam.siteImages}banner text1.png" alt="Banner image" />

    </section>
    <section id="lowerHome">

        <ul id="suggestedBookList">
            <li class="suggestedBookItem">
                <a href="#">
                    <img src="${initParam.bookImages}a-wrinkle-in-time.jpg" alt="A Wrinkle In Time" />
                </a>
            </li>
            <li class="suggestedBookItem">
                <a href="#">
                    <img src="${initParam.bookImages}lord-of-the-flies.jpg" alt="Lord of the Flies" />
                </a>
            </li>
            <li class="suggestedBookItem">
                <a href="#">
                    <img src="${initParam.bookImages}all-the-light-we-cannot-see.jpg" alt="All The Light We Cannot See" />
                </a>
            </li>
            <li class="suggestedBookItem">
                <a href="#">
                    <img src="${initParam.bookImages}wonder.jpg" alt="Wonder" />
                </a>
            </li>
        </ul>
    </section>
    <jsp:include page="footer.jsp"/>
</main>
</body>
</html>
