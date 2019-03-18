package project.com.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import project.com.entity.BoardGame;
import project.com.repository.BoardGameRepository;

@Controller
public class SearchBoardGameController {
	@Autowired
	BoardGameRepository boardGameRepository;
	
	@GetMapping("/searchboardgame")
	public String loadSearchBoardGamepage(HttpServletRequest request) {
		Iterable<BoardGame> listBoard = boardGameRepository.findAll();		
		request.setAttribute("listBoardGame", listBoard);
		
		return "searchBoardGame";
	}
	@PostMapping("/doSearchBoardGame")
	public String doSearchBoardGame(HttpServletRequest request,HttpSession session) {
		String s = request.getParameter("search"); 
		Iterable<BoardGame> listBoardGame = (Iterable<BoardGame>) boardGameRepository.findByNameBoardGame(s);		
		request.setAttribute("listBoardGame", listBoardGame);
 		return "searchBoardGame";
	}
}
