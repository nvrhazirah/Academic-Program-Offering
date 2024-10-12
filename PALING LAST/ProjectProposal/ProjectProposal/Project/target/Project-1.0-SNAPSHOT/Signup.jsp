<%-- 
    Document   : Signup
    Created on : Jun 27, 2024, 11:32:55 PM
    Author     : marli
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
        <link rel="stylesheet" href="signup.css">
        <script src="https://kit.fontawesome.com/9660894674.js" crossorigin="anonymous"></script>    </head>
        <script>
            function redirectToLogin() {
                window.location.href = 'Login.jsp'; // Redirect to Login.jsp
            }
        </script>
    
    <body>
                   
        <div class="container">
            <div class="form-box">
                <h1 id="title">Sign Up</h1>
                <form action="SignupServlet" method="post">
                    <div class="input-group">
                        
                        <div class="input-field" id="nameField">
                            <i class="fa-solid fa-user"></i>
                            <input type="text" name="name" placeholder="Name">
                        </div>
                        <div class="input-field">
                            <i class="fa-solid fa-envelope"></i>
                            <input type="email" name="email" placeholder="Email">
                        </div>
                        <div class="input-field">
                            <i class="fa-solid fa-circle-chevron-down"></i>
                            <select name="usertype">
                                <option value="quality">Peg. Kualiti</option>
                                <option value="kprogram">Ketua Program</option>
                            </select>
                        </div>
                        <div class="input-field">
                            <i class="fa-solid fa-lock"></i>
                            <input type="password" name="password" placeholder="Password">
                        </div>
                        <div class="btn-field">
                            <button type="submit" id="signupBtn">Sign up</button>
                            <button type="button" id="signinBtn" onclick="redirectToLogin()">Login</button>
                        </div>
                        
                    </div>
                </form>
            </div>
        </div>
        
    </body>
</html>
