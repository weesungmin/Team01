package com.project02.bbs.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.project02.bbs.dao.MemberDao;
import com.project02.bbs.domain.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	@Override
	public int login(String id, String pass) {
		return memberDao.login(id, pass);
	}
	
	@Override
	public Member getMember(String id ) {
		return memberDao.getMember(id);
	}
	
	@Override
	public boolean overlapIdCheck(String id) {
		Member member = memberDao.getMember(id);
		System.out.println("check member : " + member);
		if(member == null) {
			return false;
		}
		return true;
		
	}
	
	@Override
	public void addMember(Member member) {
		memberDao.addMember(member);
	}

	@Override
	public boolean memberPassCheck(String id, String pass) {
		
		return memberDao.memberPassCheck(id, pass);
	}

	@Override
	public void updateMember(Member member) {
		memberDao.updateMember(member);
		
	}

	@Override
	public boolean memberIdCheck(String name, String mobile) {
		
		return memberDao.memberIdCheck(name, mobile);	
	}
	
	@Override
	public String memberFindId(String name, String mobile) {
		
		return memberDao.memberFindId(name, mobile);	
	}

}
