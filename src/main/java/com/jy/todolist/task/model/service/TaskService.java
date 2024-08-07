package com.jy.todolist.task.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.todolist.task.model.dao.TaskDao;
import com.jy.todolist.task.model.vo.Task;

@Service
public class TaskService {

	@Autowired
	TaskDao taskDao;
	
	public List<Task> selectTaskList(){
		List<Task> resultList = new ArrayList<Task>();
		
		try {
			resultList = taskDao.selectTaskList();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return resultList;
		
	}
	
}
