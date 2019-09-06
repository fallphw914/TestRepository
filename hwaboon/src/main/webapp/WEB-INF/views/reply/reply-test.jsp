<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Reply</title>

<jsp:include page="../include/static-header.jsp" />
</head>


<body>

<jsp:include page="../include/main-header.jsp" />


	
	
	<div class="wrapper">
	
		<div class="content-wrapper">
			
			<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('/images/bg-02.jpg');">
				<h2 class="ltext-105 cl0 txt-center">
					Reply-Test
				</h2>
			</section>
			
			<section class="content container-fluid">

            <div class="col-lg-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">댓글 작성</h3>
                    </div>
                    <div class="box-body">
                        <div class="form-group">
                            <label for="newReplyText">댓글 내용</label>
                            <input class="form-control" id="newReplyText" name="replyText" placeholder="댓글 내용을 입력해주세요">
                        </div>
                        <div class="form-group">
                            <label for="newReplyWriter">댓글 작성자</label>
                            <input class="form-control" id="newReplyWriter" name="replyWriter" placeholder="댓글 작성자를 입력해주세요">
                        </div>
                        <div class="pull-right">a
                            <button type="button" id="replyAddBtn" class="btn btn-primary"><i class="fa fa-save"></i> 댓글 저장</button>
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
 
 $(document).ready(function () {
	   
		let reviewNo = 100; //현재 게시글 번호
		console.log(reviewNo);
		let replyPageNum = 1; //댓글 페이지 번호
	   
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
	  
	  
	  
 });// JQuery End
 </script>
</body>
</html>