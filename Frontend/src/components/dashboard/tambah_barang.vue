<template>
    <button class="btn-custom" data-bs-toggle="modal" data-bs-target="#itemModal">
      <div class="text-container">
        <span class="text">Tambah Barang</span>
        <i class="bi bi-plus icon"></i> <!-- Ikon plus dari Bootstrap Icons -->
      </div>
    </button>
  </template>
  
  <script>
  export default {
    name: 'AddItemButton'
  };
  </script>
  
  <style scoped>
  .btn-custom {
    background-color: white;
    border: 2px solid #6c757d; /* Warna border abu-abu dari Bootstrap */
    color: #6c757d; /* Warna teks abu-abu dari Bootstrap */
    display: inline-flex;
    flex-direction: column; /* Menyusun teks dan ikon dalam kolom */
    align-items: center;
    padding: 0.5rem 1rem;
    font-size: 1rem;
    border-radius: 0.375rem;
  }
  
  .text-container {
    display: flex;
    flex-direction: column; /* Menyusun teks dan ikon dalam kolom */
    align-items: center;
  }
  
  .text {
    margin-bottom: 0.5rem; /* Jarak antara teks dan ikon */
  }
  
  .icon {
    font-size: 2rem; /* Ukuran ikon lebih besar */
  }
  
  .btn-custom:hover {
    background-color: #f8f9fa; /* Warna latar belakang saat hover */
    border-color: #adb5bd; /* Warna border saat hover */
  }
  </style>
  