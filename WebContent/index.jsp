<%@page import="member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");

//if(request.getAttribute("mdto")!=null) {
	MemberDto mdto = (MemberDto)request.getAttribute("mdto");
	if(mdto!=null) {
		session.setAttribute("login", mdto);
		session.setMaxInactiveInterval(10);
	}
//}
%>
	
<%
//사용자 세션
Object ologin = session.getAttribute("login");
MemberDto member = null;
if(ologin==null) {
	%>
	<script type="text/javascript">
	//alert("세션이 만료됐습니다. 다시 로그인하세요.");
	//location.href = "login.jsp";
	</script>
	<%
}
else {
	member = (MemberDto)ologin;
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
/* 메뉴 */
ul {
	list-style-type: none;
	margin: 0px;
	padding: 0px;
	overflow: hidden;
	background-color: #333;
}
li {
	float: left;
}
li a {
	/* display: block; */
	display: inline;
	color: white; /* 폰트칼라 */
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-size: 24px;
}
li a:hover {
	background-color: #010101;
}

.rightF {
	float: right;
}
</style>
<title>Insert title here</title>
</head>
<body>
<%
if(member==null) {
	%>
	<a href="login.jsp">Login</a>
	<!-- <a href="./member/join.jsp">Join</a> -->
	<a href="join.jsp">Join</a>
	<%
}
else {
	%>
	<a href="Logout">Logout</a>
	<a href="">MyPage</a>
	<%
};
%>
<nav>
<ul>
	<li><a href="./botox/botox.jsp">보톡스</a></li>
	<li><a href="./skin/laser.jsp">피부 클리닉</a></li>
	<li><a href="">리프팅</a></li>
	<li class="rightF">
		<a href="">병원소개</a>
		<a href="">상담및예약</a>
		<a href="">시술후기</a>
		<a href="">고객소리함</a>
		<a href="">자료게시판</a>
	</li>
</ul>
</nav>

</body>
</html>