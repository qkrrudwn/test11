<%@ page contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>
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
<script>
/* 	function fncAddpurchaseView(prodNo) {
	var url = "/purchase/addPurchaseView?prodNo="+prodNo;
		self.location=url;
	}
	 */
	function fncAddpurchaseView() {
		$("form").attr("method", "GET").attr("action","/purchase/addPurchaseView").submit();
		}

	$(function() {

		$("button.btn.btn-primary").on("click", function() {
		
		var prodNo=$(event.target).parent().children('div').text().trim();
		
		fncAddpurchaseView();
		});

		$(function() {
			$("a[href='#']").on("click", function() {
				history.go(-1);
			});
		});
		
		
		
	});
</script>


<title>Insert title here</title>


<style>
body {
	padding-top: 70px;
}
</style>






</head>
<body  bgcolor="#ffffff" text="#000000" >
<!-- <body bgcolor="#ffffff" text="#000000" > -->
<jsp:include page="/layout/toolbar.jsp" />
<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">상품상세조회</h3>
	    </div>
	    

	    
	    
  
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" name="detailForm" >
		
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">상품번호</label>
		    <div class="col-sm-4">
		       <span id="helpBlock" class="help-block">
		       ${product.getProdNo() }
		      </span>
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
		    <div class="col-sm-4">
		      ${product.getProdName() }
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">수량</label>
		    <div class="col-sm-4">
		      ${product.getProductCNT() }
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
		
		    <div class="col-sm-4">
		    <span> <img src="/images/uploadFiles/${product.getFileName()}"/></span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
		    <div class="col-sm-4">
		    ${product.getProdDetail() }
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		    <div class="col-sm-4">
		     ${product.getManuDate() }
		    </div>
		    </div>
		     <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		    <div class="col-sm-4">
		      ${product.getPrice() }
		    </div>
		    </div>
		     <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">등록일자</label>
		    <div class="col-sm-4">
		      ${product.getRegDate() }

		    </div>
		    
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		  
		      <button type="button" class="btn btn-primary"  >구 &nbsp;매</button>
		      <input type="hidden" id="prodNo"  value= "${product.getProdNo()}"  name="prodNo">
								
								
			  <a class="btn btn-primary btn" href="#" role="button">이전</a>
		    </div>
		  </div>
		</form>

 	</div>

</body>
</html>