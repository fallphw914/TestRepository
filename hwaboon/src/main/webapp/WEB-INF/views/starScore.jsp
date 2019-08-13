<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
     #star_grade a{
        text-decoration: none;
        color: gray;
    }
    #star_grade a.on{
        color: red;
    }
</style>

</head>
<body>


<select id="example">
	<option value="1" selected>1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
	<option value="5">5</option>
</select>

<select id="example2">
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
	<option value="5">5</option>
</select>


 <jsp:include page="include/js.jsp" /> 
 
 <!-- bar-rating --> 
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"> 
 <link rel="stylesheet" href="/css/fontawesome-stars.css"> 
 <script type="text/javascript" src="/js/jquery.barrating.min.js"></script>

 
<script>

	var target=document.getElementById("example");
	var temp;

		$('#example').barrating({
			theme: 'fontawesome-stars',
			onSelect: function(value,text,event){
				console.log(target.options[target.selectedIndex].value);
				temp=target.options[target.selectedIndex].value;
				
				
			}
			
		});
		
		$('#example2').barrating({
			theme: 'fontawesome-stars',
			onSelect: function(value,text,event){
				console.log(target.options[target.selectedIndex].value);
				temp=target.options[target.selectedIndex].value;
				
				
			}
			
		});

		$('#example2').barrating ('set',temp);
	


</script>

</body>
</html>