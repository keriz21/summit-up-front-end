<template>
    <div>
      <!-- Tabel Daftar Barang -->
      <table class="table">
        <thead class="table-dark">
          <tr>
            <th scope="col">ID Barang</th>
            <th scope="col">Nama Barang</th>
            <th scope="col">Ketersediaan</th>
            <th scope="col">Perubahan</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="barang in paginatedData" :key="barang.id">
            <th scope="row">{{ barang.id }}</th>
            <td>{{ barang.name }}</td>
            <td>{{ barang.stock }}</td>
            <td>
              <button @click="editItem(barang)" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editItemModal">
                <i class="bi bi-pencil"></i> Edit
              </button>
              <button @click="deleteItem(barang.itemId)" class="btn btn-danger">
                <i class="bi bi-trash"></i> Delete
              </button>
            </td>
          </tr>
        </tbody>
      </table>
  
      <!-- Pagination -->
      <nav>
        <ul class="pagination justify-content-center">
          <li class="page-item">
            <a class="page-link" @click="prevPage" :disabled="currentPage === 1">
              <span aria-hidden="true">&laquo;</span>
            </a>
          </li>
          <li class="page-item" v-for="page in totalPages" :key="page" :class="{ 'active': currentPage === page }">
            <a class="page-link" @click="gotoPage(page)">{{ page }}</a>
          </li>
          <li class="page-item">
            <a class="page-link" @click="nextPage" :disabled="currentPage === totalPages">
              <span aria-hidden="true">&raquo;</span>
            </a>
          </li>
        </ul>
      </nav>
  
      <!-- Modal Edit Item -->
      <EditItemModal v-if="showModal" :item="selectedItem" @close="showModal = false" @refresh="fetchData"/>
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  import config from '../../config';
  import EditItemModal from './EditItemModal.vue';
  import eventBus from '../../eventbus';
  
  export default {
    name: 'ItemTable',
    components: { EditItemModal },
    data() {
      return {
        baranglist: [],
        currentPage: 1,
        itemsPerPage: 7,
        selectedItem: null,
        showModal: false,
      };
    },
    async created() {
      this.fetchData();
    },
        beforeDestroy() {
        eventBus.off('refresh-data', this.fetchData);
    },
    methods: {
      async fetchData() {
        try {
          const apiUrl = `${config.apiBaseUrl}/items`;
          const response = await axios.get(apiUrl, { withCredentials: true });
          this.baranglist = response.data;
        } catch (error) {
          console.error('Failed to fetch data:', error);
        }
      },
      nextPage() {
        if (this.currentPage < this.totalPages) {
          this.currentPage++;
        }
      },
      prevPage() {
        if (this.currentPage > 1) {
          this.currentPage--;
        }
      },
      gotoPage(page) {
        if (page >= 1 && page <= this.totalPages) {
          this.currentPage = page;
        }
      },
      editItem(item) {
        this.selectedItem = { ...item };
        this.showModal = true;
      },
      async deleteItem(itemId) {
        try {
          const apiUrl = `${config.apiBaseUrl}/items/${itemId}`;
          console.log(apiUrl)
          await axios.delete(apiUrl, { withCredentials: true });
          this.fetchData(); // Refresh the list after deletion
        } catch (error) {
          console.error('Failed to delete item:', error);
        }
      },
    },
    computed: {
      totalPages() {
        return Math.ceil(this.baranglist.length / this.itemsPerPage);
      },
      paginatedData() {
        const start = (this.currentPage - 1) * this.itemsPerPage;
        const end = start + this.itemsPerPage;
        return this.baranglist.slice(start, end);
      },
    },
  };
  </script>
  
  <style scoped>
  /* Add styles if needed */
  </style>
  