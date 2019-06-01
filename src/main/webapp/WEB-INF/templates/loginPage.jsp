<%--
  Created by IntelliJ IDEA.
  User: slawekp
  Date: 21.05.19
  Time: 21:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"/>
</head>
<body>
<div class="container" style="width: 500px">
    <div class="card">

        <h5 class="card-header info-color white-text text-center py-4">
            <strong>Zaloguj się</strong>
        </h5>

        <!--Card content-->
        <div class="card-body px-lg-5 pt-0">

            <!-- Form -->
            <form class="text-center" style="color: #757575;" method="post" action="/login">

                <!-- Email -->
                <div class="md-form">
                    <input name="email" type="email" id="materialLoginFormEmail" class="form-control">
                    <label for="materialLoginFormEmail">E-mail</label>
                </div>

                <!-- Password -->
                <div class="md-form">
                    <input name="password" type="password" id="materialLoginFormPassword" class="form-control">
                    <label for="materialLoginFormPassword">Hasło</label>
                </div>

                <div class="d-flex justify-content-around">
                        <!-- Remember me -->
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="materialLoginFormRemember">
                            <label class="form-check-label" for="materialLoginFormRemember">Zapamiętaj mnie</label>
                        </div>
                    <div>
                        <!-- Forgot password -->
                        <a href="">Zapomniałeś hasła?</a>
                    </div>
                </div>

                <!-- Sign in button -->
                <button class="btn btn-info my-4 btn-block" type="submit">
                    Zaloguj
                </button>

                <!-- Register -->
                <p>Nie masz konta?
                    <a href="/addUser">Zarejestruj się</a>
                </p>

            </form>
            <!-- Form -->

        </div>

    </div>
</div>
</body>
</html>
