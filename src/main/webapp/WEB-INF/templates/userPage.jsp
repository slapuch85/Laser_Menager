<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: slawekp
  Date: 01.06.19
  Time: 14:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <%-- <script src="<c:url value="/webjars/jquery/3.1.1/jquery.min.js"/>"></script>
     <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
     <link rel="Stylesheet" type="text/css" href="https://kursbootstrap.pl/examples/docs.css" />--%>
    <script src="/resources/js/showHiddenDiv.js" type="text/javascript"></script>
    <script src="<c:url value="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"/>"></script>
    <link href="<c:url value="/webjars/bootstrap/4.3.1/css/bootstrap.min.css"/>" rel="stylesheet">
    <%--  <link href="<c:url value="/resources/css/bootstrap.css"/>" rel="stylesheet"/>--%>
    <link href="/resources/css/style.css" rel="stylesheet">
    <title>Title</title>


</head>
<body>

<div class="container">

    <div class="menue">
        <ul>
            <li><a href="/allProgramList">Programy do wycięcia</a></li>
            <li><a href="/history">Wycięte programy</a></li>
            <li>
                <form method="post" action="/userPage">
                    <input type="hidden" name="id" value="${userSession.id}">
                    <input type="submit" value="${userSession.email}" class="btn btn-link">
                </form>
            </li>
            <li><a href="/">Wyloguj</a></li>
        </ul>
    </div>

    <div class="content">
        <button type="button" id="showDiv" class="btn btn-info">Utwórz</button>
        <div class="hiddenDiv">
            <div class="messageForm">
                <form:form method="post" modelAttribute="newMessage" action="/saveMessage">

                    <div class="md-form form-sm">
                        <form:select id="adresat" path="receiver.id" class="form-control form-control-sm">
                            <form:options items="${allUsers}" itemLabel="email" itemValue="id"/>
                        </form:select>
                        <label for="adresat">Do: </label>
                    </div>

                    <div class="md-form form-sm">
                        <form:textarea id="content" path="content" class="form-control form-control-sm"/>
                        <label for="content">Treść</label>
                        <form:errors path="content" cssClass="error"/>
                    </div>

                    <form:input path="sender.id" type="hidden" value="${currentUser.id}"/>
                    <form:input path="newMessage" type="hidden" value="1"/>

                    <div class="md-form form-sm">
                        <input type="submit" value="Wyślij" class="btn btn-info btn-block">
                    </div>
                </form:form>
            </div>
        </div>

        <div class="messages">
            <h2 style="text-align: center">Wiadomości - odebrane</h2>
            <table class="table table-sm table-bordered">
                <thead class="thead-light">
                <tr>
                    <th style="width: 300px">Od</th>
                    <th>Wiadomość</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${usersMessages}" var="message">
                    <tr>
                        <td style="width: 300px">${message.sender.email}</td>
                        <td>${message.content}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <%--<!-- JavaScript plugins (requires jQuery) -->
    <script src="https://code.jquery.com/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>--%>
</body>
</html>
