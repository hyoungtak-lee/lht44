<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%
				String u_id = (String)session.getAttribute("u_id");
	        System.out.println("u_id"+u_id);
	        	if(u_id == null) {
	        		%>
	        		<script>
	        			alert("로그인해주세요.");
	        			location.href="login";
	        			
	        		</script>
	        		<%
	        	}
			%>
			
<title>Insert title here</title>
<style>
*{
	/* font-family: "Nanum Gothic","Malgun Gothic","맑은 고딕","돋움","Dotum","Apple Gothic","Apple SD Gothic Neo",sans-serif; */
	font-family: 'Noto Sans KR', 'CJONLYONENEW', '맑은 고딕', '돋움', Dotum, sans-serif;
}
.mypage{
	margin:auto;
	min-width : 1120px;	
	max-width : 1400px;	
}
.userMovie{
	clear:both;
	margin:auto;
	min-width : 1120px;	
	max-width : 1400px;	
}
.userMovie1{
	margin-top: 50px;
}
.userMovie img{
	width: 80px;
	height: 80px;
}
.td{
	font-size: 13px;
	font-weight: 400px;
	line-height: 15.6px;
}
.lists{
	font-size: 17px;
	font-weight: 500px;
	line-height: 34px;
}
</style>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  <script type="text/javascript">	
		function del_Ok(){
			
			var pwd = prompt("비밀번호를 입력하세요.");
			 var u_pwd = ${user.u_pwd};
			 var u_id = "<%=u_id%>";
			 if(pwd == u_pwd){ 			 	
			 	if(confirm("정말 탈퇴 하시겠습니까?") == true){
					location.href = "delete?u_id="+u_id;
				}
			 } else {
					alert("비밀번호가 맞지 않습니다.");
				}
		 }
		
	</script>
<body>
	<jsp:include page="../main/mainHeader.jsp" flush="false"></jsp:include>
	
	
	
<div class="media mypage" style="font-size: 12px;">
<img class="mr-3" src="https://jaylog.co/wp-content/uploads/2017/12/noimg.png" alt="NO IMG"
       style="width: 150px; height: 150px; border: 1px solid black; float: left;
  								margin-right: 25px;">
  <div class="media-body">
  		<div class="div1 divs" style="width: 100%-170px;  margin-left: 170px; border-bottom: 1px solid rgba(0, 0, 0, 0.09);">
		    <div> <span style="font-size: 29px;"> ${user.u_name}</span></div>
	    </div>
	  
	   
    	<div class="div1 divs" >
		    <div> <span style="font-size: 20px;"><%=u_id%></span>  </div>
	    </div>
		    <div style="width: 100%-170px;  margin-left: 170px; border-bottom: 1px solid rgba(0, 0, 0, 0.09);"></div>
		<div class="div2 divs">
		    <div><span style="font-size: 20px;">등급:${user.u_auth}</span></div>
	    </div>
	   
	    <div class="div2 divs">
			<div>
				<a href="editUser?u_id=<%=u_id%>">회원정보수정 </a><span></span>&nbsp;/&nbsp;
				<a href="#" onclick="del_Ok();">회원탈퇴
			</a></div>
	    </div>
  </div>
</div>
<div class="userMovie" style="font-size: 12px;">
	<table class="table table-hover userMovie1" id="table_cus">
		  <thead>
		    <tr class="lists">
	    		<th width="120">myBookList</th>
				<td width="230">예매코드</td>
				<td width="230">영화코드</td>
				<td width="230">구매한 좌석</td>
				<td width="230">구매가격</td>
				<td width="230">구매날짜</td>
				<td>리뷰쓰기</td>
		    </tr>
		  </thead>
	  <tbody>
	  	<c:forEach items="${myBookList}" var="myBookList">
				<tr>
					<th></th>
					<td>${myBookList.b_code}</td>
					<td>${myBookList.m_code}</td>
					<td>${myBookList.se_code}</td>
					<td>${myBookList.totalPrice}</td>
					<td>${myBookList.b_date}</td>
					<td><input type="button" value="리뷰쓰기" onclick="location.href='reviewWrite_view?b_code=${myBookList.b_code}&m_code=${myBookList.m_code}'"></input></td>
				</tr>
		</c:forEach>
	   </tbody>
	</table>
</div>
<div class="userMovie" style="font-size: 12px;">
	<table class="table table-hover userMovie1" id="table_cus">
		  <thead>
		    <tr class="lists">
	    		<th width="120">myReviewList</th>
				<td width="230">리뷰코드</td>
				<td width="690">리뷰한 영화</td>
				<td width="230">작성일</td>
				<td>추천수</td>
		    </tr>
		  </thead>
	  <tbody>
	  	<c:forEach items="${myReviewList}" var="myReviewList">
				<tr>
					<th></th>
					<td>${myReviewList.r_code}</td>
					<td>${myReviewList.m_title}</td>
					<td><fmt:formatDate pattern="yyyy/MM/dd" value="${myReviewList.r_date}"/></td>
					<td>${myReviewList.r_good}</td>
				</tr>
				<tr>
					<td colspan="1">리뷰 내용</td>
					<td colspan="4">d</td>
				</tr>
		</c:forEach>
	   </tbody>
	</table>
</div>
<div class="userMovie" style="font-size: 12px;">
	<table class="table table-hover userMovie1" id="table_cus">
		  <thead>
		    <tr class="lists">
    			<th width="120">myQnaList</th>
				<td width="230">문의유형</td>
				<td width="690">제목</td>
				<td>등록일</td>
		    </tr>
		  </thead>
	  <tbody>
	  	<c:forEach items="${myQnaList}" var="myQnaList">
				<tr>
					<td></td>
					<td>${myQnaList.q_category}</td>
					<td>${myQnaList.q_title}</td>
					<td><fmt:formatDate pattern="yyyy/MM/dd" value="${myQnaList.q_date}"/></td>
				</tr>
		</c:forEach>
	   </tbody>
	</table>
</div>
	<div class="userMovie" style="font-size: 12px;">
	<table class="table table-hover userMovie1" id="table_cus">
		  <thead>
		    <tr class="lists">
	    		<th width="120">구매상품</th>
				<td width="230">상품번호</td>
				<td width="690">상품명</td>
			 	<td width="230">상품가격</td>
			 	<td>상품수</td>
		    </tr>
		  </thead>
	  <tbody>
	  <c:forEach items="${mygoodsList}" var="mygoodsList">
				<tr>
					<td></td>
					<td>${mygoodsList.g_code}</td>
					<td>${mygoodsList.g_name}</td>
					<td>${mygoodsList.g_price}</td>
					<td>${mygoodsList.c_amount}</td>
				</tr>
		</c:forEach>
	   </tbody>
	</table>
</div>
	
	
<%-- <div class="userMovie" style="font-size: 12px;">
	<table class="table table-hover userMovie1" id="table_cus">
		  <thead>
		    <tr class="lists">
	    		<th>�대━酉�</th>
				<td>�대━酉곕���</td>
			 	
		    </tr>
		  </thead>
	  <tbody>
	 <c:forEach items="${myReviewList}" var="myReviewList">
				<tr>
					<td>${myReviewList.r_code}</td>
				</tr>
		</c:forEach>
	   </tbody>
	</table>
</div>
	 --%>
	
	
	<jsp:include page="../main/mainFooter.jsp" flush="false"></jsp:include>
</body>
</html>