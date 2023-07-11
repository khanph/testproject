<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
<meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>shallweshare</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="../resources/assets/favicon.ico" />
        <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@100;200;300;400;500;600;700;800;900&amp;display=swap" rel="stylesheet" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../resources/css/styles.css" rel="stylesheet" />
        <link href="../resources/css/font.css" rel="stylesheet" />
		
	
    </head>
    <body >
        <main class="flex-shrink-0">
        
            <!-- header-->
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
                            <li class="nav-item"><a class="nav-link" href="list">모집/신청</a></li>
                            <li class="nav-item"><a class="nav-link " href="index.html" >마이페이지</a></li>
                            <li class="nav-item"><a class="nav-link" href="admin.html">관리자페이지</a></li>
                        </ul>
                     
								
						<ul class="navbar-nav ms-auto mb-2 mb-lg-0 Large  fw-bolder">
                            <li class="nav-item">
	                            <ul class="navbar-nav ms-0 ml-0 mb-lg-0 Large  fw-bolder">
	                            <li class="nav-item">
							      <a class="nav-link">
							       ${sessionScope.u_nickname}님 환영합니다
							      </a>
							     </li> 
							     <li class="nav-item">
		                              <a href="admin.html">
	                              		 <c:choose>
											<c:when test="${sessionScope.u_id eq null }">
												<a class="nav-link " href="../users/userSignIn">로그인</a>
											</c:when>
											<c:otherwise>
												<c:choose>
													<c:when test="${sessionScope.access_Token eq null }">
														<a class="nav-link " href="../users/logout">로그아웃</a>
													</c:when>
													<c:otherwise>
														<a class="nav-link " href="../users/kakaologout">로그아웃</a>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>
		                              </a>
	                              </li>
						    </li>
                       	 </ul> 									
				    </div>
                  </div>
            </nav>
     
            <!-- Navigation-->
            <nav class="navbar navbar-expand-lg navbar-light bg-dark">
                <div class="container px-10 p-0">
                    <a class="navbar-brand m-0 ms-5" href="listNetflix">
	                    <span class="fw-bolder text-primary m">
	                    	 <img src="../resources/img/NETFLIX.png"  width="170" height="60">
	                    </span>
                    </a>
                    <a class="navbar-brand m-0" href="listWavve">
	                    <span class="fw-bolder text-primary">
	                    	 <img src="../resources/img/wavve.png"  width="170" height="60">
	                    </span>
                    </a>
                    <a class="navbar-brand m-0" href="listTving">
	                    <span class="fw-bolder text-primary">
	                    	 <img src="../resources/img/TVING.jpg"  width="170" height="60">
	                    </span>
                    </a>
                    <a class="navbar-brand m-0" href="listDisney">
	                    <span class="fw-bolder text-primary">
	                    	 <img src="../resources/img/DISNEY.jpg"  width="170" height="60">
	                    </span>
                    </a>
                    <a class="navbar-brand me-5" href="listWatcha">
	                    <span class="fw-bolder text-primary">
	                    	 <img src="../resources/img/WATCHA.jpg"  width="170" height="60">
	                    </span>
                    </a>
                    <a class="navbar-brand ms-5" href="party_create">
	                    <span class="fw-bolder text-primary">
	                    	 <div class="btn btn-warning">파티만들기</div>
	                    </span>
                    </a>
                    </div>
            </nav>
            <hr>
     
			  <!--             파티방 -->
      		<div class="container d-flex justify-content-center" id="hanging-icons">
<!-- 				<h2 class="pb-2 text-center"> <img alt="" src="../resources/img/베너1.png" width="1200px"> </h2> -->
<!--                     	<img src="../resources/img/베너1.png" class="slideshow-image"> -->
                        <img src="../resources/img/베너2.png" class="slideshow-image" style="width: 1400px">
           	</div>
		    <div class="row row-cols-4 ms-5 me-5 d-flex justify-content-center">
		    
		    <c:forEach var="getParty_list" items="${getParty_list }">
			<div class=" border border-3 border-warning m-3 p-0 rounded ">
			        <div class="col-xs d-flex justify-content-center ">
			          <a href="party_page?pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount} &p_id=${getParty_list.p_id}"  class="btn btn-lg btn-light" style="width: 100%">
				          <h2><img src="../resources/img/${getParty_list.p_platform}Icon.png" width="50px" height="50px"> ${getParty_list.p_platform}</h2>
				          <p>${getParty_list.p_title}</p>
				          <p>1/4</p>
				          <p><fmt:formatDate pattern="yyyy.MM.dd" value="${getParty_list.p_finish_date }"/>까지
				           &laquo;<b> ${getParty_list.p_price}원</b> &raquo; </p>
				          
			          </a>
			        </div>
			      </div>
      		</c:forEach>
      		
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
<!--             <section class="bg-light py-2 fixed-bottom"> -->
            <section class="bg-light py-2">
                <div class="container px-2" >
                    <div class="row gx-2 justify-content-center ">
                        <div class="col-sm-8 h-5">
                            <div class="text-center">
<!--                                 <h2 class="display-5 fw-bolder"><span class="text-dark d-inline">shallweshare</span></h2> -->
<!--                                 <p class="lead fw-light mb-4">안전한 OTT 공유서비스</p> -->
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
            
        <!-- Footer-->
        <footer class="bg-warning py-4 mt-0 ">
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
            </main>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../resources/js/scripts.js"></script>

	
</body>
</html>
     
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>

//파티만들기 이동시 로그인 확인
var u_id = '<%=session.getAttribute("u_id") %>';
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
	
</script>
     

