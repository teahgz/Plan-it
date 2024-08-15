package com.jy.todolist.task.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
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
		
		int result = 0 ;
		vo.setUser_no(user_no);
		result = taskService.taskAdd(vo);
		Map<String,String> resultMap = new HashMap<String,String>();
		resultMap.put("res_code", "404");
		resultMap.put("res_msg", "할일 등록 중 오류가 발생하였습니다.");
		
		if( result > 0) {
			resultMap.put("res_code", "200");
			resultMap.put("res_msg", "할 일이 성공적으로 등록되었습니다.");
		}
		return resultMap;
	}
	
	@ResponseBody
	@DeleteMapping("/task/{taskNo}")
	public Map<String,String> deleteTask(@PathVariable("taskNo") int task_no){
		int result = 0;
		result = taskService.deleteTask(task_no);
		
		Map<String, String> resultMap = new HashMap<>();
	    resultMap.put("res_code", "400");
	    resultMap.put("res_msg", "할 일 삭제 중 오류가 발생하였습니다.");
		
	    if (result > 0) {
	        resultMap.put("res_code", "200");
	        resultMap.put("res_msg", "할 일이 성공적으로 삭제되었습니다.");
	    }
	    return resultMap;
	}
    
	@ResponseBody
	@PostMapping("/task/update/{task_no}")
	public Map<String,String> updateTask( @RequestBody Task vo, @PathVariable("task_no") int task_no){
		int result = 0 ;
		vo.setTask_no(task_no);
		result = taskService.taskUpdate(vo);
		
		Map<String,String> resultMap = new HashMap<String,String>();
		resultMap.put("res_code", "404");
		resultMap.put("res_msg", "할일 등록 중 오류가 발생하였습니다.");
		
		if( result > 0) {
			resultMap.put("res_code", "200");
			resultMap.put("res_msg", "할 일이 성공적으로 등록되었습니다.");
		}
		return resultMap;
	}
	
	@ResponseBody
	@PostMapping("/task/status/{task_no}")
	public Map<String, String> updateStatusTask(
	        @PathVariable("task_no") int task_no,
	        @RequestBody Task task) {

	    // 결과를 담을 Map 객체 생성
	    Map<String, String> resultMap = new HashMap<>();
	    resultMap.put("res_code", "404");
	    resultMap.put("res_msg", "상태 업데이트 중 오류가 발생하였습니다.");

	    try {
	        int newStatus = task.getStatus();

	        task.setTask_no(task_no);

	        int result = taskService.taskStatusUpdate(task);

	        if (result > 0) {
	            resultMap.put("res_code", "200");
	            resultMap.put("res_msg", "할 일의 상태가 성공적으로 업데이트되었습니다.");
	        }
	    } catch (Exception e) {
	        resultMap.put("res_code", "500");
	        resultMap.put("res_msg", "서버 오류가 발생했습니다.");
	    }

	    return resultMap;
	}

	
}
