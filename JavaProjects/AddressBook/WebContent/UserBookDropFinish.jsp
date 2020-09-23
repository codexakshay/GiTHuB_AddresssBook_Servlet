<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%
	if(request.getParameter("AddBookDetails")!=null)
	{
		
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		try
		{
		String id = request.getParameter("id");
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/address_book_container","root","@n0nyMizer*");	
		Statement statement = con.createStatement();
		String query = "DROP TABLE "+id+";";
		statement.executeUpdate(query);
		out.println("Dropped "+id+" : successfully");
		}
		catch(Exception e)
		{
			String id = request.getParameter("id");
			out.println("" +id+ " is not present .");
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