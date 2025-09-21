<%@page import="com.dao.MockDoctorDao"%>
<%@page import="com.entity.Doctor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

     <%@include file="../component/allcss.jsp" %>
</head>
<body>
      <c:if test="${empty docObj }">
		<c:redirect url="../doctor.jsp"></c:redirect>
	</c:if>


	<%@include file="navbar.jsp"%>

	<p class="text-center fs-3">Doctor Dashboard</p>

	<%
	Doctor d = (Doctor) session.getAttribute("docObj");
	MockDoctorDao dao = new MockDoctorDao();
	MockAppointmentDao appointmentDao = new MockAppointmentDao();
	%>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-2">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4 text-center">
							Doctor <br> <%=dao.countDoctor() %>
						</p>
					</div>
				</div>
			</div>


			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Total Appointment <br> <%=appointmentDao.countAppointmentByDoctorId(d.getId()) %>
							
						</p>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>