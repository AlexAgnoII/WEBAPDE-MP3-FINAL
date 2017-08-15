package bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name = "shared_photos")
public class Shared_Photos implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@Column
	private int photo_id;
	@Id
	@Column
	private String shared_user_username;
	
	public Shared_Photos() {}

	public int getPhoto_id() {
		return photo_id;
	}

	public void setPhoto_id(int photo_id) {
		this.photo_id = photo_id;
	}

	public String getShared_user_username() {
		return shared_user_username;
	}

	public void setShared_user_username(String shared_user_username) {
		this.shared_user_username = shared_user_username;
	}

	@Override
	public String toString() {
		return "Shared_Photos [photo_id=" + photo_id + ", shared_user_username=" + shared_user_username + "]";
	}
	
	
}
