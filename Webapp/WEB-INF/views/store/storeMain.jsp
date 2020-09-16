<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>

<head>
  <title>매장 메인페이지</title>
   
  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom Common CSS -->
  <link href="${pageContext.request.contextPath}/assets/css/common2.css" rel="stylesheet">

  <!-- Bootstrap core JavaScript -->
  <script src="${pageContext.request.contextPath}/assets/bootstrap/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Jquery UI javaScript -->
  <script src="${pageContext.request.contextPath}/assets/bootstrap/jquery/jquery-ui.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/bootstrap/jquery/datepicker-ko.js"></script>

  <!-- 지도 API -->
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=55baf69ca87b3c6183422c4ba140bef0&libraries=services,clusterer"></script>

  <!-- custom javascript -->
  <script src="${pageContext.request.contextPath}/assets/bootstrap/js/common.js"></script>
  
 	<style>
	h6 { float: right; 
		 padding: 25px 0;
		}
		
	#main_text{
			margin: 0 217px;	
		}
	#main_img{
			margin: 0 217px;
		}
	.main_pet_img img{
			 width:225px;
 			 height:225px;
		}
	</style>
</head> 

<body class="bg-light">
<!-- head -->
<c:import url="/WEB-INF/views/include/store-header.jsp"></c:import>  
<!-- /head -->
  
    <!-- 컨텐츠 -->
    <div class="container">
    	<c:choose>
    		<c:when test="${sMap.mList[0].display eq 0 && sMap.mList[1].display eq 0 && sMap.mList[2].display eq 0 && sMap.mList[3].display eq 0 && sMap.mList[4].display eq 0}">
				<div id = main_img>
					<img src="${pageContext.request.contextPath}/assets/image/main_welcome.png">
				</div>
			</c:when>
			
			<c:otherwise>
				<div>
   					<p align="center" style=color:orange;><b>안녕하세요.${sMap.shopVo.shopTitle }입니다.</b><p>
   				</div>
   				<div>
   					<p align="center" id="main_text">${sMap.shopVo.shopDesc }</p>
   				</div>
				<br>
			</c:otherwise>
    	</c:choose>
    		
		<c:if test="${sMap.mList[1].display eq 1}">
			<div>
				<h3>Pet Gallery</h3>	
				<h6>
					<a href ="${pageContext.request.contextPath}/store/${sMap.shopVo.shopDomain}/${sMap.cateList[1] }Form?menuNo=${sMap.mList[1].menuNo}">More ></a>
				</h6>	
				
				<br><hr>
			</div>
			
			<div class="mt-5">
	         	<div class="row petSupplies-img2">
	         		<c:forEach var = "i" begin="0" end="3">
						<div class="col-md-3 pr-0">
							<c:if test="${i >= fn:length(sMap.GalleryList)}">
		            			<figure class="snip1273 pointer-cursor">
		             				<img src="${pageContext.request.contextPath}/assets/image/default.png">
		            			</figure>
	            			</c:if>
	            			
	            			<c:if test="${i < fn:length(sMap.GalleryList)}">
	            				<figure class="snip1273 pointer-cursor main_pet_img">
		             				<img src="${pageContext.request.contextPath}/dogshop/${sMap.GalleryList[i].img}">
		            			</figure>
	            			</c:if>
	        			</div>
	        		</c:forEach>
	        	</div>
	        </div>
	 		<br><br>
			</c:if>
 			
		<c:if test="${sMap.mList[3].display eq 1}">
	 		<div>
				<h3>Pet Supplies</h3>	
				<h6>
					<a href ="${pageContext.request.contextPath}/store/${sMap.shopVo.shopDomain}/${sMap.cateList[3] }Form?menuNo=${sMap.mList[3].menuNo}">More ></a>
				</h6>	
				
				<br><hr>
			</div>
			<div class="mt-5">
	         	<div class="row petSupplies-img2">
	         		<c:forEach var="i" begin="0" end="3">
						<div class="col-md-3 pr-0">
							<c:if test="${i >= fn:length(sMap.GoodsList)}">
	            				<figure class="snip1273 pointer-cursor">
	             					<img src="${pageContext.request.contextPath}/assets/image/default.png">
	            				</figure>
	            			</c:if>
	            			
	            			<c:if test="${i < fn:length(sMap.GoodsList)}">
	            				<figure class="snip1273 pointer-cursor main_pet_img">
	            					<img src="${pageContext.request.contextPath}/dogshop/${sMap.GoodsList[i].img}">
	            				</figure>
	            			</c:if>
	        			</div>
	        		</c:forEach>
	        	</div>
	        </div>
	        
	        <br><br>
	     </c:if>
	     
	     <c:if test="${sMap.mList[4].display eq 1}">
	        <div>
				<h3>Directions</h3>
				<h6>
					<a href ="${pageContext.request.contextPath}/store/${sMap.shopVo.shopDomain}/${sMap.cateList[4] }Form?menuNo=${sMap.mList[4].menuNo}">More ></a>
				</h6>
				
				<br><hr>	
			</div>
	        
	        <!-- 컨텐츠 내용 : 지도 -->
		    <div class="row mb-5">
		       <div class="col-md-12">
		          <!-- api 대체할 div영역 -->
		          <div class="border bg-white" style="height: 400px">
						<div class="row">
							<div id="map" style="width:100%;height:400px;"></div>
						</div>
		          </div>
		          <!-- /. api 대체할 div영역 -->
		        </div>
		    </div>
    	 </c:if>
	      
	</div>
    <!-- /. 컨텐츠 -->

  </main>
  <!-- /. main -->


<!-- footer -->
<c:import url="/WEB-INF/views/include/store-footer.jsp"></c:import>  
<!-- /footer -->

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=55baf69ca87b3c6183422c4ba140bef0"></script>
<script>
var address = "<c:out value = '${sMap.shopVo.shopAddress}'/>";
var mapContainer = document.getElementById('map');
var mapOption = {
    center: new daum.maps.LatLng(37.498875, 127.026226),
    level: 9
};  

var map = new daum.maps.Map(mapContainer, mapOption); 

var geocoder = new daum.maps.services.Geocoder();
var listData = [
	address
];

listData.forEach(function(addr, index) {
    geocoder.addressSearch(addr, function(result, status) {
        if (status === daum.maps.services.Status.OK) {
            var coords = new daum.maps.LatLng(result[0].y, result[0].x);

            var marker = new daum.maps.Marker({
                map: map,
                position: coords
            });
            var infowindow = new daum.maps.InfoWindow({
                content: '<div style="width:150px;text-align:center;padding:6px 0;">' + listData[index] + '</div>',
                disableAutoPan: true
            });
            kakao.maps.event.addListener(marker, 'click', function() {
            	infowindow.open(map, marker);
            	console.log(result[0].address.address_name);
            });
        } 
    });
});

</script>
</body>

</html>


