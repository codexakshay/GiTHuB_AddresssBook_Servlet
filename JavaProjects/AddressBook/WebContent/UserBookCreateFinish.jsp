<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%
	if(request.getParameter("AddBookDetails")!=null)
	{
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		
		String id = request.getParameter("id");
		
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/address_book_container","root","@n0nyMizer*");
		
		try
		{
		Statement statement = con.createStatement();
		String query = "CREATE TABLE "+id+" (`first_name` VARCHAR(20) NOT NULL,`last_name` VARCHAR(20) ,`user_email` VARCHAR(20) ,`mobile_number` VARCHAR(20) ,`user_state` VARCHAR(20) ,`user_city` VARCHAR(20) ,`user_pincode` VARCHAR(20) ,`user_street` VARCHAR(20) ,PRIMARY KEY (`first_name`));";
		statement.executeUpdate(query);
			out.println(""+id+" : created sucessfully.");
		}
		catch(Exception e)
		{
			out.println(""+id+" : Already Present.");
		}
	}
%>
			<html>
		<head>
			<link rel="stylesheet" href="AddressStyle.css"/>
			<link rel="stylesheet" href="bootstrap/css/bootstrap.css"/>
			<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css/">
		</head>
		<body>
			<div class="row">
				<div class="col-sm-4">
				</div>
					<div style="margin-left: 1%" class="col-sm-4">	
		<br><a href="index.jsp"><input type="button" id="CancelEdit" style="margin-bottom: 5%;" name="CancelEdit" value="BACK" class="block"/></a>
		</div>
		</div>
		</body>
		</html>