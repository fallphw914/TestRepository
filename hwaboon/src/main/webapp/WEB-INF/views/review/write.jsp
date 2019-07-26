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
	border: 1px solid #040404;
	position: absolute;
	width: 500px;
	height: 500px;
	left: 50%;
	top: 50%;
	transform:translate(-50%, -50%)
}

</style>
</head>
<body>

	<h2>write 페이지</h2>
	<div class="wraper">
		<form role="form" id="writeform" method="POST" action="<c:url value='/review/write'/>">
			<div>
			
				<div>
					<label for="title">제목</label><br>
					<input class="form-control" id="title" name="title" placeholder="제목을 입력해주세요">
				</div>
				
				<div>
					<label for="writer">작성자</label><br>
					<input class="form-control" id="writer" name="writer">
				</div>
				
				<div>
					<label for="content">내용</label><br>
					<textarea class="form-control" id="content" name="content"
						rows="15" placeholder="내용을 입력해주세요" style="resize: none;"></textarea>
				</div>

			</div>
		
			<div>
				<button type="submit" class="btn btn-success">
					<i class="fa fa-save"></i> 입력
				</button>
			</div>

		</form>
</div>
	

</body>
</html>