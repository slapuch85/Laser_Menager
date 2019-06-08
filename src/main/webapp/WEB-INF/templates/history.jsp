<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>History</title>
    <script src="<c:url value="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"/>"></script>
    <link href="<c:url value="/webjars/bootstrap/4.3.1/css/bootstrap.min.css"/>" rel="stylesheet">
    <%--  <link href="<c:url value="/resources/css/bootstrap.css"/>" rel="stylesheet"/>--%>
    <link href="/resources/css/style.css" rel="stylesheet">
</head>
<body>

<div class="container">
    <div class="menue">
        <ul>
            <li><a href="/allProgramList">Programy do wycięcia</a></li>
            <li><a href="#">Wycięte programy</a></li>
            <li>
                <form method="post" action="/userPage">
                    <input type="hidden" name="id" value="${userSession.id}">
                    <input type="submit" value="${userSession.email}" class="btn btn-link">
                </form>
            </li>
            <li><a href="#">Wyloguj</a></li>
        </ul>
    </div>
    <div class="content">
        <h2 style="text-align: center">10 ostatnio wyciętych programów</h2>
        <table class="table table-sm table-striped">
            <thead class="thead-dark">
            <tr>
                <th>Program</th>
                <th>Data wycięcia</th>
                <th>Operator</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${history}" var="history">
                <tr>
                    <td>${history.programName}</td>
                    <td>${history.deleted}</td>
                    <td>${history.userEmail}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>


</div>

</body>
</html>
