<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
    <jsp:useBean id="p" scope="request" type="viewmodel.BaseViewModel"/>

    <section id="leftHeader">

        <div id="logo">
            <a href="home">
                <img src="${p.siteImagePath}giraffe128.png" alt="Bookstore logo"/>
            </a>
        </div>

        <div id="logoText">
            <a href="home">
                <img src="${p.siteImagePath}logo-text6.png" alt="Logo text"/>
            </a>
        </div>

    </section>


    <section id="midHeader">

        <form action="category">
            <input id="searchForm" type="search" name="searchTerm" placeholder="Search by Title/Author...">
            <input id="searchIcon" type="image" src="${p.siteImagePath}search-32.png" alt="search icon">

        </form>

    </section>

    <section id="rightHeader">
        <ul>
            <li>
                <a href="cart">
                <img src="${p.siteImagePath}cart-59-48.png" alt="cart icon"/>
                </a>
            <span id="cartCount">(${p.cart.numberOfItems})</span>
            <span><button style="background-color: black"><a href="#">Sign In</a></button></span></li>
            <li><div class="dropdown">
                <button class="dropbtn" style="cursor: hand;">Categories &#9660</button>
                <div class="dropdown-content">
                    <c:forEach var="category" items="${p.categories}">
                        <a href="category?category=${category.name}">${category.name}</a>
                    </c:forEach>
                </div>

                </div>
            </li>

        </ul>

    </section>




</header>
