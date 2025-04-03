/**
 * Registration form validation and submission
 */
$(document).ready(function() {
    // Clear all error messages when input changes
    $("input").on('input', function() {
        var fieldId = $(this).attr('id');
        $("#" + fieldId + "-error").text('');
        $(this).removeClass('input-error');
    });

    $("#submit-btn").click(function() {
        // Clear previous errors and success message
        $(".error-message").text('');
        $("input").removeClass('input-error');
        $("#success-messages").text('');

        var user = $("#username").val().trim();
        var email = $("#email").val().trim();
        var nickname = $("#nickname").val().trim();
        var password = $("#password").val().trim();
        var confirmPass = $("#confirmPassword").val().trim();

        var isValid = true;

        // Validation checks
        if (user === "") {
            $("#username-error").text("Please enter a username");
            $("#username").addClass('input-error');
            isValid = false;
        } else if (user.length < 4 || user.length > 20) {
            $("#username-error").text("Username must be between 4-20 characters");
            $("#username").addClass('input-error');
            isValid = false;
        }

        if (nickname === "") {
            $("#nickname-error").text("Please enter a nickname");
            $("#nickname").addClass('input-error');
            isValid = false;
        }

        if (email === "") {
            $("#email-error").text("Please enter an email address");
            $("#email").addClass('input-error');
            isValid = false;
        } else {
            var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if(!emailRegex.test(email)) {
                $("#email-error").text("Please enter a valid email address");
                $("#email").addClass('input-error');
                isValid = false;
            }
        }

        if (password === "") {
            $("#password-error").text("Please enter a password");
            $("#password").addClass('input-error');
            isValid = false;
        } else if (password.length < 6) {
            $("#password-error").text("Password must be at least 6 characters");
            $("#password").addClass('input-error');
            isValid = false;
        }

        if (confirmPass === "") {
            $("#confirmPassword-error").text("Please confirm your password");
            $("#confirmPassword").addClass('input-error');
            isValid = false;
        } else if (password !== confirmPass) {
            $("#confirmPassword-error").text("Passwords do not match");
            $("#confirmPassword").addClass('input-error');
            isValid = false;
        }

        // Submit form data if valid
        if (isValid) {
            submitRegistration();
        }
    });

    function submitRegistration() {
        $.ajax({
            async: false,
            type: "POST",
            url: '/registerSubmit',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: $("#registerForm").serialize(),
            dataType: "json",
            success: function(data) {
                if (data.code == 0) {
                    // Show success message
                    alert("Registration successful! Redirecting...");
                    setTimeout(function() {
                        window.location.href = "/login";
                    }, 1500);
                } else {
                    // Show server error
                    if (data.field) {
                        $("#" + data.field + "-error").text(data.msg);
                        $("#" + data.field).addClass('input-error');
                    } else {
                        $("#confirmPassword-error").text(data.msg);
                    }
                }
            },
            error: function() {
                $("#confirmPassword-error").text("Registration failed. Please try again later.");
            }
        });
    }
});