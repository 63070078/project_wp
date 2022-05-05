import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'home',
    component: () => import('../views/Home.vue')
  },
  {
    path: '/user/login',
    name: 'login',
    meta: { guess: true },
    component: () => import('../views/Login.vue')
  },
  {
    path: '/customer/cart/:member_id',
    name: 'cart',
    meta: { login: true },
    component: () => import('../views/customer/Cart.vue')
  },
  {
    path: '/customer/profile/:member_id',
    name: 'profile',
    meta: { login: true },
    component: () => import('../views/customer/Profile.vue')
  },
]

const router = new VueRouter({ routes })
router.beforeEach((to, from, next) => {
  const isLoggedIn = !!localStorage.getItem('token')
 
  if (to.meta.login && !isLoggedIn) {
    alert('Please login first!')
    next({ path: '/user/login' })
  }
 
  if (to.meta.guess && isLoggedIn) {
    alert("You've already logged in")
    next({ path: '/'})
  }
 
  next()
})

export default router
