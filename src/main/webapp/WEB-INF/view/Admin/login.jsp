<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${options.optionSiteTitle} &lsaquo; 登录</title>
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
<body class="login login-action-login wp-core-ui locale-zh-cn">
<div id="login">
    <h1><a href="/" title="Welcome to TravelTribe" tabindex="-1">${options.optionSiteTitle}</a></h1>
    <%
        String username = "";
        String password = "";
        Cookie[] cookies = request.getCookies();
        for (int i = 0; i < cookies.length; i++) {
            if ("username".equals(cookies[i].getName())) {
                username = cookies[i].getValue();
            } else if ("password".equals(cookies[i].getName())) {
                password = cookies[i].getValue();
            }
        }
    %>
    <form name="loginForm" id="loginForm" method="post">
        <p>
            <label for="user_login">email<br />
                <input type="text" name="username" id="user_login" class="input" value="<%=username%>" size="20" required/></label>
        </p>
        <p>
            <label for="user_pass">password<br />
                <input type="password" name="password" id="user_pass" class="input" value="<%=password%>" size="20" required/>
            </label>
        </p>
        <p class="forgetmenot">
            <label for="rememberme">
                <input name="rememberme" type="checkbox" id="rememberme" value="1" checked /> 记住密码
            </label>
        </p>
        <p class="submit">
            <input type="button" name="wp-submit" id="submit-btn" class="button button-primary button-large" value="登录" />
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
    <p id="backtoblog"><a href="/">&larr; 返回到风吟博客</a> | <a href="/register">注册</a></p>
</div>

<script src="/js/jquery.min.js"></script>
<script type="text/javascript">
    $("#submit-btn").click(function () {
        var user = $("#user_login").val();
        var password = $("#user_pass").val();
        if(user=="") {
            alert("用户名不可为空!");
        } else if(password==""){
            alert("密码不可为空!");
        } else {
            $.ajax({
                async: false,
                type: "POST",
                url: '/loginVerify',
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data: $("#loginForm").serialize(),
                dataType: "json",
                success: function (data) {
                    if(data.code==0) {
                        alert(data.msg);
                    } else {
                        window.location.href="/admin";
                    }
                },
                error: function () {
                    alert("数据获取失败")
                }
            })
        }
    })
</script>
</body>
</html>