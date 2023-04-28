<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jquery -->
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- google icon -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	<!-- css -->
	<link rel="stylesheet" href="/resources/css/admin/admin.css" />
	<link rel="stylesheet" href="/resources/css/common/default.css" />
</head>
<style>
    .adminPage-wrapper{
        background-color: #111;
        margin-top: 300px;
        
    }
    .adminPage-header{
        margin-left: 30px;
    }
    .adminPage-back{
        background-color: lightyellow;
        overflow: hidden;
    }
    .adminPage-sidebar{
        float: left;
        width: 300px;
        background-color: lightcoral;
        height: 2000px;

    }
    .adminPage-sidebar>ul>li{
        list-style-type: none;
    }
    .adminPage-main{
        background-color: lightgreen;
    }
    .adminPage-content{
        background-color: #fff;
        overflow: hidden;
    }
    .material-symbols-outlined{
        font-size: 150px;
        
    }
    .mainContent{
        float: left;
        width: 300px;
        height: 400px;
        text-align: center;
    }
    .table{
    	border: 1px solid black;
    }
    .table>tbody>tr>th{
    	border: 1px solid black;
    }
    .table>tbody>tr>td{
    	border: 1px solid black;
    }
    .searchForm{
    	display: none;
    }
    
	img {
 		 width: 100px;
 		 height: 50px;
 		 transition: transform 0.2s;
	}
	img:hover {
	 	 transform: scale(1.5);
	}


</style>
<body>
    <c:if test="${not empty sessionScope.m and sessionScope.m.memberStatus == 0}">
        <!-- 관리자일때만 페이지 보이게 세팅 -->
    </c:if>
    <div class="adminPage-wrapper" id="adminProductTable">
        <div class="adminPage-header">
            <div class="adminPage-title"><a href="/#">Moong's Admin</a></div>
        </div>
        <div class="adminPage-back">
            <jsp:include page="/WEB-INF/views/admin/adminSideNavi.jsp"/>
            <div class="adminPage-main">
                <div class="adminPage-content">
                    <div class="adminPage-search">
                        <select id="productSearchSelect">
                            <option id="searchProductNo" value="productNo">상품 번호 검색</option>
                            <option id="searchProductName" value="productName">상품 이름</option>
                            <option id="searchProductStatus" value="productStatus">상품 상태 검색</option>
                        </select>
                        <input type="text" name="productSearchBox" id="searchOption" placeholder="상태 검색시 [대기/등록/보류/만료]">
                        <!-- 상품 상태 검색 시 1,2,3,4 로 변환해주는 choose 걸어줘야 함 -->
                        <button type="button" name="searchSubmitBtn">검색</button>
                    </div>
                    <div class="adminPage-result">
                        <table class="table tbl-box">
                            <tr>
                            	<td>구분</td>
                            	<td>제품사진</td>
                                <td>상품번호</td>
                                <td>세부카테고리번호</td>
                                <td>상품이름</td>
                                <td>상품수량</td>
                                <td>남은수량</td><!-- 추가 -->
                                <td>상품가격</td>
                                <td>원가</td>
                                <td>공동구매인원수</td>
                                <td>상품할인률</td>
                                <td>상품상태</td> 
                                <td>상품상태변경</td>
                                <td>확정버튼</td>
                            </tr>
                            <c:forEach items="${productList }" var="p">
                                <tr>
                                	<td><input type="checkBox" class="checkBox"></td>
                                	<td><img src="/resources/upload/product/${p.thumbnail }"></td>
                                    <td>${p.productNo }<input type="hidden" class="productNo" value="${p.productNo }"></td>
                                    <c:choose>
                                    	<c:when test="${p.detailCategoryNo == 1}">
                                    		<td>패션</td>
                                    	</c:when>
                                    </c:choose>
                                    <c:choose>
                                    	<c:when test="${p.detailCategoryNo == 2}">
                                    		<td>뷰티</td>
                                    	</c:when>
                                    </c:choose>
                                    <c:choose>
                                    	<c:when test="${p.detailCategoryNo == 3}">
                                    		<td>식품</td>
                                    	</c:when>
                                    </c:choose>
                                    <c:choose>
                                    	<c:when test="${p.detailCategoryNo == 4}">
                                    		<td>생활용품</td>
                                    	</c:when>
                                    </c:choose>
                                    <c:choose>
                                    	<c:when test="${p.detailCategoryNo == 5}">
                                    		<td>가전/디지털</td>
                                    	</c:when>
                                    </c:choose>
                                    <c:choose>
                                    	<c:when test="${p.detailCategoryNo == 6}">
                                    		<td>가구</td>
                                    	</c:when>
                                    </c:choose>
                                    <c:choose>
                                    	<c:when test="${p.detailCategoryNo == 7}">
                                    		<td>침구</td>
                                    	</c:when>
                                    </c:choose>
                                    <c:choose>
                                    	<c:when test="${p.detailCategoryNo == 8}">
                                    		<td>인테리어</td>
                                    	</c:when>
                                    </c:choose>
                                    <c:choose>
                                    	<c:when test="${p.detailCategoryNo == 9}">
                                    		<td>공구</td>
                                    	</c:when>
                                    </c:choose>
                                    <c:choose>
                                    	<c:when test="${p.detailCategoryNo == 10}">
                                    		<td>스포츠/레저/취미</td>
                                    	</c:when>
                                    </c:choose>
                                    <c:choose>
                                    	<c:when test="${p.detailCategoryNo == 11}">
                                    		<td>출산/유아동</td>
                                    	</c:when>
                                    </c:choose>
                                    <c:choose>
                                    	<c:when test="${p.detailCategoryNo == 12}">
                                    		<td>반려용품</td>
                                    	</c:when>
                                    </c:choose>
                                    <c:choose>
                                    	<c:when test="${p.detailCategoryNo == 13}">
                                    		<td>명품관</td>
                                    	</c:when>
                                    </c:choose>
                                    <c:choose>
                                    	<c:when test="${p.detailCategoryNo > 13}">
                                    		<td>테스트용인듯</td>
                                    	</c:when>
                                    </c:choose>
                                    <td>${p.productName }<input type="hidden" class="productName" value="${p.productName }"></td>
                                    <td>${p.productEa }</td>
                                    <td>${p.presentCnt }</td>
                                    <td>${p.productPrice }</td>
                                    <td>${p.productCost }</td>
                                    <td>${p.gongguNumber }</td>
                                    <td>${p.productDiscount }%</td>
                                   	<c:choose>
                                   		<c:when test="${p.productStatus == 1 }">
                                   			<td>대기</td>
                                   		</c:when>
                                   		<c:when test="${p.productStatus == 2 }">
                                   			<td>등록</td>
                                   		</c:when>
                                   		<c:when test="${p.productStatus == 3 }">
                                   			<td>보류</td>
                                   		</c:when>
                                   		<c:when test="${p.productStatus == 4 }">
                                   			<td>만료</td>
                                   		</c:when>
                                   	</c:choose>
                                    <td>
	                                    <c:choose>
	                                    	<c:when test="${p.productStatus == 1 }">
		                                    	<select class="productStatusList" id="productStatusList">
		                                            <option value="1" selected>대기</option>
		                                            <option value="2">등록</option>
		                                            <option value="3">보류</option>
		                                            <option value="4">만료</option>
		                                        </select>
	                                    	</c:when>
	                                    	<c:when test="${p.productStatus == 2 }">
		                                    	<select class="productStatusList" id="productStatusList">
		                                            <option value="1">대기</option>
		                                            <option value="2" selected>등록</option>
		                                            <option value="3">보류</option>
		                                            <option value="4">만료</option>
		                                        </select>
	                                    	</c:when>
	                                    	<c:when test="${p.productStatus == 3 }">
		                                    	<select class="productStatusList" id="productStatusList">
		                                            <option value="1">대기</option>
		                                            <option value="2">등록</option>
		                                            <option value="3" selected>보류</option>
		                                            <option value="4">만료</option>
		                                        </select>
	                                    	</c:when>
	                                    	<c:when test="${p.productStatus == 4 }">
		                                    	<select class="productStatusList" id="productStatusList">
		                                            <option value="1">대기</option>
		                                            <option value="2">등록</option>
		                                            <option value="3">보류</option>
		                                            <option value="4" selected>만료</option>
		                                        </select>
	                                    	</c:when>
	                                    </c:choose>
	                                </td>
                                    <td>
                                    	<button type="button" class="changeProductStatusBtn">상품 상태 변경</button>
                                    </td>
                                </tr>
                            </c:forEach>
                            <tr>
                                <th colspan="14">${pageNavi}</th>
                            </tr>
                            <tr>
                                <th colspan="2"><button type="button" name="allChangeProductStatus">일괄 변경</button></th>
                            </tr>
                        </table>
                   	 </div>
                     <div id="ajaxResult" class="table"></div>
                </div>
            </div>
            
        </div>
    </div>

<!-- 스크립트를 넣어봅시다 -->
    <script>
    /* 상태 변경 */
	$(".changeProductStatusBtn").on("click",function(){
		var productNo = $(this).parent().parent().children().eq(1).text();
		var productStatus = $(this).parent().prev().children().val();

		console.log(productStatus);
		console.log(productNo);
		
        $.ajax({
            url: "/ajaxChangeProductStatus.do",
            type: "POST",
            data: {productStatus : productStatus, productNo : productNo},
            success: function(data) {
            	if(data == "ok"){
            		$("#adminProductTable").load(location.href+ '#adminProductTable');
            	}else{
    				console.log("다시 시도");
            		
            	}
            }
        })
		
	});
	
	 
    /* 일괄 변경 */
    
    $("[name=allChangeProductStatus]").on("click",function(){
    	const check = $(".checkBox:checked");
		if(check.length == 0){
			alert("선택된 회원이 없습니다.");
			return;
		}
			const no = new Array();
			//체크된 회원의 등급을 저장할 배열
			const level = new Array();
			//체크된 체크박스 기준으로 회원번호, 등급을 찾아서 배열에 넣는 작업
			
			check.each(function(index, item){
				const productNo = $(item).parent().next().text();
				no.push(productNo);
				//check기준으로 td -> tr -> 후손중에 select찾기
				const productStatus = $(item).parent().parent().find("select").val();
				level.push(productStatus);
			});
			
			location.href="/checkedChangeProductStatus.do?no="+no.join("/")+"&level="+level.join("/");
            
	});
            
        
        
        /* 검색기능 */
        $("[name=searchSubmitBtn]").on("click",function(){
       	 var productSearchOption = $("#productSearchSelect option:selected").val();
         var productNo = $("#searchProductNo").val();
       	 var productName = $("#searchProductName").val();
       	 var productStatus = $("#searchProductStatus").val();
       	 var productSearchBox = $("[name=productSearchBox]").val();
       	 
       	 if(productSearchOption == 'productNo'){
       		productNo = productSearchBox;
       		productName = '';
       		productStatus = 0;
       	 }else if(productSearchOption == 'productName'){
       		productName = productSearchBox;
       		productStatus = 0;
       		productNo = 0;
       	 }else if(productSearchOption == 'productStatus'){
       		 if(productSearchBox == '대기'){
	       		productStatus = 1;
       		 }else if(productSearchBox == '등록'){
       			productStatus = 2; 
       		 }else if(productSearchBox == '보류'){
       			productStatus = 3; 
       		 }else if(productSearchBox == '만료'){
       			productStatus = 4; 
       		 }
	       		productName = '';
	       		productNo = 0;
       	 }
       	 
        	 $.ajax({
                url: "/ajaxAdminSearchProduct.do",
                type: "POST",
                data: {productNo : productNo, productName : productName, productStatus : productStatus},
                success: function(data) {
                	if(data){
                		$("#ajaxResult").empty();
                			$(".adminPage-result").hide();
							const table =$("<table>");
							const titleTr = $("<tr>");
							titleTr.html("<th>구분</th><th>상품번호</th><th>세부카테고리번호</th><th>상품이름</th><th>상품수량</th><th>상품가격</th><th>원가</th><th>공동구매인원수</th><th>상품내용</th><th>상품할인률</th><th>상품상태</th>");
							table.append(titleTr);
							for(let i=0;i<data.length;i++){
								const tr = $("<tr>");
								tr.append("<td>"+"</td>")
								tr.append("<td>"+data[i].productNo+"</td>");
								tr.append("<td>"+data[i].dCategoryId+"</td>");
								tr.append("<td>"+data[i].productName+"</td>");
								tr.append("<td>"+data[i].productEa+"</td>");
								tr.append("<td>"+data[i].productPrice+"</td>");
								if(productStatus == 1){
									tr.append("<td>대기</td>");
								}else if(productStatus == 2){
									tr.append("<td>등록</td>");
								}else if(productStatus == 3){
									tr.append("<td>보류</td>");
								}else if(productStatus == 4){
									tr.append("<td>만료</td>");
								}
								tr.append("<td>"+data[i].productCost+"</td>");
								tr.append("<td>"+data[i].gongguNumber+"</td>");
								tr.append("<td>"+data[i].productContent+"</td>");
								tr.append("<td>"+data[i].productDiscount+"</td>");
								table.append(tr);
						}
						$("#ajaxResult").append(table);
                		
                	}else{
	    				console.log("다시 시도");
                	}
                }
            })
       		 
        });
        
        /* 페이지 연결 */
        $(".tbl-box").on("click", 'td',function(){
        	var productNo = $(this).parent().children().eq(2).text();
        	console.log(productNo);
   			window.open('http://192.168.10.143/productView.do?productNo='+productNo);
    	});
        	
   	
   	
        
    </script>
</body>
</html>