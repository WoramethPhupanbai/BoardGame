package project.com.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.com.entity.BoardGame;
import project.com.entity.Cafe;
import project.com.repository.BoardGameRepository;

@Controller
public class CreateBoardGameController {
	@Autowired
	BoardGameRepository boardGameRepository;
	
	
	private static String UPLOAD_DIRECTORY = "C:/Users/NUTTHAWUT/Downloads/Project/src/main/resources/static/Image/BoardGameImg/";
	
	@GetMapping("/createBoardGame")
	public String loadCreateBoardGamepage(HttpServletRequest request) {
		String status = "0";
 		request.setAttribute("status", status );
		return "createBoardGame";	
	}
	
	@PostMapping(value="/doCreateBoardGame")
	public String doCreateBoardGame(HttpServletRequest request,HttpSession session,@RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes) throws Exception{		
		request.setCharacterEncoding("UTF-8");
		String nameCafe = (String)session.getAttribute("nameCafe");
		System.out.println(nameCafe);
		BoardGame boardGame = new BoardGame();
		Cafe cafe = new Cafe();
		
	 	String nameBoardGame = request.getParameter("nameBoardGame");
 		String ageBoardGame = request.getParameter("ageBoardGame");
 		String statusBoardGame = request.getParameter("statusBoardGame");
 		String gameDetail = request.getParameter("gameDetail");
 		int minTime = Integer.parseInt(request.getParameter("minTime"));
 		int maxTime = Integer.parseInt(request.getParameter("maxTime"));
 		int minPeople = Integer.parseInt(request.getParameter("minPeople"));
 		int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
 		
 		String  picture = null;
 		cafe.setNameCafe(nameCafe);
 		boardGame.setCafe(cafe);
 		boardGame.setNameBoardGame(nameBoardGame);
 		boardGame.setAgeBoardGame(ageBoardGame);
 		boardGame.setGameDetail(gameDetail);
 		boardGame.setStatusBoardGame(statusBoardGame);
 		boardGame.setMinPlayTime(minTime);
 		boardGame.setMaxPlayTime(maxTime);
 		boardGame.setMinPeople(minPeople);
 		boardGame.setMaxPeople(maxPeople);
 		
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
 		picture = new String(file.getOriginalFilename());
 		
  		boardGame.setPictureBoardGame(picture);
  		boardGameRepository.save(boardGame);
 		String status = "1";
 		request.setAttribute("status", status );
 		
		return "createBoardGame";		 		
	}
}
