package project.com.entity;

import java.util.Date;

import javax.persistence.*;
@Entity
@Table(name = "Reserveevent")
public class ReserveEvent{

	@Id
	@GeneratedValue
	@Column(name="idReserveEvent")
	private int idReserveEvent;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="id_event")
	private Event event;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="member_email")
	private Member member_email;
	

	@Column(name = "reserveDate")
	private Date reserveDate;

	public ReserveEvent(Date reserveDate) {
		super();
		this.reserveDate = reserveDate;
	}

	public ReserveEvent() {
		super();
	}

	public Date getReserveDate() {
		return reserveDate;
	}

	public int getIdReserveEvent() {
		return idReserveEvent;
	}

	public void setIdReserveEvent(int idReserveEvent) {
		this.idReserveEvent = idReserveEvent;
	}

	public void setReserveDate(Date reserveDate) {
		this.reserveDate = reserveDate;
	}

	public Event getEvent() {
		return event;
	}

	public void setEvent(Event event) {
		this.event = event;
	}

	public Member getMember_email() {
		return member_email;
	}

	public void setMember_email(Member member_email) {
		this.member_email = member_email;
	}
	
}
