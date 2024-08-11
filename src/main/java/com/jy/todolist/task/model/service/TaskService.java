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
	
	public List<Task> selectTaskList(int user_no){
		List<Task> resultList = new ArrayList<Task>();
		
		try {
			resultList = taskDao.selectTaskList(user_no);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return resultList;
	}

	public int selectTaskCount(int user_no) {
		int result = 0;
		
		try {
			result = taskDao.selectTaskCount(user_no);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int selectTaskEndCount(int user_no) {
		int result = 0 ;
		try {
			result = taskDao.selectTaskEndCount(user_no);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int taskAdd(Task vo) {
		int result = 0;
		try {
			result = taskDao.taskAdd(vo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int deleteTask(int task_no) {
		int result = 0;
		try {
			result = taskDao.deleteTask(task_no);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public Task selectTaskDetail(int task_no) {
		Task t = new Task();
		try {
			t = taskDao.selectTaskDetail(task_no);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return t;
	}
	
	public int taskUpdate(Task vo) {
		int result = 0;
		try {
			result = taskDao.taskUpdate(vo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
