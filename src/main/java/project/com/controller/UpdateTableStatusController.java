package project.com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import project.com.entity.ReserveTable;
import project.com.entity.TableCafe;
import project.com.repository.ReserveTableRepository;
import project.com.repository.TableCafeRepository;

@Controller
public class UpdateTableStatusController {
	@Autowired
	TableCafeRepository tableCafeRepository;
	@Autowired
	ReserveTableRepository reserveTableRepository;
	@GetMapping("/updateStatusTable")
	public  String loadUpdateTablepage(HttpServletRequest request) {
		String status = request.getParameter("status");
		int idTable = Integer.parseInt(request.getParameter("idTable"));
		TableCafe table = new TableCafe();
		table = tableCafeRepository.findByidTable(idTable);
		request.setAttribute("table", table);
		request.setAttribute("status", status);
		return "updateTableStatus";
	}
	@PostMapping(value="/doUpdateTable")
	public String doEditstatusTable(HttpServletRequest request,HttpSession session) throws Exception{		
		request.setCharacterEncoding("UTF-8");
		TableCafe table = new TableCafe();
		
		int idTable = Integer.parseInt(request.getParameter("idTable"));
		table = tableCafeRepository.findByidTable(idTable);
 		String nameCafe = (String)session.getAttribute("nameCafe");
 		String StatusTables = request.getParameter("Status");

 		table.setIdTable(idTable);
 		table.setNumberTable(table.getNumberTable());
 		table.setZone(table.getZone());
 		table.setChair(table.getChair());
 		table.setStatusTable(StatusTables);
 		table.getCafe_namecafe().setNameCafe(nameCafe);
 		
 		tableCafeRepository.save(table);
		Iterable<TableCafe> listTableCafe = tableCafeRepository.findAll();
		Iterable<ReserveTable> listReserveTable = reserveTableRepository.findAll();
		request.setAttribute("listReserveTable", listReserveTable);
		String status =StatusTables;
		session.setAttribute("listTableCafe", listTableCafe);
		request.setAttribute("id", 0);
		request.setAttribute("status", status);
		return "listTableCafe";		 		
	}
}
