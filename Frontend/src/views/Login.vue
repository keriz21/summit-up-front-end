<template>
  <body>
    <div class="container full-height d-flex justify-content-center align-items-center">
      <div class="row px-5 m-5 w-100 bg-float">
        <div class="col-md-6 d-flex justify-content-center align-items-center">
          <img src="/company.jpg" alt="" class="img-fluid">
        </div>
        <div class="col-md-6">
          <h1>Login</h1>
          <p>Admin Dashboard SummitUp</p>
          <form @submit.prevent="login">
            <div class="mb-3">
              <label for="username" class="form-label">Username</label>
              <input type="text" id="username" v-model="username" class="form-control" placeholder="Username">
            </div>
            <div class="mb-3">
              <label for="password" class="form-label">Password</label>
              <input type="password" id="password" v-model="password" class="form-control" placeholder="Password">
            </div>
            <div class="d-grid gap-2">
              <button type="submit" class="btn btn-primary">Login</button>
            </div>
            <br>
            <div class="d-flex">
              <p class="ms-auto">Belum Punya akun? <a href="/register">Register</a></p>
            </div>
          </form>
        </div>
      </div>
    </div>
  </body>
</template>

<script>
import axios from 'axios';
import summit from '../assets/summit.png';
import config from '../config'

export default {
  data() {
    return {
      username: '',
      password: '',
      summit,
      errorMessage: ''
    };
  },
  methods: {
    async login() {
      try {
        console.log(config.apiBaseUrl)
        const apiUrl = `${config.apiBaseUrl}/auth/login`
        const response = await axios.post(apiUrl, {
          username: this.username,
          password: this.password
        }, {withCredentials: true});
        // Handle successful login, e.g., redirect to another page or store token
        console.log('Login successful:', response.data);
        localStorage.setItem('token', response.data.token)
        // You might want to redirect or do something with the response data
        this.$router.push('/dashboard'); // example redirection
      } catch (error) {
        // Handle error, e.g., show an error message
        console.error('Login failed:', error.response.data);
        this.errorMessage = 'Login failed. Please check your username and password.';
      }
    }
  }
};
</script>

<style scoped>
/* Tambahkan gaya khusus di sini */
.full-height{
  height: 100vh;
}
body{
  background-color: #f5f5f5;
}
.bg-float{
  background-color: white;
  padding-top: 10vh;
  padding-bottom: 10vh;
}
</style>
