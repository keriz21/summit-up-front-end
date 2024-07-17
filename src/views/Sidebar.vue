<template>
    <div class="sidebar">
      <ul>
        <li @click="handleItemClick('dashboard')">Dashboard</li>
        <li @click="handleItemClick('appointment')">Appointment</li>
        <li @click="handleItemClick('payment')">Payment</li>
        <li @click="handleItemClick('settings')">Settings</li>
        <li @click="handleItemClick('logout')">Logout</li>
      </ul>
    </div>
  </template>
  
  <script>
  export default {
    methods: {
      handleItemClick(item) {
        // Emit event to parent component (Dashboard.vue)
        this.$emit('menu-click', item);
      }
    }
  }
  </script>
  
  <style scoped>
  .sidebar {
    width: 200px;
    background-color: #f0f0f0;
    padding: 20px;
  }
  
  .sidebar ul {
    list-style-type: none;
    padding: 0;
  }
  
  .sidebar li {
    cursor: pointer;
    padding: 10px;
  }
  
  .sidebar li:hover {
    background-color: #e0e0e0;
  }
  </style>
  