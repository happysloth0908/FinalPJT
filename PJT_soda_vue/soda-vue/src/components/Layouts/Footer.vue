<template>
  <footer>
    <div class="footer-container">
      <div class="footer-main">
        <div class="footer-search">
          <div class="search-container">
            <input type="text" placeholder="검색어를 입력하세요" class="search-input">
            <button type="submit" class="search-btn">
              <i class="bi bi-search"></i>
            </button>
          </div>
        </div>

        <div class="footer-nav">
          <nav class="nav-menu">
            <RouterLink :to="{name: 'Home'}"><div class="nav-item">Home</div></RouterLink>
            <RouterLink :to="{name: 'Board'}"><div class="nav-item">Category</div></RouterLink>
            <div class="nav-item">About</div>
            <div class="nav-item">Contact</div>
          </nav>

          <div class="social-links">
            <a href="https://www.facebook.com/" class="social-link">
              <i class="bi bi-facebook"></i>
            </a>
            <a href="https://www.facebook.com/" class="social-link">
              <i class="bi bi-twitter"></i>
            </a>
            <a href="https://www.instagram.com/" class="social-link">
              <i class="bi bi-instagram"></i>
            </a>
            <a href="https://www.youtube.com/" class="social-link">
              <i class="bi bi-youtube"></i>
            </a>
          </div>
        </div>
      </div>

      <div class="footer-bottom">
        <p>주소 : 삼성연수원</p>
        <div class="logo-wrapper">
          <RouterLink :to="{name:'Home'}">
          <div class="logo-background">
            <img :src="logo" alt="logo" class="logo-container">
          </div>
        </RouterLink>
        </div>
       
        <a href="#" class="legal-link">법률자문</a>
      </div>
      <p class="copyright">© 2024 다영 소운 제작</p>
    </div>
  </footer>
</template>

<script setup>
import logo from '@/assets/etco-logo.gif'
import { RouterLink } from 'vue-router';
</script>

<style scoped>
footer {
  padding: 2rem;
  background: linear-gradient(to right,
    #4A90E2 0%,
    #67A6E4 50%,
    #81B9E5 100%);
  min-width: 1024px;
}

.footer-container {
  max-width: 1200px;
  margin: 0 auto;
}

.footer-main {
  display: flex;
  flex-direction: column;
  gap: 2rem;
  padding-bottom: 2rem;
  border-bottom: 1px solid rgba(255, 255, 255, 0.2);
}

/* 검색창 스타일 */
.footer-search {
  display: flex;
  justify-content: center;
}

.search-container {
  display: flex;
  align-items: center;
  background-color: rgba(255, 255, 255, 0.9);
  border-radius: 20px;
  padding: 0.3rem;
  box-shadow: 0 2px 5px rgba(74, 144, 226, 0.1);
  width: 300px;
}

.search-input {
  border: none;
  padding: 0.5rem 1rem;
  width: 100%;
  border-radius: 20px;
  font-size: 0.9rem;
  background: transparent;
}

.search-input:focus {
  outline: none;
}

.search-btn {
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  border-radius: 50%;
  border: none;
  background-color: transparent;
  padding: 0.5rem;
  color: #4A90E2;
  transition: all 0.3s ease;
}

.search-btn:hover {
  color: #67A6E4;
  background-color: rgba(74, 144, 226, 0.1);
}

/* 네비게이션 메뉴 스타일 */
.footer-nav {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0 2rem;
}

.nav-menu {
  display: flex;
  gap: 3rem;
}

.nav-item {
  color: #FFFFFF;
  padding: 0.5rem 1rem;
  cursor: pointer;
  border-radius: 4px;
  font-weight: 500;
  transition: all 0.3s ease;
}

.nav-item:hover {
  background-color: rgba(255, 255, 255, 0.15);
  transform: translateY(-2px);
}

/* 소셜 링크 스타일 */
.social-links {
  display: flex;
  gap: 1rem;
}

.social-link {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 36px;
  height: 36px;
  color: #FFFFFF;
  background-color: rgba(255, 255, 255, 0.15);
  border-radius: 50%;
  transition: all 0.3s ease;
}

.social-link:hover {
  background-color: rgba(255, 255, 255, 0.25);
  transform: translateY(-2px);
}

.social-link i {
  font-size: 1.2rem;
}

/* 하단 영역 스타일 */
.footer-bottom {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 2rem 0 0;
  color: #FFFFFF;
}

.copyright, .legal-link {
  color: #FFFFFF;
  font-size: 0.9rem;
  text-decoration: none;
}

.legal-link:hover {
  text-decoration: underline;
}

/* 로고 스타일 */
.logo-wrapper {
  flex-shrink: 0;
}

.logo-background {
  background-color: rgba(255, 255, 255, 0.15);
  backdrop-filter: blur(5px);
  padding: 0.5rem;
  border-radius: 4px;
}

.logo-container {
  width: 40px;
  height: 40px;
  object-fit: contain;
  transition: transform 0.3s ease;
  background-color: rgb(220, 237, 255);
    border-radius: 30%;
}

.logo-container:hover {
  transform: scale(1.05);
}
a {
  text-decoration: none; /* 밑줄 제거 */
  color: inherit; /* 기본 글자 색상 상속 */
}
</style>