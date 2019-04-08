<%@ tag body-content="empty" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ attribute name="bookTitle" rtexprvalue="true" required="true" type="java.lang.String" description="Book Title transform to book images filename" %>
<c:set var="spacesReplaced" value="${fn:replace(bookTitle,' ','-')}"/>
<c:set var="lowerCaseFinal" value="${fn:toLowerCase(spacesReplaced)}"/>
${lowerCaseFinal}
