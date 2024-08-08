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
    
    @GetMapping("/task/{user_no}")
    public String selectTaskList(@PathVariable("user_no") int userNo, Model model) {
        List<Task> resultList = taskService.selectTaskList(userNo);
        model.addAttribute("resultList", resultList);
        return "task/list";
    }
}