package project.com.entity;

import java.util.Date;

import javax.persistence.*;
@Entity
@Table(name = "reservetable")
public class ReserveTable{

	@Id
	@GeneratedValue
	@Column(name="idReserveTable")
	private int idReserveTable;
	
	@Column(name = "timeReserve")
	private String timeReserve;
	
	@Column(name = "dateReserve")
	private Date dateReserve;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="member_email")
	private Member member_email;
	

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="boardgame_id")
	private BoardGame boardgame_id;
	

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="tablecafe_idtable")
	private TableCafe tablecafe_idtable;
	
	public ReserveTable(String timeReserve, Date dateReserve) {
		super();
		this.timeReserve = timeReserve;
		this.dateReserve = dateReserve;
	}

	public ReserveTable() {
		super();
	}
	
	public int getIdReserveTable() {
		return idReserveTable;
	}

	public void setIdReserveTable(int idReserveTable) {
		this.idReserveTable = idReserveTable;
	}

	public String getTimeReserve() {
		return timeReserve;
	}
	public void setTimeReserve(String timeReserve) {
		this.timeReserve = timeReserve;
	}
	public Date getDateReserve() {
		return dateReserve;
	}
	public void setDateReserve(Date dateReserve) {
		this.dateReserve = dateReserve;
	}

	public Member getMember_email() {
		return member_email;
	}
	public void setMember_email(Member member_email) {
		this.member_email = member_email;
	}
	public BoardGame getBoardgame_id() {
		return boardgame_id;
	}
	public void setBoardgame_id(BoardGame boardgame_id) {
		this.boardgame_id = boardgame_id;
	}
	public TableCafe getTablecafe_idtable() {
		return tablecafe_idtable;
	}
	public void setTablecafe_idtable(TableCafe tablecafe_idtable) {
		this.tablecafe_idtable = tablecafe_idtable;
	}
	
}
