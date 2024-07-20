<template>
    <div class="coming-soon">
      <div class="container text-center">
        <img src="/construct.jpg" alt="Coming Soon" class="img-fluid mb-4" />
        <h1 class="display-4">Maaf, halaman ini sedang dalam pembangunan</h1>
        <p class="lead">Kami sedang mengerjakan halaman ini dan akan segera hadir dengan pembaruan yang menarik.</p>
        <router-link to="/dashboard" class="btn btn-primary">Kembali ke Dashboard</router-link>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    name: 'ComingSoon',
  }
  </script>
  
  <style scoped>
  .coming-soon {
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;
    background-color: #f8f9fa;
  }
  
  .coming-soon img {
    max-width: 100%;
    height: auto;
    max-height: 300px;
  }
  
  .coming-soon h1 {
    margin-top: 20px;
    margin-bottom: 10px;
  }
  
  .coming-soon p {
    margin-bottom: 30px;
  }
  </style>
  