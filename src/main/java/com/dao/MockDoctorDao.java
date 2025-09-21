package com.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

import com.entity.Doctor;

public class MockDoctorDao {
    private static List<Doctor> doctors = new ArrayList<>();
    private static AtomicInteger idCounter = new AtomicInteger(1);
    
    static {
        // Initialize with mock data for prototype
        doctors.add(new Doctor(idCounter.getAndIncrement(), "Dr. John Smith", "1980-05-15", "MBBS, MD", "Cardiology", "john@hospital.com", "9876543210", "password123"));
        doctors.add(new Doctor(idCounter.getAndIncrement(), "Dr. Sarah Wilson", "1985-08-22", "MBBS, MS", "Neurology", "sarah@hospital.com", "9876543211", "password123"));
        doctors.add(new Doctor(idCounter.getAndIncrement(), "Dr. Mike Johnson", "1978-12-10", "MBBS, MCh", "Orthopedics", "mike@hospital.com", "9876543212", "password123"));
        doctors.add(new Doctor(idCounter.getAndIncrement(), "Dr. Emily Brown", "1982-03-18", "MBBS, DM", "Dermatology", "emily@hospital.com", "9876543213", "password123"));
        doctors.add(new Doctor(idCounter.getAndIncrement(), "Dr. David Lee", "1979-11-25", "MBBS, MS", "General Surgery", "david@hospital.com", "9876543214", "password123"));
    }
    
    public boolean registerDoctor(Doctor d) {
        d.setId(idCounter.getAndIncrement());
        doctors.add(d);
        return true;
    }
    
    public List<Doctor> getAllDoctor() {
        return new ArrayList<>(doctors);
    }
    
    public Doctor getDoctorById(int id) {
        return doctors.stream()
            .filter(d -> d.getId() == id)
            .findFirst()
            .orElse(null);
    }
    
    public boolean updateDoctor(Doctor updatedDoctor) {
        for (int i = 0; i < doctors.size(); i++) {
            if (doctors.get(i).getId() == updatedDoctor.getId()) {
                doctors.set(i, updatedDoctor);
                return true;
            }
        }
        return false;
    }
    
    public boolean deleteDoctor(int id) {
        return doctors.removeIf(d -> d.getId() == id);
    }
    
    public Doctor login(String email, String password) {
        return doctors.stream()
            .filter(d -> d.getEmail().equals(email) && d.getPassword().equals(password))
            .findFirst()
            .orElse(null);
    }
    
    public int countDoctor() {
        return doctors.size();
    }
    
    public int countAppointment() {
        // Mock appointment count for prototype
        return 15;
    }
    
    public int countAppointmentByDoctorId(int doctorId) {
        // Mock appointment count for specific doctor
        return 3;
    }
    
    public boolean checkOldPassword(int userId, String oldPassword) {
        Doctor doctor = getDoctorById(userId);
        return doctor != null && doctor.getPassword().equals(oldPassword);
    }
    
    public boolean changePassword(int userId, String newPassword) {
        Doctor doctor = getDoctorById(userId);
        if (doctor != null) {
            doctor.setPassword(newPassword);
            return updateDoctor(doctor);
        }
        return false;
    }
    
    public boolean editDoctorProfile(Doctor d) {
        return updateDoctor(d);
    }
}
