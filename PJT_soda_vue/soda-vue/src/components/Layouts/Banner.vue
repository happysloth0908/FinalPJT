<script setup lang="ts">
import { RouterLink } from 'vue-router';
</script>

<!-- Banner.vue -->
<!-- Banner.vue -->
<template>
  <div class="banner">
      <div class="rectangle-1"></div>
      <div class="banner-image">
          <img src="@/assets/logo/logo.png" alt="Banner Image">
      </div>
      <div class="banner-content">
          <div class="one-more-friend">특별한 운동도 쉽고 재미있게, ETCO</div>
          <!-- <div class="thousands-more-fun">Where Passion Meets Community</div> -->
          <div class="bodytext">
              처음이라 걱정되시나요?
괜찮아요! 우리 다 같이 시작했답니다 😊
초보자 가이드부터 꿀팁까지,
여러분의 새로운 도전을 응원하는 친구들이 기다리고 있어요!
          </div>
          <div class="button-group">
              <div class="button-l2">
                  <div class="click-here2">View Intro</div>
              </div>
              <RouterLink to="/etco/chat">
              <div class="button-l">
                  <div class="click-here">🕹️Chat Bot🕹️</div>
              </div>
            </RouterLink>
          </div>
      </div>
  </div>
</template>

<style scoped>
.banner,
.banner * {
 box-sizing: border-box;
}

.banner {
 background: linear-gradient(102.87deg,
         #4A90E2 0%,
         #67A6E4 50%,
         #81B9E5 100%);
 border-radius: 20px;
 height: 450px;
 min-height: 400px;
 position: relative;
 overflow: hidden;
 width: 100%;
 max-width: 1400px; /* 배너 최대 너비 증가 */
 margin: 70px auto;
 box-shadow: 0 10px 30px rgba(74, 144, 226, 0.15);
 padding: 60px 80px; /* 내부 여백 증가 */
}

.banner-content {
 position: relative;
 z-index: 1;
 max-width: 800px; /* 컨텐츠 영역 제한 */
 margin-left: auto; /* 오른쪽 정렬 */
}

.rectangle-1 {
 background: rgba(255, 255, 255, 0.15);
 backdrop-filter: blur(5px);
 border-radius: 99px;
 width: 70%; /* 배경 요소 너비 증가 */
 height: 900px; /* 배경 요소 높이 증가 */
 position: absolute;
 left: 50%;
 top: -164px;
 transform-origin: 0 0;
 transform: rotate(19.781deg) scale(-1, 1);
 z-index: 0;
}

.one-more-friend {
 color: #FFFFFF;
 font-family: sans-serif;
 font-size: 48px; /* 글자 크기 증가 */
 line-height: 1.4;
 font-weight: bold;
 margin-bottom: 20px; /* 여백 추가 */
}

.thousands-more-fun {
 color: rgba(255, 255, 255, 0.9);
 font-family: sans-serif;
 font-size: 40px; /* 글자 크기 증가 */
 line-height: 1.4;
 font-weight: bold;
 margin-bottom: 30px; /* 여백 추가 */
}

.bodytext {
 color: rgba(255, 255, 255, 0.85);
 font-family: sans-serif;
 font-size: 16px; /* 글자 크기 증가 */
 line-height: 1.6;
 font-weight: 500;
 margin-bottom: 40px; /* 여백 추가 */
 max-width: 600px; /* 텍스트 너비 제한 */
}

.button-group {
 display: flex;
 gap: 20px; /* 버튼 사이 간격 */
}

.button-l {
 background: #FFFFFF;
 border-radius: 57px;
 padding: 16px 32px; /* 패딩 증가 */
 display: flex;
 align-items: center;
 justify-content: center;
 box-shadow: 0 4px 15px rgba(255, 255, 255, 0.2);
 cursor: pointer;
 transition: all 0.3s ease;
}

.button-l:hover {
 transform: translateY(-2px);
 box-shadow: 0 6px 20px rgba(255, 255, 255, 0.3);
}

.click-here {
 color: #4A90E2;
 font-family: sans-serif;
 font-size: 18px; /* 글자 크기 증가 */
 font-weight: 500;
}

.button-l2 {
 border-radius: 57px;
 border: 1.5px solid rgba(255, 255, 255, 0.6);
 padding: 16px 32px; /* 패딩 증가 */
 display: flex;
 align-items: center;
 justify-content: center;
 cursor: pointer;
 transition: all 0.3s ease;
}

.button-l2:hover {
 background: rgba(255, 255, 255, 0.15);
 transform: translateY(-2px);
}

.click-here2 {
 color: #FFFFFF;
 font-family: sans-serif;
 font-size: 18px; /* 글자 크기 증가 */
 font-weight: 500;
}

@media (max-width: 1024px) {
 .banner {
   padding: 40px 30px;
 }
 
 .banner-content {
   margin-left: 0;
   max-width: 100%;
 }
 
 .one-more-friend {
   font-size: 36px;
 }
 
 .thousands-more-fun {
   font-size: 32px;
 }
 
 .bodytext {
   font-size: 14px;
 }
}

@media (max-width: 768px) {
 .button-group {
   flex-direction: column;
 }
 
 .button-l, .button-l2 {
   width: 100%;
 }
}
a {
  text-decoration: none; /* 밑줄 제거 */
  color: inherit; /* 기본 글자 색상 상속 */
}
.banner {
  display: flex; /* Flexbox 레이아웃 사용 */
  justify-content: space-between; /* 요소들 사이에 공간 분배 */
  align-items: center; /* 수직 중앙 정렬 */
}

.banner-image {
  width: 40%; /* 배너의 왼쪽 40% 차지 */
  position: relative;
  z-index: 1; /* rectangle-1 위에 표시되도록 */
  padding-left: 40px; /* 왼쪽 여백 */
}

.banner-image img {
  width: 100%;
  height: auto;
  max-height: 350px; /* 이미지 최대 높이 설정 */
  object-fit: contain; /* 이미지 비율 유지 */
}

.banner-content {
  width: 60%; /* 배너의 오른쪽 60% 차지 */
  margin-left: 0; /* 기존 margin-left: auto 제거 */
  padding-left: 40px; /* 컨텐츠 영역 왼쪽 여백 */
}

/* 반응형 스타일 수정 */
@media (max-width: 1024px) {
  .banner {
    flex-direction: column; /* 모바일에서는 세로로 배치 */
  }
  
  .banner-image {
    width: 100%;
    padding: 0 0 20px 0;
  }
  
  .banner-content {
    width: 100%;
    padding-left: 0;
  }
}
</style>