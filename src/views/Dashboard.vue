<template>
  <div>
    <sidebar />
    <div class="main-content">
      <navbar_custom msg="Dashboard"></navbar_custom>
      <infobox>test</infobox>

      <div class="container bg-custom">
        <div class="row">
          <div class="col-12">
            <h1><b>Form Barang</b></h1>
            <p>Setiap 1 Bulan form ini akan diperbarui sesuai dari database yang berjalan.</p>
            <div class="alert alert-danger">
              <i class="bi bi-exclamation-circle"></i> 
              Pastikan barang tidak kosong untuk di sewa, dan update selalu jadwal sewa
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Konten dari dashboard -->
  </div>
</template>

<script>
import sidebar from '../components/SideBar.vue'
import navbar_custom from '../components/navbar.vue'
import infobox from '../components/infobox.vue';

export default {
  name: 'Dashboard',
  components: {
    sidebar,
    navbar_custom,
    infobox
  }
};
</script>

<style scoped>
/* Gaya untuk halaman ini saja */
.main-content {
  margin-left: 200px;
  background-color: #f5f5f5;
  min-height: 100vh;
  /* padding: 20px; */
  box-sizing: border-box;
}

.bg-custom {
  background-color: white;
  margin: 20px;
  border-radius: 10px;
  padding: 20px;
  box-sizing: border-box;
}

.bg-custom p {
  font-size: 12pt;
}

.bg-custom .row {
  margin: 0;
}

.alert {
  margin-top: 15px;
}
</style>
