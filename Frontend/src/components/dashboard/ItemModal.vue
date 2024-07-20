<template>
    <div class="modal fade" id="itemModal" tabindex="-1" aria-labelledby="itemModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="itemModalLabel">Item Details</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <form>
              <div class="mb-3">
                <label for="itemId" class="form-label">Item ID</label>
                <input type="text" class="form-control" id="itemId" v-model="item.itemId">
              </div>
              <div class="mb-3">
                <label for="name" class="form-label">Name</label>
                <input type="text" class="form-control" id="name" v-model="item.name">
              </div>
              <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea class="form-control" id="description" v-model="item.description" rows="3"></textarea>
              </div>
              <div class="mb-3">
                <label for="img_name" class="form-label">URL gambar</label>
                <input type="text" class="form-control" id="img_name" v-model="item.img_name">
              </div>
              <div class="mb-3">
                <label for="stock" class="form-label">Stock</label>
                <input type="number" class="form-control" id="stock" v-model="item.stock">
              </div>
              <div class="mb-3">
                <label for="price" class="form-label">Price</label>
                <input type="text" class="form-control" id="price" v-model="item.price">
              </div>
              <div class="mb-3">
                <label for="shop_name" class="form-label">Shop Name</label>
                <input type="text" class="form-control" id="shop_name" v-model="item.shop_name">
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-bs-dismiss="modal" @click="submitForm">Tambah</button>
          </div>
        </div>
      </div>
    </div>
  </template>
  
  <script>
import config from '../../config';
import axios from 'axios'
import eventBus from '../../eventbus'

  export default {
    name: 'ItemModal',
    data() {
      return {
        item: {
          itemId: "",
          name: "",
          description: "",
          img_name: "",
          stock: "",
          price: "",
          shop_name: ""
        }
      };
    },
    methods:{
        async submitForm(){
            console.log(this.item)
            try {
                const apiUrl = `${config.apiBaseUrl}/items`;
                const response = await axios.post(apiUrl, this.item, {
                    withCredentials: true
                })
                console.log('Item added successfully:', response.data);
                eventBus.emit('refresh-data');
            } catch (error){
                console.error('Failed to add item:', error);
            }
        }
    }
  };
  </script>
  
  <style scoped>
  .modal-body {
    max-height: 500px;
    overflow-y: auto;
  }
  </style>
  