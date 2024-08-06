package com.jy.todolist.security;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

import com.jy.todolist.member.model.vo.Member;

import lombok.Getter;

@Getter
public class SecurityUser extends User{
	
	private static final long serialVersionUID = 1L;
	
	private Member member;
	
	public SecurityUser(Member member) {
		super(member.getUser_id(), member.getUser_pw(), AuthorityUtils.createAuthorityList(member.getUser_id().equals("admin")?"ROLE_ADMIN":"ROLE_USER"));
		this.member = member;
	}
}