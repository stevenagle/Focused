package dao;

import entities.Company;
import entities.Reviewer;

public interface FocusedDbDao {

	Company createCompany(String name, String description, String username, String password);
	Reviewer createReviewer(String username, String password, int age, String gender);
	//TODO Methods go here
}
