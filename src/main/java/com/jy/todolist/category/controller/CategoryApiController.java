package com.jy.todolist.category.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.todolist.category.model.service.CategoryService;
import com.jy.todolist.category.model.vo.Category;

@Controller
public class CategoryApiController {

	@Autowired
	CategoryService categoryService;
	
	@ResponseBody
	@PostMapping("/category/create")
	public Map<String, String> addCategory(@RequestBody Category co) {
	    int result = 0;

	    result = categoryService.addCategory(co);
	    
	    Map<String, String> resultMap = new HashMap<>();
	    resultMap.put("res_code", "400");
	    resultMap.put("res_msg", "카테고리 등록 중 오류가 발생하였습니다.");
	    
	    if (result > 0) {
	        resultMap.put("res_code", "200");
	        resultMap.put("res_msg", "카테고리가 성공적으로 등록되었습니다.");
	    }
	    
	    return resultMap;
	}
	
	@ResponseBody
	@PostMapping("/category/update")
	public  Map<String, String> updateCategory(@RequestBody Category co) {
		int result = 0;
		result = categoryService.updateCategory(co);
		
		Map<String, String> resultMap = new HashMap<>();
	    resultMap.put("res_code", "400");
	    resultMap.put("res_msg", "카테고리 수정 중 오류가 발생하였습니다.");
		
	    if (result > 0) {
	        resultMap.put("res_code", "200");
	        resultMap.put("res_msg", "카테고리가 성공적으로 수정되었습니다.");
	    }
		
	    return resultMap;
	}
	
	@ResponseBody
	@DeleteMapping("/category/{categoryNo}")
	public Map<String,String> deleteCategory(@PathVariable("categoryNo") int category_no){
		int result = 0;
		result = categoryService.deleteCategory(category_no);
		
		Map<String, String> resultMap = new HashMap<>();
	    resultMap.put("res_code", "400");
	    resultMap.put("res_msg", "카테고리 삭제 중 오류가 발생하였습니다.");
		
	    if (result > 0) {
	        resultMap.put("res_code", "200");
	        resultMap.put("res_msg", "카테고리가 성공적으로 삭제되었습니다.");
	    }
		
	    return resultMap;
		
	}
}
