package com.jy.todolist.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jy.todolist.member.model.vo.Member;

@Repository
public class MemberDao {

	@Autowired
	SqlSession sqlSession;
	
	public int createMember(Member vo) {
		return sqlSession.insert("memberMapper.createMember",vo);
	}
	
	public Member selectMemberById(String user_id) {
		return sqlSession.selectOne("memberMapper.selectMemberById",user_id);
	}
}