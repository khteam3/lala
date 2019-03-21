<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>
<title>login.jsp</title>
<style type="text/css">
.center {
	margin: auto;
	width: 60%;
	border: 3px solid #8ac007;
	padding: 10px;
}
</style>

</head>
<body>

<h1>Login</h1>
<p>환영합니다</p>

<%
String msg = request.getParameter("msg");
if( !(msg==null || msg.equals("")) ) {
	%>
	<script type="text/javascript">
	alert("<%=msg %>");
	location.href = "login.jsp";
	</script>
	<%
}
%>

<div class="center">
<form action="Login" method="post" onsubmit="return check()">

<table border="1">
<tr>
	<td>아이디</td>
	<td>
		<input type="text" name="id" id="id" size="20">
		<input type="checkbox" id="saveid">id저장
	</td>
</tr>
<tr>
	<td>비밀번호</td>
	<td>
		<input type="password" name="pwd" id="pwd" size="20">
	</td>
</tr>
<tr>
	<td colspan="2">
		<input type="submit" value="로그인">
		<button type="button" onclick="location.href='join.jsp'">회원가입</button>
	</td>
</tr>
</table>

</form>
</div>

<script type="text/javascript">
$(function() {
	// 쿠키생성 - 키값: user_id
	//var user_id = $.cookie("user_id");

	//지정된 쿠키가있을 때,
	//텍스트박스에 적어놓고, 체크박스도 체크해 놓는다.
	
	if($.cookie("user_id") != null) {
        alert("저장된 쿠키가 있음");
        $("#id").val( $.cookie("user_id") );
        $("#saveid").attr("checked", "checked");
	}

	//체크박스 눌렀을 때
	$("#saveid").click(function() {
        // 클릭을 했는데 체크박스에 체크가 됐을 때때
        //if($("input:checkbox[id='chk_save_id']").is(":checked"))
        if( $("#saveid").is(":checked") ) {
			// 아이디를 안썼으면, 체크해제
			if($("#id").val().trim()==""){
		        alert("id를 입력하세요.");
		        $("#saveid").prop("checked", false);
			}
			// 아이디가 적혔으면 쿠키에 저장
			else {
		        // 7일동안 유지, 어느경로던 받아들이겠다.
		        // user_id로 id의 value를 받겠다.
		        $.cookie("user_id", $("#id").val().trim(), {expires:7, path:"/"});
			}
        }
        // 클릭했는데 체크가 없어짐
        // 그렇다면 세션삭제
        else {
			$.removeCookie("user_id", {path:"/"});
        }
	});
});

function check() {
	if($("#id").val().trim()=="") {
		alert("ID를 입력해야 합니다.");
		$("#id").focus();
		return false;
	}
	if($("#pwd").val().trim()=="") {
		alert("비밀번호를 입력해야 합니다.");
		$("#pwd").focus();
		return false;
	}

	return true;
}
</script>

</body>
</html>
















