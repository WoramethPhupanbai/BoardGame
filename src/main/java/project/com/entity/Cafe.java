package project.com.entity;

import java.util.Date;
import java.util.ArrayList;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "Cafe")
public class Cafe {

	@Id
	@Column(name = "name_cafe")
	private String nameCafe;
	
	@Column(name = "address")
	private String address;
	
	@Column(name = "nameOwner")
	private String nameOwner;
	
	@Column(name = "map")
	private String map;
	
	@Column(name = "about")
	private String about;
	
	@Column(name = "price")
	private String price;
	
	@Column(name = "tel")
	private String tel;
	
	@Column(name = "profilepictureCafe")
	private String profilepictureCafe;
	
	@Column(name = "statusCafe")
	private String statusCafe;
	
	@Column(name = "timeOpen")
	private Date timeOpen;
	
	@Column(name = "timeClosed")
	private Date timeClosed;
	
	@Column(name = "email")
	private String email;
	
	@Column(name = "passwrod")
	private String passwrod;
	
	@Transient
	private ArrayList<Event> listevent;
	
	@Transient
	private ArrayList<BoardGame> listbg;
	
	@Transient
	private ArrayList<TableCafe> listtcafe;

	@Transient
	private ArrayList<PictureCafe> listpictureCafe;
	public Cafe(String nameCafe, String address, String map, String about,
			String price,Date timeOpen,Date timeClosed,String tel) {
	super();
	this.nameCafe = nameCafe;
	this.address = address;
	this.map = map;
	this.about = about;
	this.price = price;
	this.timeOpen=timeOpen;
	this.timeClosed=timeClosed;
	this.tel=tel;
	}

	public Cafe() {
	super();
}

	public String getNameCafe() {
		return nameCafe;
	}
	public void setNameCafe(String nameCafe) {
		this.nameCafe = nameCafe;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMap() {
		return map;
	}
	public void setMap(String map) {
		this.map = map;
	}
	public String getAbout() {
		return about;
	}
	public void setAbout(String about) {
		this.about = about;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getProfilepictureCafe() {
		return profilepictureCafe;
	}

	public void setProfilepictureCafe(String profilepictureCafe) {
		this.profilepictureCafe = profilepictureCafe;
	}

	public String getStatusCafe() {
		return statusCafe;
	}

	public void setStatusCafe(String statusCafe) {
		this.statusCafe = statusCafe;
	}

	public Date getTimeOpen() {
		return timeOpen;
	}

	public void setTimeOpen(Date timeOpen) {
		this.timeOpen = timeOpen;
	}

	public Date getTimeClosed() {
		return timeClosed;
	}

	public void setTimeClosed(Date timeClosed) {
		this.timeClosed = timeClosed;
	}


	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPasswrod() {
		return passwrod;
	}

	public void setPasswrod(String passwrod) {
		this.passwrod = passwrod;
	}

	public String getNameOwner() {
		return nameOwner;
	}

	public void setNameOwner(String nameOwner) {
		this.nameOwner = nameOwner;
	}

	public ArrayList<Event> getListevent() {
		return listevent;
	}

	public void setListevent(ArrayList<Event> listevent) {
		this.listevent = listevent;
	}

	public ArrayList<BoardGame> getListbg() {
		return listbg;
	}

	public void setListbg(ArrayList<BoardGame> listbg) {
		this.listbg = listbg;
	}

	public ArrayList<TableCafe> getListtcafe() {
		return listtcafe;
	}

	public void setListtcafe(ArrayList<TableCafe> listtcafe) {
		this.listtcafe = listtcafe;
	}

	public ArrayList<PictureCafe> getListPictureCafe() {
		return listpictureCafe;
	}

	public void setListPictureCafe(ArrayList<PictureCafe> listpictureCafe) {
		this.listpictureCafe = listpictureCafe;
	}
	
}
