package com.jy.todolist.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberViewController {

	@GetMapping("/join")
	public String joinPage() {
		return "/member/join";
	}
	
	@GetMapping("/loginPage")
	public String loginPage() {
		return "/member/login";
	}
}
