<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
									<span class="cl4">By </span> ${login.userId} <span
									class="cl12 m-l-4 m-r-6">|</span>
							</span> <span> <fmt:formatDate pattern="yyyy.MM.dd a hh:mm"
										value="${article.regDate}" /> <span class="cl12 m-l-4 m-r-6">|</span>
							</span> <span> ${article.viewCnt} Views </span>
							</span>

							<div class="wrap-pic-w how-pos5-parent">
								<c:set var="len" value="${fn:length(article.fileName)}" />
								<c:set var="filetype"
									value="${fn:toUpperCase(fn:substring(article.fileName, len-4, len))}" />
								<c:choose>
									<c:when
										test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG') or (filetype eq '.GIF')}">
										<img class="img-thumbnail img-fluid"
											src="<c:url value='/review/file/${article.fileId}'/>" alt=""
											style="width: 100%; height: 400px;">
									</c:when>
									<c:otherwise>
										<img class="img-thumbnail img-fluid"
											src="<c:url value='/images/no-image.PNG'/>" alt=""
											style="width: 100%; height: 400px;">
									</c:otherwise>

								</c:choose>

							</div>
							<br>


							<p class="stext-117 cl6 p-b-26">${article.content}</p>
							<br>

						</div>

						<div>
							<form role="form" method="post">
								<input type="hidden" name="reviewNo" value="${article.reviewNo}">
								<input type="hidden" name="page" value="${criteria.page}">
								<input type="hidden" name="countPerPage"
									value="${criteria.countPerPage}"> <input type="hidden"
									name="condition" value="${criteria.condition}"> <input
									type="hidden" name="keyword" value="${criteria.keyword}">

							</form>
						</div>
						<div class="flex-w size-217">
							<a href="#"
								class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5 btn-list">
								목록 </a> <a href="#"
								class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5 btn-modify">
								수정 </a> <a href="#"
								class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5 btn-delete">
								삭제 </a>

						</div>
					</div>

					<div class="wrapper">

						<div class="content-wrapper">


							<section class="content container-fluid">

								<div class="col-lg-12">
									<div class="box box-primary">
										<div class="box-header with-border">
											<h3 class="box-title">댓글 작성</h3>
										</div>
										<div class="box-body">
											<div class="form-group">
												<label for="newReplyText">댓글 내용</label> <input
													class="form-control" id="newReplyText" name="replyText"
													placeholder="댓글 내용을 입력해주세요">
											</div>
											<div class="form-group">
												<label for="newReplyWriter">댓글 작성자</label> <input
													class="form-control" id="newReplyWriter" name="replyWriter"
													placeholder="댓글 작성자를 입력해주세요">
											</div>
											<div class="pull-right">
												<button type="button" id="replyAddBtn" class="btn btn-primary">
													<i class="fa fa-save"></i> 댓글 저장
												</button>
											</div>
										</div>


										<div class="box box-success collapsed-box">
											<%--댓글 유무 / 댓글 갯수 / 댓글 펼치기, 접기--%>
											<div class="box-header with-border">
												<a class="link-black text-lg"><i
													class="fa fa-comments-o margin-r-5 replyCount"></i> </a>
												<div class="box-tools">
													<button type="button" class="btn btn-box-tool"
														data-widget="collapse">
														<i class="fa fa-plus"></i>
													</button>
												</div>
											</div>
											<%--댓글 목록--%>
											<div class="box-body repliesDiv"></div>
											<%--댓글 페이징--%>
											<div class="box-footer">
												<div class="text-center">
													<ul class="pagination pagination-sm no-margin">

													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>


							</section>

						</div>

					</div>
				</div>



			</div>


		</div>
	</section>

	<jsp:include page="../include/main-footer.jsp" />
 
 <jsp:include page="../include/js.jsp" /> 
 
  <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script>
 
 
 <script id="replyTemplate" type="text/x-handlebars-template">

    {{#each.}}
    <div class="post replyDiv" data-replyNo={{replyNo}}>
        <div class="user-block">
            <%--댓글 작성자 프로필사진--%>
            <img class="img-circle img-bordered-sm" src="<c:url value='/images/gallery-03.jpg'/>" alt="user image">
            <%--댓글 작성자--%>
            <span class="username">
                <%--작성자 이름--%>
                <a href="#">{{replyWriter}}</a>
                <%--댓글 삭제 버튼--%>
                <a href="#" class="pull-right btn-box-tool replyDelBtn" data-toggle="modal" data-target="#delModal">
                    <i class="fa fa-times"> 삭제</i>
                </a>
                <%--댓글 수정 버튼--%>
                <a href="#" class="pull-right btn-box-tool replyModBtn" data-toggle="modal" data-target="#modModal">
                    <i class="fa fa-edit"> 수정</i>
                </a>
            </span>
            <%--댓글 작성일자--%>
            <span class="description">{{prettifyDate regDate}}</span>
        </div>
        <%--댓글 내용--%>
        <div class="oldReplyText">{{{escape replyText}}}</div>
        <br>
    </div>
    {{/each}}
</script>

	
<script type="text/javascript">
	
	
		$(function() {
			
			
			let reviewNo = "${article.reviewNo}"; //현재 게시글 번호
			console.log(reviewNo);
			let replyPageNum = 1; //댓글 페이지 번호
			
			//댓글 내용 줄바꿈 공백 처리
			Handlebars.registerHelper("escape", function(replytext) {
				let text = Handlebars.Utils.escapeExpression(replytext);
				text = text.replace(/(\r\n|\n|\r)/gm, "<br>");
				text = text.replace(/( )/gm, "&nbsp;");
				return new Handlebars.SafeString(text);
			});
			
			//댓글 등록 날짜 포맷팅
			Handlebars.registerHelper("prettifyDate", function(time) {
				let dateObj = new Date(time);
				let year = dateObj.getFullYear();
				let month = dateObj.getMonth() + 1;
				let date = dateObj.getDate();
				let hours = dateObj.getHours();
				let minutes = dateObj.getMinutes();
				//2자리 숫자로 변환
				month < 10 ? month = '0' + month : month;
				date < 10 ? date = '0' + date : date;
				hours < 10 ? hours = '0' + hours : hours;
				minutes < 10 ? minutes = '0' + minutes : minutes;
				return year + "-" + month + "-" + date + "-" + hours + ":" + minutes;
			});
		   
			//댓글 목록 함수 호출
			getReplies("/replies/" + reviewNo + "/" + replyPageNum);
			
			//댓글 목록 불러오기 함수
			function getReplies(uri) {
				$.getJSON(uri, function(data) {
					console.log(data);
					printReplyCount(data.pageCreator.articleTotalCount);
					printReplies(data.replies, $(".repliesDiv"), $("#replyTemplate"));
					printReplyPaging(data.pageCreator, $(".pagination"));
				});
			}
			
			
			//댓글 총 개수 출력 함수
			function printReplyCount(totalCount) {
				const replyCount = $(".replyCount");
				const collapsedBox = $(".collapsed-box");
				
				//댓글이 없을 때
				if(totalCount === 0) {
					replyCount.html("댓글이 없습니다. 댓글을 작성해주세요!");
					return;
				}
				
				//댓글이 존재할 때
				replyCount.html("댓글 목록 (" + totalCount + ")");
				collapsedBox.find(".btn-box-tool").html(
					"<button type='button' class='btn btn-box-tool' data-widget='collapse'>"
					+ "<i class='fa fa-plus'></i>"
					+ "</button>"			
				);
				
			}
			
			//댓글 목록 출력 함수
			function printReplies(replyArr, targetArea, templateObj) {
				const replyTemplate = Handlebars.compile(templateObj.html());
				const html = replyTemplate(replyArr);
				$(".replyDiv").remove();
				targetArea.html(html);
			}
			

			//댓글 페이지 출력 함수
			function printReplyPaging(pageCreator, targetArea) {
				let element = "";
				if(pageCreator.prev) {
					element += "<li><a href='" + (pageCreator.beginPage - 1) + "'>이전</a></li>";
				}
				
				const len = pageCreator.endPage;
				for(let i=pageCreator.beginPage; i <= len; i++) {
					const active = pageCreator.criteria.pageCnt === i ? "class=active" : "";
					element += "<li " + active + "><a href='" + i + "'>" + i + "</a></li>";
				}
				
				if(pageCreator.next) {
					element += "<li><a href='" + (pageCreator.endPage + 1) + "'>다음</a></li>";
				}
				
				targetArea.html(element);
			}
			
			//댓글 페이지 번호 클릭 이벤트
			$(".pagination").on("click", "li a", function(e) {
				console.log("page click!")
				e.preventDefault();
				replyPageNum = $(this).attr("href");
				console.log(replyPageNum);
				getReplies("/replies/" + reviewNo + "/" + replyPageNum);
				
			});
			
			// 댓글 저장 버튼 클릭 이벤트
		    $("#replyAddBtn").on("click", function () {
		    	
		    	console.log("save click!")

		        // 입력 form 선택자
		        const replyWriterObj = $("#newReplyWriter");
		        const replyTextObj = $("#newReplyText");
		        let replyWriter = replyWriterObj.val();
		        let replyText = replyTextObj.val();
		        

		        // 댓글 입력처리 수행
		        $.ajax({
		            type: "POST",
		            url: "/replies/",
		            headers: {
		                "Content-Type": "application/json",
		                "X-HTTP-Method-Override": "POST"
		            },
		            dataType: "text",
		            data: JSON.stringify({
		                reviewNo: reviewNo,
		                replyWriter: replyWriter,
		                replyText: replyText
		            }),
		            success: function (result) {
		                console.log("result : " + result);
		                if (result === "regSuccess") {
		                    alert("댓글이 등록되었습니다.");
		                    replyPageNum = 1;  // 페이지 1로 초기화
		                    getReplies("/replies/" + reviewNo + "/" + replyPageNum); // 댓글 목록 호출
		                    replyTextObj.val("");   // 댓글 입력창 공백처리
		                    replyWriterObj.val("");   // 댓글 입력창 공백처리
		                }
		            }
		        });
		    });
			

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