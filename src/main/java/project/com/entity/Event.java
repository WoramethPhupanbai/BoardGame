package project.com.entity;

import java.util.ArrayList;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.data.annotation.CreatedDate;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "event")
public class Event {
	
	@Id
	@GeneratedValue
	@Column(name = "id_Event")
	private int idEvent;
	
	@Column(name = "nameEvent")
	private String nameEvent;
	
	@CreatedDate
	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="dd-MM-yyyy,HH:00", timezone="ICT")
	@Column(name = "eventDate",columnDefinition="DATETIME")
	private Date eventDate;
	
	private Date startTime;
	
	@Column(name = "detailEvent")
	private String detailEvent;
	
	@Column(name = "price")
	private String price;
	
	@Column(name = "pictureEvent")
	private String pictureEvent;
	
	@Column(name = "quatity")
	private int quatity;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="name_cafe")
	private Cafe cafe;
	
	@Transient
	private ArrayList<ReserveEvent> listrest;
	
	public Event(int idEvent, String nameEvent, Date eventDate, String detailEvent,
			String price, int quatity,String pictureEvent,Date startTime) {
		super();
		this.idEvent = idEvent;
		this.nameEvent = nameEvent;
		this.eventDate = eventDate;
		this.detailEvent = detailEvent;
		this.price = price;
		this.quatity=quatity;
		this.pictureEvent=pictureEvent;
		this.startTime=startTime;
	}
	
	public Event() {
		super();
	}

	public int getIdEvent() {
		return idEvent;
	}
	public void setIdEvent(int idEvent) {
		this.idEvent = idEvent;
	}
	public String getNameEvent() {
		return nameEvent;
	}
	public void setNameEvent(String nameEvent) {
		this.nameEvent = nameEvent;
	}
	public Date getEventDate() {
		return eventDate;
	}
	public void setEventDate(Date eventDate) {
		this.eventDate = eventDate;
	}
	public String getDetailEvent() {
		return detailEvent;
	}
	public void setDetailEvent(String detailEvent) {
		this.detailEvent = detailEvent;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
	public String getPictureEvent() {
		return pictureEvent;
	}

	public void setPictureEvent(String pictureEvent) {
		this.pictureEvent = pictureEvent;
	}
	
	public int getQuatity() {
		return quatity;
	}

	public void setQuatity(int quatity) {
		this.quatity = quatity;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Cafe getCafe() {
		return cafe;
	}

	public void setCafe(Cafe cafe) {
		this.cafe = cafe;
	}

	public ArrayList<ReserveEvent> getListrest() {
		return listrest;
	}

	public void setListrest(ArrayList<ReserveEvent> listrest) {
		this.listrest = listrest;
	}

	
	
}
