<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: slawekp
  Date: 23.05.19
  Time: 22:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Rejestracja nowego urzytkownika</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"/>

</head>
<body>
<div class="container" style="width: 500px">

    <!-- Default form register -->
    <form:form method="post" modelAttribute="user" class="text-center border border-light p-5">

        <p class="h4 mb-4">Wprowadź wymagane dane</p>

        <div class="form-row mb-4">
            <div class="col">
                <!-- First name -->
                <form:input path="firstName" type="text" id="defaultRegisterFormFirstName" class="form-control"
                            placeholder="First name"/>
            </div>
            <div class="col">
                <!-- Last name -->
                <form:input path="lastName" type="text" id="defaultRegisterFormLastName" class="form-control"
                            placeholder="Last name"/>
            </div>
        </div>

        <!-- E-mail -->
        <form:input path="email" type="email" id="defaultRegisterFormEmail" class="form-control mb-4"
                    placeholder="E-mail"/>

        <!-- Password -->
        <form:input path="password" type="password" id="defaultRegisterFormPassword" class="form-control"
                    placeholder="Password" aria-describedby="defaultRegisterFormPasswordHelpBlock"/>


        <!-- Sign up button -->
        <button class="btn btn-info my-4 btn-block" type="submit">Zapisz</button>


    </form:form>
</div>
<!-- Default form register -->

</body>
</html>
