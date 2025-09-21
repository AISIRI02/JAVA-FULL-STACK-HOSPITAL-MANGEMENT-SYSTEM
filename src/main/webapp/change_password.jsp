<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="component/allcss.jsp"%>

<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<%
		com.entity.User userObj = (com.entity.User) session.getAttribute("userObj");
		if (userObj == null) {
			response.sendRedirect("user_Login.jsp");
			return;
		}
	%>

	<div class="container p-4">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<p class="text-center fs-3">Change Password</p>
					<%
						String succMsg = (String) session.getAttribute("succMsg");
						String errorMsg = (String) session.getAttribute("errorMsg");
						
						if (succMsg != null) {
					%>
						<p class="text-center text-success fs-3"><%=succMsg%></p>
					<%
						session.removeAttribute("succMsg");
						}
						
						if (errorMsg != null) {
					%>
						<p class="text-center text-danger fs-5"><%=errorMsg%></p>
					<%
						session.removeAttribute("errorMsg");
						}
					%>
					<div class="card-body">
						<form action="userChangePassword" method="post">
						             
						            
							
							<div class="mb-3">
								<label>Enter Old Password</label> <input type="password"
									name="oldPassword" class="form-control" required>
							</div>
						 
							<div class="mb-3">
								<label>Enter New Password</label> <input type="password"
									name="newPassword" class="form-control" required>
							</div>

							
												<div class="card-body">
						<form action="userChangePassword" method="post">
							<input type="hidden" name="uid" value="<%=userObj.getId()%>">
							<button class="btn btn-success col-md-12">Change
								Password</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>