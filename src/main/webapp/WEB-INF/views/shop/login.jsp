<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
		table{
			margin : auto;
		    // 가로 넓이도 지정해주면 좋습니다.
		    width : 80%;
		}
		tr {
		  text-align: center;
		}
		td{
		  text-align: center;
		}
		input{
			position: right;
		}
</style>
</head>
<body>
	<form action="loginCheck" method="post">
	<table border="2">
		<tr>
			<td colspan="2"> 
				<h1>shallweshare</h1>
			</td>
		</tr>
		<tr>
			<td colspan="2"> 
				ID : <input type="text" name="u_id">
			</td>
		</tr>
		<tr>
			<td colspan="2"> 
				PW : <input type="password" name="u_pw">
			</td>
		</tr>
		<tr>
			<td> 
				<input type="submit" value="로그인">
			</td>
			<td> 
				<input type="button" value="취소" onclick="history.go(-1);">
			</td>
		</tr>
	</table>
	</form>
</body>
</html>
