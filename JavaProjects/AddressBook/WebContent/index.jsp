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
		pst = con.prepareStatement("insert into address_book_container.address_book(first_name,last_name,user_email,mobile_number,user_state,user_city,user_pincode,user_street)values(?,?,?,?,?,?,?,?)");
		
		pst.setString(1, first_name);
		pst.setString(2, last_name);
		pst.setString(3, user_email);
		pst.setString(4, mobile_number);
		
		pst.setString(5, user_state);
		pst.setString(6, user_city);
		pst.setString(7, user_pincode);
		pst.setString(8, user_street);
		pst.executeUpdate();
		out.println("Value added in Address Book successfully");
		
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


<title>AddressBook|Index</title>
</head>
<body>

	
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.4.4/umd/popper.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.js"></script>
	<script src="https://cdn.datatables.net/1.10.21/js/dataTables.dataTables.min.js"></</script>
			
			
			

			<h1 align="center">ADDRESSS BOOK</h1><br/>
				<div class="row">
					<div class="col-sm-3">	
						<form action="#" method="post">
							<div>
							<h3 style="margin-left: 15%;"><label>NEW USER DATA</label></h3>
							</div>
							<input type="text" class="form-control" name="FirstName" placeholder="First Name" pattern="^([A-Za-z]+[,.]?[ ]?|[A-Za-z]+['-]?)+$" required/><br>
						
							<input type="text" class="form-control" name="LastName" placeholder="Last Name" pattern="^([A-Za-z]+[,.]?[ ]?|[A-Za-z]+['-]?)+$" required/><br>
						
							<input type="text" class="form-control" name="UserEmail" placeholder="User Email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" required/><br>
						
							<input type="text" class="form-control" name="MobileNumber" placeholder="Mobile Number" pattern="^((\+91)?|91)?[789][0-9]{9}" required/><br>
						
							<input type="text" class="form-control" name="UserState" placeholder="User State" pattern="^([A-Za-z]+[,.]?[ ]?|[A-Za-z]+['-]?)+$" required/><br>
						
							<input type="text" class="form-control" name="UserCity" placeholder="User City" pattern="^([A-Za-z]+[,.]?[ ]?|[A-Za-z]+['-]?)+$" required/><br>
						
							<input type="text" class="form-control" name="UserPinCode" placeholder="User Zip Code" pattern="([0-9]{6}|[0-9]{3}\s[0-9]{3})" required/><br>
						
							<input type="text" class="form-control" id="resizer" name="UserStreet" placeholder="Street" required/><br>
						
							<input type="submit" id="AddUserDetails" name="AddUserDetails" value="ADD" class="block"/> 
							&nbsp;
							<input type="reset" id="ClearUserDetails" style="margin-bottom: 5%;" name="ClearUserDetails" value="CLEAR" class="block"/>
						</form>
					</div>
				



				<div class="col-sm-6">
				
					<h2 style="margin-left: 33%;">ADDRESS BOOKS</h2>
				
					<div class="panel-body" >
						<div>
						
					
							
							<table  id="AddressBook" class="table table-responsive table-striped table-bordered table-sm"  cellpadding="0" style="width:100%">
								<thread>
																<th colspan="4" class="th-sm">Personal Information</th>
																<th colspan="4" class="th-sm">Location Information</th>
																<th colspan="2" class="th-sm">Actions</th>
														<tr>
																<th class="th-sm">First Name</th>
																<th class="th-sm">Last Name</th>
																<th class="th-sm">User Email</th>
																<th class="th-sm">Mobile Number</th>
																
																<th class="th-sm">User State</th>
																<th class="th-sm">User City</th>
																<th class="th-sm">User PinCode</th>
																<th class="th-sm">User Street</th>
																<th class="th-sm">EDIT</th>
																<th class="th-sm">REMOVE</th>
														</tr>
														<%
															
														Connection con;
														PreparedStatement pst;
														ResultSet rs;
														
														Class.forName("com.mysql.jdbc.Driver");
														con = DriverManager.getConnection("jdbc:mysql://localhost:3306/address_book_container","root","@n0nyMizer*");
														
														String select_query="select * from address_book_container.address_book";
														Statement st = con.createStatement();
														
														rs=st.executeQuery(select_query);
														while(rs.next())	
														{
															String first_name = rs.getString("first_name");
														%>
												
														<tr>
																<td><%= rs.getString("first_name")%></td>
																<td><%= rs.getString("last_name")%></td>
																<td><%= rs.getString("user_email")%></td>
																<td><%= rs.getString("mobile_number")%></td>
																
																<td><%= rs.getString("user_state")%></td>
																<td><%= rs.getString("user_city")%></td>
																<td><%= rs.getString("user_pincode")%></td>
																<td><%= rs.getString("user_street")%></td>
																<td><a href="AddressBookDataEdit.jsp?first_name=<%=first_name%>"><input type="button" bgcolor="Blue" id="EditDetails" name="EditDetails" value="EDIT"/></a></td>
																<td><a href="AddressBookDataRemove.jsp?first_name=<%=first_name%>"><input type="button" bgcolor="Red" id="RemoveDetails" name="RemoveDetails" value="REMOVE"/></a></td>
														</tr>
														<% 
														}
														%>
								</thread>
							</table>
						</div>
					</div>
					<br>
													<div style="margin-left: 10%;">
														<form action="#" method="post">
															<h3 style="margin-left: 19%;"><label>VIEW ANY ADDRESS BOOK </label></h3>
															<input type="text" class="form-control" name="SearchAddressBook" placeholder="ADDRESS BOOK NAME" pattern="^([a-z_]+[,.]?[ ]?|[a-z_]+['-]?)+$"/><br>
															<input type="submit" id="viewAddressBook" name="viewAddressBook" value="VIEW" class="block"/><br><br>
														</form>
													</div>
							
							
							<h2 style="margin-left: 38%;">USER - BOOK</h2>
								
								
								<div class="panel-body" >
									<div>
										<table  id="tbl-AddressBook" class="table table-responsive table-bordered table-m" >
											<thread>		<th colspan="4" class="th-sm">Personal Information</th>
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
														try
														{	
														String view = request.getParameter("SearchAddressBook");

														if(request.getParameter("viewAddressBook")!=null)
														{
														Class.forName("com.mysql.jdbc.Driver");
														con = DriverManager.getConnection("jdbc:mysql://localhost:3306/address_book_container","root","@n0nyMizer*");
														
														select_query="select * from address_book_container."+view+"";
														st = con.createStatement();
														
														rs=st.executeQuery(select_query);
														while(rs.next())	
														{
															String first_name = rs.getString("first_name");
														%>
												
														<tr>
																<td><%= rs.getString("first_name")%></td>
																<td><%= rs.getString("last_name")%></td>
																<td><%= rs.getString("user_email")%></td>
																<td><%= rs.getString("mobile_number")%></td>
																
																<td><%= rs.getString("user_state")%></td>
																<td><%= rs.getString("user_city")%></td>
																<td><%= rs.getString("user_pincode")%></td>
																<td><%= rs.getString("user_street")%></td>
														</tr>
														<%
														}
														}
														%>
														<%
														}
														catch(Exception e)
														{
															String view = request.getParameter("SearchAddressBook");
															out.println("Address book "+view+" is not present");
														}
														%>
										</thread>
									</table>
								</div>
							</div>
				</div>	
										
													
											<div class="col-sm-3">
												<div class="">
													<div>
														<form action="UserBookCreateStart.jsp" method="post">
															<h3><label>CREATE ADDRESS BOOK</label></h3>
															
															<input type="submit" id="CreateNewBook" name="CreateNewBook" value="CREATE" class="block"/><br><br>
														</form>
													</div>
													
													
													<div>
														<form action="UserBookInsertAll.jsp" method="post">
															<h4><label>INSERT INTO ADDRESSS BOOK</label></h4>
															
															<input type="submit" id="insertTemp" name="insertTemp" value="INSERT" class="block"/><br><br>
														</form>
													</div>
													
													
													
													<div>
														<form action="UserBookDropStart.jsp" method="post">
															<h3><label>DELETE ADDRESS BOOK</label></h3>
															
															<input type="submit" name="DeleteBook" value="DELETE" class="block"><br><br>
														</form>
													</div>
												</div>
											</div>
</div>

</body>
</html>

