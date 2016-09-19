package entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String description;
	private String name;
	@Column(name = "photo_url")
	private String photoUrl;
	private double price;

	// bi-directional many-to-one association to Feature
	@OneToMany(mappedBy = "product", fetch=FetchType.EAGER)
	private List<Feature> features;

	// bi-directional many-to-one association to FocusDetail
	@OneToMany(mappedBy = "product", fetch=FetchType.EAGER)
	private List<FocusDetail> focusDetails;

	// bi-directional many-to-one association to Company
	@ManyToOne
	private Company company;

	public Product() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
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

	public double getPrice() {
		return this.price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public List<Feature> getFeatures() {
		return this.features;
	}

	public void setFeatures(List<Feature> features) {
		this.features = features;
	}

	public Feature addFeature(Feature feature) {
		getFeatures().add(feature);
		feature.setProduct(this);

		return feature;
	}

	public Feature removeFeature(Feature feature) {
		getFeatures().remove(feature);
		feature.setProduct(null);

		return feature;
	}

	public List<FocusDetail> getFocusDetails() {
		return this.focusDetails;
	}

	public void setFocusDetails(List<FocusDetail> focusDetails) {
		this.focusDetails = focusDetails;
	}

	public FocusDetail addFocusDetail(FocusDetail focusDetail) {
		getFocusDetails().add(focusDetail);
		focusDetail.setProduct(this);

		return focusDetail;
	}

	public FocusDetail removeFocusDetail(FocusDetail focusDetail) {
		getFocusDetails().remove(focusDetail);
		focusDetail.setProduct(null);

		return focusDetail;
	}

	public Company getCompany() {
		return this.company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", description=" + description + ", name=" + name + ", photoUrl=" + photoUrl
				+ ", price=" + price + ", features=" + features + ", focusDetails=" + focusDetails + ", company="
				+ company + "]";
	}

}
