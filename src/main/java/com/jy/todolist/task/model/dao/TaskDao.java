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
		
		public List<Task> selectTaskList(int user_no){
			return sqlSession.selectList("taskMapper.selectTaskList",user_no);	
		}
		
		public int selectTaskCount(int user_no) {
			return sqlSession.selectOne("taskMapper.selectTaskCount",user_no);
		}
		
		public int selectTaskEndCount(int user_no) {
			return sqlSession.selectOne("taskMapper.selectTaskEndCount",user_no);
		}
		
		public int taskAdd(Task vo) {
			return sqlSession.insert("taskMapper.taskAdd",vo);
		}
		
		public int deleteTask(int task_no) {
			return sqlSession.delete("taskMapper.deleteTask",task_no);
		}
		
		public Task selectTaskDetail(int task_no) {
			return sqlSession.selectOne("taskMapper.selectTaskDetail",task_no);
		}
		
		public int taskUpdate(Task vo) {
			return sqlSession.update("taskMapper.taskUpdate",vo);
		}
		
		public void updateTasksStatusForTomorrow() {
	        sqlSession.update("taskMapper.updateTasksStatusForTomorrow");
	    }
		
		public int taskStatusUpdate(Task vo) {
			return sqlSession.update("taskMapper.taskStatusUpdate",vo);
		}

}
