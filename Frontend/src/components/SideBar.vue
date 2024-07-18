<template>
    <div class="sidebar">
    <ul class="navbar-nav list-group list-group-flush custom-list-group">
      <li class="nav-item list-group-item">
        <a href="/dashboard" class="nav-link"><i class="bi bi-grid-1x2-fill"></i> Dashboard</a>
      </li>
      <li class="nav-item list-group-item">
        <a href="/appointment" class="nav-link"><i class="bi bi-calendar-plus"></i> Appointment</a>
      </li>
      <li class="nav-item list-group-item">
        <a href="/payment" class="nav-link"><i class="bi bi-credit-card"></i> Payment</a>
      </li>
      <li class="nav-item list-group-item">
        <a href="/settings" class="nav-link"><i class="bi bi-gear"></i> Settings</a>
      </li>
      <li class="nav-item list-group-item">
        <a href="/logout" class="nav-link"><i class="bi bi-box-arrow-right"></i> Log Out</a>
      </li>
    </ul>
  </div>
  </template>
  
  <script>
  export default {
    methods: {
      closeNav() {
        // Function to close sidebar if needed
        // You can customize this based on your sidebar behavior
      }
    }
  };
  </script>
  
  <style>
    .sidebar {
      position: fixed;
      top: 0;
      left: 0;
      width: 200px;
      height: 100%;
      background-color: #262626; /* Background color sidebar */
      padding-top: 20px;
    }
    .custom-list-group .list-group-item {
      background-color: #262626; /* Background color item list */
    }

    .nav-link{
        color: #ffffff !important;
    }

    .navbar-nav{
        margin-top: 20px;
    }
  </style>
  