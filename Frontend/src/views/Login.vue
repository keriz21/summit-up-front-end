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
              <label for="email" class="form-label">E-Mail</label>
              <input type="email" id="email" v-model="username" class="form-control" placeholder="example@gmail.com">
            </div>
            <div class="mb-3">
              <label for="password" class="form-label">Password</label>
              <input type="password" id="password" v-model="password" class="form-control">
            </div>
            <a href="#">Lupa Password</a>
            <div class="d-grid gap-2">
              <button type="submit" class="btn btn-primary">Login</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </body>
</template>

<script>
import summit from '../assets/summit.png'

export default {
  data() {
    return {
      username: '',
      password: '',
      summit
    }
  },
  methods: {
    login() {
      // Perform login logic here
      console.log('Username:', this.username);
      console.log('Password:', this.password);
      
      // Redirect to dashboard after successful login
      this.$router.push('/dashboard');
    }
  }
}
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
