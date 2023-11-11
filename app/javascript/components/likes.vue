<template>
    <div>
      <button v-if="liked" @click="toggleLike" class="liked">高評価を取り消す</button>
      <button v-else @click="toggleLike" class="like">高評価</button>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        liked: false, // 初期状態
        lectureId: null // 講義ID
      };
    },
    methods: {
      toggleLike() {
        const url = this.liked ? `/lectures/${this.lectureId}/unlike` : `/lectures/${this.lectureId}/like`;
        const method = this.liked ? 'delete' : 'post';
  
        axios({ url, method, headers: { 'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content') } })
          .then(() => {
            this.liked = !this.liked;
          })
          .catch(error => console.error('Error:', error));
      }
    }
  };
  </script>