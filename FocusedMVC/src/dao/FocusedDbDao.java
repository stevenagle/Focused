package dao;

import entities.Company;
import entities.Reviewer;

public interface FocusedDbDao {

	// Company methods
	Company createCompany(String name, String description, String username, String password);
	Company updateCompany(int id, String name, String description, String username, String password);
	Company getCompanyById(int id);
	
	// Reviewer methods
	Reviewer createReviewer(String username, String password, int age, String gender);
	Reviewer updateReviewer(int id, String username, String password, int age, String gender);
	Reviewer getReviewerById(int id);
	
}