<%@page import="com.model2.mvc.service.domain.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<!DOCTYPE html>

<html>
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script type="text/javascript" src="../javascript/calendar.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
function addUpdatePurchase() {
	var url = "/purchase/updatePurchase?prodNo=${purchase.getPurchaseProd().getProdNo()}"
	
		$("form").attr("method","POST").attr("action",url).submit();
}
	
	
	$(function() {
		
		
		$("td.ct_btn01:contains('����')").on("click", function(){
		
			
			addUpdatePurchase();
			
		});

		$("td.ct_btn01:contains('���')").on("click", function() {
			history.go(-1);
		});

	});
</script>

</head>

<body bgcolor="#ffffff" text="#000000">
<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">������������</h3>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" name="detailForm" >
		
		
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">�����ھ��̵�</label>
		    <div class="col-sm-4">
		       <span id="helpBlock" class="help-block">
		      ${user.getUserId() }
		      </span>
		    </div>
		  </div>
		
		<div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">���Ź��</label>
		     <div class="col-sm-2">
		      <select class="form-control" name="paymentOption" id="paymentOption">
				  	<option value="1" >���ݱ���</option>
					<option value="2" >�ſ뱸��</option>
				</select>
		    </div>
		  </div>
		
		<div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">�������̸�</label>
		
		    <div class="col-sm-4">
		     <input type="text" class="form-control" id="receiverName" name="receiverName" value="${purchase.getReceiverName()}">
		   
		    </div>
		  </div>
		
		
		<div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">�����ڿ���ó</label>
		    <div class="col-sm-4">
		     <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${purchase.getReceiverPhone()}">
		     
		    </div>
		  </div>
		
		<div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">�������ּ�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyAddr" name="divyAddr" value="${purchase.getDivyAddr() }">
			
		    </div>
		  </div>
		
		<div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">���ſ�û����</label>
		    <div class="col-sm-4">
		     <input type="text" class="form-control" id="divyAddr" name="divyAddr" value="${purchase.getDivyRequest() }" >
		  
		    </div>
		  </div>
		
		  
		    <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">����������</label>

		    <div class="col-sm-4">
			   <input type="text" class="form-control" name="divyDate" readonly="readonly" maxLength="10" minLength="6"  />
		    	&nbsp;<img src="../images/ct_icon_date.gif" width="20" height="20"
					onclick="show_calendar('document.detailForm.divyDate'	, document.detailForm.divyDate.value)" />
		    </div> 
		  </div>
		
		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >��&nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">���</a>
		    </div>
		  </div>
		
		
		</form>
	    
 	</div>

</body>
</html>