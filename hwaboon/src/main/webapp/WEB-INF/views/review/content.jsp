<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Content</title>
<jsp:include page="../include/static-header.jsp" />
</head>
<body>

	
 <jsp:include page="../include/main-header.jsp" />
 

 
 

	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('/images/bg-02.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			Content
		</h2>
	</section>	
	
	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="<c:url value='/'/>" class="stext-109 cl8 hov-cl1 trans-04">
				Home
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<a href="<c:url value='/review/list'/>" class="stext-109 cl8 hov-cl1 trans-04">
				Review
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
				${article.title}
			</span>
		</div>
	</div>


	<!-- Content page -->
	<section class="bg0 p-t-62 p-b-60">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-lg-9 p-b-80">
					<div class="p-r-45 p-r-0-lg">

						<h4 class="ltext-109 cl2 p-b-28">${article.title}</h4>

						<div class="p-t-32">
							<span class="flex-w flex-m stext-111 cl2 p-b-19"> <span>
									<span class="cl4">By</span> ${article.writer} <span
									class="cl12 m-l-4 m-r-6">|</span>
							</span> <span> <fmt:formatDate pattern="yyyy.MM.dd a hh:mm"
										value="${article.regDate}" /> <span class="cl12 m-l-4 m-r-6">|</span>
							</span> <span> ${article.viewCnt} Views </span>
							</span>

							<div class="wrap-pic-w how-pos5-parent">
								<img src="/images/blog-04.jpg" alt="IMG-BLOG">

							</div>
							<br>


							<p class="stext-117 cl6 p-b-26">${article.content}</p>
							<br>

						</div>

						<div>
							<form role="form" method="post">
								<input type="hidden" name="reviewNo" value="${article.reviewNo}">
								<input type="hidden" name="page" value="${criteria.page}">
								<input type="hidden" name="countPerPage" value="${criteria.countPerPage}"> <input type="hidden"
									name="condition" value="${criteria.condition}"> 
								<input type="hidden" name="keyword" value="${criteria.keyword}">

							</form>
						</div>
						<div class="flex-w size-217">
							<a href="#"
								class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5 btn-list">
								목록 </a> 
								<a href="#"
								class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5 btn-modify">
								수정 </a> 
								<a href="#"
								class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5 btn-delete">
								삭제 </a>
						</div>
					</div>
				</div>
			</div>


		</div>
	</section>
	
 <jsp:include page="../include/main-footer.jsp" />
 
 <jsp:include page="../include/js.jsp" /> 

	
	<script type="text/javascript">
	
	
		$(document).ready(function() {

			const formObj = $("form[role='form']");

			$(".btn-list").on("click", function() {
				formObj.attr("method", "get");
				formObj.attr("action", "list");
				formObj.submit();
			});

			$(".btn-modify").on("click", function() {
				formObj.attr("method", "get");
				formObj.attr("action", "modify");
				formObj.submit();
			});

			$(".btn-delete").on("click", function() {
				formObj.attr("action", "delete");
				formObj.submit();
			});
		});
	</script>
</body>
</html>