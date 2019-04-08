<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>

<jsp:useBean id="selectedCategoryName" scope="request" type="String"/>
<jsp:useBean id="selectedBookList" scope="request" type="java.util.List"/>

<ul>
    <li><a href="test?category=classics">classics</a></li>
    <li><a href="test?category=fantasy">fantasy</a></li>
    <li><a href="test?category=mystery">mystery</a></li>
    <li><a href="test?category=romance">romance</a></li>

</ul>

<h1 style="text-transform: capitalize">${selectedCategoryName}</h1>

<table border="1">
    <!-- column headers -->
    <tr>
       <th>book_id</th>
       <th>title</th>
       <th>author</th>
       <th>price</th>
       <th>is_public</th>
       <th>category_id</th>
    </tr>
    <!-- column data -->
    <c:forEach var="book" items="${selectedBookList}">
        <jsp:useBean id="book" scope="page" type="business.book.Book"/>
        <tr>
            <td>${book.bookId}</td>
            <td>${book.title}</td>
            <td>${book.author}</td>
            <td>${book.price}</td>
            <td>${book.isPublic}</td>
            <td>${book.categoryId}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>