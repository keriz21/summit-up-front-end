<template>
    <div class="modal fade" id="editItemModal" tabindex="-1" aria-labelledby="editItemModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="editItemModalLabel">Edit Item</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <form @submit.prevent="submitForm">
              <div class="mb-3">
                <label for="itemId" class="form-label">Item ID</label>
                <input type="text" class="form-control" id="itemId" v-model="item.itemId" disabled>
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
                <label for="img_name" class="form-label">Image URL</label>
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
              <button type="submit" class="btn btn-primary">Update</button>
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  import config from '../../config';
  
  export default {
    name: 'EditItemModal',
    props: {
      item: Object
    },
    methods: {
      async submitForm() {
        try {
          const apiUrl = `${config.apiBaseUrl}/items/${this.item.itemId}`;
          const response = await axios.put(apiUrl, this.item, {
            withCredentials: true
          });
          console.log('Item updated successfully:', response.data);
          this.$emit('close'); // Close the modal after successful update
          this.$emit('refresh'); // Emit an event to refresh the item list
        } catch (error) {
          console.error('Failed to update item:', error);
        }
      }
    }
  };
  </script>
  
  <style scoped>
  /* Add styles if needed */
  </style>
  