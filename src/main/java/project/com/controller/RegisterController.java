package project.com.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import project.com.entity.Member;
import project.com.repository.MemberRepository;

@Controller
public class RegisterController {

	@Autowired
	MemberRepository memberRepository;
	
	@RequestMapping("/register")
	public String Register(HttpServletRequest request) {
		String status = "0";
 		request.setAttribute("status", status );
		return "register";
	}
	@RequestMapping("/login")
	public String Login(HttpServletRequest request) {
		
		return "login";
	}
	@PostMapping(value="/doregister")
	public String doRegister(HttpServletRequest request,HttpSession session) throws Exception{	
		request.setCharacterEncoding("UTF-8");
		
		Member member = new Member();
		
	 	String email = request.getParameter("email");
	 	String password = request.getParameter("password");
	 	String name = request.getParameter("name");
 		String address = request.getParameter("address");
 		String phone = request.getParameter("phone");
		String password2 = request.getParameter("password2");
		
		if(password.equals(password2)) {
		member = new Member(email,name,phone,password,address,"member");
		member.setEmail(email);
		member.setAddress(address);
		member.setName(name);
		member.setPhone(phone);
		member.setStatus("member");
		memberRepository.save(member);
		String status = "2";
 		request.setAttribute("status", status );
		return "home";	
		}
		else {
			String status = "1";
	 		request.setAttribute("status", status );
			
		return "register";	
		}
		
	}
	
	
}
