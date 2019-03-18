package project.com.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import project.com.entity.*;
import project.com.repository.EventRepository;
import project.com.repository.ReserveEventRepository;

@Controller
public class ReserveEventController {
	@Autowired
	ReserveEventRepository reserveEventRepository;
	@Autowired
	EventRepository eventRepository;
	
	@GetMapping("/reserveEvent")
	public String loadListReserveEventpage(HttpServletRequest request,HttpSession session) {
		Event event = new Event();
		String id = request.getParameter("idEvent");
		int idEvent = Integer.parseInt(id);
		session.setAttribute("idevent", id);
		event = (Event) eventRepository.findByidEvent(idEvent);
		request.setAttribute("event", event);
		return "reserveEvent";
	}
	
	@PostMapping(value="/doReserveEvent")
	public String doReserveEvent(HttpServletRequest request,HttpSession session) throws Exception{		
		request.setCharacterEncoding("UTF-8");
		
		DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
		String datenow = (String) session.getAttribute("datenow");
		ReserveEvent resEvent = new ReserveEvent();
		Event event = new Event();
		Date resDate = df.parse(datenow);
		
		String idevent = request.getParameter("idevent");
		int idEvent = (int)Integer.parseInt(idevent);
		System.out.println("ggg"+idEvent);
		
		event = (Event) eventRepository.findByidEvent(idEvent);
		
		Member member = (Member) session.getAttribute("mem");
		
		member.setEmail(member.getEmail());
		event.setQuatity(event.getQuatity()-1);
		
		resEvent.setEvent(event);
		resEvent.setMember_email(member);
		resEvent.setReserveDate(resDate);
		
		reserveEventRepository.save(resEvent);
		Iterable<ReserveEvent> listReserveEvent = reserveEventRepository.findAll();
		String status = "1";
 		request.setAttribute("status", status );
		request.setAttribute("listReserveEvent", listReserveEvent);
		return "listMyReserveEvent";			 		
	}
}
