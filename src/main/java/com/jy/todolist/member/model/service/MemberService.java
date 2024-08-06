package com.jy.todolist.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.jy.todolist.member.model.dao.MemberDao;
import com.jy.todolist.member.model.vo.Member;

@Service
public class MemberService {
	
	@Autowired
	MemberDao memberDao;
	
	@Autowired
	BCryptPasswordEncoder bycryptPasswordEncoder;
	
	public int createMember(Member vo) {
		int result = 0;
		try {
			vo.setUser_pw(bycryptPasswordEncoder.encode(vo.getUser_pw()));
			result = memberDao.createMember(vo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
