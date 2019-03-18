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
@Table(name = "Boardgame")
public class BoardGame {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "idBoardGame")
	private int idBoardGame;
	@Column(name = "nameBoardGame")
	private String nameBoardGame;
	@Column(name = "ageBoardGame")
	private String ageBoardGame;
	@Column(name = "gameDetail")
	private String gameDetail;
	@Column(name = "pictureBoardGame")
	private String pictureBoardGame;
	@Column(name = "statusBoardGame")
	private String statusBoardGame;
	@Column(name = "minPeople")
	private int minPeople;
	@Column(name = "maxPeople")
	private int maxPeople;
	@Column(name = "minPlayTime")
	private int minPlayTime;
	@Column(name = "maxPlayTime")
	private int maxPlayTime;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="name_cafe")
	private Cafe cafe;
	
	@Transient
	private ArrayList<ReserveTable> listrest;
	

	public BoardGame(int idBoardGame, String nameBoardGame, String ageBoardGame,
			String gameDetail, String pictureBoardGame, String statusBoardGame, int minPeople, int maxPeople,
			int minPlayTime, int maxPlayTime) {
		super();
		this.idBoardGame = idBoardGame;
		this.nameBoardGame = nameBoardGame;
		this.ageBoardGame = ageBoardGame;
		this.gameDetail = gameDetail;
		this.pictureBoardGame = pictureBoardGame;
		this.statusBoardGame = statusBoardGame;
		this.minPeople = minPeople;
		this.maxPeople = maxPeople;
		this.minPlayTime = minPlayTime;
		this.maxPlayTime = maxPlayTime;
	}

	public BoardGame() {
		super();
	}

	public int getIdBoardGame() {
		return idBoardGame;
	}
	public void setIdBoardGame(int idBoardGame) {
		this.idBoardGame = idBoardGame;
	}
	public String getNameBoardGame() {
		return nameBoardGame;
	}
	public void setNameBoardGame(String nameBoardGame) {
		this.nameBoardGame = nameBoardGame;
	}
	public String getAgeBoardGame() {
		return ageBoardGame;
	}
	public void setAgeBoardGame(String ageBoardGame) {
		this.ageBoardGame = ageBoardGame;
	}
	public String getGameDetail() {
		return gameDetail;
	}
	public void setGameDetail(String gameDetail) {
		this.gameDetail = gameDetail;
	}
	public String getPictureBoardGame() {
		return pictureBoardGame;
	}

	public void setPictureBoardGame(String pictureBoardGame) {
		this.pictureBoardGame = pictureBoardGame;
	}

	public String getStatusBoardGame() {
		return statusBoardGame;
	}
	public void setStatusBoardGame(String statusBoardGame) {
		this.statusBoardGame = statusBoardGame;
	}

	public int getMinPeople() {
		return minPeople;
	}

	public void setMinPeople(int minPeople) {
		this.minPeople = minPeople;
	}

	public int getMaxPeople() {
		return maxPeople;
	}

	public void setMaxPeople(int maxPeople) {
		this.maxPeople = maxPeople;
	}

	public int getMinPlayTime() {
		return minPlayTime;
	}

	public void setMinPlayTime(int minPlayTime) {
		this.minPlayTime = minPlayTime;
	}

	public int getMaxPlayTime() {
		return maxPlayTime;
	}

	public void setMaxPlayTime(int maxPlayTime) {
		this.maxPlayTime = maxPlayTime;
	}


	public Cafe getCafe() {
		return cafe;
	}

	public void setCafe(Cafe cafe) {
		this.cafe = cafe;
	}

	public ArrayList<ReserveTable> getListrest() {
		return listrest;
	}

	public void setListrest(ArrayList<ReserveTable> listrest) {
		this.listrest = listrest;
	}

	
}
