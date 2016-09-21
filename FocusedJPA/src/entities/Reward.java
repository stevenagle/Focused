package entities;

import javax.persistence.*;
import java.util.List;


@Entity
public class Reward  {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	private String cost;

	private String name;

	@Column(name="photo_url")
	private String photoUrl;
	
	@Column(name="description")
	private String description;

	//bi-directional many-to-one association to ReviewerReward
	@OneToMany(mappedBy="reward")
	private List<ReviewerReward> reviewerRewards;

	public Reward() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCost() {
		return this.cost;
	}

	public void setCost(String cost) {
		this.cost = cost;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhotoUrl() {
		return this.photoUrl;
	}

	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}

	public List<ReviewerReward> getReviewerRewards() {
		return this.reviewerRewards;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setReviewerRewards(List<ReviewerReward> reviewerRewards) {
		this.reviewerRewards = reviewerRewards;
	}

	public ReviewerReward addReviewerReward(ReviewerReward reviewerReward) {
		getReviewerRewards().add(reviewerReward);
		reviewerReward.setReward(this);

		return reviewerReward;
	}

	public ReviewerReward removeReviewerReward(ReviewerReward reviewerReward) {
		getReviewerRewards().remove(reviewerReward);
		reviewerReward.setReward(null);

		return reviewerReward;
	}

}