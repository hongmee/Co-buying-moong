# 🍊뭉쳐야 산다🍊

공동구매 쇼핑몰 + 사용자 커뮤니티 사이트
- 프로젝트 기간 : 2023.03.27 ~ 2023.05.03
- 팀원 : 6명 (김규린, 김명훈, 김홍미, 안진배, 이화정, 장형천)
<br><br>
## 🖥 프로젝트 소개
기존 공동구매 쇼핑몰에서 더 나아가, 쇼핑몰이 판매하는 상품 이외에도 사용자가 원하는 상품이 있다면 <br>
사용자끼리 모여 공동구매를 진행할 수 있도록 사용자 판매의 장을 열어주는는 사이트입니다. <br>
공동구매 쇼핑몰 '공구마켓'과, 개인 창작마켓 '윗치폼'을 참고하여 만들었습니다.
<br><br>
## 🔗 관련 링크
- <a href="https://ovenapp.io/view/QdVDUh7E8Xo7oPUNfLXRt8MjZRQMW6cS/" target="_blank">UI프로토타이핑(김홍미 구현 페이지)</a>
- <a href="https://www.canva.com/design/DAFnTOp2A4c/5qmzr3gZOTlNpC5MNLagzA/view?utm_content=DAFnTOp2A4c&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink" target="_blank">ERD / 유스케이스 / 전체 UI 프로토타이핑 / 스토리보드 </a>
<br><br>
## ⚙ 사용 기술 / 개발 환경
<table border="1">
  <tr>
    <th>분류</th><th colspan="3">이름</th>
  </tr>
  <tr>
    <td>서버</td><td colspan="3">Apache Tomcat v8.5</td>
  </tr>
  <tr>
    <td>프레임워크</td><td>Spring 3.0.0</td><td>Apache Maven 3.8.6</td><td>MyBatis 3.5.11</td>
  </tr>
  <tr>
    <td>DBMS</td><td colspan="3">Oracle Database 11g Express Edition</td>
  </tr>
  <tr>
    <td rowspan="3">기술</td>
    <td>JSP</td></td><td>Servlet</td><td>JSTL 1.0</td>
  </tr>
  <tr>
    <td>JDBC 11.2.0.4</td><td>DBCP 1.4</td><td>Lombok 1.18.24</td>
  </tr>
  <tr>
    <td>JSON.simple 1.1.1</td><td>Gson 2.10</td><td>AOP</td>
  </tr>
  <tr>
    <td>개발 환경</td><td>Spring Tool Suite 3.9.13</td><td>Visual Studio Code 1.74.0</td><td>Oracle SQL Developer 21.2.1.204</td>
  </tr>
  <tr>
    <td>공용 연락망</td><td colspan="3">Slack</td>
  </tr>
  <tr>
    <td>공용 저장소</td><td colspan="3">GitHub</td>
  </tr>
  <tr>
    <td>UI 프로토타이핑</td><td colspan="3">Kakao Oven</td>
  </tr>
  <tr>
    <td>UML 다이어그램</td><td colspan="3">StarUML</td>
  </tr>
  <tr>
    <td>ERD</td><td colspan="3">ERDCloud</td>
  </tr>
  <tr>
    <td>웹 사이트 아이콘</td><td colspan="3">Piskel</td>
  </tr>
</table>
<br>

## 💡주요 기능
#### 1. 메인
카테고리 메뉴 / 최근 본 상품 / 공지사항 팝업 / 무한스크롤 <br>
/ 권한에 따라 다른 헤더 메뉴 구현 / 쪽지 실시간 알림
#### 2. 회원 기능
회원가입(인증번호 발송) / 로그인 / 회원 정보 찾기 / 회원 정보 수정 / 마이페이지 <br>
/ 쪽지 보내기 / 받은 쪽지함 / 보낸 쪽지함
#### 3. 쇼핑몰 기능
공동 주문하기 / 혼자 주문하기 / 카테고리별 상품조회 / 인기상품별 조회 <br>
/ 타임딜 상품 / 찜하기 / 찜목록 / 장바구니 / 장바구니 목록 / 리뷰 작성 / 리뷰 상세보기
#### 4. 회원 주최 공구 게시판
공구 게시판(CRUD) / 공구 참여하기 / 주최한 공구 목록 보기<br>
/ 공구 참여자 리스트 / 참여한 공구 리스트 / 다른 회원 작성 글 보기
#### 5. 관리자 페이지
매출 그래프 / 상품관리(CRUD) / 입점문의 관리 / 결제관리 / 공지사항(CRUD) / 회원관리
<br>
## 💼 김홍미 담당 기능
<table border="1">
	<tr>
		<th rowspan="2">문서</th>
		<td>유사 사이트 분석</td>
		<td>최종 보고서 작성</td>
	</tr>
	<tr>
		<td>유스케이스 다이어그램</td>
    <td>프로젝트 발표</td>
	</tr>
	<tr>
		<th>DB</th>
		<td>담당 ERD 작성</td>
		<td>DB 생성 SQL문 작성</td>
	</tr>
	<tr>
		<th>프론트엔드</th>
		<td>프로토타이핑 (헤더, 회원가입, 마이페이지)</td>
    <td>화면 구현 (헤더, 회원가입, 마이페이지)</td>
	</tr>
	<tr>
		<th rowspan="3">백엔드</th>
		<td>헤더 구현 및 Ajax로 DB 연동해 카테고리 메뉴</td>
		<td>로그인/회원가입/권한별 메뉴</td>	
	</tr>
	<tr>
		<td>마이 페이지 :<br>회원 정보 수정·회원탈퇴</td>
		<td>마이 페이지 :<br>내가 주최한 공구 조회·단체쪽지 발송</td>
	</tr>
	<tr>
		<td>마이 페이지 : <br>쪽지 조회·수신·발신·알림</td>
    <td>ID/PW 찾기·회원인증</td>
	</tr>
</table>
