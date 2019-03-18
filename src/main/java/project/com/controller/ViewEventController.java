package project.com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import project.com.entity.Event;
import project.com.repository.EventRepository;

@Controller
public class ViewEventController {
	@Autowired
	EventRepository eventRepository;

	@GetMapping("/doviewEvent")
	public String loadViewEventpage(HttpServletRequest request,HttpSession session) {
		int idEvent= Integer.parseInt(request.getParameter("idEvent"));
		System.out.println("hhhhhhhhhh"+idEvent);
		Event event = new Event();
		event = eventRepository.findByidEvent(idEvent);
		request.setAttribute("event", event);
		
		return "viewEvent";
	}
}
