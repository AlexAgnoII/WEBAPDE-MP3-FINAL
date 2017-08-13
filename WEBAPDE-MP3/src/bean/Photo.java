package bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity(name = "photo")
public class Photo {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int photo_id;
	@Column
	private String user_username;
	@Column
	private String photo_title;
	@Column
	private String photo_description;
	@Column
	private String photo_uploadDate;
	@Column
	private String photo_url;
	@Column
	private String photo_privacy;

	public Photo() {}

	public int getPhoto_id() {
		return photo_id;
	}

	public void setPhoto_id(int photo_id) {
		this.photo_id = photo_id;
	}

	public String getUser_username() {
		return user_username;
	}

	public void setUser_username(String user_username) {
		this.user_username = user_username;
	}

	public String getPhoto_title() {
		return photo_title;
	}

	public void setPhoto_title(String photo_title) {
		this.photo_title = photo_title;
	}

	public String getPhoto_description() {
		return photo_description;
	}

	public void setPhoto_description(String photo_description) {
		this.photo_description = photo_description;
	}

	public String getPhoto_uploadDate() {
		return photo_uploadDate;
	}

	public void setPhoto_uploadDate(String photo_uploadDate) {
		this.photo_uploadDate = photo_uploadDate;
	}

	public String getPhoto_url() {
		return photo_url;
	}

	public void setPhoto_url(String photo_url) {
		this.photo_url = photo_url;
	}

	public String getPhoto_privacy() {
		return photo_privacy;
	}

	public void setPhoto_privacy(String photo_privacy) {
		this.photo_privacy = photo_privacy;
	}

	@Override
	public String toString() {
		return "Photo [photo_id=" + photo_id + ", user_username=" + user_username + ", photo_title=" + photo_title
				+ ", photo_description=" + photo_description + ", photo_uploadDate=" + photo_uploadDate + ", photo_url="
				+ photo_url + ", photo_privacy=" + photo_privacy + "]";
	}

}
