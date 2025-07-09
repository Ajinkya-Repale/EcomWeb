<%@page import="java.util.Set"%>
<%@page import="com.MainApp.Entity.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

/*Nav bar */

  body {
      margin: 0;
      font-family: Arial, sans-serif;
    }

      .navbar {
      background-color: #333;
      overflow: hidden;
      display: flex;
      justify-content: flex-end; 
      padding: 0 20px;
    }

    .navbar a {
      color: white;
      text-decoration: none;
      padding: 14px 20px;
      display: block;
      transition: all 0.3s ease;
    }

     .navbar a.home:hover {
      background-color: #1e90ff; /* Dodger blue background */
      transform: scale(1.05);     /* Slight zoom */
    }

     .navbar a.logout:hover {
      background-color: #dc3545; /* Red background */
      color: #fff;
      font-weight: bold;
    }
    
    
    /*product display grid*/
    
    body {
      font-family: Arial, sans-serif;
      
      background-color: #f5f5f5;
    }

    .product-grid {
      display: grid;
      margin:25px;
      grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
      gap: 20px;
    }

    .product-card {
      background-color: #fff;
      border-radius: 10px;
      padding: 15px;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
      display: flex;
      flex-direction: column;
      align-items: center;
      text-align: center;
    }

    .product-card img {
      max-width: 100%;
      height: 180px;
      object-fit: cover;
      border-radius: 8px;
    }

    .product-name {
      font-size: 1.2em;
      margin: 10px 0 5px;
      font-weight: bold;
    }

    .product-price {
      color: #28a745;
      font-size: 1.1em;
      margin-bottom: 10px;
    }

    .product-description {
      font-size: 0.95em;
      color: #555;
    }
    
    .addtocart {
      padding: 10px 15px;
      margin:3px;
      background-color: #007bff;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-weight: bold;
      transition: background-color 0.3s ease;
    }

    .addtocart:hover {
      background-color: #0056b3;
    }
    
    .delete-cart
    {
      padding: 10px 15px;
      background-color: #007bff;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-weight: bold;
      transition: background-color 0.3s ease;
    }
    
     .delete-cart:hover {
      background-color: red;
    }
    
    /*spacer*/
    
     .spacer {
      flex-grow: 1; /* Pushes the button to the bottom */
    }
    
    /*h1*/
    
    .h1
    {
      text-align: center;
      margin-top: 10px;
      margin-bottom: 10px;
    }
    
/*category*/

	.category-filter {
	  display: flex;
  justify-content: flex-end; /* Aligns to the right */
  align-items: center;
  gap: 10px;
  margin-bottom: 20px;
	}
	
	.category-filter label {
	  font-weight: bold;
	}

	.category-filter select {
	  padding: 8px 12px;
	  font-size: 1em;
	  border-radius: 5px;
	  border: 1px solid #ccc;
	}




</style>


</head>
<body>
<%
String utoken=(String)session.getAttribute("utoken");

if(utoken != null)
{
%>

   <!-- Nav bar start -->
   
  
    
   
   <div class="navbar">
    <div class="nav-left">
      <a href="home" class="home">Home</a>
    </div>
  </div>

   <!-- Nav bar Ends -->
   
   <h1>hello,<%=utoken %></h1>
   
   
 <%
 List<Product> l=(List<Product>)  request.getAttribute("lcp");
 %>

 <div class="product-grid">

<%
for(Product p:l)
{
	%>
	  <div class="product-card">
      <img src="/images/<%=p.getPimageName() %> " alt="Product 1">
      <div class="product-name"> <%=p.getPname() %> </div>
      <div class="product-price"> <%=p.getPprice() %> </div>
      <div class="product-description"> <%=p.getPdescription() %>  </div>
      <div class="spacer"></div>
      <div>
      <form action="#" method="post">
          <input type="hidden" name="pid" value="<%=p.getPid()%>">
          <input type="hidden" name="aname" value="<%=p.getAdminName()%>">
          <input type="hidden" name="uname" value="<%=utoken%>">
          <button class="addtocart">Order</button>
      </form>
      </div>
      <div></div>
      <div>
      <form action="delete-cart" method="post">
          <input type="hidden" name="pid" value="<%=p.getPid()%>">
          <input type="hidden" name="uname" value="<%=utoken%>">
          <button class="delete-cart">Remove</button>
      </form>
      </div>
    </div>
    
	<% 
}


%>


</div> 
   
 
   
<script type="text/javascript">

   
  
  

</script>   
   
   
   
   
   
<%		
}
else
{
	response.sendRedirect("userlogin.jsp");
	session.setAttribute("msg", "Login then access home");
}

%>




</body>
</html>