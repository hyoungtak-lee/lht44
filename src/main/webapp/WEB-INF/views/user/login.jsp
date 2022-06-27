<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
.login-img img {width:10%; max-height:20%;}


.form-first {
    float: left;
    margin-left: 15%;
    width:25%;
    box-sizing: border-box;
}

.form-second{
    float: right;
    margin-right: 15%;
    width:25%;
    box-sizing: border-box;
}

</style>    
</head>
<body>
<jsp:include page="../main/mainHeader.jsp" flush="false"></jsp:include> 
	<br><br><br>
	<div class="container">
		<div class="row text-center mb-4">
			<div class="col-md-12">
			</div>
		</div>
		<div class="row text-center">
		    <div class="col-md-6 offset-md-3">
		        <div class="card">
		            <div class="card-body">
		                <div class="login-img">
		                    <img src="https://img.icons8.com/cotton/64/undefined/popcorn.png">
		                </div>
		                <div class="login-title">
		                    <h4>TEAM3_CINEMA</h4>
		                </div><br>
		                <div class="login-form mt-4">
		                <form method="post" action="login_yn">
	                        <div class="form-row">
	                            <div class="form-group col-md-12">
	                              <input id="u_id" name="u_id" placeholder="ID" class="form-control" type="text">
	                            </div>
	                            <div class="form-group col-md-12">
	                              <input type="password" class="form-control" id="u_pwd" name="u_pwd" placeholder="Password">
	                            </div>
	                          </div>
	                        <br>
	                        <div class="form-first" >
	                            <button type="submit"  class="btn btn-danger btn-block">로그인</button><br>
	                        </div>
	                        <div class="form-second">
	                            <button type="button" class="btn btn-danger btn-block" onclick="location.href='register'">회원가입</button>
	                        </div>
	                        <br>
	                    </form>
		                </div><br><br>
		                <div class="logi-forgot text-right mt-2">
		                    <a href="findId" style="text-decoration: none;">아이디 찾기 </a>
		                    <a href="findPwd" style="text-decoration: none;">| 비밀번호 찾기 </a>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
	</div>
	<br><br><br>
<jsp:include page="../main/mainFooter.jsp" flush="false"></jsp:include>	
</body>
</html>