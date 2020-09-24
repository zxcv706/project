<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">

<head>
<!--구글 머티리얼-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!--부트스트랩-->
<link rel="stylesheet"
	href="${contextPath}/webjars/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="${contextPath}/webjars/jquery/3.5.1/dist/jquery.min.js"></script>
<script src="${contextPath}/webjars/popper.js/1.16.0/popper.min.js"></script>
<script src="${contextPath}/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- css -->
<style>
/*나눔고딕*/
@import url('/project/css/nanumgothic.css');
</style>
<link rel="stylesheet" href="${contextPath}/css/korean_food.css">
</head>

<body>
	<!-- 전체 레이아웃 -->
	<div id="Recipe1_wrap">
		<!-- 상단부:카테고리명,레시피 검색 -->
		<div id="Recipe1_header">

			<!-- 카테고리명 -->
			<div id="Recipe1_categoryname">한식</div>

			<!--레시피 검색 -->
			<div id="Recipe1_search">
				<div id="Search_panel">
					<form class="form-inline" action="search.do">
						<span class="material-icons" style="color: gray; font-size: 30pt">
							search </span> <input type="text" style="width: 250px; height: 40px;"
							class="form-control ml-2 mr-2" placeholder="검색어를 입력하세요."
							id="search_word">
						<button type="submit" style="width: 80px; height: 40px;"
							class="btn btn-primary">검색</button>
					</form>
				</div>
			</div>

		</div>

		<!-- 중단부:레시피 이미지 텍스트 모음 -->
		<div id="Content_wrap">
			<div id="Recipe1_center">

				<c:forEach items="${koreanfoods}" var="food">
					<div id="Recipe1_center_menu">
						<div id="Recipe1_center_menu_img1">
							<a href="${food.url}"> <img
								src="${contextPath}/img/food/korean/${food.foodImg}" />
							</a>
						</div>
						<div id="Recipe1_center_menu_detail1">${food.foodDetail}</div>
					</div>
				</c:forEach>
			</div>
		</div>

		<!-- 하단부:슬라이드 -->
		<div id="Recipe_pagination">
			<div class="container w-100 mx-auto">
				<ul class="pagination justify-content-center" style="margin: 20px 0">
					<li class="page-item"><a class="page-link" href="#">Previous</a></li>
					<li class="page-item"><a class="page-link" href="/project/recipe/korean?page=1">1</a></li>
					<li class="page-item active"><a class="page-link" href="/project/recipe/korean?page=2">2</a></li>
					<li class="page-item"><a class="page-link" href="/project/recipe/korean?page=3">3</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>

</html>