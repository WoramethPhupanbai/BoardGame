package project.com.entity;

import java.util.ArrayList;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "tablecafe")
public class TableCafe{

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "idtable")
	private int idTable;
	
	@Column(name = "numberTable")
	private int numberTable;
	
	@JoinColumn(name="zone")
	private String zone;
	
	@Column(name = "chair")
	private int chair;
	
	@Column(name = "statusTable")
	private String statusTable;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="cafe_namecafe")
	private Cafe cafe_namecafe;
	
	@Transient
	private ArrayList<ReserveTable> listrest;

	public TableCafe() {
		super();
	}
	

	public TableCafe(int numberTable, String zone, int chair, String statusTable) {
		super();
		this.numberTable = numberTable;
		this.zone = zone;
		this.chair = chair;
		this.statusTable = statusTable;
	}


	public int getIdTable() {
		return idTable;
	}


	public void setIdTable(int idTable) {
		this.idTable = idTable;
	}


	public int getNumberTable() {
		return numberTable;
	}


	public void setNumberTable(int numberTable) {
		this.numberTable = numberTable;
	}


	public String getZone() {
		return zone;
	}


	public void setZone(String zone) {
		this.zone = zone;
	}


	public int getChair() {
		return chair;
	}


	public void setChair(int chair) {
		this.chair = chair;
	}


	public String getStatusTable() {
		return statusTable;
	}


	public void setStatusTable(String statusTable) {
		this.statusTable = statusTable;
	}


	public Cafe getCafe_namecafe() {
		return cafe_namecafe;
	}


	public void setCafe_namecafe(Cafe cafe_namecafe) {
		this.cafe_namecafe = cafe_namecafe;
	}


	public ArrayList<ReserveTable> getListrest() {
		return listrest;
	}


	public void setListrest(ArrayList<ReserveTable> listrest) {
		this.listrest = listrest;
	}


	
}
