<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<div id="reply-box">
	
	
	
</div>

<p>
# 댓글 작성자: <br> <input id="newReplyWriter" type="text" name="replyWriter"> <br>
# 댓글 내용: <br> <textarea id="newReplyText" rows="3" name="replyText"></textarea> <br>
	<br> <input id="replyAddBtn" type="button" value="댓글 작성">

</p>

<jsp:include page="../include/plugin-js.jsp"/>
<script type="text/javascript">
	
	$(document).ready(function(){
		
		
		
		let boardNo=2997; //게시글 번호
		
		/*
		# REST 방식은 클라이언트와 서버간에 JSON데이터를 주고 받기 때문에
		    서버가 전달해준 JSON데이터를 클라이언트측에서 받을 수 있어야 한다.
		# jQUERY 라이브러리가 제공하는 $.getJSON()함수를 사용하면 서버가 넘겨준 JSON데이터를 받아낼 수 있다.
		# getJSON()함수의 첫번째 매개값으로는 요청URI,두번쨰 매개값으로 받은 JSON데이터를 사용하는 익명함수를 정의한다.*/
		
	/* 	$.getJSON("/mvc/replies/all/"+boardNo,function(data) {
			
			for(let i=0;i<10;i++){
				console.log((i+1)+"번 댓글 내용:"+data[i].replyText)
				console.log((i+1)+"번 댓글 작성자:"+data[i].replyWriter)
				console.log("====================================")
			}
			
			let str="";
			
			$(data).each(function(){
				str +="<p>댓글 번호: "+this.replyNo
				+"번<br> 댓글 내용: "+this.replyText+ "<br>"
				+"댓글 작성자: "+this.replyWriter+"</p><hr>";
				
			});
			
			//html태그를 추가하려면 jQuery의 html()함수를 사용
			$("#reply-box").html(str);
		}); */
		
		
		//댓글 쓰기 버튼 클릭 이벤트 처리
		$("#replyAddBtn").on("click",function(){
			
			//id가 newReplyText인 요소의 값을 상수 text에 저장.
			const text=$("#newReplyText").val();
			
			//id가 newReplyWriter인 요소의 값을 상수 writer에 저장.
			const writer=$("#newReplyWriter").val();
			
			//POST요청 비동기 통신 시작
			//객체의 중괄호
			$.ajax({
				
				type: "POST", //http 요청 메서드
				url: "/mvc/replies", //요청 URI(URI는도메인 뒤에 붙는다.)
				
				headers: {
					
					"Content-type": "application/json",
					"X-HTTP-Method-Override": "POST"
				},
				
				dataType: "text", //요청이 끝난 후 리턴 값의 데이터 타입
				//서버로 전송 할 데이터
				//JSON.stringify() : 매개값으로 자바스크립트의 객체를 전달하면 JSON형식으로 파싱하여 전송한다. 
				data: JSON.stringify({
					
					boardNo: 44,
					replyText: text,
					replyWriter: writer
					
				}),
				//통신성공시 실행할 문장 작성
				//익명 함수의 매개값으로 서버가 리턴한 값이 들어온다.
				success: function(result){
					
					if(result == "regSuccess"){
						alert("댓글 등록완료");
					}
					$("#newReplyText").val(""); // 통신에 성공해 댓글이 등록되면 값을 공백으로 바꿔라
					$("#newReplyWriter").val("");
				}
			});
			
		});
		
	});
</script>

</body>
</html>