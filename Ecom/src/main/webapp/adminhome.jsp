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
    
    
    /*Add product button*/
    
    .button-container {
      margin-top: 5vh; /* Responsive top margin: 5% of viewport height */
      padding-left: 20px; /* Optional: adds space from the left */
    }
    
    button {
      padding: 12px 24px;
      font-size: 16px;
      border: none;
      cursor: pointer;
      margin-right: 15px;
      transition: all 0.3s ease;
      border-radius: 5px;
    }

    .ad {
      background-color: #28a745; /* green */
      color: white;
    }

    .ad:hover {
      background-color: #218838;
      transform: scale(1.05); /* subtle zoom on hover */
    }

    .ed {
      background-color: #ffc107; /* yellow/orange */
      color: black;
    }

    .ed:hover {
      background-color: #e0a800;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.2); /* glow effect */
    }
    
   /*Add product form*/
   
   #box
   {
    display: none;
   }
   
   .form-container {
      position: relative;
      width: 400px;
      margin: 50px auto;
      padding: 20px 20px 30px 20px;
      border: 1px solid #ccc;
      border-radius: 10px;
      background-color: white;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    .close-btn-top {
      position: absolute;
      top: 10px;
      right: 10px; 
      background-color: #dc3545;
      color: white;
      border: none;
      border-radius: 60%;
      width: 30px;
      height: 30px;
      font-weight: bold;
      font-size: 16px;  
      line-height: 5px;
      text-align: center;
      cursor: pointer;
    }
    
     .form-container h2 {
      text-align: center;
      margin-top: 0;
    }

    .form-group {
      margin-bottom: 15px;
    }

    .form-group label {
      display: block;
      margin-bottom: 5px;
    }

    .form-group input,
    .form-group select,
    .form-group textarea {
      width: 100%;
      padding: 8px;
      box-sizing: border-box;
    }

    .form-group input[type="file"] {
      padding: 3px;
    }
    
     .form-buttons {
      text-align: center;
    }

    .submit-btn {
      background-color: #28a745;
      color: white;
      padding: 10px 20px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }
    
    /*show product table*/
    
     .table-container {
	  position: relative;
	  padding: 20px;
	  margin: 50px auto 30px auto; /* Top margin added here */
	  width: 95%;
	  max-width: 1000px;
	  border: 1px solid #ccc;
	  border-radius: 8px;
	  overflow-x: auto;
	  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	  background-color: #fff;
	}
    
    
    .clo-btn {
    position: absolute;
    top: 10px;
    right: 10px;
    border: none;
    background: #ff5c5c;
    color: white;
    font-size: 18px;
    cursor: pointer;
    border-radius: 50%;
    width: 30px;
    height: 30px;
    line-height: 1;
  }
  
  .clo-btn:hover {
    background: #ff2e2e;
  }

  table {
    width: 100%;
    border-collapse: collapse;
  }

  thead {
    background-color: #f5f5f5;
  }

  th, td {
    padding: 12px 15px;
    text-align: left;
    border-bottom: 1px solid #ddd;
  }
  
   tr:hover {
    background-color: #f1f1f1;
  }

  th {
    font-weight: bold;
    color: #333;
  }

  button .edT {
    padding: 6px 10px;
    background-color: #007BFF;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
  }
  
  button .deT {
    padding: 6px 10px;
    background-color: rgb(255, 230, 230);
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
  }

  .edT:hover {
    color:white;
    background-color: #28a745;
  }
  
  .deT:hover {
    color:white;
    background-color: #dc3545;
  }

 .table-title {
  text-align: center;
  margin-bottom: 20px;
  font-size: 24px;
  font-weight: 600;
  color: #333;
}
 
  
 section img
 {
   width: 150px;
   height: 150px;"
 }   

 
 #stable
   {
    display: none;
   }

/*Edit Product form*/


.form-container1 {
        width: 500px;
        margin: 30px auto;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 10px;
        position: relative;
        background-color: #f9f9f9;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .form-container1 h2 {
        text-align: center;
        margin-bottom: 20px;
    }

    .form-container1 label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
    }
    
    .form-container1 input[type="text"],
    .form-container1 input[type="file"],
    .form-container1 textarea {
        width: 100%;
        padding: 8px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 14px;
    }

    .form-container1 textarea {
        resize: vertical;
    }
    
    .form-container1 button {
        width: 100%;
        padding: 10px;
        background-color: #007BFF;
        color: white;
        font-size: 16px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    .form-container1 button:hover {
        background-color: #0056b3;
    }
    
     .close-btn1 {
        position: absolute;
        top: 10px;
        right: 15px;
        font-size: 20px;
        color: #888;
        cursor: pointer;
    }

    .close-btn1:hover {
        color: #000;
    }

    /* Unique classes for each input */
    .input-pname {}
    .input-pprice {}
    .input-pcategory {}
    .input-pquantity {}
    .input-pimage {}
    .input-pdescription {}
    
    






</style>


</head>
<body>
<%
String atoken=(String)session.getAttribute("atoken");

if(atoken != null)
{
%>

   <!-- Nav bar start -->
   
    
   
   <div class="navbar">
    <div class="nav-left">
      <a href="/home" class="home">Home</a>
    </div>
    <div class="nav-right">
      <a href="/admin-logout" class="logout">Logout</a>
    </div>
  </div>

   <!-- Nav bar Ends -->
   
   <h1>hello,<%=atoken %></h1>
   
   
 <div class="button-container">
    <button class="ad" onclick="openbox()">Add Product</button>
    <button class="ed" onclick="opentable()">Show Product</button>
  </div>
   
   
   <!--Add product form Start-->
   
<div class="form-container" id="box">
  <button class="close-btn-top" onclick="closebox()">×</button>

  <h2>Add Product</h2>
  <form id="productForm" action="add-product" method="post" enctype="multipart/form-data">
    <div class="form-group">
      <label for="pname">Product Name:</label>
      <input type="text" id="pname" name="pname" required>
    </div>

    <div class="form-group">
      <label for="pprice">Product Price:</label>
      <input type="text" id="pprice" name="pprice"  required>
    </div>

    <div class="form-group">
      <label for="pcategory">Product Category:</label>
      <input type="text" id="pcategory"  name="pcategory">
    </div>

    <div class="form-group">
      <label for="pquantity">Product Quantity:</label>
      <input type="text" id="pquantity" name="pquantity" required>
    </div>

    <div class="form-group">
      <label for="pimage">Product Image:</label>
      <input type="file" id="pimage" name="pimage" >
    </div>

    <div class="form-group">
      <label for="pdescription">Product Description</label>
      <textarea id="pdescription" name="pdescription" rows="5"></textarea>
    </div>

    <div class="form-buttons">
      <button type="submit" class="submit-btn">Add Product</button>
    </div>
      
      <input type="hidden" name="adminName" value="<%=atoken%>">
    
  </form>
</div>
   

   <!--Add product form Ends-->
   
   
   <!--Edit form starts  -->
   
   <%
    Product pp=(Product)session.getAttribute("p");
    if(pp != null)
    {
 
   %>
  
  
     
   <div class="form-container1">
    <span class="close-btn1" onclick="document.querySelector('.form-container1').style.display='none';">&times;</span>
    
    <form action="edit-product" method="post" enctype="multipart/form-data">
        <h2>Edit Product</h2>

        <div>
            <label for="editPname">Product Name:</label>
            <input type="text" name="pname" id="editPname" value="<%=pp.getPname() %>" class="input-pname"> 
        </div>

        <div>
            <label for="editPprice">Product Price:</label>
            <input type="text" name="pprice" id="editPprice" value="<%=pp.getPprice() %>" class="input-pprice"> 
        </div>     

        <div>
            <label for="editPcategory">Product Category:</label>
            <input type="text" name="pcategory" id="editPcategory" value="<%=pp.getPcategory() %>" class="input-pcategory"> 
        </div>

        <div>
            <label for="editPquantity">Product Quantity:</label>
            <input type="text" name="pquantity" id="editPquantity" value="<%=pp.getPquantity()%>" class="input-pquantity"> 
        </div>

        <div>
            <label for="editPimage">Product Image:</label>
            <input type="file" name="pimage" id="editPimage" class="input-pimage">
        </div>

        <div>
            <label for="editPdescription">Product Description:</label>
            <textarea rows="5" name="pdescription" id="editPdescription" class="input-pdescription"><%=pp.getPdescription() %></textarea>        
        </div>
        
        <div>
            <input type="hidden" name="pid" value="<%=pp.getPid()%>">
            <input type="hidden" name="adminName" value="<%=atoken%>">
        </div>

        <div>
            <button type="submit">Edit</button>
        </div>
    </form>
</div>
     
     
     
     
   
   <%
    }
    session.removeAttribute("p");
   %>
   

   <!-- doing after  -->
   <!--Edit form Ending  -->
   
   
   
   
   
   

   
   <!-- Show Product table start -->
    
 
 <%
 List<Product> l=(List<Product>) request.getAttribute("lp");
 %>   
    
    
    
  <section>
  <div class="table-container" id="stable">
    <button class="clo-btn" onclick="closetable()">&times;</button>
     <h2 class="table-title">Products</h2>
    <table>
    
      <thead>
      
        <tr>
          <th>Product Name</th>
          <th>Product Price</th>
          <th>Product Quantity</th>
          <th>Product Category</th>
          <th>Product Image</th>
          <th>Product Description</th>
          <th>Edit</th>
          <th>Delete</th>
        </tr>
      </thead>
      
      <tbody>
       <%
       for(Product p:l)
       {
    	%>  
        <tr>
          <td><%=p.getPname()%></td>
          <td><%=p.getPprice() %></td>
          <td><%=p.getPquantity() %></td>
          <td><%=p.getPcategory() %></td>
          <td>
             <img alt="loading.." src="/images/<%=p.getPimageName()%>">
          </td>
          <td><%=p.getPdescription() %></td>
          
          <td>
          	  <form action="read-edit-product" method="post">
	          <input type="hidden" name="pid" value="<%=p.getPid()%>">
	          <button class="deT">Edit</button>
	          </form> 
          </td>
          
          <td>
          
	          <form action="delete-product" method="post">
	          <input type="hidden" name="pid" value="<%=p.getPid()%>">
	          <button class="deT">Delete</button>
	          </form> 
	          
          </td>
        </tr>
       <%
       }
       if(l.size() ==0)
       {
    	   %>
    	    <tr>
    	       <td colspan="8" style="text-align:center;">No Products</td>
    	    </tr>
    	   <%
       }
       %>
      
      
      
      </tbody>
      
    </table>
    
  </div>
</section>

   
   
   
   
   
   
   
   
   <!-- Show Product table ends -->
   
   
   
   
   
   
   
   
<script type="text/javascript">

  function openbox()
  {
	  document.getElementById("box").style.display="block";
  }

  function closebox()
  {
	  document.getElementById("box").style.display="none";
  }
  
  function opentable()
  {
	  document.getElementById("stable").style.display="block";
  }

  function closetable()
  {
	  document.getElementById("stable").style.display="none";
  }


  //edit form
  
   window.onload = function() 
   {
     openEbox(); // <-- this sets display: block;
   };
  
  
  function closeEbox()
  {
	  document.getElementById("box1").style.display="none";
  }
  
  

</script>   
   
   
   
   
   
<%		
}
else
{
	response.sendRedirect("adminlogin.jsp");
	session.setAttribute("msg", "Login then access home");
}

%>




</body>
</html>