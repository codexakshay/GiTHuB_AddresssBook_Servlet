<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="AddressStyle.css" />
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css/">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">


<title>AddressBook|Index</title>
</head>
<body>


	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.4.4/umd/popper.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.21/js/dataTables.dataTables.min.js"></</script>




	<h1 align="center">ADDRESSS BOOK</h1>
<div style="margin-left: 10%;">
	<form action="#" method="post">
		<h3 style="margin-left: 36%;">
			<label>SEARCH ANY CITY</label>
		</h3>
		
		<input type="text" class="form-control" name="book_name"
			placeholder="ADDRESSS BOOK NAME"
			pattern="^([a-z_]+[,.]?[ ]?|[a-z_]+['-]?)+$" /><br> 
		
		<input type="text" class="form-control" name="user_city"
			placeholder="SEARCH CITY NAME"
			pattern="^([a-z_]+[,.]?[ ]?|[a-z_]+['-]?)+$" /><br>
			 <input type="submit" id="viewAddressBook" name="viewAddressBook"
			value="SEARCH" class="block" /><br> <br>
	</form>
</div>


<h2 style="margin-left: 41%;">SEARCHED - BOOK</h2>


<div class="panel-body">
	<div style ="margin-left: 26%" class="col-sm-6" >
		<table id="tbl-AddressBook"
			class="table table-responsive table-bordered table-m">
			<thread>
			<th colspan="4" class="th-sm">Personal Information</th>
			<th colspan="4" class="th-sm">Location Information</th>
			
			<tr>
				<th class="th-sm">First Name</th>
				<th class="th-sm">Last Name</th>
				<th class="th-sm">User Email</th>
				<th class="th-sm">Mobile Number</th>

				<th class="th-sm">User State</th>
				<th class="th-sm">User City</th>
				<th class="th-sm">User PinCode</th>
				<th class="th-sm">User Street</th>
		
			</tr>
			<%
			String Book_name = request.getParameter("book_name");
			String City_name = request.getParameter("user_city");
				try {
				
				if (request.getParameter("viewAddressBook") != null) {
					
					Connection con;
					PreparedStatement pst;
					ResultSet rs;
					Class.forName("com.mysql.jdbc.Driver");
					con = DriverManager.getConnection("jdbc:mysql://localhost:3306/address_book_container", "root", "");

					String select_query = "select * from address_book_container." + Book_name + "where user_city ='"+City_name+"'";
					Statement st = con.createStatement();

					rs = st.executeQuery(select_query);
					while (rs.next()) {
				String first_name = rs.getString("first_name");
			%>

			<tr>
				<td><%=rs.getString("first_name")%></td>
				<td><%=rs.getString("last_name")%></td>
				<td><%=rs.getString("user_email")%></td>
				<td><%=rs.getString("mobile_number")%></td>

				<td><%=rs.getString("user_state")%></td>
				<td><%=rs.getString("user_city")%></td>
				<td><%=rs.getString("user_pincode")%></td>
				<td><%=rs.getString("user_street")%></td>

			<%
				}
			}
			%> <%
 	} catch (Exception e) {
 String view = request.getParameter("viewAddressBook");
 out.println("City : " +  City_name + " is not present");
 }
 %> </thread>
		</table>
	</div>
</div>

</body>
</html>

