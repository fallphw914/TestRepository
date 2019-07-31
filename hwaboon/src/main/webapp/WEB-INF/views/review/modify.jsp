<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modify</title>
<jsp:include page="../include/static-header.jsp" />

</head>

<body>

 <jsp:include page="../include/main-header.jsp" />
 
 

<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('/images/bg-02.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			Modify
		</h2>
	</section>	

	<!-- Content page -->
	<section class="bg0 p-t-62 p-b-60">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-lg-9 p-b-80">
					<div class="p-r-45 p-r-0-lg">

						<div class="wraper">
							<form role="form" method="POST">
								
								<input type="hidden" name="reviewNo" value="${article.reviewNo}">
                  			    <input type="hidden" name="page" value="${criteria.page}">
                  				 <input type="hidden" name="countPerPage" value="${criteria.countPerPage}">
                 			    <input type="hidden" name="condition" value="${criteria.condition}">
                    			<input type="hidden" name="keyword" value="${criteria.keyword}">
								
								<div>
								<div><h4>제목</h4></div><br>
							
								<div class="bor19 size-218 m-b-20">

									<input class="stext-111 cl2 plh3 size-116 p-lr-18" type="text" id="title" name="title" placeholder="제목을 입력해주세요." value="${article.title}">
								</div>
								
								<div><h4>작성자</h4></div><br>

								<div class="bor19 size-218 m-b-20">

									<input class="stext-111 cl2 plh3 size-116 p-lr-18" type="text" name="writer" id="writer" placeholder="작성자" value="${article.writer}" readonly>
								</div>

								<div class="bor19 m-b-20">
									<textarea class="stext-111 cl2 plh3 size-124 p-lr-18 p-tb-15" name="content" id="content" placeholder="내용을 입력해주세요.">${article.content}</textarea>
								</div>
								</div>

								<div class="flex-r-m" style="padding-top: 50px">
									<button type="submit" class="flex-c-m stext-101 cl0 size-125 bg3 bor2 hov-btn3 p-lr-15 trans-04 btn-mod">Modify</button>
									<button type="submit" class="flex-c-m stext-101 cl0 size-125 bg3 bor2 hov-btn3 p-lr-15 trans-04 btn-cancel" style="margin-left: 50px">Cancel</button>
								</div>

							</form>
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
			
			const formObj=$("form[role='form']");
			
			$(".btn-mod").on("click", function(){
				

				formObj.attr("action","modify");
				formObj.submit();
			});
			
			$(".btn-cancel").on("click", function(){
				formObj.attr("method","get");
				formObj.attr("action","content");
				formObj.submit();
			});
			
		});
	
	</script>

</body>
</html>