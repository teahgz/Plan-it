package com.jy.todolist.task.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jy.todolist.task.model.vo.Task;

@Repository
public class TaskDao {

		@Autowired
		SqlSession sqlSession;
		public List<Task> selectTaskList(){
			return sqlSession.selectList("taskMapper.selectTaskList");	
		}
}
