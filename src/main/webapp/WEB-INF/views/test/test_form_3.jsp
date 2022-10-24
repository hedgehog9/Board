<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String ctxPath = request.getContextPath();
    //     /board
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	table, th, td {
		border: solid 1px gray;
		border-collapse: collapse;
	}
</style>

<script type="text/javascript" src="<%= ctxPath%>/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		
		func_ajaxselect();
		
		$("button#btnOK").click(function(){
			
			const no_val = $("input[name='no']").val();
			const name_val = $("input[name='name']").val();
			
			if( no_val.trim() == "" || name_val.trim() == "" ) {
				alert("번호와 성명 모두 입력하세요!!");
				return; // 종료
			}
			
			$.ajax({
				url:"<%= ctxPath%>/test/ajax_insert.action",
				type:"POST",
				data:{"no":no_val,
					  "name":name_val},
				dataType:"json",
				success:function(json){ // {"n":1}
				
					console.log(JSON.stringify(json));
					
					if(json.n == 1){
						func_ajaxselect();
						$("input[name='no']").val("");
						$("input[name='name']").val("");
					}
				
				},
				error: function(request, status, error){
				   alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
			});
			
		});
		
		
	}); // end of $(document).ready(function(){})-------------------------
	
	
	// Function Declaration
	function func_ajaxselect() {
		
		$.ajax({
			url:"<%= ctxPath%>/test/ajax_select.action",
			dataType:"json",
			success:function(json){
				<%-- 
				   [{"irum":"조상운","no":"105","writeday":"2022-10-19 16:42:33"},{"irum":"김성민","no":"104","writeday":"2022-10-19 16:38:05"},{"irum":"최지희","no":"103","writeday":"2022-10-19 16:09:39"},{"irum":"진혜린","no":"102","writeday":"2022-10-19 12:41:44"},{"irum":"임선우","no":"101","writeday":"2022-10-19 12:21:40"}] 
				--%>
				
				let html = "<table>"+
							  "<tr>"+
								 "<th>번호</th>"+
								 "<th>입력번호</th>"+
								 "<th>성명</th>"+
								 "<th>작성일자</th>"+
							  "</tr>";
		        
				$.each(json, function(index, item){
					html += "<tr>"+
				               "<td>"+(index+1)+"</td>"+
				               "<td>"+item.no+"</td>"+
				               "<td>"+item.irum+"</td>"+
				               "<td>"+item.writeday+"</td>"+
				            "</tr>";
				});			  
				
				html += "</table>";
		        
				$("div#view").html(html);
				
			},
			error: function(request, status, error){
			   alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});
		
	}// end of function func_ajaxselect()----------
	
</script>

</head>
<body>
	<h2>Ajax 연습</h2>
	<p>
	   안녕하세요?<br>
	   여기는  /test/test_form_3.action 페이지 입니다.
	</p>
	<br>
	    번호 : <input type="text" name="no" /><br>
	    성명 : <input type="text" name="name" /><br>
	  <button type="button" id="btnOK">확인</button>
	  <button type="button" id="btnCancel">취소</button>
	<br><br>
	 
	<div id="view"></div>  
</body>
</html>


