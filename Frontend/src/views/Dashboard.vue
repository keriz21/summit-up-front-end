<template>
  <div>
    <sidebar />
    <div class="main-content">
      <navbar_custom msg="Dashboard"></navbar_custom>
      <infobox>test</infobox>

      <div class="container">
        <div class="row">
          <div class="col-12">
            <div class="bg-custom">
              <h1><b>Form Barang</b></h1>
              <p>Setiap 1 Bulan form ini akan diperbarui sesuai dari database yang berjalan.</p>
              <add_item_button />
              <item_modal />
              <div class="alert alert-danger">
                <i class="bi bi-exclamation-circle"></i> 
                Pastikan barang tidak kosong untuk di sewa, dan update selalu jadwal sewa
              </div>

              <form_barang></form_barang>
            </div>
          </div>
        </div>
      </div>

      <div class="container ">
        <div class="row">
          <div class="col-5">
            <div class="bg-custom-2">
              <latest_customer></latest_customer>
            </div>
          </div>

          <div class="col-7 bg-custom-2">
            <!-- <top_product></top_product> -->
            <top_product></top_product>
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
import form_barang from '../components/dashboard/form_barang.vue';
import latest_customer from '../components/dashboard/latest_customer.vue';
import top_product from '../components/dashboard/top_product.vue';
import Top_product from '../components/dashboard/top_product.vue';
import add_item_button from '../components/dashboard/tambah_barang.vue';
import item_modal from '../components/dashboard/ItemModal.vue';
import { mapGetters, mapActions } from 'vuex';

export default {
  name: 'Dashboard',
  components: {
    sidebar,
    navbar_custom,
    infobox,
    form_barang,
    latest_customer,
    Top_product,
    add_item_button,
    item_modal
  },
  computed: {
    ...mapGetters(['getUser'])
  },
  methods:{
    ...mapActions(['logout']),
    handleLogout(){
      this.logout();
      this.$router.push('/login');
    }
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

  border-radius: 10px;
  padding: 20px;
  margin-top: 10px;
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

.bg-custom-2 {
  background-color: white;

  border-radius: 10px;
  margin-top: 10px;
  box-sizing: border-box;
  padding: 20px;
}
</style>
