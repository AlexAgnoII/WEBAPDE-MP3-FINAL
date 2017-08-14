package bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name = "tag_photo_relation")
public class Tag_Photo_Relation implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@Column
	private int tag_id;
	@Id
	@Column
	private int photo_id;
	
	public Tag_Photo_Relation() {}

	@Override
	public String toString() {
		return "Tag_Photo_Relation [tag_id=" + tag_id + ", photo_id=" + photo_id + "]";
	}

	public int getTag_id() {
		return tag_id;
	}

	public void setTag_id(int tag_id) {
		this.tag_id = tag_id;
	}

	public int getPhoto_id() {
		return photo_id;
	}

	public void setPhoto_id(int photo_id) {
		this.photo_id = photo_id;
	}

}
