
		
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="AddressStyle.css"/>
	<link rel="stylesheet" href="bootstrap/css/bootstrap.css"/>
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css/">
<title>AddressBook | Drop</title>
</head>
<body>
<h1 align="center">DROP ADDRESSS BOOK</h1><br/>
				<div class="row">
				<div class="col-sm-4">
				</div>
					<div style="margin-left: 1%" class="col-sm-4">	
						<form action="UserBookDropFinish.jsp" method="post">
							<div>
							<h3 style="margin-left: 15%;"><label>ADDRESS BOOK NAME</label></h3>
							</div>
							<input type="text" class="form-control" name="id" placeholder="ADDRESS BOOK NAME" required/><br>
							
							<input type="submit" id="AddBookDetails" name="AddBookDetails" value="ENTER" class="block"/> 
							&nbsp;
							<input type="reset" id="ClearUserDetails" style="margin-bottom: 5%;" name="ClearUserDetails" value="CLEAR" class="block"/>
							<a href="index.jsp"><input type="button" id="CancelEdit" style="margin-bottom: 5%;" name="CancelEdit" value="BACK" class="block"/></a>
						</form>
					</div>
</div>
</body>
</html>
			
