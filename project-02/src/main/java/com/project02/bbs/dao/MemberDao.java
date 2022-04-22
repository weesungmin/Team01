package com.project02.bbs.dao;

import com.project02.bbs.domain.Member;

public interface MemberDao {
	
	public int login(String id , String pass);
	
	public Member getMember(String id);
	
	void addMember(Member member);
	
	public boolean memberPassCheck(String id, String pass);
	
	public void updateMember(Member member);
	
	public boolean memberIdCheck(String name, String mobile);
	
	public String memberFindId(String name, String mobile);
}
