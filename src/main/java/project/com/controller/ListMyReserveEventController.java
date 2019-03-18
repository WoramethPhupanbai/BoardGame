package project.com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import project.com.entity.ReserveEvent;
import project.com.repository.ReserveEventRepository;

@Controller
public class ListMyReserveEventController {
	
	@Autowired
	ReserveEventRepository reserveEventRepository;
	
	@GetMapping("/listMyReserveEvent")
	public String loadListAllReserEventpage(HttpServletRequest request, HttpSession session) {
		Iterable<ReserveEvent> listReserveEvent = reserveEventRepository.findAll();
				request.setAttribute("listReserveEvent", listReserveEvent);
				String status = "0";
		 		request.setAttribute("status", status );
				return "listMyReserveEvent";
	}
	
	@GetMapping("/listNameReserveEvent")
	public String loadListNameReserveEventpage(HttpServletRequest request, HttpSession session) {
		String nameEvent = request.getParameter("nameEvent");
		Iterable<ReserveEvent> listReserveEvent = reserveEventRepository.findAll();
				request.setAttribute("listReserveEvent", listReserveEvent);
				request.setAttribute("nameEvent", nameEvent);
				String status = "0";
		 		request.setAttribute("status", status );
				return "listNameReserveEvent";
	}
}
