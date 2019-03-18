package project.com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import project.com.entity.Cafe;
import project.com.repository.CafeRepository;

@Controller
public class ClosedCafeController {
	@Autowired
	CafeRepository cafeRepository;
	
	@GetMapping("/deleteCafe")
	public String doClosedCafe(HttpServletRequest request,HttpSession session) {
		String nameCafe = request.getParameter("nameCafe");
		Cafe cafe = new Cafe();
		cafe = cafeRepository.findByNameCafe(nameCafe);
		
		cafe.setNameCafe(nameCafe);
		cafe.setTimeOpen(cafe.getTimeOpen());
		cafe.setTimeClosed(cafe.getTimeClosed());
		cafe.setAddress(cafe.getAddress());
 		cafe.setMap(cafe.getMap());
 		cafe.setAbout(cafe.getAbout());
 		cafe.setPrice(cafe.getPrice());
 		cafe.setProfilepictureCafe(cafe.getProfilepictureCafe());
 		cafe.setStatusCafe("Close");
		cafeRepository.save(cafe);
		Iterable<Cafe> listCafe = cafeRepository.findAll();
		request.setAttribute("listCafe", listCafe);
		return "listCafe";
	}
}
