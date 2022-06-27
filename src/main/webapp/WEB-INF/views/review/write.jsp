<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script type="text/javascript" charset="UTF-8">
	function check_ok() {
		if (document.review_form.r_rate.value.length == 0) {
			alert("평점을 입력하세요.");
			review_form.r_rate.focus();
			return;
		}

		if (document.review_form.r_name.value.length == 0) {
			alert("리뷰내용을 입력하세요.");
			review_form.r_name.focus();
			return;
		}
		
		document.review_form.submit();
	}

</script>
<style type="text/css">
        #content_area
    {
        margin: 5px 250px 0px 250px;
    }
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="../main/mainHeader.jsp" flush="false"></jsp:include>
	<div id="content_area">
	<div id="content_area">
		<div id="title">
			<h3>리뷰글 작성</h3>
		</div>
		<form name="review_form" method="post" action="reviewWrite">
		<input type="hidden" name="b_code" value="${book}">  <!-- 마이페이지에서 받은 예매코드 정보 -->
		<input type="hidden" name="m_code" value="${m_code}">   
		<input type="hidden" name="m_title" value="${m_title.m_title}">   
			<table class="table">
				<tr>
					<td width="100" align="center">UserID</td> <!-- 유저 아이디 input이 아니라 나중에 회원테이블에서 받아야함 -->
					<td width="150">
					<%
					String id = (String)session.getAttribute("u_id");
					%>
						<input class="form-control" type="text" name="u_id" value="<%=id%>" readonly="readonly" width="145">
					</td>
					<td width="100" align="center">평점</td>
					<td width="150">
						<select class="form-control" name="r_rate">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="center">영화제목</td>
					<td colspan="3">${m_title.m_title}</td>
				</tr>
				<tr>
					<td colspan="4">
					<textarea class="form-control" rows="3" cols="50" name="r_name" placeholder="리뷰내용"></textarea>
					<!-- <input type="text" name="r_name" width="495"> -->
					</td>
				</tr>
				<tr height="50" align="right">
					<td colspan="4">
						<input class="btn btn-outline-secondary btn-sm" type="button" onclick="check_ok()" value="작성완료">&nbsp;
						<input class="btn btn-outline-secondary btn-sm" type="reset" value="다시작성">&nbsp;
						<input class="btn btn-outline-secondary btn-sm" type="button" value="리뷰목록" onclick="location.href='reviewList'">
					</td>				
				</tr>
			</table>
		</form>
	</div>
	</div>
	<jsp:include page="../main/mainFooter.jsp" flush="false"></jsp:include>
</body>
</html>