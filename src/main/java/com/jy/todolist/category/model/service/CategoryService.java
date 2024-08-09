package com.jy.todolist.category.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.todolist.category.model.dao.CategoryDao;
import com.jy.todolist.category.model.vo.Category;

@Service
public class CategoryService {

	@Autowired
	CategoryDao categoryDao;
	
	public List<Category> selectCategoryList(int user_no){
		List<Category> resultList = new ArrayList<Category>();
		
		try {
			resultList = categoryDao.selectCategoryList(user_no);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return resultList;
	}
	
	public int addCategory(Category co) {
		int result = 0;
		try {
			result = categoryDao.addCategory(co);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int updateCategory(Category co) {
		int result = 0;
		try {
			result = categoryDao.updateCategory(co);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int deleteCategory(int category_no) {
		int result = 0;
		
		try {
			result = categoryDao.deleteCategory(category_no);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
