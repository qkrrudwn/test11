<%@ page contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>

<%@ page import="com.model2.mvc.service.domain.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>



<html>
<head>
<title>상품등록</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script type="text/javascript" src="../javascript/calendar.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Stylish&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="/css/admin.css" type="text/css">
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>


<style>
body>div.container {
	border: 3px solid #D6CDB7;
	margin-top: 10px;
}
</style>
<script type="text/javascript">


function fncAddPurchase() {
	$("form").attr("method","POST").attr("action","/purchase/addPurchase").submit();
};


$(function() {
	$("button.btn.btn-primary").on("click",function(){
	
			fncAddPurchase();
	});
	$("td.ct_btn01:contains('취소')").on("click",function(){
		javascript:history.go(-1);
	});
	
	
	
});


</script>


<style>
body {
	padding-top: 70px;
}
</style>

<script language="JavaScript">

var price;
var purchaseCNT;
var productCNT;
var a = 0;
function init () {

	price = document.detailForm.price.value;
	purchaseCNT = document.detailForm.purchaseCNT.value;
	document.detailForm.purchasePrice.value = price;


	change();
}

function add () {
	
	productCNT = ${product.getProductCNT()};
	
	hm = document.detailForm.purchaseCNT;
	purchasePrice = document.detailForm.purchasePrice;
	if (productCNT > a) {
	hm.value ++ ;
	a++;
	purchasePrice.value = parseInt(hm.value) * price;
	}
	
}

function del () {
	hm = document.detailForm.purchaseCNT;
	purchasePrice = document.detailForm.purchasePrice;
		if (hm.value > 0) {
			hm.value -- ;
			purchasePrice.value = parseInt(hm.value) * price;
		}
}

function change () {
	hm = document.detailForm.purchaseCNT;
	purchasePrice = document.detailForm.purchasePrice;

		if (hm.value < 0) {
			hm.value = 0;
		}
	purchasePrice.value = parseInt(hm.value) * price;
}  

</script>


</head>
<body bgcolor="#ffffff" text="#000000" onload="init();">
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">

		<div class="page-header text-center">
			<h3 class=" text-info">구매창</h3>
		</div>

		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" name="detailForm">

			<div class="form-group">
				<label for="userId" class="col-sm-offset-1 col-sm-3 control-label">상품번호</label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block">
						${product.getProdNo() } </span>
				</div>
			</div>
			<input type="hidden" name="prodNo" value="${product.getProdNo() }" />
			<div class="form-group">
				<label for="userId" class="col-sm-offset-1 col-sm-3 control-label">상
					품 명</label>
				<div class="col-sm-4">
					<span id="helpBlock" class="help-block">
						${product.getProdName() } </span>
				</div>
			</div>

			<div class="form-group">
				<label for="password" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
				<div class="col-sm-4">${product.getProdDetail() }</div>
			</div>

			<div class="form-group">
				<label for="password2"
					class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>

				<div class="col-sm-4">${product.getManuDate() }</div>
			</div>
			
			<div class="form-group">
				<label for="password2"
					class="col-sm-offset-1 col-sm-3 control-label">제고</label>

				<div class="col-sm-4">
				<p class="getget">
				${product.getProductCNT()}
				</p>
				</div>
			</div>
			

			<div class="form-group">
				<label for="userName" class="col-sm-offset-1 col-sm-3 control-label">수량</label>
			

<%-- 			<input type=text name="productCNT" value="${product.getProductCNT()}" id="productCNT"> --%>
			<input type=hidden name="price" value="${product.getPrice() }" id="price">
				 
				 <input	type="text" name="purchaseCNT" value="0" size="3" onchange="change();" >
				<input type="button" value=" + " onclick="add();">
			<input	type="button" value=" - " onclick="del();">
					
			</div>

			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">등록일자</label>
				<div class="col-sm-4">${product.getRegDate() }</div>
			</div>

			<div class="form-group">
				<label for="userName" class="col-sm-offset-1 col-sm-3 control-label">구매자아이디</label>
				<div class="col-sm-4">${user.getUserId()}</div>
			</div>

			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">구매방법</label>
				<div class="col-sm-4">
					<select class="form-control" name="paymentOption"
						id="paymentOption">
						<option value="1">현금구매</option>
						<option value="2">신용구매</option>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label for="userName" class="col-sm-offset-1 col-sm-3 control-label">구매자이름</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="receiverName"
						name="receiverName">
				</div>
			</div>

			<div class="form-group">
				<label for="userName" class="col-sm-offset-1 col-sm-3 control-label">구매자연락처</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="receiverPhone"
						name="receiverPhone">
				</div>
			</div>

			<div class="form-group">
				<label for="userName" class="col-sm-offset-1 col-sm-3 control-label">구매자주소</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="divyAddr"
						name="divyAddr">
				</div>
			</div>

			<div class="form-group">
				<label for="userName" class="col-sm-offset-1 col-sm-3 control-label">구매요청사항</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="divyRequest"
						name="divyRequest">
				</div>
			</div>



			<div class="form-group">
				<label for="password2"
					class="col-sm-offset-1 col-sm-3 control-label">배송희망일자</label>

				<div class="col-sm-4">
					<input type="text" class="form-control" name="divyDate"
						readonly="readonly" maxLength="10" minLength="6" /> &nbsp;<img
						src="../images/ct_icon_date.gif" width="20" height="20"
						onclick="show_calendar('document.detailForm.divyDate'	, document.detailForm.divyDate.value)" />
				</div>
			</div>
			
			
			
			
			<div class="form-group">
				<label for="userName" class="col-sm-offset-1 col-sm-3 control-label">총 결제 금액</label>
				<div class="col-sm-4">
					 금액 : 
				
					<input	type="text" name="purchasePrice" size="11" readonly id="purchasePrice">원
				</div>
			</div>
			
		
			


			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" class="btn btn-primary">구&nbsp;매</button>
					<a class="btn btn-primary btn" href="#" role="button">취소</a>
				</div>
			</div>
		</form>

	</div>

</body>
</html>