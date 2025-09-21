package com.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;
import com.entity.User;

public class MockUserDao {
    private static List<User> users = new ArrayList<>();
    private static AtomicInteger idCounter = new AtomicInteger(1);
    
    static {
        // Initialize with mock users for prototype
        User user1 = new User("John Doe", "john.doe@email.com", "password123");
        user1.setId(idCounter.getAndIncrement());
        users.add(user1);
        
        User user2 = new User("Jane Smith", "jane.smith@email.com", "password123");
        user2.setId(idCounter.getAndIncrement());
        users.add(user2);
        
        User user3 = new User("Alice Johnson", "alice.johnson@email.com", "password123");
        user3.setId(idCounter.getAndIncrement());
        users.add(user3);
        
        User user4 = new User("Bob Wilson", "bob.wilson@email.com", "password123");
        user4.setId(idCounter.getAndIncrement());
        users.add(user4);
    }
    
    public boolean register(User u) {
        // Check if email already exists
        boolean emailExists = users.stream()
            .anyMatch(user -> user.getEmail().equals(u.getEmail()));
        
        if (!emailExists) {
            u.setId(idCounter.getAndIncrement());
            users.add(u);
            return true;
        }
        return false;
    }
    
    public User login(String email, String password) {
        return users.stream()
            .filter(u -> u.getEmail().equals(email) && u.getPassword().equals(password))
            .findFirst()
            .orElse(null);
    }
    
    public List<User> getAllUser() {
        return new ArrayList<>(users);
    }
    
    public User getUserById(int id) {
        return users.stream()
            .filter(u -> u.getId() == id)
            .findFirst()
            .orElse(null);
    }
    
    public boolean checkOldPassword(int userId, String oldPassword) {
        User user = getUserById(userId);
        return user != null && user.getPassword().equals(oldPassword);
    }
    
    public boolean changePassword(int userId, String newPassword) {
        User user = getUserById(userId);
        if (user != null) {
            user.setPassword(newPassword);
            return true;
        }
        return false;
    }
    
    public int countUser() {
        return users.size();
    }
    
    public int countAppointment() {
        // Mock appointment count for prototype
        return 25;
    }
    
    public int countAppointmentByUserId(int userId) {
        // Mock appointment count for specific user
        return 2;
    }
}
