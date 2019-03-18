package project.com.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import project.com.entity.ReserveTable;
import project.com.entity.TableCafe;
import project.com.repository.ReserveTableRepository;
import project.com.repository.TableCafeRepository;

@Controller
public class ListTableCafeController {
	@Autowired
	TableCafeRepository tableCafeRepository;
	@Autowired
	ReserveTableRepository reserveTableRepository;
	@GetMapping("/listTableCafe")
	public String loadListTableCafepage(HttpServletRequest request, HttpSession session) {
		String namecafe = (String)request.getParameter("namecafe");
		Iterable<TableCafe> listTableCafe = tableCafeRepository.findAll();
		Iterable<ReserveTable> listReserveTable = reserveTableRepository.findAll();
		session.setAttribute("listTableCafe", listTableCafe);
		request.setAttribute("namecafe", namecafe);
		request.setAttribute("listReserveTable", listReserveTable);
		request.setAttribute("id", 0);
		return "listTableCafe";
	}
	
	@GetMapping("/listTableCafeIdBoardGame")
	public String loadListTableCafeIdBoardGamepage(HttpServletRequest request, HttpSession session) throws ParseException {
		String nameCafe = (String)session.getAttribute("nameCafe");
		SimpleDateFormat sm = new SimpleDateFormat("HH:mm");
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		String timeS = sm.format(timestamp.getTime());
		Date timenow = sm.parse(timeS);
		long TimeRes = 0;
		long TimeNow = 0;
		long sumTime = 0;
		Iterable<ReserveTable> listReserveTable = reserveTableRepository.findAll();
		if(listReserveTable!=null) {
			for(ReserveTable listResTable : listReserveTable) {
				if(nameCafe.equals(listResTable.getTablecafe_idtable().getCafe_namecafe().getNameCafe())) {
					
					Date timeres = sm.parse(listResTable.getTimeReserve());
					Timestamp timeRes = new Timestamp(timeres.getTime());
					Timestamp timeNow = new Timestamp(timenow.getTime());
					System.out.println(timeRes);
					long timesRes = timeRes.getTime();
					long timesNow = timeNow.getTime();
					TimeRes=timesRes/(60 * 60 * 1000);
					TimeNow=timesNow/(60 * 60 * 1000);
					System.out.println(TimeNow);
					System.out.println(TimeRes);
					sumTime=TimeNow-TimeRes;
					System.out.println(sumTime);
					if(sumTime>=4) {
						ReserveTable resTable = reserveTableRepository.findByidReserveTable(listResTable.getIdReserveTable());
						
						resTable.getTablecafe_idtable().setIdTable(resTable.getTablecafe_idtable().getIdTable());
						resTable.getTablecafe_idtable().setNumberTable(resTable.getTablecafe_idtable().getNumberTable());
						resTable.getTablecafe_idtable().setZone(resTable.getTablecafe_idtable().getZone());
						resTable.getTablecafe_idtable().setChair(resTable.getTablecafe_idtable().getChair());
						resTable.getTablecafe_idtable().getCafe_namecafe().setNameCafe(nameCafe);
						resTable.getTablecafe_idtable().setStatusTable("Normal");
						
						resTable.getBoardgame_id().setIdBoardGame(resTable.getBoardgame_id().getIdBoardGame());
						resTable.getBoardgame_id().setStatusBoardGame("Normal");
						resTable.getBoardgame_id().setMaxPlayTime(resTable.getBoardgame_id().getMaxPlayTime());
						resTable.getBoardgame_id().setMinPlayTime(resTable.getBoardgame_id().getMinPlayTime());
						resTable.getBoardgame_id().setMaxPeople(resTable.getBoardgame_id().getMaxPeople());
						resTable.getBoardgame_id().setMinPeople(resTable.getBoardgame_id().getMinPeople());
						resTable.getBoardgame_id().setNameBoardGame(resTable.getBoardgame_id().getNameBoardGame());
						resTable.getBoardgame_id().setAgeBoardGame(resTable.getBoardgame_id().getAgeBoardGame());
						resTable.getBoardgame_id().getCafe().setNameCafe(nameCafe);
						resTable.getBoardgame_id().setGameDetail(resTable.getBoardgame_id().getGameDetail());
						resTable.getBoardgame_id().setPictureBoardGame(resTable.getBoardgame_id().getPictureBoardGame());
						
						resTable.setIdReserveTable(resTable.getIdReserveTable());
						reserveTableRepository.delete(resTable);
					}
				}
				
				
			}
		}
		
		int idBoardGame = Integer.parseInt(request.getParameter("idBoardGame"));
		Iterable<TableCafe> listTableCafe = tableCafeRepository.findAll();
		String status = "0";
		System.out.println(idBoardGame);
		session.setAttribute("listTableCafe", listTableCafe);
		session.setAttribute("idBoardGame", idBoardGame);
		request.setAttribute("id", 1);
		request.setAttribute("status", status);
		return "listTableCafe";
	}
	
	@GetMapping("/listupdateTableCafe")
	public String loadListupdateTableCafepage(HttpServletRequest request, HttpSession session) {
		String status = (String)request.getParameter("status");
		Iterable<TableCafe> listTableCafe = tableCafeRepository.findAll();
		Iterable<ReserveTable> listReserveTable = reserveTableRepository.findAll();
		for(TableCafe table : listTableCafe){
			session.setAttribute("tableNameCafe", table.getCafe_namecafe());
		}
		session.setAttribute("listTableCafe", listTableCafe);
		request.setAttribute("listReserveTable", listReserveTable);
		request.setAttribute("id", 0);
		request.setAttribute("status", status);
		return "listTableCafe";
	}
}
