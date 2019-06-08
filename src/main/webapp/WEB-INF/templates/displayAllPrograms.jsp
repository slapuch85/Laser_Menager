<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: slawekp
  Date: 26.05.19
  Time: 17:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>Programy</title>
    <script src="/resources/js/showHiddenDiv.js" type="text/javascript"></script>
    <script src="webjars/jquery/3.1.1/jquery.min.js"></script>
    <script src="webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link href="webjars/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="/resources/css/style.css" rel="stylesheet">
    <%--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"/>--%>


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
    <div style="clear: both"></div>
    <button type="button" id="showDiv" class="btn btn-info">dodaj program</button>

    <div class="hiddenDiv">
        <div class="programForm">
            <form:form method="post" modelAttribute="program" action="addProgram">
                <div class="small form-sm">
                    <form:input id="programTitle" path="title" class="form-control form-control-sm"/>
                    <label for="programTitle" class="disabled">Program</label>
                    <form:errors path="title" cssClass="error"/>
                </div>
                <div class="md-form form-sm">
                    <form:textarea id="programComment" path="comment" class="form-control form-control-sm"/>
                    <label for="programTitle" class="disabled">Komentarz</label>
                    <form:errors path="comment" cssClass="error"/>
                </div>
                <div class="md-form form-sm">
                    <input type="submit" value="Dodaj" class="btn btn-info btn-block">
                </div>
            </form:form>
        </div>
    </div>

    <div class="content">
        <h4 style="text-align: center">Kimla - programy do wycięcia</h4>
        <table class="table table-sm table-striped">
            <thead class="thead-dark">
            <tr>
                <th>Program</th>
                <th>Komentarz</th>
                <th>Akcja</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${allPrograms}" var="program">
                <tr>
                    <td>${program.title}</td>
                    <td>${program.comment}</td>
                    <td>
                        <div id="delBtn">
                            <form action="/program/remove/" method="post">
                                <input type="hidden" name="programId" value="${program.id}">
                                <input type="hidden" name="userId" value="${userSession.id}">
                                <input type="submit" value="Usuń" class="btn btn-link">
                            </form>
                        </div>
                        <div id="editBtn">
                            <form action="/program/edit/" method="post">
                                <input type="hidden" name="id" value="${program.id}">
                                <input type="submit" value="Edytuj" class="btn btn-link">
                            </form>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
