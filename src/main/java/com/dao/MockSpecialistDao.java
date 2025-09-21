package com.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

import com.entity.Specalist;

public class MockSpecialistDao {

    private static List<Specalist> specialists = new ArrayList<>();
    private static AtomicInteger idCounter = new AtomicInteger(1);

    static {
        // Initialize with mock specialists for prototype
        specialists.add(new Specalist(idCounter.getAndIncrement(), "Cardiology"));
        specialists.add(new Specalist(idCounter.getAndIncrement(), "Neurology"));
        specialists.add(new Specalist(idCounter.getAndIncrement(), "Orthopedics"));
        specialists.add(new Specalist(idCounter.getAndIncrement(), "Dermatology"));
        specialists.add(new Specalist(idCounter.getAndIncrement(), "General Surgery"));
        specialists.add(new Specalist(idCounter.getAndIncrement(), "Pediatrics"));
        specialists.add(new Specalist(idCounter.getAndIncrement(), "Gynecology"));
        specialists.add(new Specalist(idCounter.getAndIncrement(), "Ophthalmology"));
    }

    public boolean addSpecialist(String spec) {
        specialists.add(new Specalist(idCounter.getAndIncrement(), spec));
        return true;
    }

    public List<Specalist> getAllSpecialist() {
        return new ArrayList<>(specialists);
    }

    public Specalist getSpecialistById(int id) {
        return specialists.stream()
                .filter(s -> s.getId() == id)
                .findFirst()
                .orElse(null);
    }

    public boolean deleteSpecialist(int id) {
        return specialists.removeIf(s -> s.getId() == id);
    }

    public int countSpecialist() {
        return specialists.size();
    }
}
