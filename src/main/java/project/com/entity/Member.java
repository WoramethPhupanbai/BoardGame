package project.com.entity;

import java.util.ArrayList;

import javax.persistence.*;

@Entity
@Table(name = "member")
public class Member{
	
	@Id
	@Column(name = "email")
	private String email;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "phone")
	private String phone;
	
	@Column(name = "password")
	private String password;
	
	@Column(name = "address")
	private String address;
	
	@Column(name = "status")
	private String status;
	
	@Transient
	private ArrayList<ReserveEvent> listrese = new ArrayList<ReserveEvent>();
	
	@Transient
	private ArrayList<ReserveTable> listrest;
	
	
	public Member(String email, String name, String phone, String password, String address, String status) {
		super();
		this.email = email;
		this.name = name;
		this.phone = phone;
		this.password = password;
		this.address = address;
		this.status = status;
	}

	public Member() {
		super();
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	public ArrayList<ReserveEvent> getListrese() {
		return listrese;
	}
	public void setListrese(ArrayList<ReserveEvent> listrese) {
		this.listrese = listrese;
	}
	public ArrayList<ReserveTable> getListrest() {
		return listrest;
	}
	public void setListrest(ArrayList<ReserveTable> listrest) {
		this.listrest = listrest;
	}

}
