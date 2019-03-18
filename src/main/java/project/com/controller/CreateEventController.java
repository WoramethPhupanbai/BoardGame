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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.com.entity.Cafe;
import project.com.entity.Event;
import project.com.repository.EventRepository;

@Controller
public class CreateEventController {
	@Autowired
	EventRepository eventRepository;
	
	private static String UPLOAD_DIRECTORY = "C:/Users/NUTTHAWUT/Downloads/Project/src/main/resources/static/Image/EventImg/";
	@RequestMapping("/createEvent")
	public String loadCreateEventpage(HttpSession session,HttpServletRequest request) {
		String status = "0";
 		request.setAttribute("status", status );
		return "createEvent";	
	}
	@PostMapping(value="/doCreateEvent")
	public String doCreateEvent(HttpServletRequest request,HttpSession session,@RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes) throws Exception{		
		request.setCharacterEncoding("UTF-8");
		SimpleDateFormat datefor = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat timefor = new SimpleDateFormat("HH:mm");
		Date dateNow = new Date();
		Event event = new Event();
		Cafe cafe = new Cafe();
		String nameEvent = request.getParameter("nameEvent");
 		String eventDate = request.getParameter("eventDate");
 		String startTime = request.getParameter("startTime");
 		String detailEvent = request.getParameter("detailEvent");
 		String price = request.getParameter("price");
 		int qtyPeopleEvent = Integer.parseInt(request.getParameter("qtyPeopleEvent"));
 		
 		Date eventsdate = datefor.parse(eventDate);
 		Date sTime = timefor.parse(startTime);
 		System.out.println("eventDate : "+eventDate);
 		System.out.println("EVENTDATE : "+eventsdate);
 		System.out.println("dateNow : "+dateNow);
 		long diff = (dateNow.getTime() - eventsdate.getTime()) / (1000 * 60 * 60 * 24);
 		System.out.println(diff);
 		if(eventsdate.before(dateNow)||diff>=-1) {
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
 	 		String nameCafe = (String)session.getAttribute("nameCafe");
 	 		cafe.setNameCafe(nameCafe);
 			
 			event.setNameEvent(nameEvent);
 			event.setEventDate(eventsdate);
 			event.setStartTime(sTime);
 			event.setDetailEvent(detailEvent);
 			event.setPrice(price);
 			event.setQuatity(qtyPeopleEvent);
 			event.setPictureEvent(picture);
 			event.setCafe(cafe);
 			eventRepository.save(event);
 			String status = "1";
 	 		request.setAttribute("status", status );
 			return "createEvent";			 
 		}
 				 		
	}
}
