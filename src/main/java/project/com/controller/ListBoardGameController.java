package project.com.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import project.com.entity.BoardGame;
import project.com.repository.BoardGameRepository;

@Controller
public class ListBoardGameController {
	@Autowired
	BoardGameRepository BoardGameRepository;
	
	@GetMapping("/listBoardGame")
	public String loadListBoardGamepage(HttpServletRequest request) {
		Iterable<BoardGame> listBoardGame = BoardGameRepository.findAll();		
		request.setAttribute("listBoardGame", listBoardGame);
		return "listBoardGame";
	}
}
