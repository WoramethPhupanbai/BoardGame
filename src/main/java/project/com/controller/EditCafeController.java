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
public class EditCafeController {
	@Autowired
	CafeRepository cafeRepository;
	@Autowired
	PictureCafeRepository pictureCafeRepository;
	private static String UPLOAD_DIRECTORY = "C:/Users/NUTTHAWUT/Downloads/Project/src/main/resources/static/Image/CafeImg/";

	@GetMapping("/editCafe")
	public String loadEditCafepage(HttpServletRequest request, HttpSession session) {
		String nameCafe = (String) session.getAttribute("nameCafe");
		Cafe cafe = new Cafe();
		cafe = cafeRepository.findByNameCafe(nameCafe);
		request.setAttribute("cafe", cafe);
		String status = "0";
 		request.setAttribute("status", status );
		return "editCafe";
	}

	@PostMapping(value = "/doEditCafe")
	public String doEditCafe(HttpServletRequest request, HttpSession session,
			@RequestParam("file") MultipartFile[] file, @RequestParam("logo") MultipartFile logo,
			RedirectAttributes redirectAttributes) throws Exception {
		request.setCharacterEncoding("UTF-8");
		DateFormat sm = new SimpleDateFormat("HH:mm");
		PictureCafe picturecCafe = new PictureCafe();
		Cafe cafe = new Cafe();
		
		String nameCafe = request.getParameter("nameCafe");
		String address = request.getParameter("address");
		String map = request.getParameter("map");
		String timeOpen = request.getParameter("timeOpen");
		String timeClosed = request.getParameter("timeClosed");
		String about = request.getParameter("about");
		String price = request.getParameter("price");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		Date timeopen = sm.parse(timeOpen);
		Date timeclosed = sm.parse(timeClosed);
		String content = null;
		String pictureLogo = null;
		
		cafe = cafeRepository.findByNameCafe(nameCafe);
		
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
			pictureLogo = new String(logo.getOriginalFilename());
			cafe.setProfilepictureCafe(pictureLogo);
		cafe.setStatusCafe("Open");
		cafe.setMap(map);
		cafe.setTel(tel);
		cafe.setAbout(about);
		cafe.setTimeOpen(timeopen);
		cafe.setTimeClosed(timeclosed);
		cafe.setProfilepictureCafe(cafe.getProfilepictureCafe());
		cafe.setAddress(address);
		cafe.setPrice(price);
		cafe.setNameCafe(nameCafe);

			try {
				for (MultipartFile m : file) {
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
					picturecCafe.setPictureCafe(content);
					picturecCafe.setNameCafe(cafe);
					
					pictureCafeRepository.save(picturecCafe);
				}
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		
		picturecCafe.setNameCafe(cafe);
		
		cafeRepository.save(cafe);
		pictureCafeRepository.save(picturecCafe);
		request.setAttribute("cafe", cafe);
		String status = "1";
 		request.setAttribute("status", status );
 		this.loadEditCafepage(request, session);
		return "editCafe";
	}
}
