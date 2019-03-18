package project.com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import project.com.entity.ReserveTable;
import project.com.repository.ReserveTableRepository;

@Controller
public class ListMyReserveTableController {
	
	@Autowired
	ReserveTableRepository reserveTableRepository;
	
	@GetMapping("/listReserveTable")
	public String loadListAllTablepage(HttpServletRequest request, HttpSession session) {
		Iterable<ReserveTable> listReserveTable = reserveTableRepository.findAll();
				request.setAttribute("listReserveTable", listReserveTable);
				String status = "0";
		 		request.setAttribute("status", status );
				return "listMyReserveTable";		
	}
}
