package gr.uoa.di.models;
// Generated Mar 29, 2016 1:43:54 PM by Hibernate Tools 4.3.1.Final

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * ItemPictures generated by hbm2java
 */
@Entity
@Table(name = "item_pictures")
public class ItemPictures implements java.io.Serializable {

	private int itemId;
	private String imageFilename;

	public ItemPictures() {
	}

	public ItemPictures(int itemId) {
		this.itemId = itemId;
	}

	public ItemPictures(int itemId, String imageFilename) {
		this.itemId = itemId;
		this.imageFilename = imageFilename;
	}

	@Id

	@Column(name = "item_id", unique = true, nullable = false)
	public int getItemId() {
		return this.itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	@Column(name = "image_filename", length = 45)
	public String getImageFilename() {
		return this.imageFilename;
	}

	public void setImageFilename(String imageFilename) {
		this.imageFilename = imageFilename;
	}

}
