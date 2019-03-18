package project.com.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import project.com.entity.Member;
import project.com.repository.MemberRepository;

@Controller
public class ListAllMemberController {
	@Autowired
	MemberRepository memberRepository;
	
	@GetMapping("/listAllMember")
	public String loadListAllMemberpage(HttpServletRequest request) {
		Iterable<Member> listMem = memberRepository.findAll();
		request.setAttribute("listMem", listMem);
		return "listAllMember";
	}
}
