package entities;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name="reviewer_reward")
public class ReviewerReward  {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	@Temporal(TemporalType.DATE)
	private Date date;

	@ManyToOne
	private Reviewer reviewer;

	@ManyToOne
	private Reward reward;

	public ReviewerReward() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Reward getReward() {
		return this.reward;
	}

	public void setReward(Reward reward) {
		this.reward = reward;
	}

	public Reviewer getReviewer() {
		return reviewer;
	}

	public void setReviewer(Reviewer reviewer) {
		this.reviewer = reviewer;
	}

}