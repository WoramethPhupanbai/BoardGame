package project.com.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import project.com.entity.Member;
import project.com.repository.MemberRepository;

@Controller
public class RemoveMembercontroller {
	@Autowired
	MemberRepository memberRepository;
	
	@GetMapping("/deleteMember")
	public String doRemoveMember(HttpServletRequest request) {
		String email = request.getParameter("email");
		Member member = new Member();
		member = memberRepository.findByEmail(email);
		//owner.setEmail(email);
		member.setEmail(email);
		member.setAddress(member.getAddress());
		member.setName(member.getName());
		member.setPhone(member.getPhone());
		member.setStatus("");
		memberRepository.save(member);
		//ownerRepority.delete(owner);
		Iterable<Member> listMem = memberRepository.findAll();
		request.setAttribute("listMem", listMem);
		return "listAllMember";
	}
}
