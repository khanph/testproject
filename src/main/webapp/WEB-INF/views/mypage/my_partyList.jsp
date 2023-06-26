<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<h2>내가 만든 파티</h2>
	<table width="700" border="1">
		<tr>
			<th>파티 번호</th>
			<th>파티 제목</th>
			<th>생성 시간</th>
			<th>파티 인원</th>
			<th>상태</th>
		</tr>
		<c:forEach items="${myPartyList}" var="myPartyList" varStatus="i">
			<tr>
				<td>${myPartyList.p_id}</td>
				<td><a href="../shop/party_page?p_id=${myPartyList.p_id}">${myPartyList.p_title}</a></td>
				<td><fmt:formatDate value="${myPartyList.p_created}" pattern="yyyy-MM-dd" /></td>
				<td>${myPartyList.p_max}</td>
				<td>진행중</td>
			</tr>
		</c:forEach>
	</table>	
	<h2>내가 가입한 파티</h2>
	<table width="700" border="1">
		<tr>
			<th>결제번호</th>
			<th>가입 파티</th>
			<th>가입 시간</th>
			<th>결제 정보</th>
			<th>후기</th>
		</tr>
		<c:forEach items="${myApplicationList}" var="myApplicationList" varStatus="i">
			<tr>
				<td>${myApplicationList.a_id}</td>
				<td><a href="../shop/party_page?p_id=${myApplicationList.p_id}">${myApplicationList.p_title}</a></td>
				<td><fmt:formatDate value="${myApplicationList.a_created}" pattern="yyyy-MM-dd" /></td>
				<td>${myApplicationList.a_payment}<br/>
					${myApplicationList.a_price}원
				</td>
				<td></td>
			</tr>
		</c:forEach>
	</table>
		
</body>
</html>