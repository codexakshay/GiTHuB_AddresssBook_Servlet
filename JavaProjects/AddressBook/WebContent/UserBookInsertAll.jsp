
	<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%
	if(request.getParameter("AddUserDetails")!=null)
	{
		String id = request.getParameter("AddressID");
		String first_name = request.getParameter("FirstName");
		String last_name = request.getParameter("LastName");
		String user_email = request.getParameter("UserEmail");
		String mobile_number = request.getParameter("MobileNumber");
		
		String user_state = request.getParameter("UserState");
		String user_city = request.getParameter("UserCity");
		String user_pincode = request.getParameter("UserPinCode");
		String user_street = request.getParameter("UserStreet");
		
		
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/address_book_container", "root", "@n0nyMizer*");
		Statement st=conn.createStatement();

		int i=st.executeUpdate("insert into address_book_container."+id+"(first_name,last_name,user_email,mobile_number,user_state,user_city,user_pincode,user_street)values('"+first_name+"','"+last_name+"','"+user_email+"','"+mobile_number+"','"+user_state+"','"+user_city+"','"+user_pincode+"','"+user_street+"')");

		out.println("Value Inserted successfully");
		}
		else
		{
			out.println("");
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="AddressStyle.css"/>
	<link rel="stylesheet" href="bootstrap/css/bootstrap.css"/>
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css/">
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">


<title>AddressBook|INSeRT</title>
</head>
<body>
	
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.4.4/umd/popper.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.js"></script>
	<script src="https://cdn.datatables.net/1.10.21/js/dataTables.dataTables.min.js"></</script>

			
										<h1 align="center">INSERT INTO USER ADDRESSS BOOK</h1><br/>
		<div class="row">
										<div class="col-sm-4">
										</div>
										
										
					<div style="margin-left: 1%" class="col-sm-4">	
					
						
							<form action="#" method="post">
							
						
							<h3 style="margin-left: 15%;"><label>ENTER NEW USER DATA</label></h3>
					
							<input type="text" class="form-control" name="AddressID" placeholder="ADDRESS BOOK NAME" required/><br>
							
							<input type="text" class="form-control" name="FirstName" placeholder="First Name" pattern="^([A-Za-z])+$" required/><br>
							<br>
							<input type="text" class="form-control" name="LastName" placeholder="Last Name" pattern="^([A-Za-z])+$" required/><br>
							<br>
							<input type="text" class="form-control" name="UserEmail" placeholder="User Email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" required/><br>
							<br>
							<input type="text" class="form-control" name="MobileNumber" placeholder="Mobile Number" pattern="^((\+91)?|91)?[789][0-9]{9}" required/><br>
							<br>
							<input type="text" class="form-control" name="UserState" placeholder="User State" pattern="^([A-Za-z]+[,.]?[ ]?|[A-Za-z]+['-]?)+$" required/><br>
							<br>
							<input type="text" class="form-control" name="UserCity" placeholder="User City" pattern="^([A-Za-z]+[,.]?[ ]?|[A-Za-z]+['-]?)+$" required/><br>
							<br>
							<input type="text" class="form-control" name="UserPinCode" placeholder="User Zip Code" pattern="([0-9]{6}|[0-9]{3}\s[0-9]{3})" required/><br>
							<br>
							<input type="text" class="form-control" id="resizer" name="UserStreet" placeholder="Street" required/><br>
							<br>
							
						
							<input type="submit" id="AddUserDetails" name="AddUserDetails" value="ENTER" class="block"/> 
							&nbsp;
							<input type="reset" id="ClearUserDetails" style="margin-bottom: 5%;" name="ClearUserDetails" value="CLEAR" class="block"/>
							<a href="index.jsp"><input type="button" id="CancelEdit" style="margin-bottom: 5%;" name="CancelEdit" value="BACK" class="block"/></a>
						</form>
</div>
</div>
</body>
</html>

