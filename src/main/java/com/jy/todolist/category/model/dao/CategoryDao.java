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
	
	public int addCategory(Category co) {
		return sqlSession.insert("categoryMapper.addCategory",co);
	}
	
	public int updateCategory(Category co) {
		return sqlSession.update("categoryMapper.updateCategory",co);
	}
	
	public int deleteCategory(int category_no) {
		return sqlSession.delete("categoryMapper.deleteCategory",category_no);
	}
}
