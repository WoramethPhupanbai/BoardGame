package project.com.controller;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import project.com.entity.ReserveTable;
import project.com.repository.ReserveTableRepository;

@Controller
public class CancelTableController {
	@Autowired
	ReserveTableRepository reserveTableRepository;
	
	@GetMapping("/cancelMyTable")
	public String doCancelMyTable(HttpServletRequest request,HttpSession session) throws MessagingException {
		ReserveTable resTable = new ReserveTable();
		
		int idReserveTable = Integer.parseInt(request.getParameter("idReserveTable"));
		
		resTable = reserveTableRepository.findByidReserveTable(idReserveTable);
		
		resTable.getTablecafe_idtable().setIdTable(resTable.getTablecafe_idtable().getIdTable());
		resTable.getTablecafe_idtable().setNumberTable(resTable.getTablecafe_idtable().getNumberTable());
		resTable.getTablecafe_idtable().setZone(resTable.getTablecafe_idtable().getZone());
		resTable.getTablecafe_idtable().setChair(resTable.getTablecafe_idtable().getChair());
		resTable.getTablecafe_idtable().getCafe_namecafe().setNameCafe(resTable.getTablecafe_idtable().getCafe_namecafe().getNameCafe());
		resTable.getTablecafe_idtable().setStatusTable("Normal");
		
		resTable.getBoardgame_id().setIdBoardGame(resTable.getBoardgame_id().getIdBoardGame());
		resTable.getBoardgame_id().setStatusBoardGame("Normal");
		resTable.getBoardgame_id().setMaxPlayTime(resTable.getBoardgame_id().getMaxPlayTime());
		resTable.getBoardgame_id().setMinPlayTime(resTable.getBoardgame_id().getMinPlayTime());
		resTable.getBoardgame_id().setMaxPeople(resTable.getBoardgame_id().getMaxPeople());
		resTable.getBoardgame_id().setMinPeople(resTable.getBoardgame_id().getMinPeople());
		resTable.getBoardgame_id().setNameBoardGame(resTable.getBoardgame_id().getNameBoardGame());
		resTable.getBoardgame_id().setAgeBoardGame(resTable.getBoardgame_id().getAgeBoardGame());
		resTable.getBoardgame_id().getCafe().setNameCafe(resTable.getTablecafe_idtable().getCafe_namecafe().getNameCafe());
		resTable.getBoardgame_id().setGameDetail(resTable.getBoardgame_id().getGameDetail());
		resTable.getBoardgame_id().setPictureBoardGame(resTable.getBoardgame_id().getPictureBoardGame());
		
		resTable.setIdReserveTable(idReserveTable);
 		reserveTableRepository.delete(resTable);
		
		List<ReserveTable> listReserveTable = reserveTableRepository.findAll();
		String status = "0";
 		request.setAttribute("status", status);
		request.setAttribute("listReserveTable",listReserveTable);
		request.setAttribute("id", 0);
		return "listTableCafe";	
	}
}
