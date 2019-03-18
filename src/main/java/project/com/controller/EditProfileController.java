package project.com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import project.com.entity.Member;
import project.com.repository.MemberRepository;

@Controller
public class EditProfileController {
	@Autowired
	MemberRepository memberRepository;
	
	@GetMapping("/editProfile")
	public String loadEditProfilepage(HttpServletRequest request,HttpSession session) {
		String email = request.getParameter("email");
		Member mem = new Member();
		mem = memberRepository.findByEmail(email);
		session.setAttribute("mem", mem);
		String sta = "0";
 		request.setAttribute("status", sta );
		return "editProfile";
	}
	@PostMapping(value="/doEditProfile")
	public String doEditProfile(HttpServletRequest request,HttpSession session) throws Exception{		
		request.setCharacterEncoding("UTF-8");
		Member mem = new Member();
	 	String email = request.getParameter("email");
	 	String name = request.getParameter("name");
 		String address = request.getParameter("address");
 		String phone = request.getParameter("phone");
 		String oldPassword = request.getParameter("oldPassword");
 		String newPassword = request.getParameter("newPassword");
 		String cNewPassword = request.getParameter("cNewPassword");
 		mem = memberRepository.findByEmail(email);
 		if(mem.getPassword().equals(oldPassword)) {
 			if(newPassword.equals(cNewPassword)) {
 				mem.setEmail(email);
 				mem.setName(name);
 				mem.setAddress(address);
 				mem.setPhone(phone);
 				mem.setStatus(mem.getStatus());
 				mem.setPassword(mem.getPassword());	
 				memberRepository.save(mem);
 				session.setAttribute("mem", mem);
 				String sta = "1";
 		 		request.setAttribute("status", sta );
 				return "editProfile";		 
 			}
 		}
 		String sta = "10";
	 	request.setAttribute("status", sta );
 		return "home";
				
	}
}
