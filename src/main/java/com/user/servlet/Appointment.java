package com.user.servlet;

import java.io.IOException;

import com.dao.MockAppointmentDao;
import com.dao.MockDoctorDao;
import com.entity.Appointments;
import com.entity.Doctor;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/appAppointment")
public class Appointment extends HttpServlet{
	
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int userId = Integer.parseInt(req.getParameter("userid").trim());
		String fullname = req.getParameter("fullname");
		String gender = req.getParameter("gender");
		String age = req.getParameter("age");
		String appoint_date = req.getParameter("appoint_date");
		String time_slot = req.getParameter("time_slot");
		String email = req.getParameter("email");
		String phno = req.getParameter("phno");
		String diseases = req.getParameter("diseases");
		int doctor_id = Integer.parseInt(req.getParameter("doct"));
		String address = req.getParameter("address");

		Appointments ap = new Appointments(userId, fullname, gender, age, appoint_date, email, phno, diseases, doctor_id, address, "pending", time_slot);

		MockAppointmentDao dao = new MockAppointmentDao();
		HttpSession session = req.getSession();

		if (dao.addAppointment(ap)) {
			// Set confirmation details in session for the confirmation page
			session.setAttribute("confirmationDate", appoint_date);
			session.setAttribute("confirmationTimeSlot", time_slot);
			
			// Get doctor name for confirmation
			MockDoctorDao doctorDao = new MockDoctorDao();
			Doctor doctor = doctorDao.getDoctorById(doctor_id);
			session.setAttribute("confirmationDoctorName", doctor.getFullName());
			session.setAttribute("confirmationDiseases", diseases);
			
			resp.sendRedirect("appointment_confirmation.jsp");
		} else {
			session.setAttribute("errorMsg", "Something wrong on server");
			resp.sendRedirect("user_appointment.jsp");
		}

	}

}
