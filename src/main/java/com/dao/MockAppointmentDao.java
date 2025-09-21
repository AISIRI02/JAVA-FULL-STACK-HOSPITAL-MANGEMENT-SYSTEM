package com.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

import com.entity.Appointments;

public class MockAppointmentDao {
    private static List<Appointments> appointments = new ArrayList<>();
    private static AtomicInteger idCounter = new AtomicInteger(1);
    
    static {
        // Initialize with mock appointments for prototype
        Appointments apt1 = new Appointments(1, "John Doe", "Male", "35", "2024-01-15", "john.doe@email.com", "9876543210", "Fever", 1, "123 Main St", "Pending", "09:00-10:00");
        apt1.setId(idCounter.getAndIncrement());
        appointments.add(apt1);
        
        Appointments apt2 = new Appointments(2, "Jane Smith", "Female", "28", "2024-01-16", "jane.smith@email.com", "9876543211", "Headache", 2, "456 Oak Ave", "Confirmed", "10:00-11:00");
        apt2.setId(idCounter.getAndIncrement());
        appointments.add(apt2);
        
        Appointments apt3 = new Appointments(1, "John Doe", "Male", "35", "2024-01-20", "john.doe@email.com", "9876543210", "Back Pain", 3, "123 Main St", "Completed", "11:00-12:00");
        apt3.setId(idCounter.getAndIncrement());
        appointments.add(apt3);
        
        Appointments apt4 = new Appointments(3, "Alice Johnson", "Female", "42", "2024-01-22", "alice.johnson@email.com", "9876543212", "Skin Rash", 4, "789 Pine Rd", "Pending");
        apt4.setId(idCounter.getAndIncrement());
        appointments.add(apt4);
    }
    
    public boolean addAppointment(Appointments apt) {
        apt.setId(idCounter.getAndIncrement());
        appointments.add(apt);
        return true;
    }
    
    public List<Appointments> getAllAppointmentByLoginUser(int userId) {
        return appointments.stream()
            .filter(apt -> apt.getUserId() == userId)
            .collect(ArrayList::new, ArrayList::add, ArrayList::addAll);
    }
    
    public List<Appointments> getAllAppointmentByDoctorLogin(int doctorId) {
        return appointments.stream()
            .filter(apt -> apt.getDoctorId() == doctorId)
            .collect(ArrayList::new, ArrayList::add, ArrayList::addAll);
    }
    
    public Appointments getAppointmentById(int id) {
        return appointments.stream()
            .filter(apt -> apt.getId() == id)
            .findFirst()
            .orElse(null);
    }
    
    public boolean updateCommentByDoctor(int id, String comment) {
        Appointments apt = getAppointmentById(id);
        if (apt != null) {
            // Assuming there's a comment field in Appointments entity
            // For now, we'll update the status to show it's been attended
            apt.setStatus("Attended - " + comment);
            return true;
        }
        return false;
    }
    
    public List<Appointments> getAllAppointment() {
        return new ArrayList<>(appointments);
    }
    
    public boolean updateStatus(int id, String status) {
        Appointments apt = getAppointmentById(id);
        if (apt != null) {
            apt.setStatus(status);
            return true;
        }
        return false;
    }
    
    public int countAppointment() {
        return appointments.size();
    }
    
    public int countAppointmentByDoctorId(int doctorId) {
        return (int) appointments.stream()
            .filter(apt -> apt.getDoctorId() == doctorId)
            .count();
    }
    
    public int countUser() {
        return (int) appointments.stream()
            .mapToInt(Appointments::getUserId)
            .distinct()
            .count();
    }
    
    public int countDoctor() {
        return (int) appointments.stream()
            .mapToInt(Appointments::getDoctorId)
            .distinct()
            .count();
    }
    
    public boolean updateCommentStatus(int id, int doctorId, String comment) {
        for (Appointments appointment : appointments) {
            if (appointment.getId() == id && appointment.getDoctorId() == doctorId) {
                appointment.setStatus(comment);
                return true;
            }
        }
        return false;
    }
}
