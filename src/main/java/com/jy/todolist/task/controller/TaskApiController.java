package com.jy.todolist.task.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.todolist.task.model.service.TaskService;
import com.jy.todolist.task.model.vo.Task;

@Controller
public class TaskApiController {

	@Autowired
    TaskService taskService;
	
	@ResponseBody
	@PostMapping("/task/add/{user_no}")
	public Map<String,String> taskAdd(@RequestBody Task vo, @PathVariable("user_no") int user_no){
		
		vo.setUser_no(user_no);
		
		Map<String,String> resultMap = new HashMap<String,String>();
		resultMap.put("res_code", "404");
		resultMap.put("res_msg", "할일 등록 중 오류가 발생하였습니다.");
		
		if(taskService.taskAdd(vo) > 0) {
			resultMap.put("res_code", "200");
			resultMap.put("res_msg", "할 일이 성공적으로 등록되었습니다.");
		}
		return resultMap;
	}
    
}
