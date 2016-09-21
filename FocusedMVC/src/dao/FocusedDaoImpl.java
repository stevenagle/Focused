package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import data.ReviewData;
import entities.Company;
import entities.Feature;
import entities.FeatureReview;
import entities.Product;
import entities.Reviewer;
import entities.Reward;

@Transactional
public class FocusedDaoImpl implements FocusedDbDao {

	@PersistenceContext
	private EntityManager em;

	// Company methods
	@Override
	public Company createCompany(String name, String username, String password, String description, String photoUrl) {

		Company c = new Company();

		c.setName(name);
		c.setUsername(username);
		c.setPassword(password);
		c.setDescription(description);
		c.setPhotoUrl(photoUrl);

		em.persist(c);

		return c;
	}

	@Override
	public Company updateCompany(int id, String name, String username, String password, String description, String photoUrl) {

		Company c = em.find(Company.class, id);
		c.setName(name);
		c.setDescription(username);
		c.setUsername(password);
		c.setPassword(description);
		c.setPhotoUrl(photoUrl);

		return c;
	}

	@Override
	public Company getCompanyById(int id) {
		return em.find(Company.class, id);
	}

	@Override
	public boolean isDuplicateCompany(String username) {
		boolean duplicate = false;

		String queryString = "SELECT c FROM Company c";

		List<Company> results = em.createQuery(queryString, Company.class).getResultList();

		for (Company result : results) {
			if (result.getUsername().equals(username)) {
				duplicate = true;
				break;
			} else {
				duplicate = false;
			}
		}
		return duplicate;
	}

	@Override
	public Company MatchCompany(String username, String password) {

		String queryString = "SELECT c FROM Company c";

		List<Company> results = em.createQuery(queryString, Company.class).getResultList();
		Company match = new Company();

		for (Company result : results) {
			if (result.getUsername().equals(username)) {
				match = result;
				return match;
			}
		}

		return em.find(Company.class, 1);
	}
	

	// Reviewer methods

	@Override
	public Reviewer createReviewer(String username, String password, int age, String gender, String photoUrl) {

		Reviewer r = new Reviewer();
		r.setUsername(username);
		r.setPassword(password);
		r.setAge(age);
		r.setGender(gender);
		r.setPhotoUrl(photoUrl);
		
		em.persist(r);

		return r;
	}

	@Override
	public Reviewer updateReviewer(int id, String username, String password, int age, String gender, String photoUrl) {

		Reviewer r = em.find(Reviewer.class, id);
		r.setUsername(username);
		r.setPassword(password);
		r.setAge(age);
		r.setGender(gender);
		r.setPhotoUrl(photoUrl);

		return r;
	}

	@Override
	public Reviewer getReviewerById(int id) {
		return em.find(Reviewer.class, id);
	}

	@Override
	public Reviewer MatchReviewer(String username, String password) {

		String queryString = "SELECT r FROM Reviewer r";

		List<Reviewer> results = em.createQuery(queryString, Reviewer.class).getResultList();
		Reviewer match = new Reviewer();

		for (Reviewer result : results) {
			if (result.getUsername().equals(username)) {
				match = result;
				return match;
			}
		}
		return em.find(Reviewer.class, 1);

	}

	@Override
	public boolean isDuplicateReviewer(String username) {
		boolean duplicate = false;

		String queryString = "SELECT r FROM Reviewer r";

		List<Reviewer> results = em.createQuery(queryString, Reviewer.class).getResultList();

		for (Reviewer result : results) {
			if (result.getUsername().equals(username)) {
				duplicate = true;
				break;
			} else {
				duplicate = false;
			}
		}
		return duplicate;
	}

	@Override
	public List<Product> getUnratedProducts(int reviewerId) {
		String queryString = "SELECT DISTINCT p FROM Product p";
		List<Product> tempProducts = em.createQuery(queryString, Product.class).setMaxResults(4).getResultList();
		List<Product> products = new ArrayList<>(tempProducts);

		for (Product product : tempProducts) {
			for (Feature feature : product.getFeatures()) {
				for (FeatureReview fr : feature.getFeatureReviews()) {
					if (fr.getReviewer().getId() == reviewerId) {
						products.remove(product);
					}
				}
			}
		}
		return products;
	}
	
//	@Override
//	public Set<Product> getRatedProducts(int reviewerId) {
//		String queryString = "SELECT DISTINCT p FROM Product p";
//		List<Product> tempProducts = em.createQuery(queryString, Product.class).setMaxResults(4).getResultList();
//		List<Product> products = new ArrayList<>(tempProducts);
//		Set<Product> ratedProducts = new Set();
//
//		for (Product product : tempProducts) {
//			for (Feature feature : product.getFeatures()) {
//				for (FeatureReview fr : feature.getFeatureReviews()) {
//					if (fr.getReviewer().getId() == reviewerId) {
//					if (product.getId())
//					(ratedProducts.add(product);
//					}
//				}
//			}
//		}
//		for (Product product : ratedProducts) {
//			System.out.println(product.getName());
//		}
//		return ratedProducts;
//	}

	// Product Methods
	@Override
	public Product createProduct(int id, String name, double price, String photoUrl, String description) {

		Product p = new Product();
		Company c = getCompanyById(id);

		p.setCompany(c);
		p.setName(name);
		p.setPrice(price);
		p.setPhotoUrl(photoUrl);
		p.setDescription(description);
		p.setFeatures(null);

		// New way to get Company to know it's products
		Set<Product> products = c.getProducts();
		products.add(p);
		c.setProducts(products);

		return p;
	}

	@Override
	public Product getProductById(int id) {
		return em.find(Product.class, id);
	}

	@Override
	public Product updateProduct(int id, String name, double price, String photoUrl, String description) {
		Product p = getProductById(id);
		p.setName(name);
		p.setPrice(price);
		p.setPhotoUrl(photoUrl);
		p.setDescription(description);
		return p;
	}

	@Override
	public void removeProduct(int id) {
		System.out.println("In remove product dao");
		Product p = getProductById(id);
		Company c = p.getCompany();
		c.removeProduct(p);
		em.remove(getProductById(id));
	}

	// Feature methods
	@Override
	public Feature createFeature(int id, String details) {

		Feature f = new Feature();
		Product p = getProductById(id);

		f.setProduct(p);
		f.setDetails(details);

		Set<Feature> features = p.getFeatures();
		features.add(f);
		p.setFeatures(features);

		return f;
	}

	@Override
	public Feature getFeatureById(int id) {
		return em.find(Feature.class, id);
	}

	@Override
	public Feature updateFeature(int id, String details) {
		Feature f = getFeatureById(id);
		f.setDetails(details);
		return f;
	}

	@Override
	public void removeFeature(int id) {
		Feature f = getFeatureById(id);
		Product p = f.getProduct();
		p.removeFeature(f);
		em.remove(f);
	}

	public void reviewProduct(int featureId, int reviewerId, int rating) {
		System.out.println("in reviewProduct dao");
		String queryString = "SELECT fr FROM FeatureReview fr";
		List<FeatureReview> reviews = em.createQuery(queryString, FeatureReview.class).getResultList();
		System.out.println(reviews.size());
		for (FeatureReview featureReview : reviews) {
			// Check for duplicate entries
			System.out.println(
					"Existing feature id: " + featureReview.getFeature().getId() + "Current feature id:" + featureId);
			System.out.println("Existing reviewer id: " + featureReview.getReviewer().getId() + "Current reviewer id:"
					+ reviewerId);
			if (featureReview.getFeature().getId() == featureId && featureReview.getReviewer().getId() == reviewerId) {
				System.out.println("updating exisiting review");
				featureReview.setRating(rating);
				// featureReview.setComment(comment);
				break;
			}
		}
		// Else create new entry
		System.out.println("Making new Review");
		Reviewer r = getReviewerById(reviewerId);
		int currentPoints = r.getPoints();
		System.out.println("Current User Points Before Adding: " + currentPoints);
		r.setPoints(currentPoints + 10); 
		System.out.println("Points after addition: " + r.getPoints());
		FeatureReview fr = new FeatureReview();
		fr.setFeature(getFeatureById(featureId));
		fr.setReviewer(getReviewerById(reviewerId));
		fr.setRating(rating);
		// fr.setComment(comment);

		em.persist(fr);

	}

	// ReviewData methods
	@Override
	public List<ReviewData> getReviewData(int companyId) {
		List<ReviewData> reviewData = new ArrayList<>();
		double reviewAverage;
		Company c = getCompanyById(companyId);
		Set<Product> products = c.getProducts();
		for (Product product : products) {
			System.out.println("#### Review Count" + getReviewCount(product));
			Set<Feature> features = product.getFeatures();
			for (Feature feature : features) {
				if (feature.getFeatureReviews() == null || feature.getFeatureReviews().size() == 0){
					reviewAverage = 0;
					reviewData.add(new ReviewData(product.getId(), getReviewCount(product), reviewAverage));
					break;
				} else {
					reviewAverage =  getReviewAverage(product);
					reviewData.add(new ReviewData(product.getId(), getReviewCount(product), reviewAverage));
					break;
				}
					
			}
		}
		for (ReviewData rd : reviewData) {
			System.out.println(rd.toString());
		}
		return reviewData;
	}

	public long getReviewCount(Product p) {
		if (p.getFeatures().size() == 0) {
			return 0;
		} else {
			String queryString = "SELECT COUNT(fr.rating) FROM FeatureReview fr JOIN fr.feature f JOIN f.product p WHERE p.id = ?1";
			Long count = em.createQuery(queryString, Long.class).setParameter(1, p.getId()).getSingleResult();
			return count;
		}
	}

	public double getReviewAverage(Product p) {
		if (p.getFeatures().size() == 0)  {
			return 0;
		} else {
			String queryString = "SELECT AVG(fr.rating) FROM Product p JOIN p.features f JOIN f.featureReviews fr WHERE p.id = ?1";
			double average = em.createQuery(queryString, Double.class).setParameter(1, p.getId()).getSingleResult();
			return average;
		}
	}

	// Rewards methods
	
	@Override
	public List<Reward> getRewards() {
		String queryString = "SELECT r FROM Reward r";
		List<Reward> rewards = em.createQuery(queryString, Reward.class).getResultList();

		return rewards;
	}
	
}
