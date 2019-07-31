<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Write</title>

<jsp:include page="../include/static-header.jsp" />

</head>
<body>
 <jsp:include page="../include/main-header.jsp" />
 
 

	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('/images/bg-02.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			Write
		</h2>
	</section>	
	
		<!-- Content page -->
	<section class="bg0 p-t-62 p-b-60">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-lg-9 p-b-80">
					<div class="p-r-45 p-r-0-lg">

						<div class="wraper">
							<form role="form" id="writeform" method="POST" action="<c:url value='/review/write'/>">
								
								<div>
								<div><h4>제목</h4></div><br>
							
								<div class="bor19 size-218 m-b-20">

									<input class="stext-111 cl2 plh3 size-116 p-lr-18" type="text" id="title" name="title" placeholder="제목을 입력해주세요.">
								</div>
								
								<div><h4>작성자</h4></div><br>

								<div class="bor19 size-218 m-b-20">

									<input class="stext-111 cl2 plh3 size-116 p-lr-18" type="text" name="writer" id="writer" placeholder="작성자">
								</div>

								<div class="bor19 m-b-20">
									<textarea class="stext-111 cl2 plh3 size-124 p-lr-18 p-tb-15" name="content" placeholder="내용을 입력해주세요."></textarea>
								</div>
								</div>

								<div>
									<button type="submit" class="flex-c-m stext-101 cl0 size-125 bg3 bor2 hov-btn3 p-lr-15 trans-04"> Post Comment</button>
								</div>

							</form>
						</div>

					</div>
				</div>

			</div>
		</div>
	</section>
	

</body>
</html>