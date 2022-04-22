<%-- 회원정보 수정 폼 요청 처리 대한 결과를 출력할 View 페이지 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<article>
	<div id="memberJoinForm">
	
	<h3 id="joinFormTitle">회원 정보</h3>	
	<form name="memberMypage" id="memberMypage">
		<input type="hidden" name="isIdCheck" value="true"/>		
		
		<div id="memberInputDefault">		
			
			<div class="memberInputText">
				<span class="memberSpan">* 이&nbsp;&nbsp;름 : </span>
				<span>${ sessionScope.member.name } </span>
			</div>			
			
			<div class="memberInputText">
				<span class="memberSpan">* 아이디 : </span>
				<span> ${ sessionScope.member.id } </span>
			</div>								
			
			<div class="memberInputText">
				<span class="memberSpan">* 자택주소 : </span>
				<span>${ sessionScope.member.address1 }</span>
				<span>${ sessionScope.member.address2 }</span>
			</div>

			<div class="memberInputText">
				<span class="memberSpan">* 이 메 일 : </span>
				<span>${ sessionScope.member.email } </span>
			</div>
			
			<div class="memberInputText">
				<span class="memberSpan">* 휴 대 폰 : </span>
				<span>${ sessionScope.member.mobile } </span>
			</div>
		
			<div class="memberInputText">
				<span class="memberSpan"> 자택전화 : </span>
				<span>${ sessionScope.member.phone } </span>
			</div>
		</div>
		
		<div class="formButton">
			<input type="button" id = "updateButton" value="회원정보 수정하기" />
		</div>			
		
		<div>
			<h3>상품 주문내역</h3>
			
			<table>
				<tr>
					<th>no.</th><th>주문번호</th><th>주문일</th><th>상품수</th>
					<th>주문금액</th><th>결제방법</th><th>입금액</th><th>운송장번호</th>
					<th>상태</th><th>상세보기</th>
				</tr>
				<tr>
					<td></td><td></td><td></td><td></td><td></td>
					<td></td><td></td><td></td><td></td><td></td>
				</tr>
				
			</table>
			
		</div>
	</form>	
	</div>
</article>