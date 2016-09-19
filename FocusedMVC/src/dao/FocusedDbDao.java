package dao;

import java.util.List;

import entities.Company;
import entities.Feature;
import entities.Product;
import entities.Reviewer;

public interface FocusedDbDao {

	// Company methods
	Company createCompany(String name, String description, String username, String password);
	Company updateCompany(int id, String name, String description, String username, String password);
	// TODO removeCompany-- Possibly something only an admin should be able to do?
	Company MatchCompany(String username, String password);
	Company getCompanyById(int id);
	
	// Reviewer methods
	Reviewer createReviewer(String username, String password, int age, String gender);
	Reviewer updateReviewer(int id, String username, String password, int age, String gender);
	// TODO removeReviewer-- Possibly something only an admin should be able to do?
	Reviewer getReviewerById(int id);
	Reviewer MatchReviewer(String username, String password);
	List<Product> getUnratedProducts(int reviewerId);
	
	// Product methods 
	Product createProduct(int id, String name, double price, String photoUrl, String description);
	Product getProductById(int id);
	Product updateProduct(int id, String name, double price, String photoUrl, String description);
	void removeProduct(int id);
	
	// Feature methods
	Feature createFeature(int id, String details);
	Feature updateFeature(int id, String details);
	Feature getFeatureById(int id);
	void removeFeature(int id);
}
