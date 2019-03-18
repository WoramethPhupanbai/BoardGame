package project.com.controller;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import project.com.entity.Cafe;
import project.com.repository.CafeRepository;

@Controller
public class CreateOwnerController {
	@Autowired
	CafeRepository cafeRepository;
	@Autowired
	private JavaMailSender sender;
	
	@RequestMapping("/createOwner")
	public String loadcreateOwnerpage(HttpServletRequest request) {
		String status = "0";
 		request.setAttribute("status", status );
		return "createOwner";
	}
	@PostMapping(value="/doCreateOwner")
	public String doCreateOwner(HttpServletRequest request,HttpSession session) throws Exception{		
		request.setCharacterEncoding("UTF-8");
	 	String email = request.getParameter("email");
	 	String password = request.getParameter("password");
	 	String nameOwner = request.getParameter("nameOwner");
	 	String nameCafe = request.getParameter("nameCafe");
		Cafe cafe = new Cafe();
		cafe.setNameCafe(nameCafe);
		cafe.setEmail(email);
		cafe.setNameOwner(nameOwner);
		cafe.setPasswrod(password);
		cafeRepository.save(cafe);
		this.isSendEmail(session, email, password);
		String status = "1";
 		request.setAttribute("status", status );
		return "createOwner";		 		
	}
	public String isSendEmail(HttpSession session,String email,String password) throws MessagingException{
		MimeMessage message = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		helper.setTo(email);
		helper.setText("Welcome to the New Owner Cafe"+"\n"+"Login"+"\n"+ "Email : "+email+"\n"+"Password : "+password+"\n"+"http://localhost:8081/");
		helper.setSubject("Chiang Mai BoardGame Cafe");
 		sender.send(message);
		return null;
	}
}
