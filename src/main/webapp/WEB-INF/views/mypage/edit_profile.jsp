<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li><a href="edit_profile?u_id=<%= session.getAttribute("u_id") %>">회원 수정하기</a></li>
		<li><a href="my_partyList?u_id=<%= session.getAttribute("u_id") %>">내 파티 보기</a></li>
		<li><a href="my_reportList?u_id=<%= session.getAttribute("u_id") %>">내 신고내역</a></li>
		<li><a href="#">회원 탈퇴</a></li>
	</ul>
	<table width="500" border="1">
		<form method="post" action="edit_profileProcess">
			<input type="hidden" name="u_id" value=<%= session.getAttribute("u_id") %>>
		<tr>
			<td>닉네임</td>
			<td><input type="text" name="u_nickname" value="${user.u_nickname}"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="u_name" value="${user.u_name}"></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="text" name="u_email" value="${user.u_email}"></td>
		</tr>
		<tr>
			<td>전화 번호</td>
			<td><input type="text" name="u_phoneNum" value="${user.u_phoneNum}"></td>
		</tr>
		<tr>
			<td>은행</td>
			<td><input type="text" name="u_bank_account" value="${user.u_bank_account}"></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="수정">
			</td>
		</tr>
		</form>
	</table>

</body>
</html>