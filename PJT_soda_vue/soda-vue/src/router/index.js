import BoardView from '@/views/BoardView.vue'
import DetailView from '@/views/DetailView.vue'
import JoinView from '@/views/JoinView.vue'
import LoginView from '@/views/LoginView.vue'
import MainPageView from '@/views/MainPageView.vue'
import WriteView from '@/views/WriteView.vue'
import { createRouter, createWebHistory } from 'vue-router'
import DetailView from '@/views/DetailView.vue'
import LoginView from '@/views/LoginView.vue'
import Home from '@/components/Home.vue'
import MainPageView from '@/views/MainPageView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'Home',
      component: MainPageView
    },
    {
      path: '/board',
      name: 'Board',
      component: BoardView,
    },
    {
      path: '/write',
      name: 'Write',
      component: WriteView,
    },
    {
      path: '/join',
      name: 'Join',
      component: JoinView,
    },
    {
      path: '/detailboard', //:id는 동적 라우트 파라미터
      name: 'DetailBoard',
      component: DetailView
    },
    {
      path: '/login',
      name: 'Login',
      component: LoginView
    },

  ],


})



export default router
