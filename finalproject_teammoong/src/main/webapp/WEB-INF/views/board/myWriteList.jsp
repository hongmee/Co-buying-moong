<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 주최한 공구</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="content-wrap">
		<div class="mypage-wrap">
		
		<jsp:include page="/WEB-INF/views/common/myPageMenu.jsp" />
		
		<div class="mypage-right">
			<div class="mypage-right-title">내가 주최한 공구</div>
			<div class="mypage-content">
			<div class="table_box" style="margin-top: 10px;">
				<table>
					<thead>
						<tr>
							<th style="width: 5%;">No</th>
							<th style="width: 50%;">제목</th>
							<th style="width: 15%;">신청인원</th>
							<th style="width: 15%;">공구 시작일</th>
							<th style="width: 15%;">공구 마감일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="b">
							<tr>
								<td>${b.rnum }</td>
								<td style="cursor: pointer;">${b.boardName }</td>
								<td>${b.joinCnt }</td>
								<td>${b.boardStart }</td>
								<td>${b.boardEnd }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		
		</div>
	</div>
	
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>