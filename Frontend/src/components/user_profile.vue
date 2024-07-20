<template>
    <div class="profile-container">
      <h2 class="profile-title">User Profile</h2>
      <div class="profile-details">
        <div class="profile-item">
          <label for="username" class="profile-label">Username:</label>
          <div id="username" class="profile-value">{{ user.username }}</div>
        </div>
        <div class="profile-item">
          <label for="fullname" class="profile-label">Full Name:</label>
          <div id="fullname" class="profile-value">{{ user.fullname }}</div>
        </div>
        <div class="profile-item">
          <label for="email" class="profile-label">Email:</label>
          <div id="email" class="profile-value">{{ user.email }}</div>
        </div>
        <div class="profile-item">
          <label for="phone_number" class="profile-label">Phone Number:</label>
          <div id="phone_number" class="profile-value">{{ user.phone_number }}</div>
        </div>
      </div>
    </div>
  </template>
  
  <script>

  import axios from 'axios'
  import config from '../config';

  export default {
    name: 'Profile',
    data() {
      return {
        user: {
          username: "john_doe",
          fullname: "John Doe",
          email: "john.doe@example.com",
          phone_number: "1234567890",
        },
      };
    },
    async created(){
        this.fetchData();
    },
    methods:{
        async fetchData(){
            try {
                const apiUrl = `${config.apiBaseUrl}/users`;
                const response = await axios.get(apiUrl, {
                    withCredentials:true
                })
                this.user = response.data;
                console.log("berhasil");
            } catch (error){
                console.error('Failed to fetch data:', error);
            }
        }
    }
  };
  </script>
  
  <style scoped>
  .profile-container {
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
    background: #f9f9f9;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  }
  
  .profile-title {
    font-size: 24px;
    margin-bottom: 20px;
    text-align: center;
    color: #333;
  }
  
  .profile-details {
    display: flex;
    flex-direction: column;
  }
  
  .profile-item {
    margin-bottom: 15px;
  }
  
  .profile-label {
    font-weight: bold;
    color: #555;
  }
  
  .profile-value {
    font-size: 16px;
    color: #333;
  }
  </style>
  