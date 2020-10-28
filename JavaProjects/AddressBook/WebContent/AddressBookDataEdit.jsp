<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
 
 
 
 
 
 
 
 <%
	if(request.getParameter("AddUserDetails")!=null)
	{
		
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
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/address_book_container","root","");
		pst = con.prepareStatement("update address_book_container.address_book set last_name= ?,user_email= ?,mobile_number= ?,user_state= ?,user_city= ?,user_pincode= ?,user_street= ? where first_name = ?");

		pst.setString(1, last_name);
		pst.setString(2, user_email);
		pst.setString(3, mobile_number);
		
		pst.setString(4, user_state);
		pst.setString(5, user_city);
		pst.setString(6, user_pincode);
		pst.setString(7, user_street);
		pst.setString(8, first_name);
		pst.executeUpdate();
		
		out.println("EDITED : Address Book successfully");
	}
%>
 
 
 
 
 
 
 
 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="AddressStyle.css"/>
<link rel="stylesheet" href="bootstrap/css/bootstrap.css"/>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css/">
<title> AddressBook | USER | EDIT </title>
</head>
<body>
<div class="row">
		<div class="col-sm-2">
		</div>
		<div style="margin-left: 20%;"	class="col-sm-4">	

			<form action="#" method="post">
			
			<%
			
			Connection con;
			PreparedStatement pst;
			ResultSet rs;
			
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/address_book_container","root","@n0nyMizer*");
			
			String first_name=request.getParameter("first_name");
			pst = con.prepareStatement("select * from address_book_container.address_book where first_name=?");
			pst.setString(1, first_name);
			rs = pst.executeQuery();
			
			while(rs.next())
			{
				
			
			%>
		
				<div>
				<h3 style="margin-left: 22%;"><label>EDIT USER DATA</label></h3>
				</div>
				<input type="text" value="<%= rs.getString("first_name")%>" class="form-control" name="FirstName" placeholder="First Name" required/><br>
				<br>
				<input type="text" value="<%= rs.getString("last_name")%>" class="form-control" name="LastName" placeholder="Last Name"/><br>
				<br>
				<input type="text" value="<%= rs.getString("user_email")%>" class="form-control" name="UserEmail" placeholder="User Email"/><br>
				<br>
				<input type="text" value="<%= rs.getString("mobile_number")%>" class="form-control" name="MobileNumber" placeholder="Mobile Number"/><br>
				<br>
				<input type="text" value="<%= rs.getString("user_state")%>" class="form-control" name="UserState" placeholder="User State"/><br>
				<br>
				<input type="text" value="<%= rs.getString("user_city")%>" class="form-control" name="UserCity" placeholder="User City"/><br>
				<br>
				<input type="text" value="<%= rs.getString("user_pincode")%>" class="form-control" name="UserPinCode" placeholder="User Zip Code"/><br>
				<br>
				<input type="text" value="<%= rs.getString("user_street")%>" class="form-control" id="resizer" name="UserStreet" placeholder="Street"/>
				
				<% 
					}
				%>
				<br>
				<br>
				<input type="submit" id="AddUserDetails" name="AddUserDetails" value="ADD" class="block"/> 
				<br>
				<input type="reset" id="ClearUserDetails" name="ClearUserDetails" value="CLEAR" class="block"/>
				&nbsp;
				
				<a href="index.jsp"><input type="button" id="CancelEdit" style="margin-bottom: 5%;" name="CancelEdit" value="BACK" class="block"/></a>
			</form>
		</div>
		</div>
</body>
</html>
