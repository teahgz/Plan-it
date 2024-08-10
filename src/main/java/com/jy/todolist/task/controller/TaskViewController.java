package com.jy.todolist.task.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.jy.todolist.category.model.service.CategoryService;
import com.jy.todolist.category.model.vo.Category;
import com.jy.todolist.task.model.service.TaskService;
import com.jy.todolist.task.model.vo.Task;

@Controller
public class TaskViewController {
    
    @Autowired
    TaskService taskService;
    
	@Autowired
	CategoryService categoryService;
	
    @GetMapping("/task/{user_no}")
    public String selectTaskList(@PathVariable("user_no") int user_no, Model model) {
        List<Task> resultList = taskService.selectTaskList(user_no);
        model.addAttribute("resultList", resultList);
        return "task/list";
    }
    
    @GetMapping("/taskAddPage/{user_no}")
    public String taskAddPage(@PathVariable("user_no") int user_no, Model model) {
    	List<Category> categoryList = categoryService.selectCategoryList(user_no);
    	model.addAttribute("categoryList",categoryList);
    	return "task/add";
    }
}