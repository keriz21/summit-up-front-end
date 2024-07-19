import { createRouter, createWebHistory } from 'vue-router'
import Login from '../views/Login.vue'
import Register from '../views/Register.vue'
import Dashboard from '../views/Dashboard.vue'
import appointment from '../views/appointment.vue'

const routes = [
  { path: '/login', component: Login },
  { path: '/register', component: Register },
  { path: '/dashboard', component: Dashboard, meta: { requiresAuth: true } },
  { path: '/appointment', component: appointment, meta: { requiresAuth: true } },
  { path: '/', redirect: '/login' }  // Redirect to login by default
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router
