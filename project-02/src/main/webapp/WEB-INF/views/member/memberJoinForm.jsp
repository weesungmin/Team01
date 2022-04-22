<%-- 회원가입 폼 요청 처리 결과를 출력할 View 페이지 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	새로운 5자리 우편번호로 회원 주소를 입력 받기 위해 daum.net에서
	제공하는 우편번호 찾기 API를 사용하였다.
	참고 사이트 : http://postcode.map.daum.net/guide
-->    
<script src=
"https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>    
<article>
	<div id="memberJoinForm">
	<h2 id="joinFormTitle">회원 정보 입력</h2>	
	<form action="joinResult" name="joinForm" method="post"
		id="joinForm">		
		<%-- 
			회원 아이디 중복 검사를 했는지의 정보를 hidden 필드로 저장 
		--%>
		<input type="hidden" name="isIdCheck" id="isIdCheck" value="false"/>
		<div id="memberInputDefault">			
			<div class="memberInputText">
				<span class="memberSpan">* 이&nbsp;&nbsp;름 : </span>
				<input type="text" name="name" size="15" id="name" />
			</div>				
			<div class="memberInputText">
				<span class="memberSpan">* 아이디 : </span>
				<input type="text" name="id" size="15"  id="userId" />
				<input type="button" value="중복확인" id="btnOverlapId" />
			</div>								
			<div class="memberInputText">
				<span class="memberSpan">* 비밀번호 : </span>
				<input type="password" name="pass1" id="pass1" size="15"/>
			</div>
			<div class="memberInputText">
				<span class="memberSpan">* 비밀번호 확인 : </span>
				<input type="password" name="pass2" id="pass2" size="15"/>
			</div>
			<div class="memberInputText">
				<span class="memberSpan">* 우편번호 : </span>
				<input type="text" name="zipcode" size="6" 
					maxlength="5" readonly id="zipcode"/>&nbsp;
				<input type="button" value="우편번호 검색" id="btnZipcode"/>
			</div>
			<div class="memberInputText">
				<span class="memberSpan">* 자택주소 : </span>
				<input type="text" name="address1" size="50" readonly id="address1"/>
			</div>
			<div class="memberInputText">
				<span class="memberSpan">상세주소 : </span>
				<input type="text" name="address2" size="50" id="address2" />
			</div>
			<div class="memberInputText">
				<span class="memberSpan">* 이 메 일 : </span>
				<input type="text" name="emailId" size="10" id="emailId" /> @
				<input type="text" name="emailDomain" size="10" id="emailDomain" />
				<select name="selectDomain" id="selectDomain">
					<option>직접입력</option>
					<option>네이버</option>
					<option>다음</option>
					<option>한메일</option>
					<option>구글</option>										
				</select>
			</div>
			<div class="memberInputText">
				<span class="memberSpan">* 휴 대 폰 : </span>
				<select name="mobile1" id="mobile1">
					<option>010</option>
					<option>011</option>
					<option>016</option>
					<option>017</option>
					<option>018</option>
					<option>019</option>
				</select>-					
				<input type="text" name="mobile2" size="3" maxlength="4" id="mobile2"/>-
				<input type="text" name="mobile3" size="3" maxlength="4" id="mobile3"/>
			</div>
		</div>
		<div id="memberInputOption">
			<div class="memberInputText">
				<span class="memberSpan">메일 수신여부 : </span>
				<input type="radio" name="emailGet" value="true"/>수신함
				<input type="radio" name="emailGet" value="false"/>수신안함
			</div>
			<div class="memberInputText">
				<span class="memberSpan"> 자택전화 : </span>
				<select name="phone1">
					<option>02</option>
					<option>031</option>
					<option>032</option>
					<option>033</option>
					<option>041</option>
					<option>042</option>
					<option>043</option>
					<option>044</option>
					<option>051</option>
					<option>052</option>
					<option>053</option>
					<option>054</option>
					<option>055</option>
					<option>061</option>
					<option>062</option>
					<option>063</option>
					<option>064</option>
				</select>-					
				<input type="text" name="phone2" size="3" maxlength="4"/>-
				<input type="text" name="phone3" size="3" maxlength="4"/>
			</div>
		</div>
		<div class="formButton">
			<input type="reset" value="다시쓰기"/>
			<input type="submit" value="가입하기" />
		</div>			
	</form>	
	</div>
</article>