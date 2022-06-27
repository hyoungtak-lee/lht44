<%@page import="com.javalec.team.dto.UserDto"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"> 
<!-- <link rel="stylesheet" href="../fontstyle/fontello-4581031e/css/fontello.css"> -->
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/webfont.css" /> 
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
		// 도로명 주소 찾기 API 수정 
		function goPopup(){
			 new daum.Postcode({
			        oncomplete: function(data) {
			            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
			            
			        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var addr = ''; // 주소 변수
		                var extraAddr = ''; // 참고항목 변수
		 
		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }
		 
		                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		                if(data.userSelectedType === 'R'){
		                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있고, 공동주택일 경우 추가한다.
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                    if(extraAddr !== ''){
		                        extraAddr = ' (' + extraAddr + ')';
		                    }
							// 주소변수 문자열과 참고항목 문자열 합치기
		                    addr += extraAddr;
		                    
		                } else {
		                	addr += ' ';
		                }
		 
		             // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('u_addr1').value = data.zonecode;
		                document.getElementById("u_addr2").value = addr;	
		             // 커서를 상세주소 필드로 이동한다.
		                document.getElementById("u_addr3").focus();
			        }
			    }).open();
									 
		}
		
		
		
		// 필수입력값 및 패스워드 체크
		function check_ok(){
			
			if(reg_frm.u_id.value.length == 0){
				alert("아이디를 써주세요.");
				reg_frm.u_id.focus();
				return;
			}
			
		 	if(reg_frm.u_pwd.value.length == 0){
				alert("패스워드는 반드시 입력해야 합니다.");
				reg_frm.u_pwd.focus();
				return;
			}	
			
			if(reg_frm.u_pwd.value != reg_frm.pwd_check.value){
				alert("패스워드가 일치하지 않습니다.");
				reg_frm.pwd_check.focus();
				return;
			}	
			
			if(reg_frm.u_name.value.length == 0){
				alert("이름을 써주세요.");
				reg_frm.u_name.focus();
				return;
			}
			
			if(reg_frm.u_email.value.length == 0){
				alert("Email을 입력해 주세요.");
				reg_frm.u_email.focus();
				return;
			}
											
			
			if(reg_frm.u_tel.value.length == 0){
				alert("휴대폰 번호를 써주세요.");
				reg_frm.u_tel.focus();
				return;
			}
			
			if(reg_frm.u_addr1.value.length == 0){
				alert("우편번호를 입력해 주세요.");
				reg_frm.u_addr1.focus();
				return;
			}
			
			if(reg_frm.u_addr2.value.length == 0){
				alert("주소를 써주세요.");
				reg_frm.u_addr2.focus();
				return;
			}
			
			if(reg_frm.u_addr3.value.length == 0){
				alert("상세주소를 써주세요.");
				reg_frm.u_addr3.focus();
				return;
			}
			
			var id_RegExp = /^[a-zA-z0-9]{4,12}$/; //아이디 유효성 검사
     	  	if (!id_RegExp.test(reg_frm.u_id.value)) {
				alert("아이디는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
				reg_frm.u_id.value = "";
				reg_frm.u_id.focus();
           		return;
      		}

			var pwd_RegExp1 = /[0-9]/; // 숫자
			var pwd_RegExp2 = /[a-zA-Z]/; // 문자
			var pwd_RegExp3 = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
			if(!pwd_RegExp1.test(reg_frm.u_pwd.value) || !pwd_RegExp2.test(reg_frm.u_pwd.value) || !pwd_RegExp3.test(reg_frm.u_pwd.value) || reg_frm.u_pwd.value.length < 8) {
				alert("비밀번호는 8자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다.");
				reg_frm.user_pwd.focus();
				return;
			}
			
			var email_RegExp = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		     if(!email_RegExp.test(reg_frm.u_email.value)) {
				alert("이메일 형식이 잘못되었습니다.");
				reg_frm.u_email.focus();
				return;
		     }
		     
		     var phone_RegExp = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
		     if(!phone_RegExp.test(reg_frm.u_tel.value)) {
		         alert('휴대폰 형식이 잘못되었습니다.');
				reg_frm.u_tel.focus();
				return; 
		     } 
		   
		     
		     document.reg_frm.submit();  
		     
		}
		
	</script>

	<style type="text/css">
		/* 중복아이디 존재하지 않는경우 */
		.id_input_re_1{
			color : green;
			display : none;
		}
		/* 중복아이디 존재하는 경우 */
		.id_input_re_2{
			color : red;
			display : none;
		}
	</style>
	
	<style>
		#regidiv{
			
			margin:auto;
		   	min-width : 980px;	
			max-width : 1000px;	
			height: 600px;
			
		}
		.width_tr{
			width: 200px;
			height: 30px;
			
		}
		.title_tr{
			width: 1000px;
			height: 15px;
		 	font-weight: bold;
		 	
		 	
		}
		input.btn {
			background: black;
			color: white;
		}
		
		input.btn:hover{
			background: white;
			color: black;
			border-color: gray;
		}
		input.btn1{
			background:	silver;
			color: white;
		}
		input.btn1:hover{
			background: white;
			color: black;
			border-color: silver;
		}
		::placeholder{
			font-size: 11px;
		}
	</style>

<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../main/mainHeader.jsp" flush="false"></jsp:include>

	<table class="table" id="regidiv">
		<form name="reg_frm" method="post" action="registerOk">
			<tr class="title_tr">
				<td colspan="2" style="vertical-align : bottom; border: solid 2px white;"> 
					<div style="font-size: 35px;">REGISTER</div><br>
					<div align="right" style="font-size: 15px;">*모든 입력값은 필수사항입니다.</div>
				</td>
			</tr>
			<tr>
				<td width="80" class="width_tr" id="boderleft" style="vertical-align: middle; border-top: solid 3px #DCDCDC; background-color: #F5F5F5; font-size: 17px;">
					&nbsp;&nbsp;아이디*
				</td>
				<td style="vertical-align: middle; border-top: solid 3px #DCDCDC;" id="boderright">
  					<div>
   						<input style="width: 230px" type="text" class="form-control id_input" name="u_id" placeholder="( 4~12자 영문, 숫자 조합 )"><br>
						<span class="id_input_re_1" style="font-size: small;">사용 가능한 아이디입니다.</span>
						<span class="id_input_re_2" style="font-size: small;">아이디가 이미 존재합니다.</span>
					</div>
				</td>
			</tr>
			<tr>
				<td width="80" class="width_tr" id="boderleft" style="vertical-align: middle; border-top: solid 3px #DCDCDC; background-color: #F5F5F5; font-size: 17px;">
					&nbsp;&nbsp;비밀번호*
				</td>
				<td style="border-top: solid 3px #DCDCDC;">
				  <div>
					<input style="width: 230px" type="password" class="form-control" size="35" name="u_pwd" placeholder="( 8자리 이상 문자, 숫자, 특수문자 조합 )">
				  </div>
				</td>
			</tr>
			<tr>
				<td width="80" class="width_tr" id="boderleft" style="vertical-align: middle; border-top: solid 3px #DCDCDC; background-color: #F5F5F5; font-size: 17px;">
					&nbsp;&nbsp;비밀번호 확인*
				</td>
				<td style="border-top: solid 3px #DCDCDC;">
				  <div>
					<input type="password" style="width: 230px" class="form-control" size="35" name="pwd_check" placeholder="비밀번호를 한번 더 입력해주세요.">
				  </div>
				</td>
			</tr>
			<tr>
				<td width="80" class="width_tr" id="boderleft" style="vertical-align: middle; border-top: solid 3px #DCDCDC; background-color: #F5F5F5; font-size: 17px;">
					&nbsp;&nbsp;이   름*
				</td>
				<td style="border-top: solid 3px #DCDCDC;">
				  <div>
					<input type="text" style="width: 150px" class="form-control" size="20" name="u_name" placeholder="이름을 입력해주세요.">
				  </div>
				</td>
			</tr>
			<tr>
				<td width="80" class="width_tr" id="boderleft" style="vertical-align: middle; border-top: solid 3px #DCDCDC; background-color: #F5F5F5; font-size: 17px;">
					&nbsp;&nbsp;생년월일*
				</td>
				<td style="border-top: solid 3px #DCDCDC;">
				  <div>
					<input type="text" style="width: 150px" class="form-control" size="20" name="u_birth">
				  </div>
				</td>
			</tr>
			<tr>
				<td width="80" class="width_tr" id="boderleft" style="vertical-align: middle; border-top: solid 3px #DCDCDC; background-color: #F5F5F5; font-size: 17px;">
					&nbsp;&nbsp;이메일*
				</td>
				<td style="border-top: solid 3px #DCDCDC;">
				  <div class="form-group email-form input-group-addon" style="float:left;">
					<input type="text" style="width: 250px" class="form-control" size="30" name="u_email" id="u_email" placeholder="이메일을 입력해주세요.">
				  </div>
				  <div class="input-group-addon" style="float:left;">&nbsp;
				  	<button type="button" class="btn btn-secondary mb-3" id="mail-Check-Btn">본인인증</button>
				  </div><br><br><br>
				  <div class="mail-check-box" style="" >
				  	<input class="form-control mail-check-input" style="width: 150px" placeholder="인증번호 6자리 입력" disabled="disabled" maxlength="6">
				  </div>
				  <span id="mail-check-warn"></span>
				</td>
			</tr>
			<tr>
				<td width="80" class="width_tr" id="boderleft" style="vertical-align: middle; border-top: solid 3px #DCDCDC; background-color: #F5F5F5; font-size: 17px;">
					&nbsp;&nbsp;휴대전화*
				</td>
				<td style="border-top: solid 3px #DCDCDC;">
				  <div>
					<input type="text" style="width: 250px" class="form-control" size="20" name="u_tel" placeholder="( 하이픈'-' 포함 입력 )">
				  </div>
				</td>
			</tr>
			<tr style="border-bottom: solid 3px #DCDCDC;">
				<td width="80" class="width_tr" id="boderleft" style="vertical-align: middle; border-top: solid 3px #DCDCDC; background-color: #F5F5F5; font-size: 17px;">
					&nbsp;&nbsp;주   소*
				</td>
				<td style="border-top: solid 3px #DCDCDC;">
				  <div>
					<input type="text" style="width: 120px; float: left;" class="form-control" size="10" id="u_addr1" name="u_addr1" onclick="goPopup()" placeholder="( 우편번호 찾기 )" readonly="readonly">&nbsp;
					<input type="text" style="width: 400px; float: left;" class="form-control" size="40" id="u_addr2" name="u_addr2" readonly="readonly">
					<input type="text" style="width: 520px" class="form-control" size="40" id="u_addr3" name="u_addr3" placeholder="( 상세주소를 입력해 주세요 )" >
				  </div>
				</td>
			</tr>
			<tr>
				<td colspan="3" align="center" style="vertical-align: middle; border-bottom: none;">
					<input type="reset" class="btn btn-outline-gray btn1" value="다시입력">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" class="btn btn-outline-gray btn1" onclick="check_ok()" value="회원가입"> 
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" class="btn btn-outline-gray btn1" value="가입안함" onclick="location.href='login'">
				</td>
			</tr>
		</form>
	</table>
	
	<script type="text/javascript">
		//아이디 중복검사
		$('.id_input').on("propertychange change keyup paste input", function(){
			 	var u_id = $('.id_input').val();			// .id_input에 입력되는 값
			 	
				var data = {"u_id" : u_id}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
			
				$.ajax({
					type : "post",
					url : "checkId",
					data : data,
					success : function(data){
						if(data != 'fail'){
							$('.id_input_re_1').css("display","inline-block");
							$('.id_input_re_2').css("display", "none");	 		
						} else {
						 	$('.id_input_re_2').css("display","inline-block");
							$('.id_input_re_1').css("display", "none");				
						}   
						
					}// success 종료
					
				}); // ajax 종료	
		});// function 종료
	</script>
	
	<script type="text/javascript">
		/* $('#mail-Check-Btn').click(function() {
			const email = $('#u_email').val(); // 이메일 주소값 얻어오기!
			console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
			const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
			
			$.ajax({
				type : 'get',
				url : '<c:url value ="mailCheck?email="/>'+email, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
				success : function (data) {
					console.log("data : " +  data);
					checkInput.attr('disabled', false);
					code = data;
					alert('인증번호가 전송되었습니다.')
				}			
			}); // end ajax
		}); // end send eamil */
		
		
		$('#mail-Check-Btn').click(function() {
			const email = $('#u_email').val(); // 이메일 주소값 얻어오기!
			console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
			const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
			
			
			
			$.ajax({
				type : 'get',
				//url : '<c:url value ="mailCheck?email="/>'+email, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
				url : "mailCheck",
				data : {"email" : email},
				success : function (data) {
					if(reg_frm.u_email.value.length == 0){
						alert("Email을 입력해 주세요.");
						reg_frm.u_email.focus();
						return;
					} else{
					console.log("data : " +  data);
					checkInput.attr('disabled', false);
					code = data;
					alert('인증번호가 전송되었습니다.')
					}
					
				}			
			}); // end ajax
		}); // end send eamil
		
		// 인증번호 비교 
		// blur -> focus가 벗어나는 경우 발생
		$('.mail-check-input').blur(function () {
			const inputCode = $(this).val();
			const $resultMsg = $('#mail-check-warn');
			
			if(inputCode === code){
				$resultMsg.html('<p style="font-size: x-small;">인증번호가 일치합니다.</p>');
				$resultMsg.css('color','green');
				$('#mail-Check-Btn').attr('disabled',true);
				$('#u_email').attr('readonly',true);
				$('#u_email').attr('onFocus', 'this.initialSelect = this.selectedIndex');
		         $('#u_email').attr('onChange', 'this.selectedIndex = this.initialSelect');
			}else{
				$resultMsg.html('<p style="font-size: x-small;">인증번호가 불일치 합니다. 다시 확인해주세요!</p>');
				$resultMsg.css('color','red');
			}
		});
	</script>
	
	<jsp:include page="../main/mainFooter.jsp" flush="false"></jsp:include>
</body>
</html>