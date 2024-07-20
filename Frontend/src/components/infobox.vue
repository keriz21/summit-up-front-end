<template>
    <div class="container-fluid">
      <div class="row pt-3">
        <div class="col-3 box" v-if="dashboardData">
          <div class="row align-items-center m-2 box-container">
            <div class="col-3 img-container">
              <img src="/src/assets/shop.png" alt="">
            </div>
            <div class="col-9">
              <p class="h5 titel">Total Masuk</p>
              <p class="h4">Rp {{ formatCurrency(dashboardData.total_uang_masuk) }}</p>
            </div>
          </div>
        </div>
        <div class="col-3 box" v-if="dashboardData">
          <div class="row align-items-center m-2 box-container">
            <div class="col-3 img-container">
              <img src="/src/assets/shop1.png" alt="">
            </div>
            <div class="col-9">
              <p class="h5 titel">Total Pengeluaran</p>
              <p class="h4">Rp {{ formatCurrency(dashboardData.total_uang_keluar) }}</p>
            </div>
          </div>
        </div>
        <div class="col-3 box" v-if="dashboardData">
          <div class="row align-items-center m-2 box-container">
            <div class="col-3 img-container">
              <img src="/src/assets/people.png" alt="">
            </div>
            <div class="col-9">
              <p class="h5 titel">Total Pengunjung Toko</p>
              <p class="h4">{{ dashboardData.total_pengunjung }}</p>
            </div>
          </div>
        </div>
        <div class="col-3 box" v-if="dashboardData">
          <div class="row align-items-center m-2 box-container">
            <div class="col-3 img-container">
              <img src="/src/assets/list.png" alt="">
            </div>
            <div class="col-9">
              <p class="h5 titel">Total Orderan</p>
              <p class="h4">{{ dashboardData.total_order }}</p>
            </div>
          </div>
        </div>
        <p v-if="errorMessage">{{ errorMessage }}</p>
      </div>
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  import config from '../config';
  
  export default {
    name: 'infobox',
    data() {
      return {
        dashboardData: null,
        errorMessage: ''
      };
    },
    async created() {
      await this.fetchData();
    },
    methods: {
      async fetchData() {
        try {
          const token = localStorage.getItem('token');
          const apiUrl = `${config.apiBaseUrl}/dashboard`;
  
          const response = await axios.get(apiUrl, {
            withCredentials: true
          });
  
          this.dashboardData = response.data;
          console.log(this.dashboardData);
        } catch (error) {
          console.error('Failed to fetch dashboard data:', error);
          this.errorMessage = 'Failed to fetch dashboard data. Please try again.';
        }
      },
      formatCurrency(value) {
        if (value === null || value === undefined) return '0';
        // Convert number to string
        const numberString = value.toString();
        // Insert periods as thousand separators
        return numberString.replace(/\B(?=(\d{3})+(?!\d))/g, '.');
      }
    }
  };
  </script>
  
  <style scoped>
  .box-container {
    padding-top: 1px;
    background-color: white;
    border-radius: 10px;
    margin: 0;
  }
  .titel {
    font-size: 12pt;
  }
  </style>
  