<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${options.optionSiteTitle} &lsaquo; Login</title>
    <link rel="stylesheet" href="/plugin/font-awesome/css/font-awesome.min.css">
    <link rel="shortcut icon" href="/img/logo.png">
    <link rel="stylesheet" href="/plugin/login/dashicons.min.css">
    <link rel="stylesheet" href="/plugin/login/buttons.min.css">
    <link rel="stylesheet" href="/plugin/login/forms.min.css">
    <link rel="stylesheet" href="/plugin/login/l10n.min.css">
    <link rel="stylesheet" href="/plugin/login/login.min.css">
    <link rel="stylesheet" href="/css/login.css">
    <meta name='robots' content='noindex,follow' />
</head>
<body class="login login-action-login wp-core-ui locale-en">
<div id="login">
    <h1><a href="/" title="Welcome to TravelTribe" tabindex="-1">${options.optionSiteTitle}</a></h1>
    <%
        String username = "";
        String password = "";
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                if ("username".equals(cookies[i].getName())) {
                    username = cookies[i].getValue();
                } else if ("password".equals(cookies[i].getName())) {
                    password = cookies[i].getValue();
                }
            }
        }
    %>
    <form name="loginForm" id="loginForm" method="post">
        <p>
            <label for="user_login">Email<br />
                <input type="email" name="username" id="user_login" class="input" value="<%=username%>" size="20" required/></label>
            <span id="emailError" class="error-message">Please enter a valid email address</span>
        </p>
        <p>
            <label for="user_pass">Password<br />
                <input type="password" name="password" id="user_pass" class="input" value="<%=password%>" size="20" required/>
            </label>
            <span id="passwordError" class="error-message">Please enter your password</span>
        </p>
        <p class="forgetmenot">
            <label for="rememberme">
                <input name="rememberme" type="checkbox" id="rememberme" value="1" checked /> Remember me
            </label>
        </p>
        <p class="submit">
            <input type="button" name="wp-submit" id="submit-btn" class="button button-primary button-large" value="Log In" />
        </p>
    </form>

    <script type="text/javascript">
        function wp_attempt_focus(){
            setTimeout( function(){ try{
                d = document.getElementById('user_login');
                d.focus();
                d.select();
            } catch(e){}
            }, 200);
        }

        wp_attempt_focus();
        if(typeof wpOnload=='function')wpOnload();
    </script>
    <p id="backtoblog"><a href="/article">&larr; Back to TravelTribe</a> | <a href="/register">Register</a></p>
</div>

<script src="/js/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        // Email validation function
        function validateEmail(email) {
            const re = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
            return re.test(String(email).toLowerCase());
        }

        $("#submit-btn").click(function () {
            // Reset error messages
            $(".error-message").hide();
            $(".input").removeClass("input-error");

            var user = $("#user_login").val().trim();
            var password = $("#user_pass").val().trim();
            var isValid = true;

            // Validate email
            if(user === "") {
                $("#emailError").text("Email cannot be empty!").show();
                $("#user_login").addClass("input-error");
                isValid = false;
            } else if(!validateEmail(user)) {
                $("#emailError").text("Please enter a valid email address!").show();
                $("#user_login").addClass("input-error");
                isValid = false;
            }

            // Validate password
            if(password === "") {
                $("#passwordError").text("Password cannot be empty!").show();
                $("#user_pass").addClass("input-error");
                isValid = false;
            }

            if(!isValid) {
                return false;
            }

            // Disable button to prevent duplicate submissions
            $("#submit-btn").prop("disabled", true).val("Logging in...");

            $.ajax({
                type: "POST",
                url: '/loginVerify',
                data: $("#loginForm").serialize(),
                dataType: "json",
                success: function (data) {
                    if(data.code == 0) {
                        alert(data.msg);
                    } else {
                        window.location.href = data.redirectUrl || "/article";
                    }
                },
                error: function (xhr, status, error) {
                    alert("Login failed: " + (xhr.responseJSON?.msg || "Please try again later"));
                },
                complete: function() {
                    $("#submit-btn").prop("disabled", false).val("Log In");
                }
            });
        });

        // Submit form on Enter key press
        $("#loginForm").keypress(function(e) {
            if(e.which == 13) {
                $("#submit-btn").click();
            }
        });
    });
</script>
</body>
</html> 