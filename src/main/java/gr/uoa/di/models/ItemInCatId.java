package gr.uoa.di.models;
// Generated Mar 29, 2016 1:43:54 PM by Hibernate Tools 4.3.1.Final

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * ItemInCatId generated by hbm2java
 */
@Embeddable
public class ItemInCatId implements java.io.Serializable {

	private Integer catId;
	private Integer itemId;

	public ItemInCatId() {
	}

	public ItemInCatId(Integer catId, Integer itemId) {
		this.catId = catId;
		this.itemId = itemId;
	}

	@Column(name = "cat_id")
	public Integer getCatId() {
		return this.catId;
	}

	public void setCatId(Integer catId) {
		this.catId = catId;
	}

	@Column(name = "item_id")
	public Integer getItemId() {
		return this.itemId;
	}

	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof ItemInCatId))
			return false;
		ItemInCatId castOther = (ItemInCatId) other;

		return ((this.getCatId() == castOther.getCatId())
				|| (this.getCatId() != null && castOther.getCatId() != null && this.getCatId().equals(castOther.getCatId())))
				&& ((this.getItemId() == castOther.getItemId())
						|| (this.getItemId() != null && castOther.getItemId() != null && this.getItemId().equals(castOther.getItemId())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + (getCatId() == null ? 0 : this.getCatId().hashCode());
		result = 37 * result + (getItemId() == null ? 0 : this.getItemId().hashCode());
		return result;
	}

}
