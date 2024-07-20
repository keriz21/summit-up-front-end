<template>
  <body>
    <div class="container full-height d-flex justify-content-center align-items-center">
      <div class="row px-5 m-5 w-100 bg-float">
        <div class="col-md-6 d-flex justify-content-center align-items-center">
          <img src="/company.jpg" alt="summit-up" class="img-fluid">
        </div>

        <div class="col-md-6">
          <h1>Register</h1>
          <p>Admin Dashboard SummitUp</p>
          <form @submit.prevent="register">
            <div class="mb-3">
              <label for="username" class="form-label">Username</label>
              <input type="text" id="username" v-model="username" class="form-control" placeholder="Username">
            </div>

            <div class="mb-3">
              <label for="email" class="form-label">E-Mail</label>
              <input type="email" id="email" v-model="email" class="form-control" placeholder="example@gmail.com">
            </div>

            <div class="mb-3">
              <label for="password" class="form-label">Password</label>
              <input type="password" id="password" v-model="password" class="form-control" placeholder="Password">
            </div>

            <div class="mb-3">
              <label for="fullname" class="form-label">Full Name</label>
              <input type="text" id="fullname" v-model="fullname" class="form-control" placeholder="Full Name">
            </div>

            <div class="mb-3">
              <label for="phone_number" class="form-label">No. Telp</label>
              <input type="number" id="phone_number" v-model="phone_number" class="form-control" placeholder="08** **** ****">
            </div>

            <div class="d-grid gap-2">
              <button type="submit" class="btn btn-primary">Login</button>
            </div>
            <br>
            <div class="d-flex">
              <p class="ms-auto">Sudah Punya akun? <a href="/login">Login</a></p>
            </div>
          
          </form>
        </div>

      </div>
    </div>
  </body>
  </template>
  
<script>
import axios from 'axios'
import config from '../config';

export default {
  data() {
    return {
      username: '',
      password: '',
      email: '',
      fullname: '',
      phone_number: ''
    }
  },
  methods: {
    async register() {
      // Periksa input di konsol
      console.log('Username:', this.username);
      console.log('Password:', this.password);
      console.log('Email:', this.email);
      console.log('Fullname:', this.fullname);
      console.log('Phone number:', this.phone_number);

      // Endpoint API
      const apiUrl = `${config.apiBaseUrl}/auth/signup`;

      try {
        // Kirim data pendaftaran ke server
        const response = await axios.post(apiUrl, {
          username: this.username,
          password: this.password,
          email: this.email,
          fullname: this.fullname,
          phone_number: this.phone_number
        });

        // Tanggapan berhasil
        console.log('Registration successful:', response.data);

        // Tindakan setelah berhasil (misalnya redirect ke halaman login)
        this.$router.push('/login');
      } catch (error) {
        // Tanggapan error
        console.error('Registration failed:', error.response ? error.response.data : error.message);

        // Tindakan untuk menampilkan pesan error (misalnya, menggunakan toast atau menampilkan pesan di UI)
        this.errorMessage = error.response ? error.response.data.message : 'An error occurred during registration';
      }
    }
  }
}
</script>

  <style scoped>
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
  