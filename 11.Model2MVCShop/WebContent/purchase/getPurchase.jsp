<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<html>
<head>													
<title>��ǰ���</title>
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



$(function(){
	$("button.btn.btn-primary").on("click",function(){
		var url = "/purchase/updatePurchaseView?prodNo="+${purchase.getPurchaseProd().getProdNo()};
		//var prodNo = ${purchase.getPurchaseProd().getProdNo()};
		self.location= url
		//$("form").attr("method","get").attr("action","/purchase/updatePurchaseView").submit();
	});
	
	$("a[href='#' ]").on("click",function(){
		self.location="listPurchase"
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
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">���Ż���ȸ</h3>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" name="detailForm" >
		
		<div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��ȣ</label>
		    <div class="col-sm-4">
		       ${purchase.getPurchaseProd().getProdNo() }
		    </div>
		  </div>
		
		   <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">�����ھ��̵�</label>
		    <div class="col-sm-4">
		  	${user.getUserId()}
		    </div>
		  </div>
		  <div class="purchaseNo" style="display:none">
							${purchase.getPurchaseProd().getProdNo() }
							</div>
		  
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">���Ź��</label>
		     <div class="col-sm-2">
		     ${ purchase.getPaymentOption()}
		    </div>
		  </div>
		  
		  
		  
		  
		  
		   <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">�������̸�</label>
		    <div class="col-sm-4">
		  
		    ${purchase.getReceiverName() }
		    </div>
		  </div>
		  
		  
		  
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">�����ڿ���ó</label>
		    <div class="col-sm-4">
		    ${purchase.getReceiverPhone() }
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">�������ּ�</label>
		    <div class="col-sm-4">
		    ${ purchase.getDivyAddr()}
		    </div>
		  </div>
		  
		  
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">���ſ�û����</label>
		    <div class="col-sm-4">
		    ${purchase.getDivyRequest() }
		    </div>
		  </div>
		  
		  
		  
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
		    <div class="col-sm-4">
		   ${purchase.getDivyDate() }
		    </div>
		  </div>
		  
		  
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">�ֹ���</label>
		    <div class="col-sm-4">
		    ${purchase.getOrderDate() }
		    </div>
		  </div>
		
		
		
		  
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >��&nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">Ȯ��</a>
		    </div>
		  </div>
		</form>
	    
 	</div>

</body>
</html>