<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>

<head>
<title>매장 관리자 (정보관리)</title>

<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Jquery Modal CSS -->
<link
	href="${pageContext.request.contextPath}/assets/bootstrap/jquery/jquery.modal.css"
	rel="stylesheet">

<!-- Jquery UI CSS -->
<link
	href="${pageContext.request.contextPath}/assets/bootstrap/jquery/jquery-ui.min.css"
	rel="stylesheet">

<!-- Custom Common CSS -->
<link href="${pageContext.request.contextPath}/assets/css/common2.css"
	rel="stylesheet">

<!-- Bootstrap core JavaScript -->
<script
	src="${pageContext.request.contextPath}/assets/bootstrap/jquery/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Jquery UI javaScript -->
<script
	src="${pageContext.request.contextPath}/assets/bootstrap/jquery/jquery-ui.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/bootstrap/jquery/datepicker-ko.js"></script>

<!-- custom javascript -->
<script
	src="${pageContext.request.contextPath}/assets/bootstrap/js/common.js"></script>
</head>

<body class="bg-light">

	<!-- head -->
	<c:import url="/WEB-INF/views/include/manager-header.jsp"></c:import>
	<!-- /head -->

	<!-- 컨텐츠 -->
	<div class="container">

		<!-- 컨텐츠 제목 : 매장 정보 -->
		<div class="row mb-3">
			<div class="col-md-12">
				<h2>매장 정보</h2>
				<hr>
			</div>
		</div>
		<!-- /. 컨텐츠 제목 : 매장 정보 -->

		<!-- 컨텐츠 내용 : 매장 정보 -->
		<form
			action="${pageContext.request.contextPath}/store/${sMap.shopVo.shopDomain}/infoModify"
			method="post" enctype="multipart/form-data">
			<div class="row mb-3">
				<div class="col-md-12">
					<div class="row mb-2">
						<div class="col-md-1"></div>
						<div class="col-md-2">
							<h6>
								<b>매장명</b>
							</h6>
						</div>
						<div class="col-md-8">
							<input type="text" id="" class="form-control" required autofocus
								value="${sMap.shopVo.shopTitle }" name="shopTitle">
						</div>
						<div class="col-md-1"></div>
					</div>
				</div>
				<div class="col-md-12">
					<div class="row mb-5">
						<div class="col-md-1"></div>
						<div class="col-md-2">
							<h6>
								<b>매장 소개</b>
							</h6>
						</div>
						<div class="col-md-8">
							<textarea class="form-control" rows="5" required name="shopDesc">${sMap.shopVo.shopDesc }</textarea>
						</div>
						<div class="col-md-1"></div>
					</div>
				</div>
				<div class="col-md-12">
					<div class="row mb-2">
						<div class="col-md-1"></div>
						<div class="col-md-2">
							<h6>
								<b>프로필 이미지</b>
							</h6>
						</div>
						<div class="col-md-8 form-group">
							<input type="file" class="form-control-file" id="shopLogoFile"
								name="Logo">
						</div>
						<div class="col-md-1"></div>
					</div>
				</div>
				<div class="col-md-12">
					<div class="row mb-5">
						<div class="col-md-1"></div>
						<div class="col-md-2">
							<h6>
								<b>배경 이미지</b>
							</h6>
						</div>
						<div class="col-md-8 form-group">
							<input type="file" class="form-control-file" id="shopHeaderFile"
								name="Header">
						</div>
						<div class="col-md-1"></div>
					</div>
				</div>
				<div class="col-md-12">
					<div class="row mb-2">
						<div class="col-md-1"></div>
						<div class="col-md-2">
							<h6>
								<b>매장 주소</b>
							</h6>
						</div>
						<div class="col-md-8">
							<input type="text" id="" class="form-control" required
								value="${sMap.shopVo.shopAddress }" name="shopAddress">
						</div>
						<div class="col-md-1"></div>
					</div>
				</div>
				<div class="col-md-12">
					<div class="row mb-2">
						<div class="col-md-1"></div>
						<div class="col-md-2">
							<h6>
								<b>사업자 번호</b>
							</h6>
						</div>
						<div class="col-md-8">
							<input type="text" id="" class="form-control" required
								value="${sMap.shopVo.shopAuth }" name="shopAuth">
						</div>
						<div class="col-md-1"></div>
					</div>
				</div>
				<div class="col-md-12">
					<div class="row mb-2">
						<div class="col-md-1"></div>
						<div class="col-md-2">
							<h6>
								<b>대표 번호</b>
							</h6>
						</div>
						<div class="col-md-8">
							<input type="text" id="" class="form-control" required
								value="${sMap.shopVo.shopNumber }" name="shopNumber">
						</div>
						<div class="col-md-1"></div>
					</div>
				</div>
				<div class="col-md-12">
					<div class="row mb-5">
						<div class="col-md-1"></div>
						<div class="col-md-2">
							<h6>
								<b>대표 이메일</b>
							</h6>
						</div>
						<div class="col-md-8">
							<input type="email" id="" class="form-control" required
								value="${sMap.shopVo.shopEmail }" name="shopEmail">
						</div>
						<div class="col-md-1"></div>
					</div>
				</div>
			</div>
		
		<!-- /. 컨텐츠 내용 : 매장 정보 -->

		<!-- 컨텐츠 제목 : 카테고리 정보 -->
		<div class="row mb-3">
			<div class="col-md-12">
				<h2>카테고리 정보</h2>
				<hr>
			</div>
		</div>
		<!-- /. 컨텐츠 제목 : 카테고리 정보 -->

		<!-- 컨텐츠 내용 : 카테고리 노출 설정 -->
		<div class="row">
			<div class="col-md-12">
				<div class="row mb-3">
					<div class="col-md-1"></div>
					<div class="col-md-10">
						<table class="table text-center">
							<thead class="table-secondary">
								<tr>
									<th scope="col">카테고리명</th>
									<th scope="col">노출 여부</th>
								</tr>
							</thead>
							<tbody id = "menuListArea">
								<c:forEach items="${sMap.mList}" var="menuVo">
									<tr>
										<td>${menuVo.menuTitle}</td>
										<td>
											<div>
												<label class='switch'>
												<input type='checkbox' ${menuVo.display eq 1 ? 'checked':''}  onchange='checkGallery($(this),${menuVo.menuNo})'>
												<span class='slider round'></span>
												</label>
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="col-md-1"></div>
				</div>
			</div>
		</div>
		
		<!-- /. 컨텐츠 내용 : 카테고리 노출 설정 -->
		<!-- 컨텐츠 마무리 -->
			<div class="row mb-5">
				<div class="col-md-9"></div>
				<div class="col-md-2">
					<button type="submit" class="btn btn-primary btn-sm btn-block"
						role="button">적 용</button>
				</div>
				<div class="col-md-1">
				</div>
			</div>
			<!-- /. 컨텐츠 마무리 -->
		</form>
	</div>
	
	<!-- /. 컨텐츠 -->

	</main>
	<!-- /. main -->

</body>



<script type="text/javascript">
	function checkGallery(target,menuNo) {
		var menuNo = menuNo;
		var display;
		if(target.is(":checked")) {
			display = 1;
		} else {
			display = 0;
		}
		console.log(display);
		$.ajax({
			url : "${pageContext.request.contextPath }/menu/menuDisplay",		
			type : "post",
			//contentType : "application/json",
			data : {
				menuNo	: menuNo,
				display : display
			},
			dataType : "json",
			
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		})
	}
	
</script>
<!-- footer -->
<c:import url="/WEB-INF/views/include/store-footer.jsp"></c:import>
<!-- /footer -->

</html>
