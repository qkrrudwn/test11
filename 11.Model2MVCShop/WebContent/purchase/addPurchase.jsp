<%@ page contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>

<%@ page import="com.model2.mvc.service.domain.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	
	$("form").attr("method","POST").attr("action","/purchase/listPurchase").submit();
};


$(function() {
	$("button.btn.btn-primary").on("click",function(){
	
			fncAddPurchase();
	});
});
</script>


<style>
body {
	padding-top: 70px;
}
</style>






</head>
<body bgcolor="#ffffff" text="#000000">
<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">다음과 같이 구매가 되었습니다.</h3>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" name="detailForm" >
		
		<div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">물품번호</label>
		    <div class="col-sm-4">
		       <span id="helpBlock" class="help-block">
		       ${product.getProdNo() }
		      </span>
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">구매자아이디</label>
		    <div class="col-sm-4">
		       <span id="helpBlock" class="help-block">
		      ${user.getUserId() }
		      </span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">수량</label>
		    <div class="col-sm-4">
		       <span id="helpBlock" class="help-block">
		      ${purchase.getPurchaseCNT() }
		      </span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		    <div class="col-sm-4">
		       <span id="helpBlock" class="help-block">
		       ${purchase.getPurchasePrice() }
		      </span>
		    </div>
		  </div>
		  
		  
		  
		
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">구매방법</label>
		    <div class="col-sm-4">
		     <c:if test="${purchase.getPaymentOption() eq '1' }">
					현금구매
				</c:if>
				<c:if test="${purchase.getPaymentOption() eq '2' }">
					신용구매
				</c:if>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">구매자이름</label>
		
		    <div class="col-sm-4">
		     ${purchase.getReceiverName() }
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">구매자연락처</label>
		    <div class="col-sm-4">
		      ${purchase.getReceiverPhone() }
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">구매자주소</label>
		    <div class="col-sm-4">
			${purchase.getDivyAddr() }
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">구매요청사항</label>
		    <div class="col-sm-4">
		  ${purchase.getDivyRequest() }
		    </div>
		  </div>
		  
		     <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">배송희망일자</label>
		    <div class="col-sm-4">
		${purchase.getDivyDate() }
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" class="btn btn-primary">확&nbsp;인</button>
				</div>
			</div>

		  
	
		</form>
	    
 	</div>

</body>
</html>