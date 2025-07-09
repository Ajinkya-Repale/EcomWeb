<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .login-form {
      background-color: #fff;
      padding: 30px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
      width: 300px;
    }

    section h2 {
      text-align: center;
      margin-bottom: 20px;
      
    }
    
    p 
    {
      color:red;
      text-align: center;
    } 
    

    .login-form label {
      display: block;
      margin-bottom: 8px;
      font-weight: bold;
    }

    .login-form input {
      width: 100%;
      padding: 10px;
      margin-bottom: 15px;
      border: 1px solid #ccc;
      border-radius: 4px;
      box-sizing: border-box;
    }

    .login-form button {
      width: 100%;
      padding: 10px;
      background-color: #4CAF50;
      color: white;
      border: none;
      border-radius: 4px;
      font-size: 16px;
      cursor: pointer;
    }

    .login-form button:hover {
      background-color: #45a049;
    }
    

</style>
</head>
<body>
<%
String msg =(String)session.getAttribute("msg");
if(msg == null)
{
	msg="";
}

session.removeAttribute("msg");

%>
   
<section>
	   <h2>Admin Login</h2> 
	   <p><%=msg%></p>
    
   <form class="login-form" action="admin-login" method="post">
	    <label for="name">Admin Name:</label>
	    <input type="text" id="name" name="name" required>
	
	    <label for="password">Admin Password:</label>
	    <input type="password" id="password" name="pass" required>
	
	    <button type="submit">Login</button>
     </form>
   </section>
   
</body>
</html>