<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="loginCheck" method="post">
		ID : <input type="text" name="u_id">
		PW : <input type="password" name="u_pw">
		<input type="submit" value="로그인">
		<input type="button" value="취소" onclick="history.back;">
	</form>
</body>
</html>
