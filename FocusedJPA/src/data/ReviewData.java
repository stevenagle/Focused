package data;

public class ReviewData {
	private int itemId;
	private long ratingCount;
	private double averageRating;
	
	public ReviewData() {
	}
	
	public ReviewData(int itemId, long ratingCount, double averageRating) {
		this.itemId = itemId;
		this.ratingCount = ratingCount;
		this.averageRating = averageRating;
	}
	
	
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public long getRatingCount() {
		return ratingCount;
	}
	public void setRatingCount(long ratingCount) {
		this.ratingCount = ratingCount;
	}
	public double getAverageRating() {
		return averageRating;
	}
	public void setAverageRating(double averageRating) {
		this.averageRating = averageRating;
	}
	
	@Override
	public String toString() {
		return "ReviewData [itemId=" + itemId + ", ratingCount=" + ratingCount + ", averageRating=" + averageRating
				+ "]";
	}
}


