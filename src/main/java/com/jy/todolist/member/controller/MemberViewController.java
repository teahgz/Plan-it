package com.jy.todolist.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.jy.todolist.category.model.service.CategoryService;
import com.jy.todolist.category.model.vo.Category;
import com.jy.todolist.task.model.service.TaskService;

@Controller
public class MemberViewController {

	@Autowired
	TaskService taskService;
	
	@Autowired
	CategoryService categoryService;
	
	@GetMapping("/join")
	public String joinPage() {
		return "member/join";
	}
	
	@GetMapping("/loginPage")
	public String loginPage() {
		return "member/login";
	}
	
	
	// 마이페이지 
	@GetMapping("/myPage/{user_no}")
	public String myPage(@PathVariable("user_no") int user_no,Model model) {
		int taskCount = taskService.selectTaskCount(user_no);
		int taskEndCount = taskService.selectTaskEndCount(user_no);
		
		List<Category> cateList = categoryService.selectCategoryList(user_no);
		
		model.addAttribute("taskCount",taskCount);
		model.addAttribute("taskEndCount",taskEndCount);
		model.addAttribute("cateList",cateList);
		return "member/mypage";
	}
}
