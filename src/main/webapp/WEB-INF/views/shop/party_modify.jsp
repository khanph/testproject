<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="500" border="1">
		<form method="post" action="*">
		<input type="hidden" name="pageNum" value="${pageMaker.pageNum }"> 
		<input type="hidden" name="amount" value="${pageMaker.amount }"> 
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
		<c:forEach items="${participant_list}" var="participant_list"
			varStatus="i">
			<tr>
				<td>참가자 ${i.index}</td>
				<td>${participant_list.u_nickname}</td>
			</tr>
		</c:forEach>
		<tr>
			<td>파티 플랫폼</td>
			<td> <input type="text" value="${party.p_platform}"> </td>
		</tr>
		<tr>
			<td>파티 기간</td>
			<td>
<%-- 				<fmt:formatDate value="${party.p_finish_date}"pattern="yyyy-MM-dd" />까지 ${finish_date-toDay} --%>
				<input type="date" value="<fmt:formatDate value="${party.p_finish_date}" pattern="yyyy.MM.dd. HH:mm" />까지">
			</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>
				<input type="text" value=" ${party.p_title}">
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<textarea rows="20" cols="60" >${party.p_content}</textarea> 
			</td>
		</tr>
<%-- 		<c:choose> --%>
<%-- 		<c:when test="${ fn:length(participant_list)+1 < party.p_max}"> --%>
<!-- 			<input type="button" value="신청하기" -->
<%-- 				onclick="javascript:window.location='application?p_id=${party.p_id}'"> --%>
<%-- 		</c:when> --%>
		
<%-- 		<c:otherwise> --%>
<!-- 			<h2>파티 모집이 완료되었습니다.</h2> -->
<%-- 		</c:otherwise> --%>
<%-- 		</c:choose> --%>
		
		<input type="submit" value="목록" formaction="list">
		<input type="button" value="삭제" onclick="javascript:window.location='party_delete?u_id=${party.u_id}'">
		<input type="button" value="수정" onclick="javascript:window.location='party_modify?u_id=${party.u_id}'">
		 
        <!-- 파티 개설자와 현재 로그인한 사용자의 u_id 비교 -->
<%-- 		 <c:if test="${party.u_id eq loggedUser.u_id}"> --%>
<!--         	<input type="submit" value="삭제" formaction="delete"> -->
<%--     	</c:if> --%>
		</form>
	</table>
</body>
</html>

<script type="text/javascript">
	function deleteCheck() {
	    var userid = "${loggedUser.u_id}"; // 현재 사용자의 u_id
	    var u_Id = "${party.u_id}"; // 게시글의 작성자의 u_id
	
	    if (userId == u_Id) {
	        var confirmation = confirm("정말로 삭제하시겠습니까?");
	
	        if (confirmation) {
	            // 삭제 처리를 위한 페이지로 이동
	            window.location.href = "party_delete?u_id=${party.u_id}";
	        }
	    } else {
	        alert("권한이 없습니다.");
    	}
	}
	
	function modifyCheck() {
	    var userid = "${loggedUser.u_id}"; // 현재 사용자의 u_id
	    var u_Id = "${party.u_id}"; // 게시글의 작성자의 u_id
	
	    if (userId == u_Id) {
	        var confirmation = confirm("정말로 수정하시겠습니까?");
	
	        if (confirmation) {
	            // 삭제 처리를 위한 페이지로 이동
	            window.location.href = "party_modify?u_id=${party.u_id}";
	        }
	    } else {
	        alert("권한이 없습니다.");
    	}
	}
</script>