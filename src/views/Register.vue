<template>
    <div class="register">
      <h2>Register</h2>
      <form @submit.prevent="register">
        <div>
          <label for="username">Username:</label>
          <input type="text" id="username" v-model="username">
        </div>
        <div>
          <label for="password">Password:</label>
          <input type="password" id="password" v-model="password">
        </div>
        <button type="submit">Register</button>
      </form>
      <router-link to="/login">Go to Login</router-link>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        username: '',
        password: ''
      }
    },
    methods: {
      register() {
        // Perform registration logic here
        console.log('Username:', this.username);
        console.log('Password:', this.password);
        
        // Redirect to login after successful registration
        this.$router.push('/login');
      }
    }
  }
  </script>
  
  <style scoped>
  .register {
    max-width: 400px;
    margin: 0 auto;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 10px;
  }
  .register div {
    margin-bottom: 10px;
  }
  </style>
  