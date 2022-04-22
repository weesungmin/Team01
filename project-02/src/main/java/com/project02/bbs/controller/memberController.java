package com.project02.bbs.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.project02.bbs.domain.Member;
import com.project02.bbs.service.MemberService;

@Controller
@SessionAttributes("member")
public class memberController {

	private MemberService memberService;
	
	@Autowired
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(Model model, @RequestParam("id") String id,
			@RequestParam("pass") String pass,
			HttpSession session , HttpServletResponse response)
				throws ServletException, IOException {
			
		int result = memberService.login(id, pass);
		
		if(result == -1) {
			response.setContentType("text/html charset= utf8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println(" alert('아이디가 존재하지 않습니다.');");
			out.println(" history.back();");
			out.println("</script>");
			return null;
			
		} else if(result == 0 ) {
			response.setContentType("text/html charset= utf8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println(" alert('비밀번호가 다릅니다.');");
			out.println(" history.back();");
			out.println("</script>");
			return null;
			
		}
		
		Member member = memberService.getMember(id);
		session.setAttribute("isLogin", true);
		
		model.addAttribute("member" , member);
		System.out.println("member name :" + member.getName());
		
		return "redirect:/loginForm";
	}//로그인
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/loginForm";
	}
	
	@RequestMapping("/joinResult")
	public String joinResult(Model model, Member member,
			String pass1, String emailId, String emailDomain,
			String mobile1, String mobile2, String mobile3,
			String phone1, String phone2, String phone3,
			@RequestParam(value="emailGet", required=false,
					defaultValue="false") boolean emailGet) {
		
		member.setPass(pass1);
		member.setEmail(emailId + "@" + emailDomain);
		member.setMobile(mobile1 + "-" + mobile2 + "-" + mobile3);
		
		if(phone2.equals("") || phone3.equals("")) {
			member.setPhone("");
		} else {
			member.setPhone(phone1 + "-" + phone2 + "-" + phone3);
		}
		
			member.setEmailGet(Boolean.valueOf(emailGet));
			
		memberService.addMember(member);
		System.out.println("joinname : " + member.getName());
		
		return "redirect:loginForm";
	}
	
	@RequestMapping("/overlapIdCheck")
	public String overlapIdCheck(Model model, String id) {
		
		boolean overlap = memberService.overlapIdCheck(id);
		
		model.addAttribute("id" , id);
		model.addAttribute("overlap", overlap);
		
		return "forward:WEB-INF/views/member/overlapIdCheck.jsp";
	}
		
	
	@RequestMapping("/memberMypage")
	public String memberMypage (Model model, HttpSession session) {
		return "member/memberMypage";
	}
	
	@RequestMapping("/memberUpdateForm")
	public String updateForm(Model model, HttpSession session) {
		return "member/memberUpdateForm";
	}
	
	@RequestMapping("/memberUpdateResult")
	public String memberUpdate(Model model, Member member, 
			String pass1, String emailId, String emailDomain,
			String mobile1, String mobile2, String mobile3,
			String phone1, String phone2, String phone3,
			@RequestParam(value="emailGet", required=false,
					defaultValue="false") boolean emailGet) {
		
		member.setPass(pass1);
		member.setEmail(emailId + "@" + emailDomain);
		member.setMobile(mobile1 + "-" + mobile2 + "-" + mobile3);
		
		if(phone2.equals("") || phone3.equals("")) {
			member.setPhone("");
		} else {
			member.setPhone(phone1 + "-" + phone2 + "-" + phone3);
		}
		member.setEmailGet(Boolean.valueOf(emailGet));
		
		memberService.updateMember(member);
		System.out.println("Result : " + member.getId());
		
		model.addAttribute("member", member);
		
		return "redirect:memberMypage";
	}
	
	@RequestMapping("/userSearch")
	public String userSearch() {

		return "forward:WEB-INF/views/member/userSearch.jsp";
	}
		
}
