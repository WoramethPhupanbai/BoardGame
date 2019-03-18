package project.com.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import project.com.entity.Event;
import project.com.entity.ReserveEvent;
import project.com.repository.EventRepository;
import project.com.repository.ReserveEventRepository;

@Controller
public class ListEventController {
	@Autowired
	EventRepository eventRepository;
	@Autowired
	ReserveEventRepository reserveEventRepository;
	@GetMapping("/listEvent")
	public String loadListEventpage(HttpServletRequest request,HttpSession session) {
		Iterable<Event> listEvent = eventRepository.findAll();
		Iterable<ReserveEvent> listReserveEvent = reserveEventRepository.findAll();
		session.setAttribute("listReserveEvent", listReserveEvent);
		request.setAttribute("listEvent", listEvent);
		
		HashMap<Integer, Integer> hmap = new HashMap<>();
		for (ReserveEvent reserveEvent : listReserveEvent) {
			hmap.put(reserveEvent.getEvent().getIdEvent(), reserveEvent.getIdReserveEvent());
		}
		
		request.setAttribute("listReserveEvent", listReserveEvent);
		return "listEvent";
	}
	
}
