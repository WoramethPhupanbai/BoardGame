package project.com.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.com.entity.Event;
import project.com.repository.EventRepository;

@Controller
public class EditEventController {
	@Autowired
	EventRepository eventRepository;
	
	private static String UPLOAD_DIRECTORY = "C:/Users/NUTTHAWUT/Downloads/Project/src/main/resources/static/Image/EventImg/";
	@GetMapping("/editEvent")
	public String loadEditEventpage(HttpServletRequest request,HttpSession session) {
		int idEvent = Integer.parseInt(request.getParameter("idEvent"));
		Event event = new Event();
		event = eventRepository.findByidEvent(idEvent);
		session.setAttribute("idEvent", idEvent);
		request.setAttribute("event", event);
		String status = "0";
 		request.setAttribute("status", status );
		return "editEvent";
	}
	@PostMapping(value="/doEditEvent")
	public String doEditEvent(HttpServletRequest request,HttpSession session,@RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes) throws Exception{		
		request.setCharacterEncoding("UTF-8");
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat timefor = new SimpleDateFormat("HH:mm");
		Event event = new Event();
Date dateNow = new Date();
		int idEvent = (Integer)session.getAttribute("idEvent");
		String nameCafe = (String)session.getAttribute("nameCafe");
		String nameEvent = request.getParameter("nameEvent");
 		String eventDate = request.getParameter("eventDate");
 		String startTime = request.getParameter("startTime");
 		String detailEvent = request.getParameter("detailEvent");
 		String price = request.getParameter("price");
 		int qtyPeopleEvent = Integer.parseInt(request.getParameter("qtyPeopleEvent"));
 		
 		event = eventRepository.findByidEvent(idEvent);
 		
		Date eDate = dateFormat.parse(eventDate);
		Date sTime = timefor.parse(startTime);
		System.out.println(eventDate);
		System.out.println(eDate);
		System.out.println(dateNow);
		long diff = (dateNow.getTime() - eDate.getTime()) / (1000 * 60 * 60 * 24);
		if(eDate.before(dateNow)||diff>=-1) {
				String status = "4";
				request.setAttribute("status", status );
			
			return "home";
 		}else {
 			try {

 	            // Get the file and save it somewhere
 	            byte[] bytes = file.getBytes();
 	            Path path = Paths.get(UPLOAD_DIRECTORY + file.getOriginalFilename());
 	            Files.write(path, bytes);

 	            redirectAttributes.addFlashAttribute("message",
 	                    "You successfully uploaded '" + file.getOriginalFilename() + "'");

 	        } catch (IOException e) {
 	            e.printStackTrace();
 	        }
 	 		String picture = new String(file.getOriginalFilename());
 			
 			event.setNameEvent(nameEvent);
 			event.setEventDate(eDate);
 			event.setStartTime(sTime);
 			event.setDetailEvent(detailEvent);
 			event.setPrice(price);
 			event.setQuatity(qtyPeopleEvent);
 			event.setPictureEvent(picture);
 			event.getCafe().setNameCafe(nameCafe);
 			eventRepository.save(event);
 			String status = "1";
 			request.setAttribute("event", event );
 	 		request.setAttribute("status", status );
 			return "editEvent";			 
 		}
	}
}
