<%@page import="com.dao.MockDoctorDao"%>
<%@page import="com.dao.MockSpecialistDao"%>
<%@page import="com.entity.*" %>
<%@page import="java.util.List"%>

<%@page isELIgnored="false"%>
<%@page import="com.entity.Doctor"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Appointment</title>
<%@include file="component/allcss.jsp"%>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/component/style.css">
<style type="text/css">
.paint-card {
	box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("img/po.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
.custom-width {
     
    max-width: 700px;
    
    margin: 0 auto;  
     width: 100%;
    
}
.custom-height {
    min-height: 600px; /* Adjust the minimum height as needed */
       
    
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<div class="container-fulid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-2">
		<div class="row flex">
			<div class="col-md-6 p-8">
				<img alt="" src="img/doct.jpg">
			</div>

			<div class="col-md-6">
				<div class="card paint-card custom-width custom-height">
					<div class="card-body">
						<p class="text-center fs-3">User Appointment</p>
					<%
						String errorMsg = (String) session.getAttribute("errorMsg");
						String succMsg = (String) session.getAttribute("succMsg");
						
						if (errorMsg != null) {
					%>
						<p class="fs-4 text-center text-danger"><%=errorMsg%></p>
					<%
						session.removeAttribute("errorMsg");
						}
						
						if (succMsg != null) {
					%>
						<p class="fs-4 text-center text-success"><%=succMsg%></p>
					<%
						session.removeAttribute("succMsg");
						}
					%>
						<form class="row g-3" action="appAppointment" method="post">
							<%
								com.entity.User userObj = (com.entity.User) session.getAttribute("userObj");
								int userId = (userObj != null) ? userObj.getId() : 0;
							%>
							<input type="hidden" name="userid" value="<%=userId%>">

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Full Name</label> <input
									required type="text" class="form-control" name="fullname">
							</div>

							<div class="col-md-6">
								<label>Gender</label> <select class="form-control" name="gender"
									required>
									<option value="male">Male</option>
									<option value="female">Female</option>
								</select>
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Age</label> <input
									required type="number" class="form-control" name="age">
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Appointment
									Date</label> <input type="date" class="form-control" required
									name="appoint_date">
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Time Slot</label> 
								<select class="form-control" name="time_slot" required>
									<option value="">--Select Time--</option>
									<option value="09:00-10:00">09:00 AM - 10:00 AM</option>
									<option value="10:00-11:00">10:00 AM - 11:00 AM</option>
									<option value="11:00-12:00">11:00 AM - 12:00 PM</option>
									<option value="02:00-03:00">02:00 PM - 03:00 PM</option>
									<option value="03:00-04:00">03:00 PM - 04:00 PM</option>
									<option value="04:00-05:00">04:00 PM - 05:00 PM</option>
								</select>
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Email</label> <input
									required type="email" class="form-control" name="email">
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Phone No</label> <input
									maxlength="10" required type="number" class="form-control"
									name="phno">
							</div>


							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Diseases</label> <input
									required type="text" class="form-control" name="diseases">
							</div>

							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Doctor</label> <select
									required class="form-control" name="doct">
									<option value="">--select--</option>

									 
   <% MockDoctorDao dao=new MockDoctorDao();
     List<Doctor> list = dao.getAllDoctor();
     
     for( Doctor s : list)
     {
    	 %>
    	 <option value="<%=s.getId()%>">
    	 <%=s.getFullName()%> (<%=s.getSpecialist()%>)   
    	  </option>
   <%   
   }
   %>




								</select>
							</div>

							<div class="col-md-12">
								<label>Full Address</label>
								<textarea required name="address" class="form-control" rows="3"
									cols=""></textarea>
							</div>

							<c:if test="${empty userObj }">
								<a href="user_Login.jsp" class="col-md-6 offset-md-3 btn btn-success">Submit</a>
							</c:if>

							<c:if test="${not empty userObj }">
								<button class="col-md-6 offset-md-3 btn btn-success">Submit</button>
							</c:if>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
	
	<%@include file="component/footer.jsp"%>

</body>
</html>