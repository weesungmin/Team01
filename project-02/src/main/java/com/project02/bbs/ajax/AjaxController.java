package com.project02.bbs.ajax;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project02.bbs.service.MemberService;

@Controller
public class AjaxController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/passCheck.ajax")
	@ResponseBody
	public Map<String , Boolean> memberPassCheck (String id, String pass) {
		
		boolean result = memberService.memberPassCheck(id, pass);
		
		Map<String, Boolean> map = new HashMap<String ,Boolean>();
		map.put("result", result);
		
		System.out.println("map: " + map);
		
		return map;
		
	}
	
	@RequestMapping("/idCheck.ajax")
	@ResponseBody
	public String memberFindId (String name, String mobile, Model model) {
		
		String member = memberService.memberFindId(name, mobile);
		
		model.addAttribute("member", member);
		
		System.out.println("member = " + member);
	
		return member;

	}
	
	@RequestMapping("/passCheck.ajax")
	public String membetrFindPass() {
		return null;
	}
	
}
