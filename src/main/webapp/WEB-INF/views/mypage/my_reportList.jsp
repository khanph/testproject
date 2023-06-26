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
	<h2>내 신고내역</h2>
	<table width="700" border="1">
		<tr>
			<th>신고 번호</th>
			<th>신고 카테고리</th>
			<th>신고 제목</th>
			<th>생성 시간</th>
		</tr>
		<c:forEach items="${myReportList}" var="myReportList" varStatus="i">
			<tr>
				<td>${myReportList.report_id}</td>
				<td>${myReportList.report_category}</a></td>
				<td>${myReportList.report_title}</a></td>
				<td><fmt:formatDate value="${myPartyList.report_created}" pattern="yyyy-MM-dd" /></td>
			</tr>
		</c:forEach>
</body>
</html>