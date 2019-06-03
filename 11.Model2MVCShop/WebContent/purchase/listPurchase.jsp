<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>



<html>
<head>
	<meta charset="EUC-KR">

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	
	
  <link rel="stylesheet" href="/resources/demos/style.css">


	
	
	
	
	
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	function fncGetList(currentPage) {
		document.getElementById("currentPage").value = currentPage;
		$("form").attr("method","POST").submit();
	}
	
	function readProduct(prodNo) {
		var url = "/product/getProduct?prodNo="+prodNo+"&menu=${param.menu}";
		self.location = url

	}
	
	$(function(){
		
		$(".ct_list_pop td:nth-child(1)").on("click",function(e){
			prodNo = $(e.target).children('div').text().trim();
	
			self.location="/purchase/getPurchase?prodNo="+prodNo;
		});
		
		
		
		
		$(".dir").on("click", function(event){
		
			
		var tranCode = $(event.target).children('div').children('span').text().trim();	
		var prodNo = $(event.target).children('div').children('p').text().trim();	
		
		
			self.location="/purchase/updateTranCode?proTranCode="+tranCode + "&prodNo="+prodNo;
		});
		
		
		
		$(".ct_list_pop td:nth-child(3)").on(
				"click",
				function(e) {
						var prodNo = $(e.target).children('div').text().trim();
					
					$.ajax({
						type : "GET",
						contentType : "application/json",
						url : "../product/json/getProduct/" + prodNo,
						datatype : "json",
						success : function(Data) {

							var fileName = Data.fileName;

							$('.abc p img').attr('src',
									'/images/uploadFiles/' + fileName).attr(
									'width', '250px').attr('height', '250px');//사진크기수정

						}
					})

					$(".abc").dialog({
						draggable : false, //창 드래그 못하게
						modal : true,
						resizable : true,
						position : {
							my : "center",
							at : "center",
							of : "#content"
						},
						buttons : { // dialog 하단 버튼들
							제품상세보기 : function() {
								readProduct(prodNo);
							}, // dialog 하단 버튼 클릭시 실행할 함수. (함수는 $.ready안에 선언되어있어야 한다.)
							닫기 : function() {
								$(this).dialog("close"); // button 실행을 직접 선언하려면 function안에 기능을 써준다.
							}
						}
					})
				});
		

		
	});
	

</script>
</head>


<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>구매 목록조회</h3>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
	
		</div>

      <table class="table table-hover table-striped" >
      
        <thead>
        
          <tr>
            <th align="center">No</th>
             <th align="center"></th>
            <th align="left" >회원 ID</th>
             <th align="center"></th>
            <th align="left">회원명</th>
             <th align="center"></th>
            <th align="left">전화번호</th>
      		  <th align="center"></th>
            <th align="left">배송현황</th>
            <th align="left">정보수정</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
				<c:forEach var="purchase" items="${list}">
					<c:set var="i" value="${ i+1 }" />
					<tr class="ct_list_pop">
						<td align="center">
<%-- 							href="/purchase/getPurchase?prodNo=${purchase.getPurchaseProd().getProdNo() }">${i}</a> --%>
							${i}
							<div class="purchaseNo" style="display:none">
							${purchase.getPurchaseProd().getProdNo() }
							</div>
						</td>
						<td></td>
						<td align="left">
						
						
						<div class="abc" title="상품 이미지" style="display: none">
								<p>
									<img />
								</p>
							</div>
						
						
						${user.getUserId()}
						<div class="prodd" style="display:none">
							${purchase.getPurchaseProd().getProdNo() }
							</div>
						
						
						</td>
						<td></td>
						<td align="left">${user.getUserName() }</td>
						<td></td>
						<td align="left">${purchase.getReceiverPhone() }</td>
						<td></td>
						<td align="left">
						<c:if test="${purchase.getTranCode().trim() eq '1' }">
							현재 구매완료 상태 입니다.
						</c:if>
						<c:if test="${purchase.getTranCode().trim() eq '2' }">
							현재 배송중 상태 입니다.
						</c:if>
						<c:if test="${purchase.getTranCode().trim() eq '3' }">
							현재 배송완료 상태 입니다.
						</c:if>
						</td>
<!-- 						<td align="left"></td> -->
						<c:if
							test="${not empty purchase.getTranCode().trim() && purchase.getTranCode().trim() eq '2' }">
							<td class="dir" align="left">
							물건도착
<!-- 							<a -->
<%-- 								href="/purchase/updateTranCode?proTranCode=${purchase.getTranCode().trim() }&prodNo=${purchase.getPurchaseProd().getProdNo()}">물건도착</a> --%>
							<div  style="display:none">
							
							<span title="tranCode">${purchase.getTranCode().trim() }</span>
							<p title="prodNo"> ${purchase.getPurchaseProd().getProdNo()}  </p>
							</div>
							</td>
						</c:if>
					</tr>
					
				</c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>
</html>