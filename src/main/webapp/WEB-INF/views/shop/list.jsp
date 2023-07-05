<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>shallweshare</title>
        <!-- Favicon-->
		<link href="../resources/css/list.css" rel="stylesheet" type="text/css">
        <link rel="icon" type="image/x-icon" href="../resources/assets/favicon.ico" />
        <!-- Custom Google font-->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@100;200;300;400;500;600;700;800;900&amp;display=swap" rel="stylesheet" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../resources/css/styles.css" rel="stylesheet" />
    </head>
    <body class="d-flex flex-column h-100">
        <main class="flex-shrink-0">
            <!-- Navigation-->
            <nav class="navbar navbar-expand-lg navbar-light bg-white py-3">
                <div class="container px-7">
                    <a class="navbar-brand" href="list"><span class="fw-bolder text-primary">shallweshare</span></a>
                    </span></a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0 small fw-bolder">
                            <li class="nav-item"><a class="nav-link" href="index.html">ㅇㅇ님 환영합니다</a></li>
                            <li class="nav-item"><a class="nav-link" href="resume.html">로그아웃</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- Header-->
            	<table border="1" class="body">
		<tr>
		 	<td>파티 번호 </td>
		 	<td>파티장 </td>
		 	<td>파티 인원  </td>
		 	<td>파티 끝나는 기간 </td>
		 	<td>파티 금액 </td>
		 	<td>공유 플랫폼 </td>
		 	<td>성인인증 유무 </td>
		 	<td>제목</td>
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
	<form method="posdt" action="#" id="actionForm">
		<input type="hidden" name="u_id" value="${user.getU_id()}"> 
		${user.getU_id()}
	</form>
            
            <!-- About Section-->
            <section class="bg-light py-2">
                <div class="container px-2">
                    <div class="row gx-2 justify-content-center">
                        <div class="col-xxl-8">
                            <div class="text-center my-5">
                                <h2 class="display-5 fw-bolder"><span class="text-gradient d-inline">shallweshare</span></h2>
                                <p class="lead fw-light mb-4">안전한 OTT 공유서비스</p>
                                <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugit dolorum itaque qui unde quisquam consequatur autem. Eveniet quasi nobis aliquid cumque officiis sed rem iure ipsa! Praesentium ratione atque dolorem?</p>
                                <div class="d-flex justify-content-center fs-2 gap-4">
                                    <a class="text-gradient" href="#!"><i class="bi bi-twitter"></i></a>
                                    <a class="text-gradient" href="#!"><i class="bi bi-linkedin"></i></a>
                                    <a class="text-gradient" href="#!"><i class="bi bi-github"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
        <!-- Footer-->
        <footer class="bg-white py-4 mt-auto">
            <div class="container px-5">
                <div class="row align-items-center justify-content-between flex-column flex-sm-row">
                    <div class="col-auto"><div class="small m-0">Copyright &copy; Your Website 2023</div></div>
                    <div class="col-auto">
                        <a class="small" href="#!">Privacy</a>
                        <span class="mx-1">&middot;</span>
                        <a class="small" href="#!">Terms</a>
                        <span class="mx-1">&middot;</span>
                        <a class="small" href="#!">Contact</a>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../resources/js/scripts.js"></script>

	
</body>
</html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
//파티만들기 이동시 로그인 확인

	var u_id = '<%= session.getAttribute("u_id") %>';
	function loginCheck() {
			  console.log("@# u_id==>"+u_id);
		if (u_id==='null') {
			  alert("로그인 해라")
		 	window.location='login';
		}else {
			 	window.location='party_create?u_id=${user.getU_id()}';
		}
	}
	
// 	페이지번호 처리
	var actionForm =$("#actionForm");
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
	