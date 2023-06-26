<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="500" border="1">
		
			<tr>
				<td>파티 번호</td>
				<td>${party.p_id}</td>
			</tr>
			<tr>
				<td>파티장 회원번호</td>
				<td>${party.u_id}</td>
			</tr>
			<tr>
				<td>파티장 닉네임</td>
				<td>${master.u_nickname}</td>
			</tr>
			<c:forEach items="${list}" var="list" varStatus="i">
			<tr>
				<td>참가자 ${i.index}</td>
				<td>${list.u_nickname}</td>
			</tr>
			</c:forEach>
			<tr>
				<td>파티 플랫폼</td>
				<td>${party.p_platform}</td>
			</tr>
			<tr>
				<td>파티 기간</td>
				<td><fmt:formatDate value="${party.p_finish_date}" pattern="yyyy-MM-dd"/>까지
				${finish_date-toDay}
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${party.p_title}</td>
			</tr>
			<tr>
				<td>파티 플랫폼 아이디</td>
				<td>${party.p_platform_id}</td>
			</tr>
			<tr>
				<td>파티 플랫폼 비밀번호</td>
				<td>${party.p_platform_password}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${party.p_content}</td>
			</tr>
	</table>
	<br/>
	<table width="500" border="1">
		<tr>
			<td colspan ="2">채팅방</td>
		</tr>
		<c:forEach items="${chatList}" var="chats" varStatus="i">
			<tr>
				<td>작성자</td>
				<td>${chats.u_nickname}</td>
			</tr>
			<tr>
				<td colspan="2">${chats.p_board_content}</td>
			</tr>
			<tr>
				<td colspan="2">${chats.p_board_created}</td>
			</tr>
		</c:forEach>
		<tr>
			
			<form method="post" action="insertChat">
				<input type="hidden" name="p_id" value="${party.p_id}">
				<input type="hidden" name="u_id" value=<%= session.getAttribute("u_id") %>>
				<td><input type="text" name="p_board_content"> </td>
				<td><input type="submit" value="입력" width="50"></td>
				
			</form>
			
		</tr>
	</table>
</body>
</html>