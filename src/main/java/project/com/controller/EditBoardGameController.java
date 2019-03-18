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
import project.com.repository.BoardGameRepository;

@Controller
public class EditBoardGameController {
	@Autowired
	BoardGameRepository BoardGameRepository;
	
	private static String UPLOAD_DIRECTORY = "C:/Users/NUTTHAWUT/Downloads/Project/src/main/resources/static/Image/BoardGameImg/";
	@GetMapping("/editBoardGame")
	public String loadEditBoardGamepage(HttpSession session,HttpServletRequest request) {
		int idBoardGame = Integer.parseInt(request.getParameter("idBoardGame"));
		BoardGame boardGame = new BoardGame();
		boardGame = BoardGameRepository.findByidBoardGame(idBoardGame);
		request.setAttribute("boardGame", boardGame);
		String status = "0";
 		request.setAttribute("status", status );
		return "editBoardGame";	
	}
	@PostMapping(value="/doEditBoardGame")
	public String doEditBoardGame(HttpServletRequest request,HttpSession session,@RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes) throws Exception{		
		request.setCharacterEncoding("UTF-8");
		
		BoardGame boardGame = new BoardGame();
		int idBoardGame = Integer.parseInt(request.getParameter("idBoardGame"));
		String nameCafe = (String)session.getAttribute("nameCafe");
	 	String nameBoardGame = request.getParameter("nameBoardGame");
 		String ageBoardGame = request.getParameter("ageBoardGame");
 		String gameDetail = request.getParameter("gameDetail");
 		int minTime = Integer.parseInt(request.getParameter("minTime"));
 		int maxTime = Integer.parseInt(request.getParameter("maxTime"));
 		int minPeople = Integer.parseInt(request.getParameter("minPeople"));
 		int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));

 		boardGame = BoardGameRepository.findByidBoardGame(idBoardGame);
 		
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
		boardGame.setIdBoardGame(boardGame.getIdBoardGame());
 		boardGame.setNameBoardGame(nameBoardGame);
 		boardGame.setGameDetail(gameDetail);
 		boardGame.setStatusBoardGame(boardGame.getStatusBoardGame());
 		boardGame.setAgeBoardGame(ageBoardGame);
 		boardGame.setMinPlayTime(minTime);
 		boardGame.setMaxPlayTime(maxTime);
 		boardGame.setMinPeople(minPeople);
 		boardGame.setMaxPeople(maxPeople);
 		boardGame.setPictureBoardGame(picture);
 		boardGame.getCafe().setNameCafe(nameCafe);
 		
 		BoardGameRepository.save(boardGame);
		request.setAttribute("boardGame", boardGame);
		String status = "1";
 		request.setAttribute("status", status);
 		this.loadEditBoardGamepage(session, request);
		return "editBoardGame";				 		
	}
}
