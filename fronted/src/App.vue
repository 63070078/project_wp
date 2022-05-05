<template>
  <div id="app">
    <!-- nav bar -->
    <nav class="navbar has-background-link-light" role="navigation" aria-label="main navigation">
      <div class="navbar-brand">
        <router-link to="/" class="navbar-item is-size-3">
          JUICESHOP
        </router-link>

        <a
          role="button"
          class="navbar-burger"
          aria-label="menu"
          aria-expanded="false"
          data-target="navbarBasicExample"
        >
          <span aria-hidden="true"></span>
          <span aria-hidden="true"></span>
          <span aria-hidden="true"></span>
        </a>
      </div>

      <div class="navbar-menu mx-2">
        <div class="navbar-end">
          <!-- <div v-if="user.member_level=='customer'" class="navbar-item">
            <router-link :to="{ name: 'cart', params: { customerId:  }}" class="button is-primary">
              <strong>Cart</strong>
            </router-link>
          </div> -->
          <!-- <div v-if="user" class="navbar-item has-dropdown is-hoverable "> -->
            <!-- <a class="navbar-link">
              <span class="pl-3">{{ customer.fname }} {{ customer.lname }}</span>
            </a> -->
            <!-- <div class="navbar-dropdown mr-2">
              <a class="navbar-item">
                <router-link to="/customer/profile">
                  <strong>Profile</strong>
                </router-link>
                </a>
              <a class="navbar-item">Log out</a>
            </div>
          </div> -->
           <div v-if="user" class="navbar-item">
           
              <router-link  :to="{ name: 'profile', params: { member_id: user.member_id }}">
                  <strong>Profile</strong>
                </router-link>
            
          </div>
          <div v-if="user" class="navbar-item" @click="localStorage.clear()">
           
              <a class="subtitle is-6" ><strong>LogOut</strong></a>
            
          </div>

          <div v-if="!user" class="navbar-item">
            <router-link to="/user/login">
              <strong>Login</strong>
            </router-link>
          </div>
        </div>
      </div>
    </nav>
    
    
    <router-view :key="$route.fullPath" @auth-change="onAuthChange" :user="user" />
  </div>
</template>

<script>
import axios from '@/plugins/axios'
export default {
  data () {
    return {
      user: null,
      member_id:null,
      // customer:{},
      // customer1:{
        // customer_id:1,
        // cus_type:'gold',
        // fname:'ช่อม่วง',
        // lname:'รุ่งเรือง',
        // phone:'0802255524',
        // email:'purple@hotmail.com',
        // address:'42 หมู่ 1 บ้านสังแกตำบลสะเดา อ.บัวเชด จ.สุรินทร์ 32230'
      // }
    }
  },
   mounted () {
    this.onAuthChange()
  },
  methods: {
    onAuthChange () {
      const token = localStorage.getItem('token')
      if (token) {
        this.getUser()
      }
    },
    getUser () {
      const token = localStorage.getItem('token')
      axios.get('/user/me').then(res => {
        this.user = res.data
      })
    },
    // getDetail(){
    //         axios
    //         .get(`http://localhost:3000/customer/profile/${this.users.member_id}`)
    //         then((res) => {
    //             console.log(res);
    //             this.customer = response.data;
    //             this.$router.push({name:'profile'})
    //         })
    //         .catch((e) => console.log(e));

    //     }
  },
};

</script>