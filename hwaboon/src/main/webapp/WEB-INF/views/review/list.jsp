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
		border-top: 1px solid #D8D8D8;
		border-collapse: collapse;
		margin-left:auto;
		margin-right:auto;
	}
	
	th, td {
		
		border-bottom: 1px solid #A4A4A4;
		padding: 6px;
	}
	
	li{
	list-style-type: none;
	display:inline;
	marigin-left: 30px;
	
	}
	
	.footer{
		
		margin-top:30px;

	}
	
</style>

</head>
<body>
	
	

<div class="wrap">

<div class="head">
	<h2 align="center">리뷰 목록 페이지</h2><br><br>
		<ul>
			<li><a href="/">HOME</a></li>
			<li><a href="/review/write">Write</a></li>
	</ul>
</div>

<div class="body">
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
				<td align="center"><a href="<c:url value='/review/content?reviewNo=${article.reviewNo}&page=${pageCreator.criteria.page}'/>">${article.title}</a></td>			
				<td><c:out value="${article.writer}" /></td>			
				<td align="center"><fmt:formatDate pattern="yyyy.MM.dd" value="${article.regDate}" /></td>			
				<td><c:out value="${article.viewCnt}" /></td>			
			</tr>
			
			</c:forEach>

 	 </table>
	
 </div>
	<div class="footer" style="text-align: center">
		<ul class="pagination">
			<c:if test="${pageCreator.prev}">
				<li><a href="<c:url value='/review/list?page=${pageCreator.beginPage - 1}'/>">이전</a></li>
			</c:if>
			<c:forEach var="idx" begin="${pageCreator.beginPage}" end="${pageCreator.endPage}">
				<li <c:out value="${pageCreator.criteria.page == idx ? 'class=active' : ''}"/>><a href="<c:url value='/review/list?page=${idx}'/>">${idx}</a></li>
			</c:forEach>
			
			<c:if test="${pageCreator.next}">
				<li><a href="<c:url value='/review/list?page=${pageCreator.endPage + 1}'/>">다음</a></li>			
			</c:if>
		</ul>
	</div>	
	
</div>
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