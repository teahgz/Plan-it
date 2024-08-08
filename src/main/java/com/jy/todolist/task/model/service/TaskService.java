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
	
	public List<Task> selectTaskList(int userNo){
		List<Task> resultList = new ArrayList<Task>();
		
		try {
			resultList = taskDao.selectTaskList(userNo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return resultList;
	}

	public int selectTaskCount(int userNo) {
		int result = 0;
		
		try {
			result = taskDao.selectTaskCount(userNo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
