<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bitgrid.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="template/lmshead.jspf"%>
<title>BITCAMP JEJU: 마이페이지</title>

<script type="text/javascript">
	var num = "${bean.num }";
	$(function() {
		$('#deleteMeOk').on('click', function() { //삭제 컨트롤러로
			//var param = 'idx='+num
			var param = 'idx=' + num + '&pw=' + $('#deletemepw').val();
			$.ajax('deleteme.bit', {
				'method' : 'post',
				'data' : param,
				'success' : function(data) { //여기서 data는 controller에서 받은 결과
					var result = $(data).find('result').text();
					if (result == 1) {
						alert('회원정보가 삭제되었습니다')
						location.href = 'logout.bit';
					} else {
						alert('비밀번호를 확인해주세요');
					}
				},//success
				'error' : function(data) {
					alert('error');
				}//error
			});//ajax
		});//click
	});//ready
</script>
<style type="text/css">
.lmscontent {
	width: 600px;
	display: block;
	margin: auto;
	border-bottom: 1px solid #e4e4e4;
}

.lmscontent:last-child { /*푸터와 거리두기  */
	margin-bottom: 400px;
}

#chkmsg {
	border-collapse: collapse;
	padding: 30px;
}

.pwchk {
	padding-bottom: 10px;
}

#accountback { /* 뒤로 */
	float: right;
	background-color: #000069;
	border: 1px solid #000069;
	color: white;
	margin: 7px;
	width: 50px;
	height: 20px;
}

#deleteMeOk { /* 탈퇴 */
	float: right;
	background-color: #d90b0b;
	border: 1px solid #d90b0b;
	color: white;
	margin: 7px;
	width: 50px;
	height: 20px;
}

#deleteMeOk:hover {
	background-color: white;
	color: #d90b0b;
	cursor: pointer;
}

#accountback:hover {
	background-color: white;
	color: #000069;
	cursor: pointer;
}

#pwchk { /*비밀번호 input  */
	width: 300px;
	height: 35px;
	margin: 7px;
	border-radius: 5px;
	border: 1px solid #969696;
	font-size: 120%;
	text-align: center;
	vertical-align: middle;
}

#header .grid3 {
	margin-top: 40px;
	position: relative;
}
</style>
</head>
<body>
	<%@ include file="template/header.jspf"%>
	<%@ include file="template/menu.jspf"%>
	<div id="contents">
		<!--*****************lms메뉴******************-->
		<div class="grid2">
			<div id="lmsmenu">
				<p>내정보</p>
				<ul>
					<li class="bigletter">계정관리</li>
					<li><a href="mypage.bit">회원정보</a></li>

					<li></li>
				</ul>
			</div>
		</div>
		<!--*****************lms메뉴******************-->
		<div id="content" class="grid6">
			&nbsp;
			<!--*************content start****************-->
			<div class="lmscontent">
				<h2>계정관리</h2>
				<h4>회원탈퇴</h4>

				<c:set value="${bean }" var="bean" />
				<div id="chkmsg">
					<div class="pwchk">비밀번호를 입력해주세요</div>
					<!-- 					<div class="deletemsg">탈퇴 후 삭제된 정보는 복구할 수 없습니다.</div> -->
					<div>
						<input type="password" name="deletemepw" id="deletemepw" />
					</div>
				</div>


			</div>
			<div class="lmscontent">
				<button id="accountback" onclick="window.history.go(-1)">뒤로</button>
				<button id="deleteMeOk" type="submit">탈퇴</button>
			</div>
			<!--*************content end******************-->
			<%@ include file="template/footer.jspf"%>
</body>
</html>
<!-- 
-1번라인의 charset, pageEncoding 5번라인의 charset모두 utf-8로 맞춰주세요.
-2번의 doctype도 다지우고 위처럼 html만 남겨주세요.
-content내부에 content와 sidebar로 나눔 ->content에 작업하면됩니다.
-sidebar에서 사용하고 있는 id: #signin #emailid #pw #login #createccount #gotolms #campus #campusinfo #classinfo #open
-footer에서 사용하고있는 id: #footercon
위의 아이디들은 작업시 사용하지 마세요 이름바꾸고 싶으면 저와 의논바람
 -->