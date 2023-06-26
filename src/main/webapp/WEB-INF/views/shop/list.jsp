<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
		table{
			margin : auto;
		    // ���� ���̵� �������ָ� �����ϴ�.
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
				<a href="list">����/��û</a>
			</td>
			<td>
				<a href="party_create">��Ƽ����</a>
			</td>
		</tr>
		<tr>
			<td>
				<a href="listNetflix">
					���ø���
				</a>
			</td>
			<td>
				<a href="listWavve">
					���̺�
				</a>
			</td>
			<td>
				<a href="listTving">
					Ƽ��
				</a>
			</td>
			<td>
				<a href="listDisney">
					������÷���
				</a>
			</td>
			<td>
				<a href="listWatcha">
					��í
				</a>
			</td>
		</tr>
	</table>
	<table border="1">
		<tr>
		 	<td>��Ƽ ��ȣ </td>
		 	<td>��Ƽ�� </td>
		 	<td>��Ƽ �ο�  </td>
		 	<td>��Ƽ ������ �Ⱓ </td>
		 	<td>��Ƽ �ݾ� </td>
		 	<td>���� �÷��� </td>
		 	<td>�������� ���� </td>
		 	<td>���� �Է� </td>
		 	<td>��Ƽ ���� �ð� </td>
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
<!-- 					���������� - 1 �ϸ� ������ 10�� ������ ǥ�� -->
<!-- 				ex>11->10(1~10), 21->20(11~20) -->
					<a href="${pageMaker.startPage - 1}">
						[Previous]
					</a>
				</li>
			</c:if>
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
<%-- 				<li>${num}</li> --%>
<%-- 				<li ${pageMaker.cri.pageNum == num ? "style='color:red'":""} > --%>
<!-- 				���� �������� ���� ��������� ǥ�� -->
				<li class="paginate_button" ${pageMaker.cri.pageNum == num ? "style='background-color:yellow'":""} >
<!-- 					Ŭ���� ���������� ��ȣ�� ��ũ�� ���� -->
					<a href="${num}">
						[${num}]
					</a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next}">
				<li class="paginate_button">
<!-- 					�������� + 1 �ϸ� ������ 10�� ������ ǥ�� -->
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
	
	
// 	��������ȣ ó��
	$(".paginate_button a").on("click", function(e){
		e.preventDefault();
		console.log("@# href==>"+$(this).attr("href"));
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
	
	
// 	�Խñ� ó��
	$(".move_link").on("click",function(e){
		e.preventDefault();
		var targetBno=$(this).attr("href");
		actionForm.append("<input type='hidden' name='p_id' value='"+targetBno+"'>")
		actionForm.attr("action", "party_page").submit();
	});
	
</script>
	