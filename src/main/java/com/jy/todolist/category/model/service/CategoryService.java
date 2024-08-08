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
	
	public int addCategory(Category ct) {
		int result = 0;
		try {
			result = categoryDao.addCategory(ct);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
