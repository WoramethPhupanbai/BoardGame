package project.com.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import project.com.entity.Cafe;
import project.com.repository.CafeRepository;

@Controller
public class ListCafeController {
	@Autowired
	CafeRepository cafeRepository;

	@GetMapping("/listCafe")
	public String loadListCafepage(HttpServletRequest request) {		
		Iterable<Cafe> listCafe = cafeRepository.findAll();
		request.setAttribute("listCafe", listCafe);
		return "listCafe";
	}
}
