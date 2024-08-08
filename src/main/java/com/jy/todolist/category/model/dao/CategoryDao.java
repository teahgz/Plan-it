package com.jy.todolist.category.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jy.todolist.category.model.vo.Category;

@Repository
public class CategoryDao {

	@Autowired
	SqlSession sqlSession;
	
	public List<Category> selectCategoryList(int user_no){
		return sqlSession.selectList("categoryMapper.selectCategoryList",user_no);
	}
	
	public int addCategory(Category ct) {
		return sqlSession.insert("categoryMapper.addCategory",ct);
	}
	
}
