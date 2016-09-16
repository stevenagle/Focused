package dao;

import entities.Company;

public interface FocusedDbDao {

	Company createCompany(String name, String description, String username, String password);
	//TODO Methods go here
}
