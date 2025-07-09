<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

/*Admin register form */
 body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        section {
            background-color: #fff;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 350px;
            text-align: center;
        }
        
         form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-top: 15px;
            font-weight: lighter;
        }

        input {
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        
        .btn {
            margin-top: 20px;
            padding: 10px;
            border: none;
            background-color: #007bff;
            color: white;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            display: block;
        }

        .btn:hover {
            background-color: #0056b3;
        }
        
         p {
            margin-top: 20px;
            text-align: center;
        }

        .login-link {
            width: 100%;
            margin: 10px auto 0;
        }

      h2 {
            margin-bottom: 20px;
            color: #333;
        }
        
       .m
       {
         color:red;
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
       <h2>Admin Register</h2>
       
       <p class="m"> <%=msg%> </p>
               
         <form action="admin-register" method="post">
               
               <label for="aname">Enter Admin Name:</label>
               <input type="text" name="name" id="aname">  
                
               <label for="apass">Enter Admin Password:</label>
               <input type="password" name="pass" id="apass">  
         
               <label for="aemail">Enter Admin Email:</label>
               <input type="email"  name="email" id="aemail">  
            
               <button type="submit" class="btn">Register</button>
         </form>
               
               <p>Already register?..</p>
               <a href="alogin" type="button" class="btn login-link">Login</a>

      </section>
      
</body>
</html>