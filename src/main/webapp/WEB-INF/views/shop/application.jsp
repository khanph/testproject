<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="500" border="1">
		<form method="post" action="application_process">
		<%= session.getAttribute("u_id")%>
		<input type="hidden" name="p_id" value="${party.p_id}">
		<input type="hidden" name="a_price" value="${party.p_price}">
		<input type="hidden" name="u_id" value=<%= session.getAttribute("u_id") %>>
			<tr>
				<td>파티 번호</td>
				<td>${party.p_id}</td>
			</tr>
			<tr>
				<td>파티 제목</td>
				<td>${party.p_title}</td>
			</tr>
			<tr>
				<td>결제 금액</td>
				<td>${party.p_price}</td>
			</tr>
			
			<tr>
				<td>결제 방법 선택</td>
				<td>
					<label><input type="radio" name="a_payment" value="카카오페이">카카오페이</label>			
					<label><input type="radio" name="a_payment" value="무통장입금">무통장입금</label>			
				</td>
			</tr>
			<tr>
				<input type="submit" value="신청하기">
				<input type="button" value="돌아가기">
			</tr>
		</form>
	</table>
</body>
</html>