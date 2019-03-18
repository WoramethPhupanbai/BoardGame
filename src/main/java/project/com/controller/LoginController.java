package project.com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import project.com.entity.Cafe;
import project.com.entity.Member;
import project.com.repository.CafeRepository;
import project.com.repository.MemberRepository;

@Controller
public class LoginController {
	@Autowired
	MemberRepository memberRepository;
	@Autowired
	CafeRepository cafeRepository;
	@PostMapping(value="/doLogin")
	public String doLogin(HttpServletRequest request,HttpSession session) throws Exception{		
		request.setCharacterEncoding("UTF-8");
		Member member = new Member();
		Cafe cafe = new Cafe();
	 	String email = request.getParameter("email");
	 	String password = request.getParameter("password");
	 	System.out.println(email);
	 	System.out.println(password);
	 	List<Cafe> listCafe = (List<Cafe>)session.getAttribute("listCafe");
	 	cafe.setEmail(email);
	 	cafe.setPasswrod(password);
	 	System.out.println(cafe.getEmail());
	 	System.out.println(cafe.getPasswrod());
		member.setEmail(email);
		member.setPassword(password);
		Member mem = memberRepository.findByEmail(email);
		cafe = cafeRepository.findByEmail(email);
		if(email.isEmpty()&&password.isEmpty()) {
	 		String status = "2";
	 		request.setAttribute("status", status );
		return "register";	
	 	}
		if(cafe!=null){
			if(cafe.getEmail().equals(cafe.getEmail())&&cafe.getPasswrod().equals(cafe.getPasswrod())){
				for(Cafe c : listCafe){
					String nameCafe = c.getNameCafe();
					session.setAttribute("nameCafe", nameCafe);
					session.setAttribute("email", c);
				}
				
				String status = "0";
		 		request.setAttribute("status", status );
				return "home";
			}
			if(cafe.getEmail()==null||cafe.getPasswrod()==null){
				String status = "2";
		 		request.setAttribute("status", status );
				
		 		return "register";	
			}
			if(!(cafe.getPasswrod().equals(cafe.getPasswrod()))||!(cafe.getEmail().equals(cafe.getEmail()))){
				String status = "5";
		 		request.setAttribute("status", status );
				
			return "home";
			}
		}
		
		if(mem.getEmail().equals(member.getEmail())&&mem.getPassword().equals(member.getPassword())) {
			session.setAttribute("mem", mem);
			/*for(Cafe c : listCafe){
				String nameCafe = c.getNameCafe();
				session.setAttribute("nameCafe", nameCafe);
			}
			session.setAttribute("email", cafe);*/
			String status = "0";
	 		request.setAttribute("status", status );
			return "home";
	 		}
		
		if(!(mem.getEmail().equals(member.getEmail())) ||!(mem.getPassword().equals(member.getPassword()))) {
			String status = "5";
	 		request.setAttribute("status", status );
			
		return "home";	
		}
		if(mem.getEmail()==null ||mem.getPassword()==null) {
			String status = "2";
	 		request.setAttribute("status", status );
			
	 		return "register";	
		}
/*		for(Cafe c : listCafe) {
			if(c.getEmail().equals(email)&&c.getPasswrod().equals(password)) {
				String nameCafe = c.getNameCafe();
				System.out.println(c.getEmail());
				System.out.println(nameCafe);
				
				return "home";
			}
		}*/
		
	return "register";	
	}
	@GetMapping(value = "/doLogout")
	public String do_logout(HttpServletRequest request, HttpSession session) throws Exception {
				session.removeAttribute("mem");
				session.removeAttribute("nameCafe");
				session.removeAttribute("email");
				String status = "0";
		 		request.setAttribute("status", status );
				return "home";
		
	}
}
