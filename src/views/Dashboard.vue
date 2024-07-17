<template>
  <div>
    <sidebar />
    <div class="main-content">
      <navbar_custom msg="Dashboard"></navbar_custom>
      <infobox></infobox>

      <h1>halo dunia</h1>
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
  components:{
    sidebar,
    navbar_custom,
    infobox
  }
};
</script>

<style scoped>
/* Gaya untuk halaman ini saja */
.main-content{
  margin-left: 200px;
  background-color: pink;
  min-height: 100vh;
}
</style>
