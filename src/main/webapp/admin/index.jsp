  
 <%@page import="com.dao.MockDoctorDao"%>
<%@page import="com.dao.MockUserDao"%>
<%@page import="com.dao.MockAppointmentDao"%>
     <%@page isELIgnored="false" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../component/allcss.jsp" %>
<style type="text/css">
.paint-card {
  box-shadow : 0 0 10px 0 rgba(0,0,0,0.5);
}
</style>
</head>
<body>
<%@include file="navbar.jsp"%>
<c:if test="${empty adminObj }"> 
<c:redirect url="../admin.jsp"></c:redirect>
</c:if>




<div class="container p-5">

<p class="text-center fs-3">Admin Dashboard </p>

 <c:if test="${not empty sucMsg }">
 <p class="text-center text-success fs-3" role="alert">${sucMsg }</p>
  <c:remove var="sucMsg" scope="session"/>
 </c:if>
  
  
<%
	String errorMsg = (String) session.getAttribute("errorMsg");
	
	if (errorMsg != null) {
%>
		<p class="text-center text-danger fs-3"><%=errorMsg%></p>
<%
		session.removeAttribute("errorMsg");
	}
%>
  
                         <%
		MockDoctorDao dao = new MockDoctorDao();
		MockUserDao userDao = new MockUserDao();
		MockAppointmentDao appointmentDao = new MockAppointmentDao();
		MockSpecialistDao specialistDao = new MockSpecialistDao();
		%>
                         
<div class="row">


     

<div class="col-md-4 ">
<div class="card paint-card">
<div class="card-body text-center text-success">
<i class="fas fa-user-md fa-3x"></i><br>
<p class="fs-4 text-center"> 
   Doctor <br><%=dao.countDoctor()%>
 </p>

</div>
</div>
</div>


<div class="col-md-4 ">
<div class="card paint-card">
<div class="card-body text-center text-success">
<i class="fas fa-user-circle fa-3x"></i><br>
<p class="fs-4 text-center">User <br>
        <%= userDao.countUser() %>
</p>

</div>
</div>
</div>

<div class="col-md-4 ">
<div class="card paint-card">
<div class="card-body text-center text-success">
<i class="far fa-calendar-check fa-3x"></i><br>
<p class="fs-4 text-center">Total Appointment <br> 
              <%= appointmentDao.countAppointment() %>
</p>

</div>
</div>
</div>

<div class="col-md-4 p-2">
<div class="card paint-card"  data-bs-toggle="modal" 
data-bs-target="#exampleModal">
<div class="card-body text-center text-success">
<i class="far fa-calendar-check fa-3x"></i><br>
<p class="fs-4 text-center">Specialist <br>
      <%= specialistDao.countSpecialist() %>
</p>

</div>
</div>
</div>

</div>
</div>



<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Specialist</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        
        <form action="../addSpecialist" method="post">
        
        <div class="form-group">
        <label>Enter Specialist Name</label>
        <input required name="name" name="specName" class="form-Control" >
        </div>
        <div class="text-center mt-3">
        <button type="submit" class="btn btn-primary">add</button>
        </div>
        </form>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>



</body>
</html>