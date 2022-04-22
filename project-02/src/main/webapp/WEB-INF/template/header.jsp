<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
	<div id="logo">		
		<a href="${ pageContext.servletContext.contextPath }/">
		<img src="http://placehold.it/176x67" alt="Books2U" width="176" 
			height="67" /></a></div>	
					
	<div id="header_link">
		<ul>			
			<c:if test="${ sessionScope.isLogin }" >
			
				<c:if test="${ sessionScope.member.id ne 'admin' }" >
				<li>			
					<span id="message">안녕하세요 ${ sessionScope.member.name }님</span>
				</li>		
				</c:if>
				
				<c:if test="${ sessionScope.member.id eq 'admin' }" >
				<li>			
					<span id="message">관리자 전용 입니다.</span>
				</li>				
				</c:if>	
			</c:if>		
			<li>		
				<a href='${pageContext.servletContext.contextPath}/
					${ sessionScope.isLogin ? "logout" : "loginForm" }'>
					${ sessionScope.isLogin ? "로그아웃" : "로그인" }</a>
			</li>			
			<li>
				<a href="boardList">게시 글 리스트</a>
			</li>			
			<li>
				<c:if test="${ not sessionScope.isLogin }" >	
					<a href="joinForm">회원가입</a>
				</c:if>
				
				<c:if test="${ sessionScope.isLogin }" >
					
					<c:if test="${ sessionScope.member.id ne 'admin' }" >
						<a href="memberMypage">마이페이지</a>
						<li><a href="#">주문/배송조회</a></li>		
						<li class="no_line"><a href="#">고객센터</a></li>
					</c:if>
			
					<c:if test="${ sessionScope.member.id eq 'admin' }" >
						<a href="memberMypage">마이페이지</a>
						<li><a href="#">주문/배송</a></li>
						<li><a href="#">상품관리</a></li>
					</c:if>	
				</c:if>
			</li>
			
		</ul>
	</div>
</header>