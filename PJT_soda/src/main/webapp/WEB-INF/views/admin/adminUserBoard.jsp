 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<<<<<<< Updated upstream
<meta charset="UTF-8">
<title>User Board</title>
=======

    <meta charset="UTF-8">
    <title>User Board</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        /* 전체 레이아웃 스타일 */
        .user-board,
        .user-board * {
            box-sizing: border-box;
        }

        .user-board {
            background: #ffffff;
            min-height: 100vh;
            position: relative;
            padding-left: 93px;
            padding-top: 95px; /* 헤더와의 간격을 위해 약간 증가 */
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        /* 테이블 컨테이너 스타일 */
        .rectangle-34 {
            background: #fdfdfd;
            border-radius: 19px;
            width: 90%;
            max-width: 1200px;
            height: 513px;
            margin: 0 auto;
            padding: 0;
            overflow: hidden;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        .user-table-container {
            width: 100%;
            height: 100%;
            padding: 1rem;
            overflow-y: auto;
        }

        /* 테이블 스타일 */
        .user-table {
            width: 100%;
            margin: 0 auto;
            border-collapse: collapse;
            background: white;
        }

        .user-table th {
            background: #f8f9fa;
            padding: 1rem 1.5rem;
            text-align: center;
            font-family: sans-serif;
            font-size: 16px;
            color: #333;
            border-bottom: 2px solid #dee2e6;
            position: sticky;
            top: 0;
            z-index: 1;
        }

        .user-table td {
            padding: 1rem 1.5rem;
            text-align: center;
            border-bottom: 1px solid #dee2e6;
            font-family: sans-serif;
            font-size: 14px;
        }

        /* 행 호버 효과 */
        .user-table tbody tr {
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .user-table tbody tr:hover {
            background-color: #f8f9fa;
        }
        
        /* 반응형 디자인을 위한 미디어 쿼리 */
        @media (max-width: 1200px) {
            .rectangle-34 {
                width: 95%;
            }
        }

        @media (max-width: 768px) {
            .user-board {
                padding-left: 73px; /* 모바일에서는 사이드바 너비 줄임 */
            }
            
            .user-table th,
            .user-table td {
                padding: 0.75rem 1rem;
                font-size: 14px;
            }
        }
    </style>
>>>>>>> Stashed changes
</head>
<style>
.user-board,
.user-board * {
  box-sizing: border-box;
}
.user-board {
  background: #ffffff;
  height: 811px;
  position: relative;
  overflow: hidden;
}
.rectangle-1 {
  background: #f9f9f9;
  width: 93px;
  height: 810px;
  position: absolute;
  left: 0px;
  top: 0px;
}
.list-of-parts {
  width: 37px;
  height: 50px;
  position: absolute;
  left: 27px;
  top: 528px;
  object-fit: cover;
}
.selected {
  position: absolute;
  inset: 0;
}
.rectangle-4 {
  background: #1678f3;
  border-radius: 22px;
  width: 53px;
  height: 53px;
  position: absolute;
  left: 18px;
  top: 311px;
  box-shadow: 0px 6px 4px 0px rgba(0, 0, 0, 0.1);
}
.customer {
  width: 35px;
  height: 35px;
  position: absolute;
  left: 27px;
  top: 320px;
  object-fit: cover;
}
.rectangle-2 {
  background: #f3f3f3;
  width: 93px;
  height: 75px;
  position: absolute;
  left: 0px;
  top: 0px;
}
.rectangle-3 {
  background: #fcfcfc;
  width: 1240px;
  height: 75px;
  position: absolute;
  left: 96px;
  top: 0px;
}
.rectangle-39 {
  background: #f3f3f3;
  border-radius: 9px;
  border-style: solid;
  border-color: #353535;
  border-width: 0.5px;
  width: 347px;
  height: 37px;
  position: absolute;
  left: 153px;
  top: 129px;
  transform-origin: 0 0;
  transform: rotate(0deg) scale(1, -1);
}

.rectangle-34 {
  background: #fdfdfd;
  border-radius: 19px;
  width: 1111px;
  height: 513px;
  position: absolute;
  left: 159px;
  top: 250px;
}
.div {
  color: #000000;
  text-align: center;
  font-family: "RoundedMplus1C-Regular", sans-serif;
  font-size: 20px;
  font-weight: 400;
  position: absolute;
  left: 242px;
  top: 212px;
  width: 95px;
  height: 20px;
  display: flex;
  align-items: center;
  justify-content: center;
}
.div2 {
  color: #000000;
  text-align: center;
  font-family: "RoundedMplus1C-Regular", sans-serif;
  font-size: 20px;
  font-weight: 400;
  position: absolute;
  left: 378px;
  top: 212px;
  width: 81px;
  height: 20px;
  display: flex;
  align-items: center;
  justify-content: center;
}
.div3 {
  color: #000000;
  text-align: center;
  font-family: "RoundedMplus1C-Regular", sans-serif;
  font-size: 20px;
  font-weight: 400;
  position: absolute;
  left: 473px;
  top: 212px;
  width: 167px;
  height: 20px;
  display: flex;
  align-items: center;
  justify-content: center;
}
.div4 {
  color: #000000;
  text-align: center;
  font-family: "RoundedMplus1C-Regular", sans-serif;
  font-size: 20px;
  font-weight: 400;
  position: absolute;
  left: 731px;
  top: 212px;
  width: 137px;
  height: 20px;
  display: flex;
  align-items: center;
  justify-content: center;
}
.div5 {
  color: #000000;
  text-align: center;
  font-family: "RoundedMplus1C-Regular", sans-serif;
  font-size: 20px;
  font-weight: 400;
  position: absolute;
  left: 1072px;
  top: 216px;
  width: 109px;
  height: 20px;
  display: flex;
  align-items: center;
  justify-content: center;
}
.user-board2 {
  color: #000000;
  text-align: left;
  font-family: "RoundedMplus1C-Regular", sans-serif;
  font-size: 35px;
  font-weight: 400;
  position: absolute;
  left: 120px;
  top: 11px;
}
.export {
  width: 35px;
  height: 35px;
  position: absolute;
  left: 27px;
  top: 728px;
  object-fit: cover;
}
.ellipse-1 {
  border-radius: 50%;
  width: 53px;
  height: 59px;
  position: absolute;
  left: 1898px;
  top: 31px;
  object-fit: cover;
}
.dashboard-layout {
  width: 35px;
  height: 35px;
  position: absolute;
  left: 27px;
  top: 439px;
  object-fit: cover;
}
.online-store {
  width: 53px;
  height: 57px;
  position: absolute;
  left: 19px;
  top: 203px;
  object-fit: cover;
}
.group-131 {
  position: absolute;
  inset: 0;
}
.div6 {
  color: #ffffff;
  text-align: left;
  font-family: "RoundedMplus1C-Regular", sans-serif;
  font-size: 25px;
  font-weight: 400;
  position: absolute;
  left: 1068.91px;
  top: 139.03px;
  width: 167.55px;
  height: 30.94px;
}
.group-127 {
  width: 244.98px;
  height: 51px;
  position: static;
}
.rectangle-40 {
  background: #ff74a6;
  border-radius: 13px;
  width: 244.98px;
  height: 51px;
  position: absolute;
  left: 1025px;
  top: 129px;
}
.div7 {
  color: #ffffff;
  text-align: center;
  font-family: "RoundedMplus1C-Regular", sans-serif;
  font-size: 25px;
  font-weight: 400;
  position: absolute;
  left: 1063px;
  top: 136px;
  width: 167.55px;
  height: 30.94px;
}
._2024-10-29-21-13 {
  color: #000000;
  text-align: left;
  font-family: "Inter-Regular", sans-serif;
  font-size: 20px;
  font-weight: 400;
  position: absolute;
  left: 1041px;
  top: 89px;
  width: 212px;
  height: 26px;
}
.div8 {
  color: #000000;
  text-align: center;
  font-family: "RoundedMplus1C-Regular", sans-serif;
  font-size: 20px;
  font-weight: 400;
  position: absolute;
  left: 920px;
  top: 212px;
  width: 71px;
  height: 19px;
  display: flex;
  align-items: center;
  justify-content: center;
}

/* 새로 추가된 테이블 스타일 */
/* 수정된 테이블 컨테이너 스타일 */
.user-table-container {
  width: 100%;
  height: 100%;
  padding: 0; /* 패딩 제거 */
  overflow-y: auto;
}

/* 수정된 테이블 스타일 */
.user-table {
  width: 100%; /* 너비 100%로 설정 */
  margin: 0; /* 마진 제거 */
  border-collapse: collapse;
  background: white;
}

/* 테이블 헤더 스타일 수정 */
.user-table th {
  background: #f8f9fa;
  padding: 15px;
  text-align: center;
  font-family: sans-serif;
  font-size: 16px;
  color: #333;
  border-bottom: 2px solid #dee2e6;
  position: sticky; /* 헤더 고정 */
  top: 0; /* 헤더 고정 */
  z-index: 1; /* 헤더가 내용 위에 보이도록 */
}

/* 테이블 셀 스타일 수정 */
.user-table td {
  padding: 15px;
  text-align: center;
  border-bottom: 1px solid #dee2e6;
  font-family: sans-serif;
  font-size: 14px;
}

/* rectangle-34 스타일 수정 */
.rectangle-34 {
  background: #fdfdfd;
  border-radius: 19px;
  width: 1111px;
  height: 513px;
  position: absolute;
  left: 159px;
  top: 250px;
  padding: 0; /* 패딩 제거 */
  overflow: hidden; /* 내용이 넘치지 않도록 */
}

.date-info {
   color: #000000;
   text-align: left;
   font-family: "Inter-Regular", sans-serif;
   font-size: 20px;
   font-weight: 400;
   position: absolute;
   left: 1041px;
   top: 89px;
   width: 250px;
   height: 26px;
}

</style>

<body>
<div class="user-board">
  <div class="rectangle-1"></div>
  <img class="list-of-parts" src="list-of-parts0.png" />
  <div class="rectangle-4"></div>
  <img class="customer" src="customer0.png" />
  <div class="rectangle-2"></div>
  <div class="rectangle-3"></div>
  <div class="rectangle-39"></div>
  
  <!-- User Table 추가 -->
  <div class="rectangle-34">
    <div class="user-table-container">
      <table class="user-table">
        <thead>
          <tr>
            <th>아이디</th>
            <th>이름</th>
            <th>성별</th>
            <th>생일</th>
            <th>핸드폰 번호</th>
            <th>가입일자</th>
            <th>...</th>
          </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="user" >
          <tr onclick="location.href='${pageContext.request.contextPath}/admin/adminUserDetail?no=${user.userNo}'">
            <td>${user.userId}</td>
            <td>${user.name}</td>
            <td>${user.gender}</td>
            <td>${user.birthDate}</td>
            <td>${user.phoneNumber}</td>
            <td>${user.userRegDate}</td>
            <td>...</td>
          </tr>
          
          </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
  
  <div class="user-board2">User Board</div>
  <img class="export" src="export0.png" />
  <img class="ellipse-1" src="ellipse-10.png" />
  <img class="dashboard-layout" src="dashboard-layout0.png" />
  <img class="online-store" src="online-store0.png" />
  <div class="div6">신고된 게시글</div>
  <div class="group-127">
    <div class="rectangle-40"></div>
    <div class="div7">신고된 유저</div>
  </div>
 	<div class="date-info">실시간 날짜 기준</div>



</div>
  <script>
   function updateDateTime() {
       const now = new Date();
       const options = { 
           year: 'numeric', 
           month: '2-digit', 
           day: '2-digit',
           hour: '2-digit', 
           minute: '2-digit',
           hour12: false 
       };
       
       document.querySelector('.date-info').textContent = 
           now.toLocaleString('ko-KR', options).replace(',', '') + ' 기준';
   }

   // 페이지 로드 시 초기 실행
   updateDateTime();

   // 1분마다 업데이트
   setInterval(updateDateTime, 60000);
   </script>



</body>
</html>