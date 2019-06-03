<%@ page contentType="text/html; charset=euc-kr" pageEncoding="utf-8"%>

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
	function fncAddProduct(prodNo) {
		//Form 유효성 검증
		var name = document.detailForm.prodName.value;
		var detail = document.detailForm.prodDetail.value;
		var manuDate = document.detailForm.manuDate.value;
		var price = document.detailForm.price.value;

	
		
		
		if (name == null || name.length < 1) {
			alert("상품명은 반드시 입력하여야 합니다.");
			return;
		}
		if (detail == null || detail.length < 1) {
			alert("상품상세정보는 반드시 입력하여야 합니다.");
			return;
		}
		if (manuDate == null || manuDate.length < 1) {
			alert("제조일자는 반드시 입력하셔야 합니다.");
			return;
		}
		if (price == null || price.length < 1) {
			alert("가격은 반드시 입력하셔야 합니다.");
			return;
		}

		$("form").attr("method" , "POST").attr("action" , "/product/UpdateProduct?prodNo="+prodNo).submit();
	}
	
	
	$(function() {
		
		 $( "button.btn.btn-primary" ).on("click" , function(event) {
			var prodNo = $(event.target).parent().children('div').text().trim();
			
			fncAddProduct(prodNo);
		});
		 
		 $("a[href='#']").on("click", function() {
				history.go(-1);
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
<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">상품수정</h3>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" name="detailForm" enctype="multipart/form-data" >
	
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
		    <div class="col-sm-4">
		     <input type="text" class="form-control" id="email" name="prodName" value=" ${product.getProdName() }" placeholder="변경상품명">
		     
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
		    <div class="col-sm-4">
		     <input type="text" class="form-control" id="email" name="prodDetail" value=" ${product.getProdDetail() }" placeholder="변경정보">
		   
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		    <div class="col-sm-4">
		    <input type="text" class="form-control" id="email" name="manuDate" value="${product.getManuDate() }" placeholder="변경제조일자">
		
		    </div>
		    </div>
		    
		     <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		    <div class="col-sm-4">
		    <input type="text" class="form-control" id="email" name="price" value=" ${product.getPrice() }" placeholder="변경가격">
		     
		    </div>
		    </div>
		    
		    <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">수량</label>
		    <div class="col-sm-4">
		    <input type="text" class="form-control" id="productCNT" name="productCNT" value=" ${product.getProductCNT() }" >
		     
		    </div>
		    </div>
		    
		    
		    
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
		
		    <div class="col-sm-4">
		    <span> <input type="file" class="form-control" id="file" name="file"  ></span>
		    </div>
		  </div>
		    
		    
	
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >수 &nbsp;정</button>
		      <div id="producvalue" style="display: none">
									 ${product.getProdNo()} 
								</div>
			  <a class="btn btn-primary btn" href="#" role="button">취소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>

</body>
</html>
