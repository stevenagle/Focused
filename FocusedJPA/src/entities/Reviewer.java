package entities;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Reviewer {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private int age;
	private String gender;
	private String password;
	private String username;
	// bi-directional many-to-one association to FeatureReview
	@OneToMany(mappedBy = "reviewer", fetch=FetchType.EAGER)
	private List<FeatureReview> featureReviews;

	public Reviewer() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getAge() {
		return this.age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getGender() {
		return this.gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public List<FeatureReview> getFeatureReviews() {
		return this.featureReviews;
	}

	public void setFeatureReviews(List<FeatureReview> featureReviews) {
		this.featureReviews = featureReviews;
	}

	public FeatureReview addFeatureReview(FeatureReview featureReview) {
		getFeatureReviews().add(featureReview);
		featureReview.setReviewer(this);

		return featureReview;
	}

	public FeatureReview removeFeatureReview(FeatureReview featureReview) {
		getFeatureReviews().remove(featureReview);
		featureReview.setReviewer(null);

		return featureReview;
	}

	@Override
	public String toString() {
		return "Reviewer [id=" + id + ", age=" + age + ", gender=" + gender + ", password=" + password + ", username="
				+ username + ", featureReviews=" + featureReviews + "]";
	}
}
