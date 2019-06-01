<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: slawekp
  Date: 28.05.19
  Time: 20:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edycja programu</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<div class="container" style="width: 650px">
    <div class="tweetForm" style="width: 600px">
        <h4 style="text-align: center">Edytuj wybrane pola</h4>
        <form:form method="post" modelAttribute="programToEdit" action="/program/merge">
            <input type="hidden" name="id" value="${programToEdit.id}" >
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
                <input type="submit" value="Zmień" class="btn btn-primary btn-block">
            </div>
        </form:form>
    </div>
</div>
</body>
</html>
