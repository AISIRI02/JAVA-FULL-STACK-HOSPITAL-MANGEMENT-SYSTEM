package com.db;

public class DBConnect {
	
	// Mock database connection for prototype - no actual database needed
	public static boolean isConnected() {
		// Always return true for mock implementation
		return true;
	}
	
	public static String getConnectionStatus() {
		return "Mock Database Connected - Prototype Mode";
	}
	
	// This method is kept for compatibility but returns null since we're using mock data
	public static Object getConn() {
		// Return null since mock DAOs don't need actual database connections
		return null;
	}
}
