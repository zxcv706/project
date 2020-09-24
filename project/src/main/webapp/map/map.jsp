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
		
		var contextPath = '${contextPath}';
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
		var mart_list_content = "";
		
		if (stores.trim() == "") {
			
			console.log("점포 정보 인자 없음");
			
		} else { // 점포 정보 인자 전송시
			
			console.log("인자 전송됨");
			//console.log("점포 정보 : "+stores);
			
			console.log("점포 갯수 : "+storesJSON.length);
			console.log("점포 정보 : "+storesJSON[0]);
			
			var store_obj = { content : "", latlng : "" };
			var temp_foods = "";
			
			for (var i=0; i<storesJSON.length; i++) {
				
				// 점포 썸네일 이미지
				var thumb_image = contextPath + '/mart_thumb/small_2'
							+ storesJSON[i].storeName + '.JPG';
				// 마트 마커스 팝업
				popup_content = 
					'<div id="map_window_java_'+(i+1)+'" name="map_window_java" class="wrap">'
					+ '    <div class="info">'
					+ '        <div class="title">'
					+ 		   	   storesJSON[i].storeName
					+ '            <div class="close" id="close_marker_'+(i+1)+'" title="닫기"></div>'
					+ '        </div>'
					+ '        <div class="body">'
					+ '            <div class="img">'
					+ '                <img src="'+ thumb_image +'" width="73" height="70">'
					+ '           </div>'
					+ '            <div class="desc">'
					+ '				 <button class="store_detail_btn" id="store_detail_btn'+(i+1)+'" type="button">상세<br>현황</button>'
					+ '            </div>'
					+ '        </div>' 
					+ '	    </div>'
					+ '</div>'
					
				// 마트 리스트
				mart_list_content += 
					'<div id="mart_content_'+(i+1)+'">'
					+ '   <div class="mart_content_inner_box">'
					+ '       <div class="mart_content_inner_box">'
					+ '            <img src="'+thumb_image+'" width="75" height="75">'
					+ '       </div>'
					+ '       <div class="mart_box_over_flow mart_content_inner_box">'
					+              storesJSON[i].storeName + '<br>'
					+ 			   storesJSON[i].storeAddress1  + '<br>'
				    +              storesJSON[i].storeAddress2 
					+ '       </div>'
					+ '	  </div>'
					+ '</div>'	
					
				store_obj.content = popup_content;
				store_obj.latlng = new kakao.maps.LatLng(storesJSON[i].latitude, storesJSON[i].longitude);
				
				positions[i] = store_obj;
				// 초기화
				store_obj = {}; 
				temp_foods = "";
				
				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
					map : map, // 마커를 표시할 지도
					position : positions[i].latlng,
					title: 'map_window_java_'+(i+1) // 클립 윈도우 제어를 위한 추가 패치
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
				kakao.maps.event.addListener(marker, 'click', function(event) {
					
					location.reload(); // 초기화
				});
				
			} // for-end
			
			$("#mart_list").html(mart_list_content);
			
		} // if-end
		
	} // window.onload
	</script>
	
	<script>
	$(function() {
		
		var contextPath = '${contextPath}';
		var stores = '${stores}';
		var storesJSON = JSON.parse(stores);
		
		// 클립 윈도우 닫기 이벤트 핸들러
		$("#map_wrap").on('click', '[id^=close_marker_]', function(e) {  
			
			console.log("아이디 : "+e.target.id);
			var id = e.target.id;
			var num = id.split("_")[2];
			console.log("번호 : "+num);
			console.log("클립 윈도우 아이디 : "+"map_window_java_"+num);
			$("#map_window_java_"+num).hide();
		});
		
		// 상세 현황 보기 버튼
		$("#map_wrap").on('click', '[id^=store_detail_btn]', function(e) {  
			
				console.log("클릭");
				
				var id = e.target.id;
				var num = id.substring("store_detail_btn".length);
				console.log("번호 : "+num);
				console.log("storesJSON[num-1].storeName : "+storesJSON[num-1].storeName);
				
				// 점포 이미지
				var store_image = contextPath + '/mart_image/2' 
								+ storesJSON[num-1].storeName + '.JPG';
				
				var temp_foods = "";
				
				for (var j=0; j<storesJSON[num-1].productList.length; j++) {
					temp_foods += storesJSON[num-1].productList[j].productName+"&nbsp;"
							   +  storesJSON[num-1].productList[j].productOrigin+"&nbsp;"
							   +  storesJSON[num-1].productList[j].productQuantity+"개&nbsp;"
							   +  storesJSON[num-1].productList[j].productQuantityUnit+"(묶음당)&nbsp;"
							   +  storesJSON[num-1].productList[j].productPrice+"원(그램당)<br>"
				}
				
				// 섹션 초기화
				$("#mart_detail").html("");
				
				var mart_content = "<div class='mart_content_box'>"
								 + "   <h2>"+storesJSON[num-1].storeName+"</h2>"
								 + "     <h4>"+storesJSON[num-1].storeAddress1+"</h4>"
								 + "     <h4>"+storesJSON[num-1].storeAddress2+"</h4>"
								 + "   <img src='"+store_image+"' width='400' height='400'><br>"
								 + "   <b>상세현황 : </b><br>"+temp_foods+"<br>"
								 + "</div>";
				
				$("#mart_detail").html(mart_content);
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