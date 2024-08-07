package com.jy.todolist.task.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.jy.todolist.task.model.service.TaskService;
import com.jy.todolist.task.model.vo.Task;

@Controller
public class TaskViewController {
	
	@Autowired
	TaskService taskService;
	
	@GetMapping("/task")
	public String selectTaskList(Model model) {
		List<Task> resultList = taskService.selectTaskList();
		model.addAttribute("resultList", resultList);
		System.out.println(resultList);
		return "/task/list";
	}
}
