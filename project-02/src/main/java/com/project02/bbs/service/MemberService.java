package com.project02.bbs.service;

import java.util.Map;

import com.project02.bbs.domain.Member;

public interface MemberService {
	
	public int login(String id, String pass);
	
	public Member getMember(String id);
	
	public boolean overlapIdCheck(String id);

	public void addMember(Member member);
	
	public boolean memberPassCheck(String id, String pass);
	
	public void updateMember(Member member);
	
	public boolean memberIdCheck(String name, String mobile);
	
	public String memberFindId(String name, String mobile);
	
}
