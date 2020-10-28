 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
 <%
	
		String first_name = request.getParameter("first_name");
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/address_book_container","root","");
		pst = con.prepareStatement("delete from address_book_container.address_book where first_name = ?");
		pst.setString(1, first_name);
		pst.executeUpdate();
		out.println("DELETED : Record from Address Book successfully");
		
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
			
