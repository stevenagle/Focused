package entities;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Feature {
	@Id
	private int id;

	private String details;

	// bi-directional many-to-one association to Product
	@ManyToOne
	private Product product;

	// bi-directional many-to-one association to FeatureReview
	@OneToMany(mappedBy = "feature")
	private List<FeatureReview> featureReviews;

	public Feature() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDetails() {
		return this.details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public List<FeatureReview> getFeatureReviews() {
		return this.featureReviews;
	}

	public void setFeatureReviews(List<FeatureReview> featureReviews) {
		this.featureReviews = featureReviews;
	}

	public FeatureReview addFeatureReview(FeatureReview featureReview) {
		getFeatureReviews().add(featureReview);
		featureReview.setFeature(this);

		return featureReview;
	}

	public FeatureReview removeFeatureReview(FeatureReview featureReview) {
		getFeatureReviews().remove(featureReview);
		featureReview.setFeature(null);

		return featureReview;
	}

	@Override
	public String toString() {
		return "Feature [id=" + id + ", details=" + details + ", product=" + product + ", featureReviews="
				+ featureReviews + "]";
	}
}
