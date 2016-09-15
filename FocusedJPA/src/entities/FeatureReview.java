package entities;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="feature_review")
public class FeatureReview {
	
	@Id
	private int id;

	private String comment;

	private int rating;

	//bi-directional many-to-one association to Feature
	@ManyToOne
	private Feature feature;

	//bi-directional many-to-one association to Reviewer
	@ManyToOne
	@JoinColumn(name="user_id")
	private Reviewer reviewer;

	public FeatureReview() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getComment() {
		return this.comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getRating() {
		return this.rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public Feature getFeature() {
		return this.feature;
	}

	public void setFeature(Feature feature) {
		this.feature = feature;
	}

	public Reviewer getReviewer() {
		return this.reviewer;
	}

	public void setReviewer(Reviewer reviewer) {
		this.reviewer = reviewer;
	}
}
