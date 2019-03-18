package project.com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import project.com.entity.Cafe;
import project.com.entity.ReserveTable;
import project.com.entity.TableCafe;
import project.com.repository.ReserveTableRepository;
import project.com.repository.TableCafeRepository;

@Controller
public class CreateTableController {
	@Autowired
	TableCafeRepository tableCafeRepository;
	@Autowired
	ReserveTableRepository reserveTableRepository;
	@GetMapping("/createTable")
	public String loadCreateTablepage(HttpServletRequest request,HttpSession session) {
		String status = "0";
 		request.setAttribute("status", status );
 		String nameCafe = (String)session.getAttribute("nameCafe");
 		Iterable<TableCafe> listTableCafe = tableCafeRepository.findAll();
		request.setAttribute("listTableCafe", listTableCafe);
		Iterable<TableCafe> listZoneTableCafe = tableCafeRepository.getTablebyname(nameCafe);
		request.setAttribute("listZoneTableCafe", listZoneTableCafe);
		return "createTable";	
	}
	@PostMapping(value="/doCreateTable")
	public String doCreateTable(HttpServletRequest request,HttpSession session) throws Exception{		
		request.setCharacterEncoding("UTF-8");
		int tables = 0;
		Cafe cafe = new Cafe();
		Iterable<TableCafe> listTableCafe = tableCafeRepository.findAll();
		tables = Integer.parseInt(request.getParameter("tables"));
		String zone = request.getParameter("zone");
		String nameCafe = (String)session.getAttribute("nameCafe");
		int count = 0;
		
		for(TableCafe ltb : listTableCafe) {	
			if(ltb.getCafe_namecafe().getNameCafe().equals(nameCafe)) {
				if(ltb.getZone().equals(zone)) {
					count++;
				}
			}
			
			}
		
		
	 	System.out.println(tables);
	 	cafe.setNameCafe(nameCafe);
	 	
 		for(int i=1;i<=tables;i++){
 			TableCafe tableCafe = new TableCafe();
 			tableCafe.setNumberTable(count+i);
 			tableCafe.setZone(zone);
 	 		tableCafe.setStatusTable("Normal");
 	 		tableCafe.setChair(4);
 	 		tableCafe.setCafe_namecafe(cafe);
 			System.out.println(i);
 			tableCafeRepository.save(tableCafe);
 		}
 		
		request.setAttribute("listTableCafe", listTableCafe);
		String status = "1";
 		request.setAttribute("status", status );
 		request.setAttribute("id", 0);
 		Iterable<ReserveTable> listReserveTable = reserveTableRepository.findAll();
		request.setAttribute("listReserveTable", listReserveTable);
 		
		return "listTableCafe";
	}
}
