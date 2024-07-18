<template>
    <nav class="navbar navbar-expand-lg navbar-light bg-color-custom">
      <div class="container">
        <!-- Bagian kiri navbar -->
        <router-link to="/dashboard" class="navbar-brand">{{msg}}</router-link>
  
        <!-- Bagian kanan navbar -->
        <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
          <ul class="navbar-nav">
            <!-- Profil Image -->
            <li class="nav-item">
              <a href="#" class="nav-link">
                <img src="/src/assets/vue.svg" alt="Profile" class="rounded-circle" style="width: 30px; height: 30px;">
              </a>
            </li>
            <!-- Search Box -->
            <li class="nav-item">
                <form class="d-flex" role="search">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </li>
            
          </ul>
        </div>
      </div>
    </nav>
  </template>
  
  <script>
  export default {
    name: 'Navbar',
    props : {
        msg : String
    }
  };

  </script>
  
  <style scoped>
.navbar-nav {
    margin-top: 0;
    padding-top: 0;
}

.nav-link {
    padding-top: 0;
    margin-top: 0;
}

.bg-color-custom {
    background-color: white;
}
  </style>
  