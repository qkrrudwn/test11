

<%@ page contentType="text/html; charset=euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="utf-8">
<title>회원 목록조회</title>
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

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<style>
body>div.container {
	border: 3px solid #D6CDB7;
	margin-top: 10px;
}
</style>
<script>
	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage);

		$("form").attr("method", "POST").attr("action", "/product/listProduct"+"?menu=${param.menu}")
				.submit();
	}

	function readProduct(prodNo) {

		self.location = "/product/getProduct?prodNo=" + prodNo + "&menu="+${param.menu};

	}

	$(function() {
// html의 data값은 소문자로만 인식
		$(".dir").on("click", function(event) {
		
			
	//	var tranCode	= $(event.target).text().trim();
		var tranCode	= $(event.target).data('trancode');
		
//		var prodNo =	$(event.target).children('div').children('p').last().html().trim();
		var prodNo =	 $(event.target).data('prodno');
		var tranNo =	 $(event.target).data('tranno');
			alert(tranNo);
			self.location="/purchase/updateTranCode?proTranCode="+tranCode + "&prodNo="+prodNo+"&menu=${param.menu}&tranNo=" + tranNo;
			
		});

		$(".ct_list_pop td:nth-child(3)").css("color", "red");

		$("h7").css("color", "red");

		

		$(".ct_list_pop:nth-child(4n+6)").css("background-color", "whitesmoke");
		//console.log ( $(".ct_list_pop:nth-child(1)" ).html() );
		//console.log ( $(".ct_list_pop:nth-child(2)" ).html() );
		//console.log ( $(".ct_list_pop:nth-child(3)" ).html() );
		//console.log ( $(".ct_list_pop:nth-child(4)" ).html() ); //==> ok
		//console.log ( $(".ct_list_pop:nth-child(5)" ).html() ); 
		//console.log ( $(".ct_list_pop:nth-child(6)" ).html() ); //==> ok
		//console.log ( $(".ct_list_pop:nth-child(7)" ).html() ); 

		$.ajax({
		
			type : "GET",
			contentType : 'application/json',
			url : "/product/json/productGetName",
			dataType : "json",
			success : function(Data) {

				$("#auto").autocomplete({
					source : Data
				});
			}
		});
		
		$("button[href='#']").on("click", function(event){
		var prodNo = $(event.target).parent().children("div").text().trim();
		//alert(prodNo);
		
		
		//var prodNo = $(event.target).parent().children('div').children('p').text().trim();
		
		
		//var index = $("a[href='#']").index(this)
		//alert(index);
		//var prodNo = $($("a[href='#']")[index]).text().trim();
		//var prodNo = $('div.caption').children('div').text().trim();
		//alert(prodNo);
			//alert($(".test").text().trim());
			//var index = $("a[href='#']").index(this);
			//alert(index);
			//var prodNo = $($("a[href='#']")[index]).text().trim();
			
			
			//var prodNo = $
			//alert(prodNo);
	
			self.location= "/product/getProduct?prodNo="+prodNo+"&menu=${param.menu}";
		});
		
		
		$("button.btn.btn-default").on("click", function() {
		
			fncGetList(1);
		});
		
		
		
		
	});
</script>




<style>
body {
	padding-top: 70px;
}
</style>


</head>


	<jsp:include page="/layout/toolbar.jsp" />
	

<div class="container">



	<div style="width: 98%; margin-left: 10px;">
	
	<div class="page-header text-info">
	<c:if test="${param.menu == 'manage'  }">
	<h3>판매관리목록</h3>
	</c:if> 
	<c:if test="${param.menu == 'search'  }">
	<h3>상품검색목록</h3>
	</c:if> 
	    </div>

 <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0"
								${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option>
							<option value="1"
								${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option>
							<option value="2"
								${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>상품가격</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    
				    
				    <input type="text" class="form-control" id="auto" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				    
				    
				    
				    
<!-- 				    <input type="text" name="searchKeyword" class="auto" -->
<!-- 						style="width: 200px; height: 19px"> -->
				  
				  
				  
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>


				<c:set var="i" value="0" />
				<c:forEach var="product" items="${list}">
					<c:set var="i" value="${ i+1 }" />
					<div class=column>
						<div class="col-sm-4 col-md-3">
							<div class="thumbnail">
								<img style= "width: 250px; height: 230px;"   src="../images/uploadFiles/${product.getFileName()}"
									alt="...">
								<div class="caption">
									<h3>${product.getProdName()}</h3>
									<p>
										<div  class="test" name="test1" style="display: none" value="${product.getProdNo()}">
											${product.getProdNo()}
										</div>
										<button href="#" class="btn btn-primary" data-value="${product.getProdNo()}" >
										<c:if test="${param.menu == 'manage' }">
										상품수정
										</c:if>
										<c:if test="${param.menu == 'search' }">
										제품상세보기
										</c:if>
										</button>
									</p>
									
									<button class="dir" data-tranCode="${product.getProTranCode().trim()}" data-prodNo="${product.prodNo}" data-tranNo="${product.tranNo}">
								
									<c:if test="${product.getProductCNT() > 0}">
							판매중
						</c:if>
						
						 <c:if test="${ product.getProTranCode().trim() eq '1' && param.menu == 'search'}">
							구매완료
							</c:if>
							
							<c:if test="${product.getProTranCode().trim() eq '1' && param.menu == 'manage' }">
								배송하기
								<div style="display: none">
										<p title="tranCode">${product.getProTranCode() }</p>
										<p title="prodno">${ product.prodNo}</p>
									</div>
								</c:if>
								
								<c:if test="${ product.getProTranCode().trim() eq '2' && param.menu == 'manage' }">
							배송중
							</c:if>
							
							<c:if test="${product.getProductCNT() == 0}">
							품절
							</c:if>
							
							</button>
									
									
								</div>
							</div>
						</div>
					</div>
				</c:forEach>

	</div>
</div>
<jsp:include page="../common/pageNavigator_new.jsp"/>
</body>




</html>
