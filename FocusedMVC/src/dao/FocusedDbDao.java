package dao;

import java.util.List;
import java.util.Set;

import data.ReviewData;
import entities.Company;
import entities.Feature;
import entities.Product;
import entities.Reviewer;
import entities.Reward;

public interface FocusedDbDao {

	// Company methods
	Company createCompany(String name, String username, String password, String description, String photoUrl);
	Company updateCompany(int id, String name, String username, String password, String description, String photoUrl);
	Company MatchCompany(String username, String password);
	Company getCompanyById(int id);
	boolean isDuplicateCompany(String username);
	
	// Reviewer methods
	Reviewer createReviewer(String username, String password, int age, String gender, String photoUrl);
	Reviewer updateReviewer(int id, String username, String password, int age, String gender, String photoUrl);
	Reviewer getReviewerById(int id);
	Reviewer MatchReviewer(String username, String password);
	List<Product> getUnratedProducts(int reviewerId);
	void reviewProduct(int featureId, int reviewerId, int rating);
	boolean isDuplicateReviewer(String username);
	
	// Product methods 
	Product createProduct(int id, String name, double price, String photoUrl, String description);
	Product getProductById(int id);
	Product updateProduct(int id, String name, double price, String photoUrl, String description);
	void removeProduct(int id);
	List<Product> getRatedProducts(int reviewerId);
	
	// Feature methods
	Feature createFeature(int id, String details);
	Feature updateFeature(int id, String details);
	Feature getFeatureById(int id);
	void removeFeature(int id);
	
	// ReviewData methods
	List<ReviewData> getReviewData(int companyId);
	
	// Reward methods
	List<Reward> getRewards();
	Reward getRewardById(int rewardId);
	int getRewardTotalCost(List<Reward> rewards);
	List<Reward> removeItemfromCart(List<Reward> rewards, Reward reward);
	
}
