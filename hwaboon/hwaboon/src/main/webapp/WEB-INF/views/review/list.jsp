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

	table {
		
		width: 50%;
		border: 1px solid #444444;
		border-collapse: collapse;
		margin-left:auto;
		margin-right:auto;
	}
	
	th, td {
		
		border: 1px solid #444444;
		padding: 6px;
	}
	
</style>

</head>
<body>
	
	<h2 align="center">리뷰 목록 페이지</h2><br><br>
	<ul>
		<li><a href="/">HOME</a></li>
		<li><a href="/review/write">Write</a></li>
	</ul>

	<table>
		<thead>
			<tr>
				<th style="width: 30px">No. </th>
				<th>제목</th>
				<th style="width: 100px">작성자</th>
				<th style="width: 150px">작성시간</th>
				<th style="width: 60px">조회수</th>
			</tr>
			</thead>
			
			
			<c:forEach var="article" items="${articles}">
			
			<tr>
				<td><c:out value="${article.reviewNo}" /></td>			
				<td align="center"><a href="<c:url value='/review/content?reviewNo=${article.reviewNo}'/>">${article.title}</a></td>			
				<td><c:out value="${article.writer}" /></td>			
				<td align="center"><fmt:formatDate pattern="yyyy.MM.dd" value="${article.regDate}" /></td>			
				<td><c:out value="${article.viewCnt}" /></td>			
			</tr>
			
			</c:forEach>

	</table>

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
	
</script>

</body>
</html>