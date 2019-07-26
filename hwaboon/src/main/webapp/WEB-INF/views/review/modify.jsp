<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<h2>modify 페이지</h2>

<div class="wraper">
	<div>
		<form role="form" method="POST">
					<input type="hidden" name="reviewNo" value="${article.reviewNo}">
			
				<div>
					<label for="title">제목</label><br>
					<input class="form-control" id="title" name="title" placeholder="제목을 입력해주세요" value="${article.title}">
				</div>
				
				<div>
					<label for="writer">작성자</label><br>
					<input class="form-control" id="writer" name="writer" value="${article.writer}" readonly>
				</div>
				
				<div>
					<label for="content">내용</label><br>
					<textarea class="form-control" id="content" name="content"
						rows="15" placeholder="내용을 입력해주세요" style="resize: none;">${article.content}</textarea>
				</div>

		
			
			
					
					
					<div>
						<button type="submit" class="btn btn-mod"><i class="fa fa-save"></i> 수정 완료	</button>
						<button type="submit" class="btn btn-cancel"><i class="fa fa-save"></i> 취소	</button>
					</div>
				</form>			
			</div>
		</div>
		


<!-- autocomplete from jQuery Ui -->
    <script src='{% static "js/jquery-1.11.3.min.js" %}'></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
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