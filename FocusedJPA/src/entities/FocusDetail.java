package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "focus_details")
public class FocusDetail {

	@Id
	private int id;

	private String details;

	@Column(name = "reviewer_count")
	private int reviewerCount;

	// bi-directional many-to-one association to Product
	@ManyToOne
	private Product product;

	public FocusDetail() {
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

	public int getReviewerCount() {
		return this.reviewerCount;
	}

	public void setReviewerCount(int reviewerCount) {
		this.reviewerCount = reviewerCount;
	}

	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@Override
	public String toString() {
		return "FocusDetail [id=" + id + ", details=" + details + ", reviewerCount=" + reviewerCount + ", product="
				+ product + "]";
	}

}
