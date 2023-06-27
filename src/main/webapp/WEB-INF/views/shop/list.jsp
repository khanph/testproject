<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
		.head{
			margin : auto;
		    width :64%;
		}
		th, td {
		  text-align: center;
		}
		.div_page ul{
			display: flex;
			list-style: none;
			justify-content: center;
		}
	</style>
</head>
<body >
	<table border="1" class="head">
		<tr>
			<td colspan="4">
				<a href="list">모집/신청</a>
			</td>
			<td>
				<a href="party_create">파티모집</a>
			</td>
		</tr>
		<tr>
			<td>
				<a href="listNetflix">
					넷플릭스
				</a>
			</td>
			<td>
				<a href="listWavve">
					웨이브
				</a>
			</td>
			<td>
				<a href="listTving">
					티빙
				</a>
			</td>
			<td>
				<a href="listDisney">
					디즈니플러스
				</a>
			</td>
			<td>
				<a href="listWatcha">
					왓챠
				</a>
			</td>
		</tr>
	</table>
	<table border="1">
		<tr>
		 	<td>파티 번호 </td>
		 	<td>파티장 </td>
		 	<td>파티 인원  </td>
		 	<td>파티 끝나는 기간 </td>
		 	<td>파티 금액 </td>
		 	<td>공유 플랫폼 </td>
		 	<td>성인인증 유무 </td>
		 	<td>자유 입력 </td>
		 	<td>파티 만든 시간 </td>
		</tr>
		<c:forEach var="getParty_list" items="${getParty_list }">
		<tr>
		 	<td>${getParty_list.p_id }</td>
		 	<td>${getParty_list.u_id }</td>
		 	<td>${getParty_list.p_max }</td>
		 	<td><fmt:formatDate pattern="yyyy.MM.dd. HH:mm" value="${getParty_list.p_finish_date }"/></td>
		 	<td>${getParty_list.p_price }</td>
		 	<td>${getParty_list.p_platform }</td>
		 	<td>${getParty_list.p_adult }</td>
		 	<td>
		 		<a class="move_link" href="${getParty_list.p_id}">${getParty_list.p_title }</a>
		 	</td>
		 	<td><fmt:formatDate pattern="yyyy.MM.dd. HH:mm" value="${getParty_list.p_created }"/> </td>
		</tr>
		</c:forEach>
	</table>
	
	<div class="div_page">
		<ul>
			<c:if test="${pageMaker.prev}">
				<li class="paginate_button">
<!-- 					시작페이지 - 1 하면 이전의 10개 페이지 표시 -->
<!-- 				ex>11->10(1~10), 21->20(11~20) -->
					<a href="${pageMaker.startPage - 1}">
						[Previous]
					</a>
				</li>
			</c:if>
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
<%-- 				<li>${num}</li> --%>
<%-- 				<li ${pageMaker.cri.pageNum == num ? "style='color:red'":""} > --%>
<!-- 				현재 페이지는 배경색 노란색으로 표시 -->
				<li class="paginate_button" ${pageMaker.cri.pageNum == num ? "style='background-color:yellow'":""} >
<!-- 					클릭한 현재페이지 번호를 링크로 연결 -->
					<a href="${num}">
						[${num}]
					</a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next}">
				<li class="paginate_button">
<!-- 					끝페이지 + 1 하면 이후의 10개 페이지 표시 -->
<!-- 				ex>10->11(11~20), 20->21(21~30) -->
					<a href="${pageMaker.endPage + 1}">
						[Next]
					</a>
				</li>
			</c:if>
		</ul>
	</div>
	
	<form method="get" action="#" id="actionForm">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }"> 
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }"> 
	</form>
</body>
</html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	var actionForm =$("#actionForm");
	
	
// 	페이지번호 처리
	$(".paginate_button a").on("click", function(e){
		e.preventDefault();
		console.log("@# href==>"+$(this).attr("href"));
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
	
	
// 	게시글 처리
	$(".move_link").on("click",function(e){
		e.preventDefault();
		var targetBno=$(this).attr("href");
		actionForm.append("<input type='hidden' name='p_id' value='"+targetBno+"'>")
		actionForm.attr("action", "party_page").submit();
	});
	
</script>
	