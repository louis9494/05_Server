<%--
	prefix : 접두사 (앞에 붙는 말/단어)
	만약 prefix="c"	   ->  <c:if> 태그 써야됨
	만약 prefix="fn"   ->  <fn:..>
 --%>


<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>a태그 get요청으로 응답받은 페이지</h1>
	
	<h1>EL (Expression Language) : 표현 언어</h1>
	
	<pre>
	
		<%--
			<%= %>
		--%>
		- JSP에서 표현식을
		  간단하고 효율적으로
		  작성할 수 있도록 고안된 언어
		  (JSP 내부에 기본 내장되어 있음!)
		
		- JAVA의 값을 HTML 형태로 쉽게 출력할 수 있다!
		
		- 기본 작성법 : \${key} []백슬래시는 제거하고 사용 (그대로 출력)]
		 <!-- 대입하면 value값이 도출됨 -->
			 
	</pre>
	
	<h3>전달 받은 파라미터를 출력하는 방법</h3>
	
	<p style="color: red;">
		주소 뒤에 쿼리스트링(?name=홍길동&age=20)
		직접 작성해보면서 테스트
	</p>
	
	<h4>1. JSP 표현식</h4>
	<div>
		name : <%= request.getParameter("name") %>
		<br>
		age : <%= request.getParameter("age") %>
	</div>
	

	
	<h4>2. EL</h4>
	<%-- el 특징 : null, NullpointerException을 빈칸으로 처리 
					get 이라는 단어를 사용하지 않는다.			
			
	--%>
	<div>
		name : ${param.name}
		<br>
		age : ${param.age}
	</div>
	
	<hr><hr>
	
	<h1>JSTL(JSP Standard Tag Library)</h1>
	<pre>
		jsp에서 자주 사용하는 java 코드를
		(if, for, 변수 선언, string 관련 메서드....)
		
		스트립틀릿이 아닌 html 태그 모양으로 작성할 수 있도록
		태그를 제공하는 라이브러리
		
		[라이브러리 추가 방법]
		1. 필요한 라이브러리(.jar) 파일이름 다운 받기
		2. 프로젝트 webapp/WEB-INF/lib 폴더에
		   다운 받은 라이브러리 추가(복사 붙여넣기)
		3. JSTL을 사용할  JSP 파일 제일 위에
			taglib 추가 구문 작성
	</pre>
	
	<h3> JSTL c:if문 사용해보기</h3>
	
	<%
		int age = Integer.parseInt(request.getParameter("age"));
		if(age > 20) { 
	%>
		
			<h3>성인입니다(JSP 스크립틀릿으로 출력)</h3>
	<% } %>
	
	<c:if test="${param.age > 20}">
		<h3>성인입니다(JSTL 사용)</h3>
	</c:if>
	
	<c:if test="${param.age <= 20}">
		<h3>성인보다 나이가 작습니다(JSTL 사용)</h3>
	</c:if>
	
	<hr>
	<h3>회원가입</h3>

  <form action="/signUp" method="post">
     아이디 :        <input type="text" name="inputId" required> <br>
     비밀번호 :      <input type="password" name="inputPw" required> <br>
     비밀번호 확인 : <input type="password" required> <br>
     이름 : 		 <input name="inputName" required> <br>
	 나이 : 		 <input name="inputAge" required> <br>
    
     <button>회원가입</button>

  </form>
	
	
</body>
</html>