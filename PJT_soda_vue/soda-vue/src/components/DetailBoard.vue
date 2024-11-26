<template>
  <div class="board-container" v-if="store.board">
    <div class="board-detail">
      <div class="category-wrapper">
        <h2 class="category">{{ store.board.category }}</h2>
      </div>
      <div class="detail-content">
        <div class="title-section">
          <div class="title">{{ store.board.title }}</div>
      
          <div class="meta-info">
            <span class="writer">{{ store.board.writer }}</span>
            <span class="date">{{ formatDate(store.board.regDate) }}</span>
            <span class="view-count">조회 {{ store.board.viewCnt }}</span>
            <button class="report-button" @click="handleReport">
              🚨 신고
            </button>
          </div>
        </div>

        <div class="main-content">
          <div class="text-content ql-editor" v-html="sanitizedContent" ></div>
          <div class="like-section">
            <button class="like-button" :class="{ 'liked': isLiked }" @click="handleLike">
              ❤️ {{ store.board.likesCnt }}
            </button>
          </div>
        </div>

        <div class="button-section">
          <div class="action-buttons" v-if="isWriter">
            <router-link :to="`/detailboard/update/${route.params.no}`" class="edit-link">
              <span>✏️ 수정</span>
            </router-link>
            <router-link to="" class="delete-link" @click.prevent="deleteBoard">
              <span>🗑️ 삭제</span>
            </router-link>
          </div>
          <button class="list-button" @click="goToList">목록</button>
        </div>
      </div>

      <div class="comment-section">
      <!-- route.params.no를 postId로 전달 -->
      <Comment :boardNo="Number(route.params.no)" />
      </div>
    </div>
  </div>
</template>

<script setup>
import Comment from './Comment.vue'
import { useRoute, useRouter } from 'vue-router'
import { ref, onMounted, computed } from 'vue'
import { useBoardStore } from '@/stores/board';
import { useUserStore } from '@/stores/user' // 1125 기능추가
import axios from 'axios';
import DOMPurify from 'dompurify';
import 'quill/dist/quill.snow.css';   // Quill 스타일시트

const isLiked = ref(false)
const store = useBoardStore()
const userStore = useUserStore() // 1125 기능추가
const route = useRoute() 
const router = useRouter()
// const [likeCount, setLikeCount] = useState(boardDetail.likeCount);
// setLikeCount(liked ? likeCount - 1 : likeCount + 1);

//1125 기능추가
// 현재 로그인한 사용자가 게시글 작성자인지 확인하는 computed 속성
const isWriter = computed(() => {
  const currentUserNo = localStorage.getItem('userNo')
  if (!currentUserNo || !store.board) return false
  
  console.log('게시글 정보:', store.board)
  console.log('현재 사용자:', currentUserNo)
  
  // store.board.userNo가 null이 아닌 경우에만 비교
  if (store.board.userNo === null) {
    // 대체 방법: writer 필드로 비교
    return store.board.writer === localStorage.getItem('userId')
  }
  
  return store.board.userNo === parseInt(currentUserNo)
})
// 조회수 증가 함수 추가
const increaseViewCnt = async (boardNo) => {
  try {
    await api.put(`/board/${boardNo}/view-count`)
  } catch(err) {
    console.error('조회수 증가 처리 오류', err)
  }
}
// 게시글 로딩 함수 수정
const loadBoard = async () => {
  try {
    loading.value = true
    error.value = null
    
    // 조회수 증가 처리 후 게시글 정보 조회
    await increaseViewCnt(route.params.no)
    await store.getBoardByNo(route.params.no)
    
    console.log('게시글 로딩 완료:', store.board)
  } catch (err) {
    error.value = '게시글을 불러오는 중 오류가 발생했습니다.'
    console.error('게시글 로딩 오류:', err)
  } finally {
    loading.value = false
  }
}


onMounted(async() => {
  console.log('게시글 조회 시작')
  await store.getBoardByNo(route.params.no)

  console.log('조회된 게시글:', store.board)
  console.log('현재 로그인 정보:', {
    userNo: localStorage.getItem('userNo'),
    token: localStorage.getItem('access-token')
  })

})

const deleteBoard = async () => {
  console.log("삭제게시글 번호" , route.params.no)
  if (confirm('정말 삭제하시겠습니까?')) {
    try {
      //삭제로직
      console.log("route.params 전체:", route.params) // params 객체 전체 확인
      const response = await axios.delete(`${import.meta.env.VITE_BASE_URL}/etco/board/${route.params.no}`)
      console.log("DELETE 요청 후 응답:", response)
      console.log("삭제완료")
      alert('삭제되었습니다.')
      router.push({name:'Board'})
    } catch (error) {
      alert('삭제 중 오류가 발생했습니다.')
    }
  }
}
//수정로직
const updateBoard = function () {
  router.push({name: 'boardUpdate'})
}

const goToList = function () {
  router.push({name: 'Board'})
}


const handleLike = async () => {
  try {
    const token = localStorage.getItem('token');
    console.log("토큰:", token); // 토큰 값 확인
    
    const response = await axios.post(
      `${import.meta.env.VITE_BASE_URL}/etco/board/like/${route.params.no}`, 
      null, 
      {
        headers: {
          'Authorization': `Bearer ${token}`
        }
      }
    );
    console.log("응답:", response.data); // 응답 확인
    router.push(`/detailboard/${route.params.no}`);
  } catch (error) {
    console.error("에러 details:", error.response); // 자세한 에러 정보 확인
    alert('이미 좋아요를 누른 게시글입니다.');
  }
}




const handleReport = () => {
  if (confirm('이 게시글을 신고하시겠습니까?')) {
    alert('신고가 접수되었습니다.')
  }
}

const formatDate = (date) => {
  return new Date(date).toLocaleDateString('ko-KR', {
    year: 'numeric',
    month: '2-digit',
    day: '2-digit',
    hour: '2-digit',
    minute: '2-digit'
  })
}
//quill 추가
const sanitizedContent = computed(() => {
  return store.board?.content ? DOMPurify.sanitize(store.board.content) : '';
});
</script>

<style scoped>
.board-container {
  width: 100%;
  padding: 2rem;
  background-color: #FBF8EF;
  border-radius: 16px;
}

.board-detail {
  background-color: white;
  border-radius: 16px;
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.06);
  padding: 2.5rem 3rem;
}

.category-wrapper {
  margin-bottom: 2rem;
}

.category {
  display: inline-block;
  background-color: #9EC5FE;
  padding: 0.6rem 1.2rem;
  border-radius: 20px;
  font-size: 0.95rem;
  font-weight: 600;
  color: #1a365d;
  box-shadow: 0 2px 8px rgba(158, 197, 254, 0.3);
}

.title-section {
  border-bottom: 2px solid #F3F0E6;
  padding-bottom: 1.5rem;
  margin-bottom: 2rem;
}

.title {
  font-size: 1.8rem;
  font-weight: bold;
  margin-bottom: 1rem;
  color: #2d3748;
}

.meta-info {
  display: flex;
  gap: 1.2rem;
  color: #4a5568;
  font-size: 0.95rem;
  align-items: center;
}

.main-content {
  min-height: 300px;
  margin-bottom: 2.5rem;
  background-color: #FDFBF7;
  padding: 2.5rem;
  border-radius: 12px;
}

.text-content {
  line-height: 1.8;
  color: #2d3748;
  margin-bottom: 2.5rem;
  font-size: 1.1rem;
  margin-bottom: 1em;
}

.like-section {
  display: flex;
  justify-content: center;
  margin: 2rem 0;
}

.like-button {
  background-color: white;
  padding: 0.7rem 2rem;
  border-radius: 25px;
  cursor: pointer;
  transition: all 0.3s ease;
  border: none;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.06);
  font-size: 1.1rem;
}

.like-button:hover {
  background-color: #FFE8E8;
  transform: translateY(-2px);
}

.like-button.liked {
  background-color: #FFD1D1;
  color: #e53e3e;
}

.button-section {
  border-top: 2px solid #F3F0E6;
  padding-top: 1.5rem;
  display: flex;
  justify-content: space-between;
  margin-top: 2rem;
}

.action-buttons {
  display: flex;
  gap: 1rem;
  align-items: center;
}

.edit-link,
.delete-link {
  padding: 0.7rem 1.5rem;
  border-radius: 12px;
  cursor: pointer;
  transition: all 0.3s ease;
  text-decoration: none;
  font-weight: 500;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.edit-link {
  background-color: #9EC5FE;
  color: white;
}

.edit-link:hover {
  background-color: #7DB0FE;
  transform: translateY(-2px);
}

.delete-link {
  background-color: #FF8787;
  color: white;
}

.delete-link:hover {
  background-color: #FF6B6B;
  transform: translateY(-2px);
}

.edit-link span,
.delete-link span {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  font-size: 0.95rem;
}

.list-button {
  background-color: #9EC5FE;
  color: white;
  padding: 0.7rem 2rem;
  border-radius: 12px;
  cursor: pointer;
  transition: all 0.3s ease;
  border: none;
  font-weight: 500;
  box-shadow: 0 2px 8px rgba(158, 197, 254, 0.3);
  text-decoration: none;
  display: inline-flex;
  align-items: center;
}

.list-button:hover {
  background-color: #7DB0FE;
  transform: translateY(-2px);
}

.comment-section {
  margin-top: 3rem;
}

.report-button {
  background-color: white;
  color: #FF6B6B;
  padding: 0.4rem 1rem;
  border-radius: 8px;
  font-size: 0.9rem;
  cursor: pointer;
  transition: all 0.3s ease;
  margin-left: auto;
  border: none;
  box-shadow: 0 2px 8px rgba(255, 107, 107, 0.1);
}

.report-button:hover {
  background-color: #FF6B6B;
  color: white;
  transform: translateY(-2px);
}

.writer {
  font-weight: 600;
  color: #2d3748;
}

.view-count {
  background-color: #F3F0E6;
  padding: 0.3rem 0.8rem;
  border-radius: 20px;
  font-size: 0.85rem;
}

@media (max-width: 1600px) {
  .board-detail {
    padding: 2rem 2.5rem;
  }

  .title {
    font-size: 1.6rem;
  }

  .main-content {
    padding: 2rem;
    min-height: 250px;
  }
}

@media (max-width: 1200px) {
  .board-detail {
    padding: 1.8rem 2rem;
  }

  .title {
    font-size: 1.4rem;
  }
}

@media (max-width: 768px) {
  .board-container {
    padding: 1rem;
  }

  .board-detail {
    padding: 1.5rem;
  }

  .meta-info {
    flex-wrap: wrap;
    gap: 0.8rem;
  }

  .report-button {
    margin-left: 0;
    width: 100%;
    margin-top: 0.5rem;
  }

  .button-section {
    flex-direction: column;
    align-items: stretch;
    gap: 1rem;
  }

  .action-buttons {
    width: auto;
  }

  .edit-link,
  .delete-link {
    padding: 0.7rem 1.2rem;
    text-decoration: none;
  }

  .list-button {
    width: 100%;
  }
  .text-content {
  margin: 20px 0;
  min-height: 200px;
}

/* Quill 스타일 재정의 */
.text-content :deep(.ql-editor) {
  padding: 0;
}

.text-content :deep(p) {
  margin-bottom: 1em;
}

.text-content :deep(img) {
  max-width: 100%;
  height: auto;
  margin: 1em 0;
}

.text-content :deep(blockquote) {
  border-left: 4px solid #ccc;
  margin: 1em 0;
  padding-left: 16px;
  color: #666;
}

.text-content :deep(pre) {
  background-color: #f0f0f0;
  border-radius: 4px;
  padding: 12px;
  margin: 1em 0;
  overflow-x: auto;
}

.text-content :deep(ul), 
.text-content :deep(ol) {
  padding-left: 2em;
  margin: 1em 0;
}

.text-content :deep(h1),
.text-content :deep(h2),
.text-content :deep(h3) {
  margin: 1em 0 0.5em;
}
}
</style>