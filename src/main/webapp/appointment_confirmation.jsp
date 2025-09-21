<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.MockDoctorDao"%>
<%@page import="com.entity.Appointments"%>
<%@page import="com.dao.MockAppointmentDao"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointment Confirmation</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
}

.confirmation-icon {
	font-size: 4rem;
	color: #28a745;
}

.confirmation-card {
	border: 2px solid #28a745;
	border-radius: 15px;
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<%
	if (session.getAttribute("userObj") == null) {
		response.sendRedirect("user_Login.jsp");
		return;
	}
	%>

	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card paint-card confirmation-card">
					<div class="card-body text-center">
						<div class="confirmation-icon mb-4">
							<i class="fas fa-check-circle"></i>
						</div>
						
						<h2 class="text-success mb-4">Appointment Confirmed!</h2>
						
						<%
						// Get the appointment details from session
						String appointmentDate = (String) session.getAttribute("confirmationDate");
						String timeSlot = (String) session.getAttribute("confirmationTimeSlot");
						String doctorName = (String) session.getAttribute("confirmationDoctorName");
						String diseases = (String) session.getAttribute("confirmationDiseases");
						
						if (appointmentDate != null && timeSlot != null && doctorName != null) {
						%>
						
						<div class="card mb-4" style="background-color: #f8f9fa;">
							<div class="card-body">
								<h5 class="card-title text-primary">Appointment Details</h5>
								<div class="row">
									<div class="col-md-6">
										<p><strong>Date:</strong> <%=appointmentDate%></p>
										<p><strong>Time Slot:</strong> <span class="badge badge-info"><%=timeSlot%></span></p>
									</div>
									<div class="col-md-6">
										<p><strong>Doctor:</strong> Dr. <%=doctorName%></p>
										<p><strong>Concern:</strong> <%=diseases%></p>
									</div>
								</div>
							</div>
						</div>
						
						<div class="alert alert-info">
							<i class="fas fa-info-circle"></i>
							<strong>Important Notes:</strong>
							<ul class="text-left mt-2">
								<li>Please arrive 15 minutes before your scheduled time</li>
								<li>Bring a valid ID and any relevant medical records</li>
								<li>Your appointment status is currently "Pending" until confirmed by the doctor</li>
								<li>You can view your appointment details anytime in "View Appointments"</li>
							</ul>
						</div>
						
						<%
						// Clear the session attributes after displaying
						session.removeAttribute("confirmationDate");
						session.removeAttribute("confirmationTimeSlot");
						session.removeAttribute("confirmationDoctorName");
						session.removeAttribute("confirmationDiseases");
						} else {
						%>
						<div class="alert alert-warning">
							<p>Appointment confirmation details are not available.</p>
						</div>
						<%
						}
						%>
						
						<div class="mt-4">
							<a href="view_appointment.jsp" class="btn btn-primary mr-3">
								<i class="fas fa-calendar-alt"></i> View My Appointments
							</a>
							<a href="user_appointment.jsp" class="btn btn-outline-primary">
								<i class="fas fa-plus"></i> Book Another Appointment
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="component/footer.jsp"%>
</body>
</html>
