<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
.login-img img {width:10%; max-height:20%;}

.form-second{
    border: 1px solid green;
    float: right;
    margin-right: 10%;
    width:20%;
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
		                <form method="post" action="findPwdOk">
	                        <div class="form-row">
	                            <div align="left" class="form-group col-md-12">
	                            	등록하신 아이디를 입력해 주세요.
	                              <input id="u_id" name="u_id" placeholder="ID" class="form-control" type="text">
	                            </div>
	                            
	                            <div align="left" class="form-group col-md-12">
	                            	등록하신 이메일 주소를 입력해 주세요.
	                              <input type="text" class="form-control" id="u_email" name="u_email" placeholder="E-mail을 입력하세요">
	                            </div>
	                          </div><br>
	                       
	                        <div class="form-second">
	                            <button type="submit"  class="btn btn-danger btn-block">확인</button><br>
	                        </div>
	                       
	                    </form>
		                </div><br><br>
		                <div class="logi-forgot text-right mt-2">
		                   <p style="font-size: 13px; font-family: Malgun Gothic,돋움; margin-top: 25px;">아이디가 기억나지 않으세요? <a href="findId">아이디 찾기 바로가기</a></p>
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