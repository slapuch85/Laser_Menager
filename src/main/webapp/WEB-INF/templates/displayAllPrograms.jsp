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

      <link rel="stylesheet" href="/resources/css/style.css"/>

    <link href="/webjars/bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="webjars/font-awesome/5.8.2/css/all.min.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="/resources/js/script.js" type="text/javascript"></script>
    <script src="webjars/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <script src="webjars/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<div class="container">
    <div class="meni">
        <ol>
            <li><a href="#">Strona główna</a></li>
            <li><a href="#">Klasyki NES</a></li>
            <li><a href="#">Gry filmowe</a></li>
            <li><a href="#">Bijatyki</a></li>
            <li>
                <form method="post" action="/userPage">
                    <i class="fas fa-envelope"></i> <span id="loggedUser">Zalogowano jako:</span>
                    <input type="hidden" name="id" value="${userSession.id}">
                    <input type="submit" value="${userSession.email}" class="btn btn-link">
                </form>
            </li>
            <li><a href="#">Wyloguj</a></li>
        </ol>
    </div>
    <div class="programForm" style="width: 700px">
        <h4 style="text-align: center">Dodaj nowy program</h4>
        <form:form method="post" modelAttribute="program" action="addProgram">
            <div class="md-form form-sm">
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
                <input type="submit" value="Dodaj" class="btn btn-primary btn-block">
            </div>
        </form:form>
    </div>

    <div class="content" style="width: 700px">
        <h2 style="text-align: center">Kimla - programy do wycięcia</h2>
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
                                <input type="hidden" name="id" value="${program.id}">
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
        <p><a href="/" class="btn btn-block btn-primary">Wyloguj</a></p>
    </div>
</div>
</body>
</html>
