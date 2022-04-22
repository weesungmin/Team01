package com.project02.bbs.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project02.bbs.domain.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	private final String NAME_SPACE = "com.project02.bbs.mapper.MemberMapper";
	
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public int login(String id, String pass) {
		Member m = sqlSession.selectOne(NAME_SPACE + ".login", id);
		int result = -1;
		
		// id가 존재하지 않으면
			if(m == null) {
				return result;
			}
			// 로그인 성공
			if(m.getPass().equals(pass)) {
				result = 1;
			// 비밀번호가 틀리면
			} else {
				result = 0;
			}
				return result;
			}
	
	@Override
	public Member getMember(String id) {
		
		return sqlSession.selectOne(NAME_SPACE + ".getMember" , id);
	}
	
	@Override
	public void addMember(Member member) {
		sqlSession.insert(NAME_SPACE + ".addMember", member);
	}

	@Override
	public boolean memberPassCheck(String id, String pass) {
			boolean result = false;
		String dbPass = sqlSession.selectOne(NAME_SPACE + ".memberPassCheck", id);
		
		if(dbPass.equals(pass)) {
			result = true;
		}
		return result;
	}

	@Override
	public void updateMember(Member member) {
	sqlSession.update(NAME_SPACE + ".updateMember", member);
		
	}

	@Override
	public boolean memberIdCheck(String name, String mobile) {
		
		boolean result = false;
		
		Map <String, String> params = new HashMap<String, String>();
		params.put("name" , name);
		params.put("mobile", mobile);

		String dbCheck = sqlSession.selectOne(NAME_SPACE + ".memberIdcheck" , params);
		
		System.out.println("params : " + params);
		
		if(dbCheck.equals(name) & dbCheck.equals(mobile)) {
			result = true;
		}
		
		return result;
	}
	
	public String memberFindId(String name, String mobile) {
		
		Map <String, String> params = new HashMap<String, String>();
		params.put("name" , name);
		params.put("mobile", mobile);
		
		return sqlSession.selectOne(NAME_SPACE + ".IdCheckMember" , params);
	}
	

}
