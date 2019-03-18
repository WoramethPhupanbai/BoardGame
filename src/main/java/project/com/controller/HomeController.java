package project.com.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import project.com.entity.*;
import project.com.repository.*;

@Controller
public class HomeController {
		@Autowired
		CafeRepository cafeRepository;
		
		@Autowired
		EventRepository eventRepository;
		
	// inject via application.properties
		@Value("${welcome.message:test}")
		private String message = "Hello World";

		@GetMapping("/")
		public String welcome(Map<String, Object> model,HttpSession session,HttpServletRequest request) {
			model.put("message", this.message);
			DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
			DateFormat timeFormat = new SimpleDateFormat("HH:mm");
			Date date = new Date();
			String datenow = dateFormat.format(date);
			String timeNow = timeFormat.format(date);
			Iterable<Cafe> listCafe = cafeRepository.findAll();
			Iterable<Event> listEvent = eventRepository.findAll();
			session.setAttribute("datenow", datenow);
			session.setAttribute("timeNow", timeNow);
			
			session.setAttribute("listCafe", listCafe);
			session.setAttribute("listEvent", listEvent);
			String status = "0";
	 		request.setAttribute("status", status );
			return "home";
		}
		
		
}
