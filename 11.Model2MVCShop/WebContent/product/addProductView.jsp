<%@ page contentType="text/html; charset=euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

	function fncAddProduct() {
		//Form ��ȿ�� ����
		alert("check::")
// 		var name = document.detailForm.prodName.value;
// 		var detail = document.detailForm.prodDetail.value;
// 		var manuDate = document.detailForm.manuDate.value;
// 		var price = document.detailForm.price.value;

// 		if (name == null || name.length < 1) {
// 			alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
// 			return;
// 		}
// 		if (detail == null || detail.length < 1) {
// 			alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
// 			return;
// 		}
// 		if (manuDate == null || manuDate.length < 1) {
// 			alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
// 			return;
// 		}
// 		if (price == null || price.length < 1) {
// 			alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
// 			return;
// 		}

		$("form").attr("method", "POST").attr("action", "/product/addProduct") .submit();
	}

	$(function() {

		$("button.btn.btn-primary").on("click", function() {
			fncAddProduct();
		});
	});

	$(function() {
		$("button.btn.btn-primary").on("click", function() {
			$("form")[0].reset();
		});
	});

	function resetData() {
		document.detailForm.reset();
	}
</script>
<style type="text/css">
h1, h2, h3, h4, h5, h6, p, li, a, td {
	font-family: 'Stylish', sans-serif
}
</style>
<style>
body {
	padding-top: 70px;
}
</style>

</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">��ǰ���</h3>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" name="detailForm" enctype="multipart/form-data">
		
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">�� ǰ ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName"    >
		       <span id="helpBlock" class="help-block">
		      </span>
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="password" name="detail" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
		    
		    <div class="col-sm-4">
		      
		      
		      <input type="text" class="form-control" name="manuDate" readonly="readonly" maxLength="10" minLength="6"  />
		    	&nbsp;<img src="../images/ct_icon_date.gif" width="20" height="20"
					onclick="show_calendar('document.detailForm.manuDate'	, document.detailForm.manuDate.value)" />
					
					
<!-- 		   <input type="text" name="manuDate" -->
<!-- 					readonly="readonly" class="ct_input_g" -->
<!-- 					style="width: 100px; height: 19px" maxLength="10" minLength="6" /> -->
<!-- 					&nbsp;<img src="../images/ct_icon_date.gif" width="15" height="15" -->
<!-- 					onclick="show_calendar('document.detailForm.manuDate'	, document.detailForm.manuDate.value)" /> -->
		   
		    </div>
		    
		    
		    
		  </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="userName" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�̹���</label>
		    <div class="col-sm-4">
		        <span> <input type="file" class="form-control" id="file" name="file"  ></span>
		    </div>
		 
		    
		    
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">�� &nbsp;��</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
 	
</body>
</html>