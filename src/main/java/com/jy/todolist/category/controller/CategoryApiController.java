package com.jy.todolist.category.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	@PostMapping("/cateAdd")
	public Map<String, String> addCategory(@RequestBody Category co) {
	    

	    int result = categoryService.addCategory(co);
	    
	    Map<String, String> resultMap = new HashMap<>();
	    resultMap.put("res_code", "400");
	    resultMap.put("res_msg", "카테고리 등록 중 오류가 발생하였습니다.");
	    
	    if (result > 0) {
	        resultMap.put("res_code", "200");
	        resultMap.put("res_msg", "카테고리가 성공적으로 등록되었습니다.");
	    }
	    
	    return resultMap;
	}
}
