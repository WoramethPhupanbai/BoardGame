package project.com.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import project.com.entity.Cafe;
import project.com.entity.PictureCafe;
import project.com.repository.CafeRepository;
import project.com.repository.PictureCafeRepository;

@Controller
public class ViewCafeController {
	@Autowired
	CafeRepository cafeRepository;
	@Autowired
	PictureCafeRepository pictureCafeRepository;
	
	@GetMapping("/viewCafe")
	public String loadViewCafepage(HttpServletRequest request) {
		Cafe c = new Cafe();
		String nameCafe = request.getParameter("nameCafe");
		c = cafeRepository.findByNameCafe(nameCafe);
		Iterable<PictureCafe> listPictureCafe = pictureCafeRepository.findAll();		
		request.setAttribute("listPictureCafe", listPictureCafe);

		request.setAttribute("c", c);
		return "viewCafe";
	}
}
