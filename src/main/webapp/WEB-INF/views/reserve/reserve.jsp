<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <title>영화 예매</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/css/Reservation/reserve.css" rel="stylesheet">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<% request.setCharacterEncoding("UTF-8"); %>
</head>
<body>
<div class="header">
    <div class="contents">
        <h1 class="header_title">
            <a href="/team/" class="main_index">
                <img src="https://img.icons8.com/cotton/64/undefined/popcorn.png"/>
                <span class="header_title_span">TEAM3_CINEMA</span>
            </a>
        </h1>
        <%
            String u_id = (String)session.getAttribute("u_id");
            if(u_id != null) {
        %>
        <ul class="header_login">
            <li class="header_con">
                <a href="logOut" class="header_a">
                    <img src="https://img.cgv.co.kr/R2014/images/common/ico/loginPassword.png" alt="로그인" class="cgv_img"/>
                    <span>로그아웃</span>
                </a>
            </li>
            <li class="header_con">
            	<a href="cartlist?u_id=<%=u_id%>" class="header_a">
            		<img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png" alt="장바구니" class="cgv_img" id="cart_img"/>
            		<span>장바구니</span>
            	</a>
            </li>
            <li class="header_con">
                <a href="userPage?u_id=<%=u_id%>" class="header_a">
                    <img src="https://img.cgv.co.kr/R2014/images/common/ico/loginMember.png" alt="마이페이지" class="cgv_img"/>
                    <span>마이페이지</span>
                </a>
            </li>
            <li class="header_con">
                <a href="#" class="header_a">
                    <img src="https://img.cgv.co.kr/R2014/images/common/ico/loginCustomer.png" alt="고객센터" class="cgv_img"/>
                    <span>고객센터</span>
                </a>
            </li>
        </ul>
        <%
        } else {
        %>
		<script>        
        	alert('로그인을 해주세요.');
     	    location.href="/team/";
        </script> 
        <ul class="header_login">
            <li class="header_con"><a href="logOut" class="header_a"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginPassword.png" alt="로그아웃" class="cgv_img"/><span>로그아웃</span></a></li>
            <li class="header_con"><a href="cartlist?u_id=<%=u_id%>" class="header_a"><img src="https://cdn-icons.flaticon.com/png/512/2997/premium/2997834.png?token=exp=1654572631~hmac=808157ccee560e484daf3e6b70424210" alt="장바구니" class="cgv_img" id="cart_img"/><span>장바구니</span></a></li>
            <li class="header_con"><a href="userPage?u_id=<%=u_id%>" class="header_a"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginMember.png" alt="마이페이지" class="cgv_img"/><span>마이페이지</span></a></li>
            <li class="header_con"><a href="#" class="header_a"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginCustomer.png" alt="고객센터" class="cgv_img"/><span>고객센터</span></a></li>
        </ul>
        <%
            }
        %>
    </div>
</div>
<% response.setContentType("text/html;charset=UTF-8"); %>

<form action = "seats" method="post" name="resvform" id="resvform">
    <div class="back"></div>
    <script>
    function sendData(){
        let reserveform = document.resvform;
        //let reserveform = $('resvform');
        let Mname = $('#SresultName').val(); let Mcode = $('#SresultNameCode').val();
        if (!Mname == null || !Mcode == null){
            alert("영화를 선택해주세요")
            $('#movie').focus();
        }

        let Rname = $('#SresultRegion').val(); let Rcode = $('#SresultRegionCode').val();
        if (!Rname|| !Rcode){
            alert("지역을 선택해주세요")
            $('#region').focus();
        }

        let Tname = $('#SresultTheater').val(); let Tcode = $('#SresultTheaterCode').val();
        if (!Tname|| !Tcode){
            alert("영화관을 선택해주세요")
            $('#regionTheater').focus();
        }

        let Sdate = $('#SresultDate').val();
        if(!Sdate){
            alert('날짜를 선택해주세요');
            $('#datepicker').focus();
        }

        let Shall = $('#SresultHall').val(); let Stime = $('#SresultTime').val();
        if (!Tname|| !Tcode){
            alert("상영관과 시간을 선택해주세요")
            $('#regionTheater').focus();
        }
        if(Mname && Mcode && Rname && Rcode && Tname && Tcode && Sdate && Shall && Stime){
            reserveform.submit();
        }
    };
    </script>
    <div class="main">
        <div class="movielist">
            <div class="movietitle">
                <h1>영화</h1>
            </div>
            <div class="moviecontent">
                <select id='movie' name='movie' size='20'>
                    <c:forEach items="${mlist}" var="mdto" varStatus="status">
                        <option value="${mdto.m_code}">${mdto.m_title}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="theaterlist">
            <div class="theatertitle">
                <h1>지역</h1>
            </div>
            <div class="theatercontent">
                <div class="lefttheatercontent">
                    <select id='region' name='region' size='9'>
                        <option value="1">서울</option>
                        <option value="2">경기</option>
                        <option value="3">인천</option>
                        <option value="4">강원</option>
                        <option value="5">대전/충청</option>
                        <option value="6">대구</option>
                        <option value="7">부산/울산</option>
                        <option value="8">경상</option>
                        <option value="9">광주/전라/제주</option>
                    </select>
                </div>
                <div class="righttheatercontent">
                    <select id='regionTheater' name='t_name' size='20'>
                    </select>
                </div>
            </div>
        </div>
<script src="${pageContext.request.contextPath}/resources/js/Reservation/theaterlist.js"/>        
        <script>
            
        </script>
        <!-- 날짜, 시간, 상영관 -->
<script src="${pageContext.request.contextPath}/resources/js/datepick.js"></script>
        <div class="timelist">
            <div class="timelisttitle">
                <h1>상영관</h1>
            </div>
            <div class="timelistdate">
                <input type="text" id="datepicker"/>
            </div>
            <div class="timelistcontent">
                <div class="hall1">
                    <input type="text" value="1관" disabled>
                    <select id="htlist1" name="htlist1" size="10">
                    </select>
                </div>
                <div class="hall2">
                    <input type="text" value="2관" disabled>
                    <select id="htlist2" name="htlist2" size="10">
                    </select>
                </div>
                <div class="hall3">
                    <input type="text" value="3관" disabled>
                    <select id="htlist3" name="htlist3" size="10">
                    </select>
                </div>
                <div class="hall4">
                    <input type="text" value="4관" disabled>
                    <select id="htlist4" name="htlist4" size="10">
                    </select>
                </div>
            </div>
            <input type="button" id="findHall" value="조회하기" onclick="ajaxt();">
        </div>
    </div>
<script src="${pageContext.request.contextPath}/resources/js/Reservation/timetable.js"/>    
    <script>
        
    </script>

    <div class="footer">
        <div class="box-result01">
            <input type="text" value="[영화 제목]" disabled><br>
            <input type="text" id="resultName" name="resultName" disabled/><br>

        </div>
        <div class="box-result02">
            <input type="text" value="[지역]" disabled><br>
            <input type="text" id="resultRegion" name="resultRegion" disabled/><br>
            <input type="text" value="[극장]" disabled><br>
            <input type="text" id="resultTheater" name="resultTheater" disabled/><br>

        </div>
        <div class="box-result03">
            <input type="text" value="[날짜]" disabled><br>
            <input type="text" id="resultDate" name="resultDate" disabled/><br>
            <input type="text" value="[상영관]" disabled><br>
            <input type="text" id="resultHall" name="resultHall" disabled/><br>
            <input type="text" value="[시간]" disabled><br>
            <input type="text" id="resultTime" name="resultTime" disabled/>
        </div>
        <input type="button" class="btn-result" value="좌석 선택" onclick="sendData();">
    </div>
<script src="${pageContext.request.contextPath}/resources/js/Reservation/dateValidation.js"/>    
    <script>
        
    </script>
<script src="${pageContext.request.contextPath}/resources/js/Reservation/check.js"/>    
    <script>
        
    </script>
    <div>
        <input type="hidden" id="SresultName" name="SresultName"/>
        <input type="hidden" id="SresultNameCode" name="SresultNameCode"/>

        <input type="hidden" id="SresultRegion" name="SresultRegion"/><br>
        <input type="hidden" name="SresultRegionCode" id="SresultRegionCode"><br>

        <input type="hidden" id="SresultTheater" name="SresultTheater"/><br>
        <input type="hidden" name="SresultTheaterCode" id="SresultTheaterCode">

        <input type="hidden" id="SresultDate" name="SresultDate" /><br>
        <input type="hidden" id="SresultHall" name="SresultHall" /><br>
        <input type="hidden" id="SresultTime" name="SresultTime" />
    </div>
</form>
</body>
</html>
