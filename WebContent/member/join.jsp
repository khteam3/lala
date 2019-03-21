<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="//cdn.poesis.kr/post/popup.min.js" charset="UTF-8"></script>
<title>Insert title here</title>
</head>
<body>

<div align="center">
<form action="InsertMember" method="post" onsubmit="return check()">

<table border="1">
<tr>
	<td>아이디</td>
	<td>
		<input type="text" name="id" id="id" size="20">
		<!-- id 확인 -->
		<p id="idcheck" style="font-size: 8px;"></p>
		<input type="button" id="btn" value="id확인">
	</td>
</tr>
<tr>
	<td>비밀번호</td>
	<td>
		<input type="text" name="pwd" id="pwd" size="20">
	</td>
</tr>
<tr>
	<td>이름</td>
	<td>
		<input type="text" name="name" id="name" size="20">
	</td>
</tr>
<tr>
	<td>이메일</td>
	<td>
		<input type="text" name="email1" id="email1" >@
		<input type="text" name="email2" id="email2" >&nbsp;
		<select id="email3">
			<option selected="selected">직접입력</option>
			<option value="naver.com">naver.com</option>
		 	<option value="daum.net">daum.net</option>
		</select>
		<input type="hidden" name="email" id="email" size="20" value="">
	</td>
</tr>
<tr>
	<td>전화번호</td>
	<td>
		<select id="phone1">
			<option value="010" selected="selected">010</option>
			<option value="011">011</option>
		</select>-
		<input type="text" id="phone2">-
		<input type="text" id="phone3">
		<input type="hidden" name="phone" id="phone" size="20" value="">
	</td>
</tr>
<tr>
	<td>주소</td>
	<td>
		<div>
		    <p>
		        <label>우편번호</label><input type="text" size="4" class="postcodify_postcode6_1" id="post1" /> &ndash;
		        <label></label><input type="text" size="4" class="postcodify_postcode6_2" id="post2" /> &nbsp;
		        <!-- <button id="search_button">검색</button> -->
		        <a id="search_button">[검색]</a>
		    </p>
		    <p><label>주소</label><input type="text" class="postcodify_address" id="address1"/></p>
		    <p><label>상세주소</label><input type="text" class="postcodify_details" id="address2"/></p>
		</div>
		<input type="hidden" name="address" id="address" size="20" value="">
	</td>
</tr>
<tr>
	<td colspan="2">
		<input type="submit" id="submitBtn" value="회원가입" disabled="disabled">
	</td>
</tr>
</table>
</form>

</div>

<script type="text/javascript">
$("#search_button").postcodifyPopUp();

var idck = false;
var wid = "";

$(function() {
	$("#id").on("focus", function() {
		$("#submitBtn").attr("disabled", true);
	});
	
	$("#email3").change(function() {
		$("#email2").val($("#email3").val());
	});
	
	$("#btn").click(function() {
		if( $("#id").val().trim() != "" ) {
			$.ajax({
				type: "post",
				data: { "id" : $("#id").val().trim() },
				url: "IdSameCheck",
				
				success: function( data ) {
					if(data.trim()=='fail') {
						alert("사용중인 ID입니다.");
						//$("#idcheck").text("사용중인 ID입니다.");
						$("#id").val("");
						idck = false;
					}
					else if(data.trim()=='success') {
						alert("사용할 수 있습니다.");
						//$("#idcheck").text("사용할 수 있습니다.");
						wid = $("#id").val().trim();
						$("#submitBtn").attr("disabled", false);
						idck = true;
					}
				},
				error: function() {
					alert("error");
				}
			}); // end ajax
		}
		else {
			alert("ID를 입력해야 합니다.");
			$("#id").focus();
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
	if($("#name").val().trim()=="") {
		alert("이름을 입력해야 합니다.");
		$("#name").focus();
		return false;
	}
	if($("#email1").val().trim()=="" || $("#email2").val().trim()=="") {
		alert("이메일을 입력해야 합니다.");
		//$("#email").focus()
		return false;
	}
	if($("#phone2").val().trim()=="" || $("#phone3").val().trim()=="") {
		alert("전화번호를 입력해야 합니다.");
		//$("#phone").focus()
		return false;
	}
	if($("#address1").val().trim()=="" || $("#address2").val().trim()=="") {
		alert("주소를 입력해야 합니다.");
		//$("#phone").focus()
		return false;
	}
	
	if( !($("#id").val().trim()==wid) ) {
		idck = false;
	}
	
	if(idck==false) {
		alert("id 중복체크를 해주세요.");
		return false;
	}
	
	$("#email").val( $("#email1").val() + "@" + $("#email2").val() );
	var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if(!check(re2, $("#email").val( $("#email1").val() + "@" + $("#email2").val() ), "적합하지 않은 이메일 형식입니다.")) {
        return false;
    }
	$("#phone").val( $("#phone1").val() + "-" + $("#phone2").val() + "-" + $("#phone3").val() );
	var adrs = "["+$("#post1").val()+"-"+$("#post2").val()+"] " + $("#address1").val() + " " + $("#address2").val();
	$("#address").val(adrs);
	
	idck = false;
	return true;
}
</script>

</body>
</html>