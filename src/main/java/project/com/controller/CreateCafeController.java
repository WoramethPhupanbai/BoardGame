package project.com.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DateFormat;
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

import project.com.entity.Cafe;
import project.com.entity.PictureCafe;
import project.com.repository.CafeRepository;
import project.com.repository.PictureCafeRepository;

@Controller
public class CreateCafeController {
	@Autowired
	CafeRepository cafeRepository;
	@Autowired
	PictureCafeRepository pictureCafeRepository;
	
	private static String UPLOAD_DIRECTORY = "C:/Users/NUTTHAWUT/Downloads/Project/src/main/resources/static/Image/CafeImg/";
	@GetMapping("/createCafe")
	public String loadCreateCafepage() {
		return "createCafe";	
	}
	@PostMapping(value="/doCreateCafe")
	public String doCreateCafe(HttpServletRequest request,HttpSession session,@RequestParam("file") MultipartFile[] file,@RequestParam("logo") MultipartFile logo, RedirectAttributes redirectAttributes
            ) throws Exception{		
		request.setCharacterEncoding("UTF-8");
		DateFormat sm = new SimpleDateFormat("HH:mm");
		Cafe cafe = new Cafe();
		PictureCafe pc = new PictureCafe();
		String nameCafe = request.getParameter("nameCafe");
		String address = request.getParameter("address");
		String map = request.getParameter("map");
		String about = request.getParameter("about");
		String timeOpen = request.getParameter("timeOpen");
		String timeClosed = request.getParameter("timeClosed");
		String price = request.getParameter("price");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		cafe = cafeRepository.findByEmail(email);
		Date timeopen = sm.parse(timeOpen);
		Date timeclosed = sm.parse(timeClosed);
		String content = null;
		try {

            // Get the file and save it somewhere
            byte[] bytes = logo.getBytes();
            Path path = Paths.get(UPLOAD_DIRECTORY + logo.getOriginalFilename());
            Files.write(path, bytes);

            redirectAttributes.addFlashAttribute("message",
                    "You successfully uploaded '" + logo.getOriginalFilename() + "'");

        } catch (IOException e) {
            e.printStackTrace();
        }
		String pictureLogo = new String(logo.getOriginalFilename());

		cafe.setMap(map);
		cafe.setNameOwner(cafe.getNameOwner());
		cafe.setPasswrod(cafe.getPasswrod());
		cafe.setAbout(about);
		cafe.setProfilepictureCafe(pictureLogo);
		cafe.setAddress(address);
		cafe.setTel(tel);
		cafe.setTimeOpen(timeopen);
		cafe.setEmail(email);
		cafe.setTimeClosed(timeclosed);
		cafe.setStatusCafe("Open");
		cafe.setPrice(price);
		cafe.setNameCafe(nameCafe);
	
		try {
			for(MultipartFile m : file) {
				if (m.isEmpty()) {
		            redirectAttributes.addFlashAttribute("message", "Please select a file to upload");
		            return "redirect:uploadStatus";
		        }
				
	            // Get the file and save it somewhere
	            byte[] bytes = m.getBytes();
	            Path path = Paths.get(UPLOAD_DIRECTORY + m.getOriginalFilename());
	            Files.write(path, bytes);

	            redirectAttributes.addFlashAttribute("message",
	                    "You successfully uploaded '" + m.getOriginalFilename() + "'");
	            
	            content = new String(m.getOriginalFilename());
	        	
	            System.out.println(content);
	            
	            pc.setPictureCafe(content);
	            
	           
			}

        } catch (IOException e) {
            e.printStackTrace();
        }
		pc.setNameCafe(cafe);
		 cafeRepository.save(cafe);
		 pictureCafeRepository.save(pc);
        
		session.setAttribute("nameCafe", nameCafe);
		String status = "0";
 		request.setAttribute("status", status );
		return "home";				 		
	}
}
