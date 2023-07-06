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
            <nav class="navbar navbar-expand-lg navbar-light bg-warning py-3">
                <div class="container px-10">
                    <a class="navbar-brand" href="list">
	                    <span class="fw-bolder text-primary">
	                  	   <img src="../resources/img/shallweshare.png" alt="Bootstrap" width="250" height="50">
	                    </span>
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-0 ml-0 mb-lg-0 Large  fw-bolder">
                            <li class="nav-item"><a class="nav-link" href="resume.html">모집/신청</a></li>
                            <li class="nav-item"><a class="nav-link " href="index.html" >마이페이지</a></li>
                            <li class="nav-item"><a class="nav-link" href="resume.html">관리자페이지</a></li>
                        </ul>
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0 Large  fw-bolder ">
                            <li class="nav-item"><a class="nav-link" href="resume.html">모집 </a></li>
                            <li class="nav-item"><a class="nav-link " href="index.html" >티모님 환영합니다</a></li>
                            <li class="nav-item"><a class="nav-link" href="resume.html">로그아웃</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
     
            <!-- Navigation-->
            <nav class="navbar navbar-expand-lg navbar-light bg-dark">
                <div class="container px-10 p-0">
                    <a class="navbar-brand m-0 ms-5" href="list">
	                    <span class="fw-bolder text-primary m">
	                    	 <img src="../resources/img/NETFLIX.png" alt="" width="170" height="60">
	                    </span>
                    </a>
                    <a class="navbar-brand m-0" href="list">
	                    <span class="fw-bolder text-primary">
	                    	 <img src="../resources/img/wavve.png" alt="" width="170" height="60">
	                    </span>
                    </a>
                    <a class="navbar-brand m-0" href="list">
	                    <span class="fw-bolder text-primary">
	                    	 <img src="../resources/img/TVING.jpg" alt="" width="170" height="60">
	                    </span>
                    </a>
                    <a class="navbar-brand m-0" href="list">
	                    <span class="fw-bolder text-primary">
	                    	 <img src="../resources/img/DISNEY.jpg" alt="" width="170" height="60">
	                    </span>
                    </a>
                    <a class="navbar-brand me-5" href="list">
	                    <span class="fw-bolder text-primary">
	                    	 <img src="../resources/img/WATCHA.jpg" alt="" width="170" height="60">
	                    </span>
                    </a>
                    <a class="navbar-brand ms-5" href="list">
	                    <span class="fw-bolder text-primary">
	                    	 <div class="btn btn-warning">파티만들기</div>
	                    </span>
                    </a>
                    </div>
                </div>
            </nav>
            <hr>
     
            
			  
			  <!--             파티방 -->
			  
      		<div class="container " id="hanging-icons" style="width: 70%">
				<h2 class="pb-2 text-center">싸움은 끝난지 않는다. 파티 생활 저렴하게 지금 시작 ~! </h2>
           	</div>
		    <div class="row g-3 py-2 row-cols-2 row-cols-lg-3 p-5 m-5 p-5">
		    <c:forEach var="getParty_list" items="${getParty_list }">
			<div class="border border-3 border-warning rounded-pill">
		    	<div class="col d-flex justify-content-center">
			        <div>
			          <a href="party_page?pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount} &p_id=${getParty_list.p_id}"  class="btn btn-white">
				          <h2>${getParty_list.p_platform}</h2>
				          <p>${getParty_list.p_title}</p>
				          <p>${getParty_list.p_price}원</p>
				          <p><fmt:formatDate pattern="yyyy.MM.dd. HH:mm" value="${getParty_list.p_created }"/>까지</p>
			          </a>
			        </div>
			      </div>
				</div>
      		</c:forEach>
	    	
	    	</div>
   		</div>
   		
		  

<!-- 	페이징  -->
	<div>
		<nav aria-label="Page navigation example">
		  <ul class="pagination pagination-lg justify-content-center bg-dark mt-5">
		  	<c:if test="${pageMaker.prev}">
		    	<li class="page-item">
		    		<a class="page-link" href="${pageMaker.startPage - 1}" aria-label="Previous">
		    			<span aria-hidden="true">&laquo;</span>
		    		</a>
	    		</li>
		    </c:if>
	    	<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
			    <li class="page-item " ${pageMaker.cri.pageNum == num } >
					<a class="page-link" href="${num}">
						${num}
					</a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next}">
				<li class="page-item">
					<a class="page-link " href="${pageMaker.endPage + 1}" aria-label="Next">
						 <span aria-hidden="true">&raquo;</span>
					</a>
				</li>
			</c:if>
		  </ul>
		</nav>
		</div>
		
	<form method="get" action="#" id="actionForm">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }"> 
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}"> 
	</form>
	<form method="post" action="#" id="actionForm">
		<input type="hidden" name="u_id" value="${user.getU_id()}"> 
		${user.getU_id()}
	</form>
	
            
            <!-- About Section-->
            <section class="bg-light py-2">
                <div class="container px-2" >
                    <div class="row gx-2 justify-content-center ">
                        <div class="col-sm-8 h-5">
                            <div class="text-center">
                                <h2 class="display-5 fw-bolder"><span class="text-dark d-inline">shallweshare</span></h2>
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
        <footer class="bg-warning py-4 mt-0">
            <div class="container px-5">
                <div class="row align-items-center justify-content-center flex-column flex-sm-row">
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
     
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js?v=10"></script>
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
	$(".page-link").on("click", function(e){
		e.preventDefault();
// 		console.log("@# href==>"+$(this).attr("href"));
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
	
// 	게시글 처리
// 	$(".btn btn-white").on("click",function(e){
// 		e.preventDefault();
// 		var targetBno=$(this).attr("href");
// 		actionForm.append("<input type='hidden' name='p_id' value='"+targetBno+"'>")
// 		actionForm.attr("action", "party_page").submit();
// 	});
	
</script>
     

