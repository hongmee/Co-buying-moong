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
- [ERD]
<br><br>
## ⚙ 사용 기술 / 개발 환경
<table>
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

<br><br>
## 💡주요 기능
<table>
  <tr>
    <th rowspan="5">회원 기능</th>
    <tr><td>회원가입</td><td>아이디/비밀번호 찾기</td><td>로그인/등급별 메뉴</td></tr>
    <tr><td>휴대폰 인증</td><td>이메일 인증</td><td>개인정보 수정</td></tr>
    <tr><td>쪽지 주고 받기</td><td>출석 체크</td><td>회원 탈퇴</td></tr>
    <tr><td>상품 찜 하기</td><td >생일 쿠폰 발급</td><td>실시간 알림</td></tr>
  </tr>
</table>
<table>
  <tr>
    <th rowspan="5">관리자 페이지</th>
    <tr><td>전체 회원 조회</td><td>회원 등급 수정</td><td>블랙리스트 관리</td></tr>
    <tr><td>게시물 삭제 권한</td><td>실적 보고서 그래프</td><td>쿠폰 발급</td></tr>
    <tr><td>입점 문의</td><td>전체 상품 조회</td><td>상품 상태 변경</td></tr>
  </tr>
</table>
