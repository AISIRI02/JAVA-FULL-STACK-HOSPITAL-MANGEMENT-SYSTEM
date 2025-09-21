<%@page import="com.dao.MockDoctorDao"%>
<%@page import="com.dao.MockSpecialistDao"%>
<%@page import="com.entity.*" %>
<%@page import="java.util.List"%>
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

<div class="container-fluid p-3">


<div class="row">

<div class="col-md-5 offset-md-4">
<div class="card paint-card">
<div class="card-body">
<p class="fs-3 text-center">Add Doctor </p>


  <c:if test="${not empty sucMsg }">
 <p class="text-center text-success fs-3" role="alert">${sucMsg }</p>
  <c:remove var="sucMsg" scope="session"/>
 </c:if>
  
  
<%
	String errorMsg = (String) session.getAttribute("errorMsg");
	String succMsg = (String) session.getAttribute("succMsg");
	
	if (errorMsg != null) {
%>
		<p class="text-center text-danger fs-3"><%=errorMsg%></p>
<%
		session.removeAttribute("errorMsg");
	}
%>


 
  
  <form action="../addDoctor" method="post">
   <div class="mb-3">
   <label class="form-lable">Full Name</label> <input type="text"
   required name="fullname" class="form-control">
   </div>
  
  <div class="mb-3">
   <label class="form-lable">DOB</label> <input type="text"
   required name="dob" class="form-control">
   </div>
   
   <div class="mb-3">
   <label class="form-lable">Qualification</label> <input type="text"
   required name="qualification" class="form-control">
   </div>
   
   
<div class="mb-3">
<label class="form-label">Specialist</label> <select name="specialist"
required class="form-control">

   <option>--select--</option>
   
   <% MockSpecialistDao dao = new MockSpecialistDao();
     List<Specalist> list = dao.getAllSpecialist();
     
     for(Specalist s : list)
     {
    	 %>
    	 <option><%= s.getSpecialistName() %> </option>
   <%   
   }
   %>
   </select>
   </div>
   
   <div class="mb-3">
   <label class="form-lable">Email</label> <input type="text"
   required name="email" class="form-control">
   </div>
   
   <div class="mb-3">
   <label class="form-lable">Mob No</label> <input type="text"
   required name="mobno" class="form-control">
   </div>
   
   <div class="mb-3">
   <label class="form-lable">password</label> <input required
   name="password" type="password" class="form-control">
   </div>
   
   <button class="submit" class="btn btn-primary">Submit</button>
  
  </form>

</div>
</div>
</div>

   



</body>
</html>