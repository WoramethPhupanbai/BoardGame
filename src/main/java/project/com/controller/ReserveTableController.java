package project.com.controller;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import project.com.entity.*;
import project.com.repository.BoardGameRepository;
import project.com.repository.TableCafeRepository;
import project.com.repository.ReserveTableRepository;

@Controller
public class ReserveTableController {
	@Autowired
	ReserveTableRepository reserveTableRepository;
	@Autowired
	TableCafeRepository tableCafeRepository;
	@Autowired
	BoardGameRepository boardGameRepository;
	@Autowired
	private JavaMailSender sender;

	@GetMapping(value="/reserveTable")
	public String loadListReserveTablepage(HttpServletRequest request,HttpSession session) throws Exception{
		int idTable = Integer.parseInt(request.getParameter("idTable"));
		int idBoardGame = (Integer)session.getAttribute("idBoardGame");
		BoardGame boardGame = new BoardGame();
		TableCafe tableCafe = new TableCafe();
		boardGame = boardGameRepository.findByidBoardGame(idBoardGame);
		tableCafe = tableCafeRepository.findByidTable(idTable);
		request.setAttribute("boardGame",boardGame);
		request.setAttribute("tableCafe",tableCafe);
		return "reserveTable";
	}
	@GetMapping("/selectBoardGame")
	public String loadSelectBoarGamepage(HttpServletRequest request,HttpSession session) {
		String nameCafe = request.getParameter("nameCafe");
		Iterable<BoardGame> listBoardGame = boardGameRepository.findAll();
		session.setAttribute("nameCafe", nameCafe);
		request.setAttribute("listBoardGame", listBoardGame);
		return "listBoardGame";
	}
	@PostMapping(value="/doReserveTable")
	public String doReserveTable(HttpServletRequest request,HttpSession session) throws Exception{		
		request.setCharacterEncoding("UTF-8");
		DateFormat time = new SimpleDateFormat("HH:mm");
		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		Date date = new Date();
		String datenow = dateFormat.format(date);
		
		TableCafe table = new TableCafe();
		ReserveTable resTable = new ReserveTable();
		BoardGame boardGame = new BoardGame();
		//long diff = 0; 
		
		Member email = (Member)session.getAttribute("mem");
		int idBoardGame = (Integer)session.getAttribute("idBoardGame");
		int idTable = Integer.parseInt(request.getParameter("idTable"));
		String timeres = request.getParameter("timeres");
		Date tres = time.parse(timeres);
		
		int numberTable = Integer.parseInt(request.getParameter("numberTable"));
		
		boardGame = boardGameRepository.findByidBoardGame(idBoardGame);
		TableCafe tableCafe = tableCafeRepository.findByidTable(idTable);
		String timeclose = time.format(boardGame.getCafe().getTimeClosed().getTime());
		String timeopen = time.format(boardGame.getCafe().getTimeOpen().getTime());
		Date timeC = time.parse(timeclose);
		Date timeO = time.parse(timeopen);
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		String timeS = time.format(timestamp.getTime());
		Date timeNow = time.parse(timeS);
		Timestamp timesClose = new Timestamp(timeC.getTime());
		Timestamp timesOpen = new Timestamp(timeO.getTime());
		Timestamp timeRes = new Timestamp(tres.getTime());
		Timestamp timesNow = new Timestamp(timeNow.getTime());
		long TimeClose = timesClose.getTime();
		long TimeOpen = timesOpen.getTime();
		long TimeRes = timeRes.getTime();
		long TimeNow = timesNow.getTime();
		if(TimeRes >= TimeClose||TimeRes <TimeOpen||TimeRes<TimeNow) {
			String status = "3";
	 		request.setAttribute("status", status );
			return "home";
		}else{
			Date dateRes = dateFormat.parse(datenow);
			String t = time.format(tres);
			table.setIdTable(idTable);
			table.setNumberTable(numberTable);
			table.setStatusTable("Reserved");
			table.setChair(tableCafe.getChair());
			table.setZone(tableCafe.getZone());
			table.setCafe_namecafe(tableCafe.getCafe_namecafe());
			
			boardGame.setIdBoardGame(idBoardGame);
			boardGame.setNameBoardGame(boardGame.getNameBoardGame());
			boardGame.setAgeBoardGame(boardGame.getAgeBoardGame());
			boardGame.setMaxPlayTime(boardGame.getMaxPlayTime());
			boardGame.setMinPlayTime(boardGame.getMinPlayTime());
			boardGame.setMaxPeople(boardGame.getMaxPeople());
			boardGame.setMinPeople(boardGame.getMinPeople());
			boardGame.setCafe(boardGame.getCafe());
			boardGame.setStatusBoardGame("Reserved");
			boardGame.setGameDetail(boardGame.getGameDetail());
			boardGame.setPictureBoardGame(boardGame.getPictureBoardGame());
			
			resTable.setTablecafe_idtable(table);
			resTable.setBoardgame_id(boardGame);
			resTable.setMember_email(email);
			resTable.setDateReserve(dateRes);
			resTable.setTimeReserve(t);

			
			boardGameRepository.save(boardGame);
			tableCafeRepository.save(table);
	 		reserveTableRepository.save(resTable);
	 		this.isSendEmail(session, numberTable,boardGame,resTable);
	 		Iterable<ReserveTable> listReserveTable = reserveTableRepository.findAll();
	 		String status = "1";
	 		request.setAttribute("status", status );
	 		request.setAttribute("listReserveTable", listReserveTable);
			return "listMyReserveTable";	
		}
		
				 		
	}
	public String isSendEmail(HttpSession session,int numberTable,BoardGame boadGame,ReserveTable resTable) throws MessagingException{
		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		Member email = (Member)session.getAttribute("mem");
		String dateRes = dateFormat.format(resTable.getDateReserve());
		MimeMessage message = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		helper.setTo(resTable.getMember_email().getEmail());
		helper.setText("I'm ReserveTable My Name is : "+email.getName()+"\n"+"NumberTable: "+numberTable+"\n"+"Time Reservetion: "+resTable.getTimeReserve()+"\n"+"Reservetion Date: "+dateRes+"\n"+"BoardGame Name: "+boadGame.getNameBoardGame()
		+"\n"+"Zone: "+resTable.getTablecafe_idtable().getZone());
 		helper.setSubject("BoardGame Notification");
 		sender.send(message);
		return null;
	}
}
