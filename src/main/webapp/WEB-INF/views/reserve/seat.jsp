<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>좌석 선택</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/css/seats.css" rel="stylesheet">
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
    <% request.setCharacterEncoding("UTF-8"); %>
</head>
<body>
<% response.setContentType("text/html;charset=UTF-8"); %>
<div class="background"></div>
<div class="wrapper">
    <div class="wrapper-middle">
        <div class="wrapper-left">
            <div class="box-info">
                <div class="box-pic"></div>
                <div class="box-reserve-info">
                    <input type="hidden" id="mRegion" value="${ReserveDetail.theaterName}">
                    <input type="hidden" id="mhall" value="${ReserveDetail.hall}">
                    <input type="hidden" id="mdate" value="${ReserveDetail.date}">
                    <input type="hidden" id="mtime" value="${ReserveDetail.time}">
                    <input type="hidden" id="mMcode" value="${ReserveDetail.mcode}">
                    <input type="hidden" id="mName" value="${ReserveDetail.movieName}">
                    <input type="hidden" id="mtcode" value="${ReserveDetail.t_code}">
                    <input type="hidden" id="bookedSeats" value="${booked}">
                    <table class="table-info">
                        <tr>
                            <td>제목</td>
                            <td colspan="2">${ReserveDetail.movieName}</td>
                        </tr>
                        <tr>
                            <td>일자</td>
                            <td colspan="2">${ReserveDetail.date}</td>
                        </tr>
                        <tr>
                            <td>시간</td>
                            <td>${ReserveDetail.time}</td>
                            <td>${rst}</td>
                        </tr>
                        <tr>
                            <td>영화관</td>
                            <td colspan="2">${ReserveDetail.regionName} | ${ReserveDetail.theaterName}</td>
                        </tr>
                        <tr>
                            <td>상영관</td>
                            <td colspan="2">${ReserveDetail.hall}</td>
                        </tr>
                    </table>
                </div>
            </div>
            <%
                String id = (String) session.getAttribute("u_id");
            %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/Seat/seatSelect.js"/>
             <script>
            </script>
            <div class="box-payinfo">
                <div class="box-pay-num">
                    <div class="box-teen-num">
                        <h2>청소년</h2>
                        <input type="text" id="teenNum" disabled/>
                        <input type="hidden" id="userId" value="<%=id%>"/>
                    </div>
                    <div class="box-adult-num">
                        <h2>성인</h2>
                        <input type="text" id="adultNum" disabled/>
                    </div>
                    <div class="box-total-num">
                        <h2>총 인원</h2>
                        <input type="text" id="totalNum" disabled/>
                    </div>
                </div>
                <div class="box-pay-select">
                    <div class="box-pay-teen">
                        <input type="text" value="청소년" disabled><br>
                        <select id="teenPrice" name="teenPrice" size="4" onchange="chanfunc();">
                            <option value="0">0</option>
                            <option value="${pList[0]}">1</option>
                            <option value="${pList[0]*2}">2</option>
                            <option value="${pList[0]*3}">3</option>
                            <option value="${pList[0]*4}">4</option>
                        </select>
                    </div>
                    <div class="box-pay-adult">
                        <input type="text" value="성인" disabled><br>
                        <select id="adultPrice" name="adultPrice" size="5" onchange="chanfunc();">
                            <option value="0">0</option>
                            <option value="${pList[1]}">1</option>
                            <option value="${pList[1]*2}">2</option>
                            <option value="${pList[1]*3}">3</option>
                            <option value="${pList[1]*4}">4</option>
                        </select>
                    </div>
                </div>
            </div>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/Seat/seatAjax.js"/>
            <script>
                
            </script>
            <div class="box-pay">
                <div class="box-pay-info">
                    <table>
                        <tr>
                            <td>청소년</td>
                            <td><input type="text" id="tPrice" disabled>원</td>
                            <input type="hidden" id="htprice">
                        </tr>
                        <tr>
                            <td>성인</td>
                            <td><input type="text" id="aPrice" disabled>원</td>
                            <input type="hidden" id="haprice">
                        </tr>
                    </table>
                    <h2>총 가격</h2>
                    <input type="text" id="totalPrice" disabled>
                    <input type="hidden" id="htotalprice">
                </div>
                <input type="button" class="btn-pay" id="reserveBtn" value="결제하기"/>
            </div>
        </div>
        <div class="wrapper-right">
            <div class="mainScreen">
                <h1>SCREEN</h1>
            </div>
            <div id="seatcase">
                <input type="hidden" class="bookedSeatList" id="bookedSeatList" value="${booked}" name="${booked}">
                    <c:set var="bookedSeat" value="${booked}"/>
                <c:forEach items="${sInfo}" var="sData" varStatus="status">
                    <input type="checkbox" class="hseat" id="${sData.se_code}" name ="hseat" value="${sData.se_code}">
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<div>
</div>
</body>
</html>
