<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<!DOCTYPE html>

<html lang="ko">
<head>
	<title>Review</title>

<jsp:include page="../include/static-header.jsp" />
	
<body class="animsition">
	
	
 <jsp:include page="../include/main-header.jsp" />
 


	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('/images/bg-02.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			Review
		</h2>
	</section>	


	<!-- Content page -->
	<section class="bg0 p-t-62 p-b-60">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-lg-9 p-b-80">
					<div class="p-r-45 p-r-0-lg">

						<c:if test="${articles.size() <= 0}">
						<tr>
							<td align="center" colspan="5"><strong>검색 결과가 없습니다!</strong></td>
						</tr>
					</c:if>

					<c:if test="${articles.size() > 0}">

						<c:forEach var="article" items="${articles}">
						
						<div class="p-b-63">
							<a href="<c:url value='/review/content${pageCreator.makeSearchURI(pageCreator.criteria.page)}&reviewNo=${article.reviewNo}'/>" class="hov-img0 how-pos5-parent">
								<img src="/images/blog-04.jpg" alt="IMG-BLOG">
							</a>

							<div class="p-t-32">
								<h4 class="p-b-15">
									<a href="blog-detail.html" class="ltext-108 cl2 hov-cl1 trans-04">
										<a href="<c:url value='/review/content${pageCreator.makeSearchURI(pageCreator.criteria.page)}&reviewNo=${article.reviewNo}'/>">
		                                ${article.title}</a>
									</a>
								</h4>

								<p class="stext-117 cl6">
									${article.content}  
								</p>

								<div class="flex-w flex-sb-m p-t-18">
									<span class="flex-w flex-m stext-111 cl2 p-r-30 m-tb-10">
										<span>
											<span class="cl4">By</span> ${article.writer}  
											<span class="cl12 m-l-4 m-r-6">|</span>
										</span>

										<span>
											<fmt:formatDate value="${article.regDate}" pattern="yyyy.MM.dd"/>
											<span class="cl12 m-l-4 m-r-6">|</span>
										</span>

										<span>
											${article.viewCnt} Views
										</span>
									</span>

									<a href="<c:url value='/review/content${pageCreator.makeSearchURI(pageCreator.criteria.page)}&reviewNo=${article.reviewNo}'/>" class="stext-101 cl2 hov-cl1 trans-04 m-tb-10">
										Continue Reading

										<i class="fa fa-long-arrow-right m-l-9"></i>
									</a>
								</div>
							</div>
						</div>
						</c:forEach>
						</c:if>
						
						<div class="flex-r-m" style="padding-top: 50px">
									<button type="submit" class="flex-c-m stext-101 cl0 size-125 bg3 bor2 hov-btn3 p-lr-15 trans-04 btn-write">Write</button>
								</div>

						
			<!-- Pagination -->
				<div class="flex-c-m flex-w w-full p-t-10 m-lr--7" >
					
						<c:if test="${pageCreator.prev}">
							<li><a href="<c:url value='/review/list${pageCreator.makeSearchURI(pageCreator.beginPage - 1)}' />"><i class="fa fa-long-arrow-left m-l-9"> 이전 </i></a></li>
						</c:if>
					
						
						
							<c:forEach var="idx" begin="${pageCreator.beginPage}" end="${pageCreator.endPage}">
								<li <c:out value="${pageCreator.criteria.page == idx ? 'class=active' : ''}" />>
									<a href="<c:url value='/review/list?page=${idx}'/>" class="flex-c-m how-pagination1 trans-04 m-all-7 ">${idx}</a>
								</li>
							</c:forEach>
						
						

						
							<c:if test="${pageCreator.next}">
								<li><a href="<c:url value='/review/list${pageCreator.makeSearchURI(pageCreator.endPage + 1)}'/>">다음<i class="fa fa-long-arrow-right m-l-9"></i></a></li>
							</c:if>
						
					</div>
						
					</div>
				</div>

				<div class="col-md-4 col-lg-3 p-b-80">
					<div class="side-menu">
						 	<div class="flex-w flex-l-m p-b-10">
									
									<div class="size-207 respon6-next">
										<div class="rs1-select2 bor17 bg0">
											<select class="js-select2" name="time">
												<option value="title"<c:out value="${param.condition == 'title' ? 'selected' : ''}"/>>제목</option>
													<option value="content"<c:out value="${param.condition == 'content' ? 'selected' : ''}"/>>내용</option>
													<option value="writer"<c:out value="${param.condition == 'writer' ? 'selected' : ''}"/>>작성자</option>
													<option value="title"<c:out value="${param.condition == 'title' ? 'selected' : ''}"/>>제목+내용</option>
											</select>
											<div class="dropDownSelect2"></div>
										</div>
									</div>
								</div>
								
						<div class="bor17 of-hidden pos-relative">
							<input class="stext-103 cl2 plh4 size-116 p-l-28 p-r-55" type="text" name="search" id="keywordInput" placeholder="Search">

							<button class="flex-c-m size-122 ab-t-r fs-18 cl4 hov-cl1 trans-04" id="searchBtn">
								<i class="zmdi zmdi-search"></i>
							</button>
						</div>

						</div>
				</div>
			</div>
		</div>
	</section>	
	
 <jsp:include page="../include/main-footer.jsp" />
 
 <jsp:include page="../include/js.jsp" /> 

<script type="text/javascript">
	const result="${message}";
	
	
	
	if(result=="regSuccess"){
		alert("게시물이 등록되었습니다.");
		}
	else if(result=="modSuccess"){
		alert("게시물이 수정되었습니다.");
	}
	else if(result=="delSuccess"){
		alert("게시물이 삭제되었습니다.");
	}
	
	//JQuery문의 시작
	$(document).ready(function() {
		
		//글작성 버튼 클릭 이벤트
		$(".btn-write").on("click", function() {
			self.location = "/review/write";
		});
		
		
		
		//검색 버튼 클릭 이벤트
		$("#searchBtn").on("click", function() {
			self.location = "/review/list${pageCreator.makePageURI(1)}"
							+ "&condition=" + $("select option:selected").val()  
							+ "&keyword=" + $("#keywordInput").val();
			
		});
		
		//엔터키 입력 이벤트
		$("#keywordInput").keydown(function (key) {
			 
	        if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
	        	$("#searchBtn").click();
	        }
	 
	    	});
		});
	
</script>

</body>
</html>