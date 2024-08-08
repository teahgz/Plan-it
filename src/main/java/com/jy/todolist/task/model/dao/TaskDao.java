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
		
		public List<Task> selectTaskList(int userNo){
			return sqlSession.selectList("taskMapper.selectTaskList",userNo);	
		}
		
		public int selectTaskCount(int userNo) {
			return sqlSession.selectOne("taskMapper.selectTaskCount",userNo);
		}
}
