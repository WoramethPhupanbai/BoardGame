package project.com.entity;

import javax.persistence.*;
@Entity
@Table(name = "picturecafe")
public class PictureCafe{
	
	@Id
	@GeneratedValue
	@Column(name = "idPictureCafe")
	private int idPictureCafe;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="name_cafe")
	private Cafe nameCafe;
	
	@Column(name = "pictureCafe")
	private String pictureCafe;
	public PictureCafe() {
		super();
	}
	
	public Cafe getNameCafe() {
		return nameCafe;
	}

	public int getIdPictureCafe() {
		return idPictureCafe;
	}

	public void setIdPictureCafe(int idPictureCafe) {
		this.idPictureCafe = idPictureCafe;
	}

	public void setNameCafe(Cafe nameCafe) {
		this.nameCafe = nameCafe;
	}

	public String getPictureCafe() {
		return pictureCafe;
	}
	public void setPictureCafe(String pictureCafe) {
		this.pictureCafe = pictureCafe;
	}
	
}
