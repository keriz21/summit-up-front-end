import { createRouter, createWebHistory } from 'vue-router'
import Login from '../views/Login.vue'
import Register from '../views/Register.vue'
import Dashboard from '../views/Dashboard.vue'
import appointment from '../views/appointment.vue'
import chart from '../views/payment/chart.vue'
import coming_soon from '../views/coming_soon.vue'
import profile from '../views/profie.vue'
import not_found from '../views/not_found.vue'

const routes = [
  { path: '/login', component: Login , name:"Login"},
  { path: '/register', component: Register },
  { path: '/dashboard', component: Dashboard, meta: { requiresAuth: true } },
  { path: '/appointment', component: appointment, meta: { requiresAuth: true } },
  { path: '/', redirect: '/login' },  // Redirect to login by default
  { path: '/payment', redirect: '/payment/chart'},
  { path: '/payment/chart', component: chart, meta : {requiresAuth: true}},
  { path: '/coming-soon', component: coming_soon },
  { path: '/profile', component: profile},
  { path: '/:pathMatch(.*)*', component: not_found}
  // { path: '*', component: not_found, name: '404 not found'}
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

router.beforeEach((to, from, next) => {
  const isAuthenticated = !!localStorage.getItem('token'); // Check authentication status (or use your own logic)
  
  if (to.matched.some(record => record.meta.requiresAuth) && !isAuthenticated) {
    // Redirect to login if route requires authentication and user is not authenticated
    next({ name: 'Login' });
  } else {
    next(); // Proceed to route
  }
});

export default router
