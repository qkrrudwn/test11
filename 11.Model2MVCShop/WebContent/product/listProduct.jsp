<%@ page contentType="text/html; charset=euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="utf-8">
<title>ȸ�� �����ȸ</title>
<link
	href="https://fonts.googleapis.com/css?family=Stylish&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/css/admin.css" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Stylish&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
  
	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage);

		$("form").attr("method", "POST").attr("action", "/product/listProduct")
				.submit();
	}
	
	function readProduct(prodNo){
		
		self.location = "/product/getProduct?prodNo="+prodNo+ "&menu=${param.menu}";
			
		
	}

	$(function() {

		$("td.ct_btn01:contains('�˻�')").on("click", function() {
			fncGetList(1);
		});

		$(".ct_list_pop td:nth-child(3)").css("color", "red");

		$("h7").css("color", "red");

		$(".ct_list_pop td:nth-child(3)").on(
				"click",
				function() {

 					var prodNo = $(this).find('div').text().trim();
					
					
					$.ajax({
						type:"GET",
						contentType: "application/json",
						url:"../product/json/getProduct/"+prodNo,
						datatype:"json",
						success: function(Data){
											
							var fileName = Data.fileName;

							$('.abc p img').attr('src', '/images/uploadFiles/'+fileName).attr('width','250px').attr('height','250px');//����ũ�����

						}
					})			
					
					$(".abc").dialog({
		                draggable:false, //â �巡�� ���ϰ�
		                modal:true,
		                resizable:true,
 		                position:
		                   { my:"center",
		                    at:"center",
		                    of:"#content" 
		                    },
					  buttons : {            // dialog �ϴ� ��ư��
				            ��ǰ�󼼺��� : function(){
				            	readProduct(prodNo);
				            },    // dialog �ϴ� ��ư Ŭ���� ������ �Լ�. (�Լ��� $.ready�ȿ� ����Ǿ��־�� �Ѵ�.)
				            �ݱ� : function() {
				                $(this).dialog("close"); // button ������ ���� �����Ϸ��� function�ȿ� ����� ���ش�.
				            }
				        }
		            })		
				});

		$(".ct_list_pop:nth-child(4n+6)").css("background-color", "whitesmoke");
		//console.log ( $(".ct_list_pop:nth-child(1)" ).html() );
		//console.log ( $(".ct_list_pop:nth-child(2)" ).html() );
		//console.log ( $(".ct_list_pop:nth-child(3)" ).html() );
		//console.log ( $(".ct_list_pop:nth-child(4)" ).html() ); //==> ok
		//console.log ( $(".ct_list_pop:nth-child(5)" ).html() ); 
		//console.log ( $(".ct_list_pop:nth-child(6)" ).html() ); //==> ok
		//console.log ( $(".ct_list_pop:nth-child(7)" ).html() ); 
		 
			 $.ajax({
					
					type:"GET",
					contentType: 'application/json',
					url:"/product/json/productGetName",
					dataType:"json",
					success: function(Data){
						
						 $( ".auto" ).autocomplete({
						      source: Data					
						   });	
					}
				});
	}); 

</script>
<style type="text/css">
h1, h2, h3, h4, h5, h6, p, li, a, td, tr {
	font-family: 'Stylish', sans-serif
}
</style>

</head>

<body bgcolor="#ffffff" text="#000000">

	<div style="width: 98%; margin-left: 10px;">

		<form name="detailForm">

			<table width="100%" height="37" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
						width="15" height="37"></td>
					<td background="/images/ct_ttl_img02.gif" width="100%"
						style="padding-left: 10px;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="93%" class="ct_ttl01">�ǸŰ������</td>
							</tr>
						</table>
					</td>
					<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
						width="12" height="37"></td>
				</tr>
			</table>
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>

					<td align="right"><select name="searchCondition"
						class="ct_input_g" style="width: 80px">
							<option value="0"
								${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
							<option value="1"
								${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
							<option value="2"
								${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ����</option>
					</select> <input type="text" name="searchKeyword" class="auto"
						style="width: 200px; height: 19px"></td>
					<td align="right" width="70">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="17" height="23"><img
									src="/images/ct_btnbg01.gif" width="17" height="23"></td>
								<td background="/images/ct_btnbg02.gif" class="ct_btn01"
									style="padding-top: 3px;">�˻�
								<td width="14" height="23"><img
									src="/images/ct_btnbg03.gif" width="14" height="23"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td colspan="11">��ü ${resultPage.totalCount } �Ǽ�, ����
						${resultPage.currentPage} ������</td>
				</tr>
				<tr>
					<td class="ct_list_b" width="150">No</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">��ǰ��</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">����</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">�����</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">�������</td>

				</tr>
				<tr>
					<td colspan="11" bgcolor="808285" height="1"></td>
				</tr>

				<c:set var="i" value="0" />
				<c:forEach var="product" items="${list}">
					<c:set var="i" value="${ i+1 }" />
					<tr class="ct_list_pop">
						<td align="center">${ i }</td>
						<td></td>
						<td align="left">
							<div class="abc" title="��ǰ �̹���" style="display: none">
								<p>
									<img />
								</p>
							</div> ${product.getProdName()}
							<div id="producvalue" style="display: none">
								${product.getProdNo()}</div>
						</td>
						<td></td>
						<td align="left">${product.getPrice()}</td>
						<td></td>
						<td align="left">${product.getRegDate()}</td>
						<td></td>
						<td align="left"><c:if test="${ empty product.proTranCode}">
							�Ǹ���
						</c:if> <c:if test="${ product.getProTranCode().trim() eq '1'}">
							���ſϷ�
							<c:if test="${param.menu eq null || param.menu == 'manage' }">
									<a
										href="/purchase/updateTranCode?proTranCode=${product.getProTranCode().trim() }&prodNo=${product.getProdNo()}">����ϱ�</a>
								</c:if>

							</c:if></td>
					</tr>
					<tr>
						<td colspan="11" bgcolor="D6D7D6" height="1"></td>
					</tr>
				</c:forEach>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td align="center"><input type="hidden" id="currentPage"
						name="currentPage" value="" /> <jsp:include
							page="../common/pageNavigator.jsp" /></td>
				</tr>
			</table>

		</form>
	</div>

</body>
</html>