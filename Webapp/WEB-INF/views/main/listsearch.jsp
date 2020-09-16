<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>리스트로 매장찾기</title>

<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath }/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath }/assets/css/common.css" rel="stylesheet">

</head>

<body class="bg-light">

	<!-- header -->
		<c:import url="/WEB-INF/views/include/main-header.jsp"></c:import>
	<!-- header -->
	<!-- Page Content -->

	<div class="container">
		<div id="content-head" class="py-5 text-left">
			<h2>매장찾기</h2>
			<div id="location">
				<ul class="list-inline">
					<li>매장찾기</li>
					<li class="last">리스트로 찾기</li>
				</ul>
			</div>
		</div>

		<!-- Category -->
		<div class="row">
			<div class="col-md-2 order-md-1 mb-4">
				<h4 class="d-flex justify-content-between align-items-center mb-3">
					<!-- <span class="text-muted">회원 정보</span> -->
					<!-- <span class="badge badge-secondary badge-pill">3</span> -->
				</h4>
				<ul class="list-group mb-3">
					<li class="list-group-item d-flex justify-content-between lh-condensed">
						<div>
							<h6 class="my-0">
								<a href="${pageContext.request.contextPath }/mapsearch">지도로 찾기</a>
							</h6>
						</div>
					</li>
					<li class="list-group-item d-flex justify-content-between lh-condensed">
						<div>
							<h6 class="my-0">
								<a href="${pageContext.request.contextPath }/listsearch">리스트로 찾기</a>
							</h6>
						</div>
					</li>
				</ul>
			</div>
			<!-- /. Category -->

			<div class="col-md-10 order-md-2">
				<div>
					<div class="row listSearch-body">

						<div class="listSearch-info">

							<ul class="list-unstyled">
								<li>매장명</li>
								<li id="infotitle"></li>
							</ul>

							<ul class="list-unstyled">
								<li>영업시간</li>
								<li>09:30 ~ 21:30</li>
							</ul>

							<ul class="list-unstyled">
								<li>전화번호</li>
								<li id="infonumber"></li>
							</ul>

							<ul class="list-unstyled">
								<li>주소</li>
								<li id="infoaddress"></li>
							</ul>
								
							<ul class="list-unstyled">
								<li>이메일</li>
								<li id="infoaddress"></li>
							</ul>

						</div>
							<a href="" class="img-listSearch-location"> <img
								src="${pageContext.request.contextPath }/assets/image/default.png"
								class="img-responsive rounded img-listSearch"
								alt="Responsive image">
							</a>
					</div>
				</div>

				<table class="table table-sm table-hover text-center listSearch">
					<thead>
						<tr>
							<th scope="col">No.</th>
							<th scope="col">매장명</th>
							<th scope="col">매장 주소</th>
							<th scope="col">매장 번호</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${sList}" var="shopVo">
							<tr class="shopinfo" data-shoptitle="${shopVo.shopTitle}"
           						  data-shopaddress="${shopVo.shopAddress}"
								 data-shopnumber="${shopVo.shopNumber}">
								<td>${shopVo.shopNo}</td>
								<td><a href="${pageContext.request.contextPath }/store/${shopVo.shopDomain}/main">${shopVo.shopTitle}</a></td>
								<td>${shopVo.shopAddress}</td>
								<td>${shopVo.shopNumber}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>
		</div>
	</div>
	<!-- //Page Content -->

	 <!-- /.Footer -->
	<c:import url="/WEB-INF/views/include/main-footer.jsp"></c:import>  
	 <!-- /.Footer -->

	<!-- Bootstrap core JavaScript -->
	<script src="${pageContext.request.contextPath }/assets/bootstrap/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
<script type="text/javascript">
	$(".shopinfo").on("click", function() {
		var shoptitle = $(this).data("shoptitle");
		var shopaddress = $(this).data("shopaddress");
		var shopnumber = $(this).data("shopnumber");

		$("#infotitle").text(shoptitle);
		$("#infoaddress").text(shopaddress);
		$("#infonumber").text(shopnumber);

	})
</script>

</html>