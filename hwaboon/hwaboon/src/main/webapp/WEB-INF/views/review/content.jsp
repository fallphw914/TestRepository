<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.wraper {
	width: 50%;
	border: 1px solid #444444;
	border-collapse: collapse;
	margin-left: auto;
	margin-right: auto;
}
</style>
</head>
<body>
	<h2>content 페이지</h2>
	<div class="wraper">
		<div>
			<div>
			
				<div>
					<label for="title">제목</label><br>
					<div style="height: 55px">${article.title}</div>
				</div>
				<label for="regdate">작성시간</label><br>
				<div style="height: 55px"><fmt:formatDate pattern="yyyy.MM.dd" value="${article.regDate}"/></div>
			
				<div>
					<label for="writer">작성자</label><br>
					<div style="height: 55px">${article.writer}</div>
				</div>
				
				<div>
					<label for="content">내용</label><br>
					<div style="height: 400px">${article.content}</div>
				</div>
			</div>

			<div>
				<div>
					<form role="form" method="post">
						<input type="hidden" name="reviewNo" value="${article.reviewNo}">
					</form>
						<button type="submit" class="btn btn-list"><i class="fa fa-save"></i> 목록 </button>
						<button type="submit" class="btn btn-modify"><i class="fa fa-save"></i> 수정	</button>
						<button type="submit" class="btn btn-delete"><i class="fa fa-save"></i> 삭제	</button>
				
				</div>
			
			</div>

		</div>
	</div>
	
	<!-- autocomplete from jQuery Ui -->
    <script src='{% static "js/jquery-1.11.3.min.js" %}'></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<script type="text/javascript">
	
	
		$(document).ready(function() {
			
			const formObj=$("form[role='form']");
			
			$(".btn-list").on("click", function(){
				formObj.attr("method","get");
				formObj.attr("action","list");
				formObj.submit();
			});
			
			$(".btn-modify").on("click", function(){
				formObj.attr("method","get");
				formObj.attr("action","modify");
				formObj.submit();
			});
			
			$(".btn-delete").on("click", function(){
				formObj.attr("action","delete");
				formObj.submit();
			});
		});
	
	</script>
</body>
</html>