<%--
	회원 가입시 아이디 중복검사 요청에 대한 처리 결과를 출력할 View 페이지
	이 페이지는 새창으로 실행되고 중복 아이디 체크를 할 수 있는 폼을 제공한다.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" href="resources/css/member.css" rel="stylesheet" />
<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="resources/js/member.js"></script>
<title>아이디 , 패스워드 찾기</title>
</head>
<body>
		<div>
			<h3>아이디/비밀번호 찾기</h3>
			<p>인증된 이메일만 정보 찿기가 가능합니다.</p>
		</div>
		
		<div>
			<input type = "radio" name = "search" onclick="search(1)" checked="checked">
			<label>아이디 찾기</label>
		</div>
		<div>
			<input type = "radio" name = "search" onclick="search(2)">
			<label>비밀번호 찾기</label>
		</div>
		<div id= "searchI">
		<form>
			<div>
				<label>이름 : </label>
				<input type="text" name = "name" id = "idName" >
			</div>
			<div>
				<label>휴대폰번호 : </label>
				<input type="text" name = "mobile" id = "idMobile">
			</div><br/>
			<div>
				<button onclick="searchIdClick()" class="btn-Search">확인</button>
				<a <%-- href="${pageContext.request.contextPath/loginForm --%>}">취소</a>
			</div>
			</form>
		</div>
		
		<div id= "searchP" style = "display: none ">
			<div>
				<label>아이디 : </label>
				<input type= "text" name = "inputId" id = "inputId">
			</div>
			<div>
				<label>이메일 : </label>
				<input type = "email" name="inputEmail" placeholder ="ex : email@mail.com">
			</div><br/>
			<div>
				<button onclick="searchPassClick()" class="btn-Search">확인</button>
				<a <%-- href="${pageContext.request.contextPath/loginForm}" --%>>취소</a>
			</div>
		</div>
		<div id="resultData">
		</div>
</body>

<script>

	function search(num) {
		if( num == '2') {
			document.getElementById("searchI").style.display = "none";
			document.getElementById("searchP").style.display = "";
		
		} else {
			document.getElementById("searchP").style.display = "none";
			document.getElementById("searchI").style.display = "";	
		}
	}
	
	function searchIdClick() {
		
		$.ajax ({
			url:"idCheck.ajax",
			type:"post",
			data : { name: $("#idName").val() , mobile : $("#idMobile").val()} ,
			dataType: "text",
			success: function(data) {	
				
				$("#resultData").text(data);
				
				if(data = null) {
					$("#resultData").text("일치하는 회원정보가 없습니다.");
					alert("일치하는 회원정보가 없습니다.");
				} else {
					$("#resultData").text(data+ "입니다.");
				};
			},
			error: function(xhr, status, error) {
				alert("error : " + xhr.statusText + ", " + status + ", " + error);
			}
		});
	};
</script>
</html>