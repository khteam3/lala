<%@page import="member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//사용자 세션
Object ologin = session.getAttribute("login");
MemberDto member = null;
if(ologin==null) {
	%>
	<script type="text/javascript">
	//alert("세션이 만료됐습니다. 다시 로그인하세요.");
	//location.href = "../login.jsp";
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

div {
	/* width: 1100px; */
}
nav {
	/* width: 1100px; */
}
.font15 {
	font-size: 15px;
}
.center {
	margin: auto;
}
.main {
	margin: auto;
	background-color: green;
	height: 500px;
	text-align: center;
}
</style>
<title>라라클리닉 역삼점</title>
</head>
<body>
<div class="center">
<div align="center">
<img src="../images/lala_logo_264x130.png" onclick="location.href='../index.jsp'">
</div>
<div align="right" >
<%
if(member==null) {
	%>
	<a href="../member/login.jsp">Login</a>&nbsp;&nbsp;&nbsp;
	<a href="../member/join.jsp">Join</a>
	<%
}
else {
	%>
	<a href="../Logout">Logout</a>&nbsp;&nbsp;&nbsp;
	<a href="">MyPage</a>
	<%
};
%>
</div>
<div>
<nav>
<ul>
	<li><a href="../botox/botox.jsp">보톡스</a></li>
	<li><a href="../skin/laser.jsp">피부 클리닉</a></li>
	<li><a href="../lifting/lifting.jsp">리프팅</a></li>
	<li class="rightF">
		<a href=""><font class="font15">병원소개</font></a>
		<a href=""><font class="font15">상담및예약</font></a>
		<a href=""><font class="font15">시술후기</font></a>
		<a href=""><font class="font15">고객소리함</font></a>
		<a href=""><font class="font15">자료게시판</font></a>
	</li>
</ul>
</nav>
</div>

<h1>보톡스/보톡스</h1>
<a href="../botox/botox.jsp">보톡스</a><br>
<a href="../botox/filler.jsp">필러</a><br>
<a href="../botox/outline.jsp">윤곽주사</a>

</body>
</html>