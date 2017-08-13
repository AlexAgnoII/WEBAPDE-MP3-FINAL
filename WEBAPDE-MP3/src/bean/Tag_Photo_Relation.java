package bean;

import javax.persistence.Column;
import javax.persistence.Entity;

@Entity(name = "tag_photo_relation")
public class Tag_Photo_Relation {
	@Column
	private int tag_id;
	@Column
	private int photo_id;
	
	public Tag_Photo_Relation() {}

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

	@Override
	public String toString() {
		return "Tag_Photo_Relation [tag_id=" + tag_id + ", photo_id=" + photo_id + "]";
	}
	
}
