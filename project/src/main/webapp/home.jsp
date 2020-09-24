<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, mnimum-scale=1,maximum-scale=1,user-scalable=no">
	
<title>MainPage</title>

<!--구글 머티리얼-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!--부트스트랩-->
<link rel="stylesheet"
	href="${contextPath}/webjars/bootstrap/4.5.0/css/bootstrap.min.css">

<!-- DaumMap -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script src="${contextPath}/webjars/jquery/3.5.1/dist/jquery.min.js"></script>
<script src="${contextPath}/webjars/popper.js/1.16.0/popper.min.js"></script>
<script src="${contextPath}/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<!-- jqueryui -->
<link rel="stylesheet"
	href="${contextPath}/webjars/jquery-ui/themes/base/jquery-ui.min.css">
<script src="${contextPath}/webjars/jquery-ui/jquery-ui.min.js"></script>

<!-- css -->
<style>
/*나눔고딕*/
@import url('/project/css/nanumgothic.css');
</style>
<link rel="stylesheet" href="${contextPath}/css/home.css">

<!-- js -->
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function execDaumPostcode() {

		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 3단계 : 해당 필드들에 정보 입력
						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('memberZip').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('memberAddressBasic').value = fullAddr;
					}

				}).open();

	}; //
</script>
<script>
	window.onload = function() {
		// Get the modal
		var Login_modal = document.getElementById('Login_btn');//로그인박스//
		var Signup_modal = document.getElementById('Signup_membership_box');//회원가입박스//
		Signup_modal.style.display = "none";

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			//로그인 박스 감추기
			if (event.target == Login_modal) {
				Login_modal.style.display = "none";
			}
			//회원 박스 감추기
			if (event.target == Signup_modal) {
				Signup_modal.style.display = "none";
			}
		}

	}
</script>
<script>
	/* jquery & jQueryUI */
	// 생년월일 자동 입력 달력 컴포넌트
	// 참고 링크) jQuery date Picker : https://jqueryui.com/datepicker/
	$(function() {

		$("#memberBirth").datepicker({
			changeYear : true,
			changeMonth : true,
			dateFormat : "yy-mm-dd"
		});

		// (하단부)#Main_bottom 영역 좌표 보정
		//$("#Main_bottom")
		//실제 화면 높이: 750 + 205
		console.log("화면 높이2:" + $(document).height());
		console.log("상단화면높이:" + $("#Login_btn").height());
		var Main_bottom_top = $(document).height() + 180 - 125 - 195 + 50;
		console.log("#Main_bottom_top: " + Main_bottom_top);
		$("#Main_bottom").attr("position", "absolute");
		$("#Main_bottom").attr("z-index", "10");
		$("#Main_bottom").offset({
			top : Main_bottom_top,
			left : 0
		});

	});
</script>
</head>

<body>

 	<!-- 인증(auth) 에러 메시징 : 예외처리 메시지가 직접 인쇄됨-->
	<c:if test="${error eq 'true'}">
		<script>
		alert('${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}');
		</script>
	</c:if> 
		
	<!-- 로그인 박스 -->
	<div id="Login_btn" class="Login_modal">
	
	    <!-- 인증(auth) 에러 메시징 : 예외처리 메시지가 직접 인쇄됨-->
		<c:if test="${error eq 'true'}">
			<div class="msg">${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</div>
		</c:if> 

		<form class="Login_modal-content Login_animate" action="<c:url value='/login?${_csrf.parameterName}=${_csrf.token}' />"
			method="post">
			
			<div class="Login_imgcontainer">
				<span
					onclick="document.getElementById('Login_btn').style.display='none'"
					class="Login_close" title="Close Modal">&times;</span>
				<h2>로그인</h2>
			</div>

			<div class="Login_container">
				<label for="uname"><b>Username</b></label> <input type="text"
					id="uname" placeholder="Enter Username" name="username" required>

				<label for="psw"><b>Password</b></label> <input type="password"
					id="psw" placeholder="Enter Password" name="password" required>

				<button type="submit" class="Login_btn_group">Login</button>
				<label> <input type="checkbox" checked="checked"
					name="remember"> Remember me
				</label>
			</div>

			<div class="Login_container" style="background-color: white">
				<button type="button" class="Login_btn_group"
					onclick="document.getElementById('Login_btn').style.display='none'"
					class="Login_cancelbtn">Cancel</button>
				<!--<span class="psw">Forgot <a href="#">password?</a></span>-->
			</div>
		</form>
	</div>

	<!-- 회원가입 -->
	<div id="Signup_membership_box" class="Login_modal">

		<form class="Login_modal-content Login_animate" action="${contextPath}/joinAction"
			method="post">
			<div class="Login_imgcontainer">
				<span onclick="document.getElementById('Signup_membership_box').style.display='none'"
					  class="Login_close" title="Close Modal">&times;</span>
				<h2>회원가입</h2>
			</div>

			<div class="Login_container">

				<div id="Signup_wrap">

					<div id="joinFormPnl">

							<table id="joinFormTbl">

								<!-- 아이디 -->
								<tr>
									<td><span class="requiredFld">*</span> 아이디</td>
									<td><input type="text" id="memberId" name="memberId"
										maxlength="20" pattern="[a-zA-Z]{1}\w{7,19}"
										title="아이디는 영문으로 시작하며 영문/숫자 조합하여 8~20자로 입력하십시오" required>
									</td>
								</tr>
								<!--// 아이디 -->

								<!-- 패쓰워드  -->
								<tr>
									<td><span class="requiredFld">*</span> 패쓰워드</td>
									<td>
										<input type="password" id="memberPassword"
											name="memberPassword" maxlength="20"
											pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{8,20}"
											required title="패쓰워드는 영문대소문자/특수문자/숫자 조합하여 8~20자로 입력하십시오">
									</td>
								</tr>
								<!--// 패쓰워드  -->

								<!-- 별명 -->
								<tr>
									<td><span class="requiredFld">*</span> 별명</td>
									<td><input type="text" id="memberNickname"
										name="memberNickname" maxlength="50"
										pattern="[가-힣]{2,25}|[a-zA-Z]{2,50}|\s[a-zA-Z]{2,50}" required
										title="별명은 두글자 이상으로 입력하십시오"></td>
								</tr>
								<!--// 별명 -->

								<!-- 이름  -->
								<tr>
									<td><span class="requiredFld">*</span> 이름</td>
									<td><input type="text" id="memberName" name="memberName"
										maxlength="25" pattern="[가-힣]{2,25}" required="true"
										title="이름은 한글로 입력하십시오"></td>
								</tr>
								<!--// 이름  -->

								<!-- 성별  -->
								<tr>
									<td><span class="requiredFld">*</span> 성별</td>
									<td>
										<ul>
											<li><input type="radio" id="memberGenderMale"
												name="memberGender" value="m" checked required> <label
												for="memberGenderMale">남</label>
												<div class="check"></div></li>
											<li><input type="radio" id="memberGenderFemale"
												name="memberGender" value="f"> <label
												for="memberGenderFemale">여</label>
												<div class="check"></div></li>
										</ul>
									</td>
								</tr>
								<!--// 성별  -->

								<!-- 이메일 -->
								<tr>
									<td><span class="requiredFld">*</span> 이메일</td>
									<td><input type="text" id="memberEmail" name="memberEmail"
										pattern="[a-zA-Z0-9_+.-]+@([a-zA-Z0-9-]+\.)+[a-zA-Z0-9]{2,4}"
										size="50" maxlength="50" required title="이메일을 입력하십시오">
									</td>
								</tr>
								<!--// 이메일 -->

								<!-- 핸드폰번호  -->
								<tr>
									<td><span class="requiredFld">*</span> 연락처</td>
									<td><input type="text" id="memberPhone" name="memberPhone"
										maxlength="13" pattern="01\d{1}-\d{3,4}-\d{4}" required
										title="전화번호는 우측 예시와 같이 입력하십시오"> ex) 010-1234-5678</td>
								</tr>
								<!--// 핸드폰번호  -->

								<!-- 생년월일 -->
								<tr>
									<td><span class="requiredFld">*</span> 생년월일</td>
									<td><input type="text" id="memberBirth" name="memberBirth"
										pattern="\d{4}-\d{2}-\d{2}" maxlength="11" required
										title="생년월일을 입력하십시오"></td>
								</tr>
								<!--// 생년월일 -->

								<!-- 우편변호  -->
								<tr>
									<td>우편번호</td>
									<td><input type="text" id="memberZip" name="memberZip"
										maxlength="5" pattern="\d{5}"> <input type="button"
										id="joinAddressSearchBtn" name="joinAddressSearchBtn"
										value="주소검색" onclick="execDaumPostcode()"><br></td>
								</tr>
								<!--// 우편변호  -->

								<!-- 기본주소 -->
								<tr>
									<td>기본주소</td>
									<td><input type="text" id="memberAddressBasic"
										name="memberAddressBasic"
										pattern="[\w | \W | 가-힣 | / | - | (  |  ) | ,]{2,200}"
										maxlength="200" size="50" title="기본주소를 입력하십시오"></td>
								</tr>
								<!--// 기본주소 -->

								<!-- 상세주소 -->
								<tr>
									<td>상세주소</td>
									<td><input type="text" id="memberAddressDetail"
										name="memberAddressDetail"
										pattern="[\w | \W | 가-힣 | / | -]{2,100}" maxlength="100"
										size="50" title="상세주소를 입력하십시오"></td>
								</tr>
							</table>
							<!--// 상세주소 -->

							<table id="joinFormMenu">

								<!-- 회원가입/취소 버튼 -->
								<tr>
									<td><input type="submit" id="joinSubmitBtn"
										name="joinSubmitBtn" value="회원가입"> <input type="reset"
										id="joinResetBtn" name="joinResetBtn" value="가입취소"></td>
								</tr>
								<!--// 회원가입/취소 버튼 -->

							</table>
						</form>

					</div>

				</div>

			</div>

			<div class="Login_container" style="background-color: white">
				<button type="button" class="Login_btn_group"
					onclick="document.getElementById('Login_btn').style.display='none'"
					class="Login_cancelbtn">Cancel</button>
				<!--<span class="psw">Forgot <a href="#">password?</a></span>-->
			</div>
		</form>
	</div>




	<!-- 전체 레이아웃 -->
	<div id="Main_intro_wrap">

		<!-- 상단부 : 로고,검색,공동 메뉴(로그인,회원가입)-->
		<div id="Main_header_bar">

			<!-- 로고 -->
			<div id="Main_logo">SSADAGOO</div>

			<!-- 검색 -->
			<div id="Main_search">
				<div id="Search_panel">
					<form class="form-inline" action="search.do">
						<span class="material-icons" style="color: gray; font-size: 30pt">
							search </span> <input type="text" style="width: 300px;"
							class="form-control ml-2 mr-2" placeholder="검색어를 입력하세요."
							id="search_word">
						<button type="submit" class="btn btn-primary">검색</button>
					</form>
				</div>
				<!-- 빈셀 -->
				<div id="Blank_search_panel">&nbsp;</div>
			</div>

			<!-- 로그인 -->
			<div id="Main_header_login">
			
				<c:if test="${not empty pageContext.request.userPrincipal.name}">
			        <b>${pageContext.request.userPrincipal.name}</b>&nbsp;로그인중 &nbsp;
			        <input type="button" class="btn btn-primary" value="로그아웃" 
			        	   onclick="location.href='${pageContext.request.contextPath}/logoutProc'" />
			    </c:if>
			    
			    <c:if test="${empty pageContext.request.userPrincipal.name}">
			        <span style="width:180px;">&nbsp;</span>
					<button class="btn btn-primary"
						onclick="document.getElementById('Login_btn').style.display='block'"
						style="width: auto;">Login</button>
				</c:if>	
				
			</div>

			<!-- 회원가입 -->
			<div id="Main_header_signupmembership">
				<button class="btn btn-primary"
					onclick="document.getElementById('Signup_membership_box').style.display='block'"
					style="width: auto;">회원가입</button>

			</div>

		</div>
		<!--// 상단부 : 로고,검색,공동 메뉴(로그인,회원가입)-->

		<!-- 중단부 : 레시피 카테고리 메뉴 ,메인 인트로(슬라이드),플로팅 광고-->
		<div id="Main_center_section">

			<!-- 레시피 카테고리 메뉴 :한식,중식,양식,일식,기타 -->
			<div id="Main_recipe_category">
				<div id="Cate_label" for="Left_category_menu">
					<h5>카테고리</h5>
				</div>
				<ul id="Left_category_menu">
					<li><a href="${contextPath}/recipe/foods?foodCate=한식&page=1">한식</a></li>
					<li><a href="${contextPath}/recipe/foods?foodCate=중식&page=1">중식</a></li>
					<li><a href="${contextPath}/recipe/foods?foodCate=양식&page=1">양식</a></li>
					<li><a href="${contextPath}/recipe/foods?foodCate=일식&page=1">일식</a></li>
					<li><a href="${contextPath}/recipe/foods?foodCate=기타&page=1">기타</a></li>
				</ul>
				
				<!-- 주변 상점 식재료 현황 -->
				<div id="store_link_menu">
					<a id="store_link" href="${contextPath}/store">주변 상점 식재료 현황</a>
				</div>
			</div>
			
			<!--// 레시피 카테고리 메뉴 :한식,중식,양식,일식,기타 -->

			<!-- 메인 인트로 (슬라이드)-->
			<div id="Main_intro_slide">
				<div id="Main_intro" class="carousel slide" data-ride="carousel">

					<!-- Indicators -->
					<ul class="carousel-indicators">
						<!--<li data-target="#Main_intro" data-slide-to="0" class="active"></li>
					  <li data-target="#Main_intro" data-slide-to="1"></li>
					  <li data-target="#Main_intro" data-slide-to="2"></li>
					  <li data-target="#Main_intro" data-slide-to="3"></li>-->
						<a data-target="#Main_intro" class="active" data-slide-to="0"
							style="cursor: pointer"> <span class="material-icons"
							style="color: gray; font-size: 10pt"> lens </span>
						</a> &nbsp;

						<a data-target="#Main_intro" data-slide-to="1"
							style="cursor: pointer"> <span class="material-icons"
							style="color: gray; font-size: 10pt"> lens </span>
						</a> &nbsp;
						<a data-target="#Main_intro" data-slide-to="2"
							style="cursor: pointer"> <span class="material-icons"
							style="color: gray; font-size: 10pt"> lens </span>
						</a>
					</ul>

					<!-- The slideshow -->
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="${contextPath}/img/칼럼1.jpg" alt="이미지" width="800"
								height="450">
						</div>
						<div class="carousel-item">
							<img src="${contextPath}/img/칼럼2.jpg" alt="이미지" width="800"
								height="450">
						</div>
						<div class="carousel-item">
							<img src="${contextPath}/img/칼럼3.jpg" alt="이미지" width="800"
								height="450">
						</div>
					</div>

					<!-- Left and right controls -->
					<a class="carousel-control-prev" href="#Main_intro"
						data-slide="prev"> <!--  <span style="color:red;" class="carousel-control-prev-icon"></span>-->
						<span class="material-icons" style="color: gray; font-size: 60pt">
							keyboard_arrow_left </span>
					</a> <a class="carousel-control-next" href="#Main_intro"
						data-slide="next"> <!--<span class="carousel-control-next-icon"></span>-->
						<span class="material-icons" style="color: gray; font-size: 60pt">
							keyboard_arrow_right </span>
					</a>
				</div>

			</div>
			<!--// 메인 인트로 (슬라이드)-->

			<!--플로팅 광고 -->
			<div id="Main_floating_ads"></div>
			<!--// 플로팅 광고 -->

		</div>
		<!--// 중단부 : 좌측 카테고리 메뉴 ,메인 인트로(슬라이드),플로팅 광고-->

		<!-- 하단부 : sns메뉴 -->
		<div id="Main_bottom">
			<div class="Main_bottom_sns-go">

				<a href="#"
					onclick="javascript:window.open('https://twitter.com/intent/tweet?text=[%EA%B3%B5%EC%9C%A0]%20' +encodeURIComponent(document.URL)+'%20-%20'+encodeURIComponent(document.title), 'twittersharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;"
					target="_blank" alt="Share on Twitter"><img
					src="${contextPath}/img/sns/sns_tw.png" width="50" alt="트위터 공유하기"></a>
				<a href="#"
					onclick="javascript:window.open('https://story.kakao.com/s/share?url=' +encodeURIComponent(document.URL), 'kakaostorysharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes, height=400,width=600');return false;"
					target="_blank" alt="Share on kakaostory"><img
					src="${contextPath}/img/sns/sns_kakao.png" width="50"
					alt="카카오스토리 공유하기"></a> <a href="#"
					onclick="javascript:window.open('https://plus.google.com/share?url=' +encodeURIComponent(document.URL), 'googleplussharedialog','menubar=no,toolbar=no,resizable=yes, scrollbars=yes,height=350,width=600');return false;"
					target="_blank" alt="Share on Google+"><img
					src="${contextPath}/img/sns/sns_google.png" width="50"
					alt="구글 플러스 공유하기"></a>


			</div>
			<!--// 하단부 : sns메뉴 -->

		</div>
		<!--// 전체 레이아웃 -->
</body>

</html>