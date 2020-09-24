<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko-kr">
<head>
	<meta charset="utf-8"/>
	<title>map</title>
	<link rel="stylesheet" href="${contextPath}/css/map.css" />
	
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c60d795e0184b94a4cd445430f1ad3dc"></script>
	
	<script>		
	window.onload = function() {
		
		var stores = '${stores}';
		var storesJSON = JSON.parse(stores);
		
		var mapContainer = document.getElementById('map'); // 지도를 표시할 div
		
		var mapOption = { 
				center : new kakao.maps.LatLng(storesJSON[0].latitude, storesJSON[0].longitude),  // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
		var positions = [];
		var popup_content = ""; 
		var overlays = [];
		var markers = [];
		
		if (stores.trim() == "") {
			
			console.log("점포 정보 인자 없음");
			
		} else { // 점포 정보 인자 전송시
			
			console.log("인자 전송됨");
			console.log("점포 정보 : "+stores);
			
			console.log("점포 갯수 : "+storesJSON.length);
			// console.log("점포 정보 : "+storesJSON[0].storeName);
			
			var store_obj = { content : "", latlng : "" };
			var temp_foods = "";
			
			for (var i=0; i<storesJSON.length; i++) {
				
				for (var j=0; j<storesJSON[i].productList.length; j++) {
					temp_foods += storesJSON[i].productList[j].productName+"&nbsp;"
							   +  storesJSON[i].productList[j].productOrigin+"&nbsp;"
							   +  storesJSON[i].productList[j].productQuantity
							   +  storesJSON[i].productList[j].productQuantityUnit+"&nbsp;"
							   +  storesJSON[i].productList[j].productWeight
							   +  storesJSON[i].productList[j].productWeightUnit+"&nbsp;"
							   +  storesJSON[i].productList[j].productPrice+"원(그램당)<br>"
				}
			
				// onclick="closeOverlay()" 
				
				popup_content = 
					'<div id="map_window_java_'+(i+1)+'" name="map_window_java" class="wrap">'
					+ '    <div class="info">'
					+ '        <div class="title">'
					+ 		   	   storesJSON[i].storeName
					+ '            <div class="close" id="close_marker_'+(i+1)+'" title="닫기"></div>'
					+ '        </div>'
					+ '        <div class="body">'
					+ '            <div class="img">'
					+ '                <img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">'
					+ '           </div>'
					+ '            <div class="desc">'
					+ '                <div>'+ temp_foods +'</div>'
					+ '                <div class="ellipsis">경기도 부천시 원미구 심곡2동 신흥로52번길 35</div>'
					+ '                <div class="jibun ellipsis">심곡2동 407-2 유정연립</div>'
					+ '                <div><a href="https://store.naver.com/restaurants/detail?id=34105398" target="_blank" class="link">홈페이지</a></div>'
					+ '            </div>'
					+ '        </div>' 
					+ '	    </div>'
					+ '</div>'
					
					store_obj.content = popup_content;
					store_obj.latlng = new kakao.maps.LatLng(storesJSON[i].latitude, storesJSON[i].longitude);
					
					positions[i] = store_obj;
					// 초기화
					store_obj = {}; 
					temp_foods = "";
				
			// } // for-end	
			
			//console.log("~~~~~ position 점포 정보 : "+positions[0].content);
			//console.log("~~~~~ position 좌표 : "+positions[0].latlng);
			
			//console.log("~~~~~ position 점포 정보 : "+positions[1].content);
			//console.log("~~~~~ position 좌표 : "+positions[1].latlng);
			
			// for (var i = 0; i < positions.length; i++) {
				
				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
					map : map, // 마커를 표시할 지도
					position : positions[i].latlng
				// 마커의 위치

				});
				
				markers.push(marker);
				
				// https://apis.map.kakao.com/web/sample/markerWithCustomOverlay/
				// 마커 위에 커스텀오버레이를 표시합니다
				var overlay = new kakao.maps.CustomOverlay({
					content : positions[i].content,
					map : map,
					position : marker.getPosition()
				});
				
				overlays.push(overlay);
				
				// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
				kakao.maps.event.addListener(map, 'click', function(event) {
					$("[id^='map_window_java_']").show(); // 모든 클립 윈도우 다시 열기
				}); 
				
			} // for-end
			
		} // if-end
		
	} // window.onload
	</script>
	
	<script>
	$(function() {
		
		// 클립 윈도우 닫기 이벤트 핸들러
		$("#map_wrap").on('click', '[id^=close_marker_]', function(e) {  
			
			console.log("아이디 : "+e.target.id);
			var id = e.target.id;
			var num = id.substring(id.length-1);
			console.log("번호 : "+num);
			console.log("클립 윈도우 아이디 : "+"map_window_java_"+num);
			$("#map_window_java_"+num).hide();
		});
		
	});
	</script>
</head>
<body>
<%-- 점포 : ${stores}  --%>
	
	<!-- 팝업 윈도우 -->
	<div id="">
	</div>
	<!--// 팝업 윈도우 -->

	<!-- 전체 레이아웃 -->
	<div id="map_wrap">
	
		<!-- 지도 표시 -->
		<div id="map"></div>
		<!--// 지도 표시 -->
		
		<!-- 마트 리스트 -->
		<div id="mart_list">
		</div>
		<!--// 마트 리스트 -->
		
		<!-- 마트 상세 현황 -->
		<div id="mart_detail">
		</div>
		<!--// 마트 상세 현황 -->
	</div>
	<!--// 전체 레이아웃 -->
</body>
</html>