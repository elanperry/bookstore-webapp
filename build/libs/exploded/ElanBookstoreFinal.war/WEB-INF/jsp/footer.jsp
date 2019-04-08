<footer>
    <jsp:useBean id="p" scope="request" type="viewmodel.BaseViewModel"/>
    <section id="leftFooter">

        <p>&copy; 2018, Elan Books</p>

    </section>


    <section id="midFooter">

        <div>
            <ul id="contact">
                <li><a href="#">Contact Us</a></li>
                <li>&#9679;</li>
                <li><a href="#">Directions</a></li>
                <li>&#9679;</li>
                <li><a href="#">Privacy</a></li>
            </ul>
        </div>


    </section>

    <section id="rightFooter">

        <div >
            <ul id="socialMedia">
                <li><a href="#"><img src="${p.siteImagePath}facebook.png" width="32" height="32"></a></li>
                <li><a href="#"><img src="${p.siteImagePath}twitter.png" width="32" height="32"></a></li>
                <li><a href="#"><img src="${p.siteImagePath}instagram.png" width="32" height="32"></a></li>
            </ul>
        </div>

    </section>




</footer>
