package com.jy.todolist.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.jy.todolist.task.model.service.TaskService;

@Controller
public class MemberViewController {

	@Autowired
	TaskService taskService;
	
	@GetMapping("/join")
	public String joinPage() {
		return "member/join";
	}
	
	@GetMapping("/loginPage")
	public String loginPage() {
		return "member/login";
	}
	
	@GetMapping("/myPage/{user_no}")
	public String myPage(@PathVariable("user_no") int userNo,Model model) {
		int taskCount = taskService.selectTaskCount(userNo);
		model.addAttribute("taskCount",taskCount);
		return "member/mypage";
	}
}
