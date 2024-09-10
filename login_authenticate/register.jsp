<%@ page import="java.sql.*" %>
<html>
<head>
    <title>User Registration</title>
    <style>
        body {
            text-align: center; 
            font-family: Arial, sans-serif; 
        }
        .container {
            display: inline-block; 
            text-align: left;
            margin-top: 50px; 
        }
        .myButton {
            font-size: 22px;
            margin: 5px; 
        }
        .myTextBox {
            font-size: 22px; 
            padding: 5px; 
        }
        .form-group {
            margin-bottom: 20px; 
        }
    </style>
</head>
<body>
    <h2>Register</h2>
    <div class="container">
        <form name="f1" method="post" action="insert.jsp">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" class="myTextBox" name="username" id="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" class="myTextBox" name="password" id="password" required>
            </div>
            <div class="form-group">
                <input type="submit" value="Register" class="myButton">
                <input type="reset" value="Reset" class="myButton">
            </div>
        </form>
    </div>

    
</body>
</html>
