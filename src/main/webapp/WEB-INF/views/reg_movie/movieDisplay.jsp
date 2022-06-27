<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("utf-8");
	String u_id = (String)session.getAttribute("u_id");
	String u_auth = (String)session.getAttribute("u_auth");
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
    <!-- <meta id="ctl00_og_image" property="og:image" content="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000085/85829/85829_185.jpg"></meta> -->
    <link rel="alternate" href="http://m.cgv.co.kr" />
   <!--  <link rel="shortcut icon" href="https://img.cgv.co.kr/theater_img/favicon.ico" type="image/x-icon" /> -->
    <title id="ctl00_headerTitle">${movie.m_title}&lt;</title>
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/webfont.css" />
    <!-- <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/reset.css" /> -->
    <!-- <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/layout.css" /> -->
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/module.css?20211209" />
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/content.css" />
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/common.css" />
    
    <link rel="stylesheet" type="text/css" href="https://img.cgv.co.kr/R2014/js/jquery.ui/smoothness/jquery-ui-1.10.4.custom.min.css" />
    
    <script type="text/javascript" src="/common/js/extraTheaters.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/app.config.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.tmpl.min.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.validate.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.paging.min.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.ui/jquery-ui-1.10.4.custom.min.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.utils.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/app.utils.js"></script>
	<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.utils.pageing.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/app.init.js"></script>

    <!-- [if lte IE 9]><script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.placeholder.js"></script><![endif] -->
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.dotdotdot.min.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/silverlight_link.js"></script>
	<script src="https://img.cgv.co.kr/R2014/js/slick/slick.js" type="text/javascript" charset="utf-8"></script>

    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/phototicket/phototicket.css" />
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/slick.css" />
	<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/slick-theme-custom.css" />

    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/icheck/login.timer.js"></script>
    <script src="https://img.cgv.co.kr/R2014/js/icheck/icheck.min.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" type="text/css" href="https://img.cgv.co.kr/R2014/js/icheck/iCheck.css" />
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
    </script> <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js">
    </script> <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap-5.1.3-dist/css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="../fontstyle/fontello-4581031e/css/fontello.css">
    <link rel="stylesheet" href="../css/jquery.bxslider.css">


<html>
<meta charset="EUC-KR">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(".pageInfo a").on("click", function(e) {
    e.preventDefault();
    moveForm.find("input[name='pageNum']").val($(this).attr("href"));
    moveForm.attr("action", "/movieDisplay");
    moveForm.submit();
})
</script>
<script type="text/javascript">
function searchCheck1() {

	     	if (!document.getElementById('search').value) {
	     		alert("검색할 내용을 입력해주세요.");
	     		history.back();
			} else {
				document.search_frm.submit();
			}
	      }
</script>
</head>
<body>
<jsp:include page="../main/mainHeader.jsp" flush="false"></jsp:include>	

	<!-- Contaniner -->
	<div id="container" style="display: inline-block; margin-left: 300px; width: 1300px;"><!-- 벽돌 배경이미지 사용 시 class="bg-bricks" 적용 / 배경이미지가 없을 경우 class 삭제  -->
        

		<!-- Contents Area -->
		 <div id="contents" class="">
        
            
            <!-- Contents Start -->
			

<!-- 실컨텐츠 시작 -->
<div class="wrap-movie-detail" id="select_main">

    
<!--
<div class="tit-heading-wrap">
    <h3>영화상세</h3>
</div>
    //-->
<div class="sect-base-movie">
    <h3><strong>${movie.m_title}</strong>기본정보</h3>
    <div class="box-image">
            <span class="thumb-image"> 
                <img src="${pageContext.request.contextPath}/resources/${movie.m_position}" alt="브로커 포스터 새창" onerror="errorImage(this)"/>
            </span> 
        </a> 
    </div>
    <div class="box-contents">
        <div class="title"> 
            <strong>${movie.m_title}</strong>
            
            <em class="round brown"><span>예매중</span></em>
            <em class="round red"><span>D-6</span></em>
            <p>Broker</p>
        </div>
        <div class="score"> 
            <strong class="percent">예매율&nbsp;<span>10.9%</span></strong>
        </div>
        <!-- 떨어지는 얘 이전 요소에 class=on을 넣는다 -->
        <div class="spec">
            <dl>
                <dt>감독 :&nbsp;</dt>
                <dd>
                        <span>${movie.m_director}</span>                    
                </dd>
                <dt>&nbsp;/ 배우 :&nbsp;</dt>
                <dd class="on">
                        <span>${movie.m_actor}</span>                    
                </dd>
                <dt>장르 :&nbsp;${movie.m_genre}</dt> 
                <dd></dd>
                <dt>&nbsp;/ 기본 :&nbsp;</dt>
                <dd class="on">${movie.m_grade}세 이상, ${movie.m_time}분, ${movie.m_intro}</dd>
                <dt>개봉 :&nbsp;</dt>
                <dd class="on">${movie.m_date}</dd>
            </dl>
        </div>
        <span class="screentype">
        
        </span>

        <span class="like">
        <a class="link-reservation" href="/team/reservation?m_code=${movie.m_code}">예매</a>
        
        </span>

    </div>
</div><!-- .sect-base -->



    <div class="cols-content" id="menu">
        <div class="col-detail">
            <!-- 메뉴가 선택되면 a 에 title="선택" 이라고 넣는다 -->
            <div class="sect-story-movie">
             <pre>${movie.m_detail}</pre>
            </div>
            
       
            
            <div id="ctl00_PlaceHolderContent_Section_Still_Cut" class="sect-stillcut">
                <div class="heading">
                    <h4>스틸컷</h4><span class="count"><strong id="stillcut_current"></strong></span>
                    
                </div>
                <div class="">
                           <c:forEach items="${dtoList}" var="dto">
		                        <div class="item-wrap">
		                            <div class="item">
		                                <img src="${pageContext.request.contextPath}/resources/${dto.m_pics}" onerror="errorImage(this)" />
		                            </div>
		                        </div>
                           </c:forEach>
                        
                </div>
            </div><!-- .sect-stillcut -->
         
    
            <div class="sect-grade">   
                <!-- preegg.css 연관 UI -->
                <div class="real-rating">
                    <p class="desc"><span> 영화 리뷰는 마이페이지의 구매한 영화 목록에서 쓰실 수 있습니다.</span></p>
                </div>

            </div><!-- .sect-grade -->
                      
 

             
            
           
        </div><!-- .col-detail -->
        
            <div id="content_area">
	<div id="content_area">
		<div id="boardArea">
			<table class="table" cellspacing="0">
				<tr height="25">
					<td width="40" align="center">No.</td>
					<td width="300" align="left">리뷰한 영화</td>
					<td width="120" align="center">작성자</td>
					<td width="130" align="center">작성일</td>
					<td width="60" align="center">추천</td>
					<td width="80" align="center">추천수</td>
				</tr>
				<c:set var="num" value="${pageMaker.total - ((pageMaker.cri.pageNum - 1) * 10)}"></c:set>
				<c:forEach items="${list}" var="dto">
					<tr align="center">
						<td>${num}</td>
						<td align="left">${dto.m_title}</td>
						<td>${dto.u_id}</td>
						<td><fmt:formatDate pattern="yyyy/MM/dd" value="${dto.r_date}"/> </td>
						<td>
						<a href="reviewGood1?u_id=<%= u_id %>&r_code=${dto.r_code}&m_code=${dto.m_code}">추천</a>
						</td>
						<td>${dto.r_good}</td>
					<!-- 여기 수정해야함 분기처리 작성자랑 관리자만 수정삭제 버튼 보이게 -->
					<c:set var="admin" value="A"/>
					<c:set var="auth" value="<%= u_auth %>"/>
					<c:set var="id" value="<%= u_id %>"/>
					<c:choose>
						<c:when test="${admin eq auth}">
							<td width="60" align="center">
							<button class="btn btn-outline-secondary btn-sm" type="button" onclick="location.href='reviewModify_view1?r_code=${dto.r_code}'">수정</button>
							</td>
							<td width="60" align="center">
							<button class="btn btn-outline-secondary btn-sm" type="button" onclick="location.href='reviewDelete1?r_code=${dto.r_code}&m_code=${dto.m_code}'">삭제</button>
							</td>
						</c:when>
						<c:when test="${dto.u_id eq id}">
							<td width="60" align="center">
							<button class="btn btn-outline-secondary btn-sm" type="button" onclick="location.href='reviewModify_view1?r_code=${dto.r_code}'">수정</button>
							</td>
							<td width="60" align="center">
							<button class="btn btn-outline-secondary btn-sm" type="button" onclick="location.href='reviewDelete1?r_code=${dto.r_code}&m_code=${dto.m_code}'">삭제</button>
							</td>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
					</tr>
					<tr>
						<td height="40">
						</td>
						<td colspan="5">
							${dto.r_name}
						</td>
					</tr>
				<c:set var="num" value="${num-1 }"></c:set>
				</c:forEach>
			</table>

			<div class="pageInfo_wrap" align="center">
				<div class="pageInfo_area">
					<ul id="pageInfo" class="pageInfo">
					
					    <!-- 이전페이지 버튼 -->
		                <c:if test="${pageMaker.prev}">
		                    <li class="pageInfo_btn previous"><a href="?pageNum=${pageMaker.startPage-1}">Previous</a></li>
		                </c:if>
					
						<!-- 각 번호 페이지 버튼 -->
		                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
		                    <li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="?pageNum=${num}&m_code=${movie.m_code}">${num}</a></li>
		                </c:forEach>
		                
				        <!-- 다음페이지 버튼 -->
		                <c:if test="${pageMaker.next}">
		                    <li class="pageInfo_btn next"><a href="?pageNum=${pageMaker.endPage + 1 }">Next</a></li>
		                </c:if>  
		                
					</ul>
				</div>
			</div>
			
			<form id="moveForm" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			</form>
		</div>
		<div id="writeBtn" align="right">
			<button class="btn btn-outline-secondary btn-sm" type="button" onclick="location.href='index'">메인으로</button>
		</div>
	</div>
	</div><br>
        
        

    
      


    <!-- Aside Banner :  -->
    
	<!-- <div id="ctl00_sect_person_right" class="sect-aside-banner" style="padding:0; margin:0; position:fixed; z-index:1;display:none">
		<div class="aside-content-top">
			<div class="aside-content-btm">
				<a href="/theaters/"><img src="https://img.cgv.co.kr/R2014/images/common/btn/btn_person_theater.gif" alt="CGV THEATER" /></a>
				<a href="/arthouse/"><img src="https://img.cgv.co.kr/R2014/images/common/btn/btn_person_arthouse.gif" alt="CGV arthouse" /></a>
				<a href="/theaters/special/"><img src="https://img.cgv.co.kr/R2014/images/common/btn/btn_person_special.gif" alt="CGV SPECIAL" /></a>

				<a href="/user/mycgv/reserve/" class="required-login" data-url="/user/mycgv/reserve/"><img src="https://img.cgv.co.kr/R2014/images/common/btn/btn_person_ticket.gif" alt="CGV TICKET INFO" /></a>
				<a href="/discount/discountlist.aspx"><img src="https://img.cgv.co.kr/R2014/images/common/btn/btn_person_discount.gif" alt="CGV DISCOUNT INFO" /></a>
			</div>
		</div>
		<div class="btn-top">
            <a href="#" onclick="window.scrollTo(0,0);return false;"><span>최상단으로 이동</span></a>
		</div>
	</div> -->
   
	<!-- //Aside Banner -->
    
</div>


<jsp:include page="../main/mainFooter.jsp" flush="false"></jsp:include>
</body>
</html>