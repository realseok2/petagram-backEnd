<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<c:if test="${sMap.shopVo.shopHeader != 'default' }">
  <style>
  	.jumbotron {
  		background-image:url(${pageContext.request.contextPath}/dogshop/${sMap.shopVo.shopHeader});
  		background-size : 1660px;
  		background-position: center;
  	}
  	
  	.jumbottron:after {
  		opacity: 0.7;
  	}
  </style>
  <!-- main -->
  <main role="main">

    <!-- 타이틀 -->
    <div class="jumbotron">
    	<!-- 헤더 네비 -->
	  <nav class="navbar navbar-expand-lg navbar-dark ">
	    <div class="container">
	      <!-- 로고 -->
	      <a class="navbar-brand" href="${pageContext.request.contextPath}/main"><img src="${pageContext.request.contextPath}/assets/image/lettering-bright.png"></a>
	
	      <div class="collapse navbar-collapse" id="navbarResponsive">
	        <!-- 메인 네비 -->
	        <ul class="navbar-nav">
	          <li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/store/${sMap.shopVo.shopDomain}/main">홈</a></li>
	          <li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/store/${sMap.shopVo.shopDomain}/reservationForm">예약하기</a></li>
	          <c:forEach var="i" begin="0" end="${fn:length(sMap.mList)}" >
	          	<c:if test="${sMap.mList[i].display eq 1 }">
	          	 	<li class="nav-item">
	          	 		<a class="nav-link active" href="${pageContext.request.contextPath}/store/${sMap.shopVo.shopDomain}/${sMap.cateList[i] }Form?menuNo=${sMap.mList[i].menuNo}">${sMap.mList[i].menuTitle }</a>
	          	 	</li>
	          	</c:if>
	          </c:forEach>
	        </ul>
	
	        <!-- 회원 네비 -->
	        <c:choose>
				<c:when test="${empty session }">
			        <ul class="navbar-nav ml-auto">
			          <li class="nav-item">
			            <a class="nav-link active" href="${pageContext.request.contextPath}/user/loginForm">로그인</a>
			          </li>
			          <li class="nav-item">
			            <a class="nav-link active" href="${pageContext.request.contextPath}/user/joinForm">회원가입</a>
			          </li>
			        </ul>
	        	</c:when>
	        	<c:otherwise>
			        <ul class="navbar-nav ml-auto">
			          <li class="nav-item  active" ><a class="nav-link"	>${session.userName }님</a></li>
			          <c:if test="${sMap.shopVo.shopNo eq session.shopNo }">
			          	<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/store/${session.shopDomain}/store-reservation">매장관리</a></li>
			          </c:if>
			          <li class="nav-item active"><a class="nav-link" href="#">회원정보</a></li>
			          <li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/user/logout">로그아웃</a></li>
			        </ul>
				</c:otherwise>
			</c:choose>
	      </div>
	    </div>
	  </nav>
	  <!-- 헤더 네비 -->
	  
	  
      <div class="container">
        <div class="row">
          <div class="col-md-2">
          	
          	<c:if test="${sMap.shopVo.shopLogo eq null }">
            	<img src="${pageContext.request.contextPath}/assets/image/title_img.png" class="rounded-circle btn-block mt-4">
            </c:if>
            
            <c:if test="${sMap.shopVo.shopLogo ne null }">
            	<img src="${pageContext.request.contextPath}/dogshop/${sMap.shopVo.shopLogo}" class="rounded-circle btn-block mt-4">
            </c:if>
            
          </div>
          <div class="col-md-10 title_fnt "style="color:black;">
            <h1 class="display-3 mt-4"><b>${sMap.shopVo.shopTitle }</b></h1>
            
          </div>
        </div>
      </div>
    </div>
    <!-- /. 타이틀 -->
</c:if>


<!-- ================================================================================= -->

<c:if test="${sMap.shopVo.shopHeader == 'default' }">
	 <!-- 헤더 네비 -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-danger fixed-top">
    <div class="container">
      <!-- 로고 -->
      <a class="navbar-brand" href="${pageContext.request.contextPath}/main"><img src="${pageContext.request.contextPath}/assets/image/lettering-bright.png"></a>

      <div class="collapse navbar-collapse" id="navbarResponsive">
        <!-- 메인 네비 -->
        <ul class="navbar-nav">
          <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/store/${sMap.shopVo.shopDomain}/main">홈</a></li>
          <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/store/${sMap.shopVo.shopDomain}/reservationForm">예약하기</a></li>
          <c:forEach var="i" begin="0" end="${fn:length(sMap.mList)}" >
          	<c:if test="${sMap.mList[i].display eq 1 }">
          	 	<li class="nav-item">
          	 		<a class="nav-link" href="${pageContext.request.contextPath}/store/${sMap.shopVo.shopDomain}/${sMap.cateList[i] }Form?menuNo=${sMap.mList[i].menuNo}">${sMap.mList[i].menuTitle }</a>
          	 	</li>
          	</c:if>
          </c:forEach>
        </ul>

        <!-- 회원 네비 -->
        <c:choose>
			<c:when test="${empty session }">
		        <ul class="navbar-nav ml-auto">
		          <li class="nav-item">
		            <a class="nav-link" href="${pageContext.request.contextPath}/user/loginForm">로그인</a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link" href="${pageContext.request.contextPath}/user/joinForm">회원가입</a>
		          </li>
		        </ul>
        	</c:when>
        	<c:otherwise>
		        <ul class="navbar-nav ml-auto">
		          <li class="nav-item  active" ><a class="nav-link"	>${session.userName }님</a></li>
		          <c:if test="${sMap.shopVo.shopNo eq session.shopNo }">
		          	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/store/${session.shopDomain}/store-reservation">매장관리</a></li>
		          </c:if>
		          <li class="nav-item"><a class="nav-link" href="#">회원정보</a></li>
		          <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/user/logout">로그아웃</a></li>
		        </ul>
			</c:otherwise>
		</c:choose>
      </div>
    </div>
  </nav>
  <!-- 헤더 네비 -->


  <!-- main -->
  <main role="main">

    <!-- 타이틀 -->
    <div class="jumbotron" style=background-image:url(${pageContext.request.contextPath}/dogshop/${sMap.shopVo.shopHeader})>
      <div class="container">
        <div class="row">
          <div class="col-md-2">
          	
          	<c:if test="${sMap.shopVo.shopLogo eq null }">
            	<img src="${pageContext.request.contextPath}/assets/image/title_img.png" class="rounded-circle btn-block mt-4">
            </c:if>
            
            <c:if test="${sMap.shopVo.shopLogo ne null }">
            	<img src="${pageContext.request.contextPath}/dogshop/${sMap.shopVo.shopLogo}" class="rounded-circle btn-block mt-4">
            </c:if>
            
          </div>
          <div class="col-md-10 title_fnt "style="color:black;">
            <h1 class="display-3 mt-4"><b>${sMap.shopVo.shopTitle }</b></h1>
            <div class="mt-2">
              <b>(매장 간략 소개글)</b> ${sMap.shopVo.shopDesc }
            </div>
            
          </div>
        </div>
      </div>
    </div>
    <!-- /. 타이틀 -->
  
</c:if>
  