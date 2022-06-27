<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
     <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/layout.css" /> 
    
  <!--    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/webfont.css" />
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/reset.css" />
     -->
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/module.css?20211209" />
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/content.css" />
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/common.css" /> 
   
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/eggupdate.css" />
    <link rel="stylesheet" media="print" type="text/css" href="https://img.cgv.co.kr/R2014/css/print.css" />    
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

    <!--[if lte IE 9]><script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.placeholder.js"></script><![endif]-->
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.dotdotdot.min.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/silverlight_link.js"></script>
	<script src="https://img.cgv.co.kr/R2014/js/slick/slick.js" type="text/javascript" charset="utf-8"></script>

    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/phototicket/phototicket.css" />
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/slick.css" />
	<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/slick-theme-custom.css" />

    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/icheck/login.timer.js"></script>
    <script src="https://img.cgv.co.kr/R2014/js/icheck/icheck.min.js" type="text/javascript" charset="utf-8"></script>
    
    
    <link rel="stylesheet" type="text/css" href="https://img.cgv.co.kr/R2014/js/icheck/iCheck.css" />

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.wrap-movie-chart {
        margin: 5px 250px 0px 250px;
	}
	
	#rank_color {
		background-color: #333333;
	}
	.movie_list_ol {
		list-style: none;
	}
	.movie_list_li {
		margin: 0px 25px 50px 25px;
	}
	
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script>
    
		// 페이지 호출하자마자 위의 제이쿼리 실행
		$(document).ready(function(){
			var sorted = $(".sort_name").val();
			
			if (sorted.length==0) {
				sorted = "최신순";
			}
			
			$('#order_type').val(sorted).trigger('change');
		});
    </script>
</head>
<body>
<jsp:include page="mainHeader.jsp" flush="false"></jsp:include> 
<div class="wrap-movie-chart">
        <!-- Heading Map Multi -->
        <div class="tit-heading-wrap" style="border: none">
            <h3 >${name }</h3>
        </div>
        
        <div class="sect-movie-chart">
            <ol class="movie_list_ol">
            
        <c:forEach items="${list }" var="dto" varStatus="status">
                <li class="movie_list_li" onclick = "location.href='goodsDisplay?g_code=${dto.g_code}'"> 
                    <div class="box-image" >
                        <a href="#">
                            <span class="thumb-image">
                                <img src='${pageContext.request.contextPath}/resources/${dto.img_1}'/>
                            </span>
                            
                        </a>
                    </div>
                    
                    <div class="box-contents">
                        <strong class="title">${dto.g_name }</strong>

                        <div class="score">
                            <strong class="percent">${dto.g_price }원</strong>
                        </div>
                    </div>    
                </li>
		</c:forEach>
                
                
			</ol>
		</div>

<!-- 0607 제이쿼리 실행시키기 위해 - 근지 -->
<input type="hidden" class="sort_name" value="${sort_name }">

<jsp:include page="mainFooter.jsp" flush="false"></jsp:include>
</body>
</html>