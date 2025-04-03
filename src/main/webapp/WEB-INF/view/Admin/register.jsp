<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>${options.optionSiteTitle} &lsaquo; Register</title>
    <link rel="stylesheet" href="/plugin/font-awesome/css/font-awesome.min.css">
    <link rel="shortcut icon" href="/img/logo.png">
    <link rel='stylesheet' id='dashicons-css' href='/plugin/login/dashicons.min.css' type='text/css' media='all'/>
    <link rel='stylesheet' id='buttons-css' href='/plugin/login/buttons.min.css' type='text/css' media='all'/>
    <link rel='stylesheet' id='forms-css' href='/plugin/login/forms.min.css' type='text/css' media='all'/>
    <link rel='stylesheet' id='l10n-css' href='/plugin/login/l10n.min.css' type='text/css' media='all'/>
    <link rel='stylesheet' id='login-css' href='/plugin/login/login.min.css' type='text/css' media='all'/>
    <link rel='stylesheet' id='register-css' href='/css/register.css' type='text/css' media='all'/>
    <meta name='robots' content='noindex,follow'/>
    <meta name="viewport" content="width=device-width"/>
</head>
<body class="login login-action-login wp-core-ui locale-en-us">
<div id="login">
    <h1><a href="/" title="Welcome to our site!" tabindex="-1">${options.optionSiteTitle}</a></h1>
    <form name="registerForm" id="registerForm" method="post">
        <p>
            <label for="username">Username<br/>
                <input type="text" name="username" id="username" class="input"
                       size="20" required/>
                <span id="username-error" class="error-message"></span>
            </label>
        </p>
        <p>
            <label for="nickname">Nickname<br/>
                <input type="text" name="nickname" id="nickname" class="input"
                       size="20" required/>
                <span id="nickname-error" class="error-message"></span>
            </label>
        </p>
        <p>
            <label for="email">Email<br/>
                <input type="text" name="email" class="input" id="email"
                       size="20" required/>
                <span id="email-error" class="error-message"></span>
            </label>
        </p>
        <p>
            <label for="password">Password<br/>
                <input type="password" name="password" id="password" class="input"
                       size="20" required/>
                <span id="password-error" class="error-message"></span>
            </label>
        </p>
        <p>
            <label for="confirmPassword">Confirm Password<br/>
                <input type="password" name="confirmPassword" id="confirmPassword" class="input"
                       size="20" required/>
                <span id="confirmPassword-error" class="error-message"></span>
            </label>
        </p>
        <p class="submit">
            <input type="button" name="wp-submit" id="submit-btn" class="button button-primary button-large"
                   value="Register"/>
        </p>
    </form>

    <p id="backtoblog"><a href="/">Back to TravelTribe Login</a> | <a href="/login">Login</a></p>
</div>

<div class="clear"></div>

<script src="/js/jquery.min.js"></script>
<script src="/js/register-validation.js"></script>
</body>
</html>