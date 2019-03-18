package project.com.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import project.com.entity.*;
import project.com.repository.ReserveEventRepository;

@Controller
public class CancelMyEventController {
	@Autowired
	ReserveEventRepository reserveEventReposity;
	@Autowired
	private JavaMailSender sender;
	@GetMapping("/cancelMyEvent")
	public String doCancelMyEvent(HttpServletRequest request,HttpSession session) throws MessagingException {
		ReserveEvent resEvent = new ReserveEvent();
		
		int idReserveEvent = Integer.parseInt(request.getParameter("idReserveEvent"));
		resEvent = reserveEventReposity.findByidReserveEvent(idReserveEvent);
		
		resEvent.setIdReserveEvent(idReserveEvent);
		
		resEvent.getEvent().setNameEvent(resEvent.getEvent().getNameEvent());
		resEvent.getEvent().setEventDate(resEvent.getEvent().getEventDate());
		resEvent.getEvent().setDetailEvent(resEvent.getEvent().getDetailEvent());
		resEvent.getEvent().setNameEvent(resEvent.getEvent().getNameEvent());
		resEvent.getEvent().setPictureEvent(resEvent.getEvent().getPictureEvent());
		resEvent.getEvent().setPrice(resEvent.getEvent().getPrice());
		resEvent.getEvent().setQuatity(resEvent.getEvent().getQuatity()+1);
		
		reserveEventReposity.delete(resEvent);
		this.isSendEmail(session,resEvent);
		List<ReserveEvent> listReserveEvent = reserveEventReposity.findAll();
		String status = "0";
 		request.setAttribute("status", status );
		request.setAttribute("listReserveEvent", listReserveEvent);
		return "listMyReserveEvent";
	}
	public String isSendEmail(HttpSession session,ReserveEvent resEvent) throws MessagingException{
		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		String dateRes = dateFormat.format(resEvent.getReserveDate());
		Member member = (Member)session.getAttribute("mem");
		MimeMessage message = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		helper.setTo(resEvent.getMember_email().getEmail());
 		helper.setText("I'm Cancel Event My Name : "+member.getName()+"\n"+"Date Reserve :"+dateRes+"\n"+"Event Name : "+resEvent.getEvent().getNameEvent());
 		helper.setSubject("Chiang Mai BoardGame Cafe");
 		sender.send(message);
		return null;
	}
}
