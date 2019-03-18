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
public class EditTableController {
	@Autowired
	TableCafeRepository tableCafeRepository;
	@Autowired
	ReserveTableRepository reserveTableRepository;

	@GetMapping("/editTable")
	public String loadEditTablepage(HttpServletRequest request) {
		String id = request.getParameter("id");
		int idTable = Integer.parseInt(id);
		TableCafe TableID = new TableCafe();
		TableID = (TableCafe) tableCafeRepository.findByidTable(idTable);
		request.setAttribute("TableID", TableID);
		String sta = "0";
 		request.setAttribute("status", sta );
		return "editTable";
	}
	@PostMapping(value="/doEditTable")
	public String doEditTable(HttpServletRequest request,HttpSession session) throws Exception{		
		request.setCharacterEncoding("UTF-8");
		TableCafe table = new TableCafe();
		//Cafe cafe = new Cafe();
		int idTable = Integer.parseInt(request.getParameter("idTable"));
		String zone = request.getParameter("zone");
		System.out.println(idTable);
		int chair = Integer.parseInt(request.getParameter("seats"));
		String nameCafe = (String)session.getAttribute("nameCafe");
 		String StatusTables = request.getParameter("Status");
 		
 		table = tableCafeRepository.findByidTable(idTable);

 		//cafe.setNameCafe(nameCafe);
 		table.getCafe_namecafe().setNameCafe(nameCafe);
 		table.setIdTable(idTable);
 		table.setNumberTable(table.getNumberTable());
 		table.setZone(zone);
 		table.setChair(chair);
 		table.setStatusTable(StatusTables);
 		//table.setCafe_namecafe(cafe);
 		tableCafeRepository.save(table);
		Iterable<TableCafe> listTableCafe = tableCafeRepository.findAll();
		session.setAttribute("listTableCafe",listTableCafe);
		request.setAttribute("id", 0);
 		Iterable<ReserveTable> listReserveTable = reserveTableRepository.findAll();
		request.setAttribute("listReserveTable", listReserveTable);
		return "listTableCafe";			 		
	}
}
