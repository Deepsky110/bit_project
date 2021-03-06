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
		$('#mypageedit').on('click', function() { //내정보 수정페이지로 이동
			//var param = 'idx='+num
			$.ajax('mypageedit.bit', {
				'method' : 'post',
				'data' : 'idx=' + num,
				'success' : function(data) { //여기서 data는 controller에서 받은 결과
					location.href = 'mypageedit.bit';
				},//success
				'error' : function(data) {
					alert('수정에 실패했습니다.');
				}//error
			});//ajax
		});//click
	});//function ready
	
	$(function(){
		$('#accountdelete').on('click', function(){ // 탈퇴 페이지로 이동
			var param = 'idx='+num
			$.ajax('deletemechk.bit', {
				'method' : 'post',
				'data' : param,
				'success' : function(data){
					location.href ='deletemechk.bit';
				}, //success
				'error' : function(data){
					alert('이동 실패');
				} //error
			}); //ajax
		}); //click
	}); //function2 ready
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

#accounttable {
	border-collapse: collapse;
}

#accounttable tr {
	
}

#accounttable th {
	color: #1E3269;
	padding: 30px;
	border-right: 1px solid #e4e4e4;
	text-align: right;
}

#accounttable td {
	padding: 25px;
	text-align: left;
}

#mypageedit, #accountback{
	float: right;
	background-color: #000069;
	border: 1px solid #000069;
	color: white;
	margin: 7px;
	width: 50px;
	height: 20px;
}

#accountdelete{
	float: left;
	background-color: #d90b0b;
	border: 1px solid #d90b0b;
	color: white;
	margin: 7px;
	width: 80px;
	height: 20px;
	margin-left: 23px;
}

#mypageedit:hover, #accountback:hover{
	background-color: white;
	color: #000069;
	cursor: pointer;
}

#accountdelete:hover{
	background-color: white;
	color: #d90b0b;
	cursor: pointer;
}

#mypagepw, #mypagephone { /*비밀번호 input  */
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
				<h4>회원정보</h4>


				<c:set value="${bean }" var="bean" />
				<table id="accounttable">
					<tr>
						<th>이름</th>
						<td>${bean.name }</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>${bean.id_email }</td>
					</tr>
					<tr>
						<th>구분</th>
						<td>${bean.dept }</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>${bean.phone }</td>
					</tr>
				</table>


			</div>
			<div class="lmscontent">
				<button id="accountdelete" type="submit">탈퇴하기</button>
				<button id="accountback" onclick="window.history.go(-1)">뒤로</button>
				<button id="mypageedit" type="submit">수정</button>
				<!-- 			<button id="accountedit">수정</button>
회원정보 수정 삭제가 행정직원에게 주어도 되는지 고민.. 

수강생관리에서 수강생 삭제기능만 넣기. 개인정보는 각자 로그인했을 때 변경. 	 -->
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