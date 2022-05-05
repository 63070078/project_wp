<template>
    <section class="section" id="app">
        <div class="container is-max-desktop p-5">
            <div class="column pt-6 pl-0 pr-0">
                
                <div class="card mb-4" v-for="orderList in orderList" :key="orderList.item_no">
                    <div class="card-content p-0">
                        <div class="media" >
                            <div class="media-left">
                                <figure class="image is-96x96">
                                    <img src="https://images.unsplash.com/photo-1585459733441-9b415fed25b3?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=80"
                                    alt="Placeholder image">
                                        <!-- <img :src="cart.image" alt="Placeholder image"> -->
                                </figure>
                            </div>
                            <div class="media-content pt-2">
                                <p class="is-5">(ตัวอย่าง) Lumix GH5</p>
                                <p class="has-text-grey-light is-6">Panasonic</p>
                                <!-- <p class="is-5">{{cart.title}}</p>
                                <p class="has-text-grey-light is-6">{{cart.brand}}</p> -->
                                    
                                <div style="display: flex;justify-content: space-between;">
                                    <div>
                                        <span class="is-6 has-text-danger">44900</span>
                                        <span>x0</span>
                                        <!-- <span class="is-6 has-text-danger">{{orderList.unit_price}}</span>
                                        <span>{{'x'+orderList.quantity}}</span> -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
    
            </div>
    
            <div class="columns is-size-4">
                <div class="column is-1 is-offset-8">
                        Total
                </div>
                <div class="column is-3 has-text-right">
                    <!-- Total here ---------------------------------------- -->
                    123 ฿
                    <!-- {{totalPrice}} -->
                    <a class="button is-success is-light mx-2">pay</a>
                </div>
                    
            </div>
    
        </div>
        
       
          
    </section>
    
</template>
<script>
import axios from '@/plugins/axios'
// @ is an alias to /src
export default {
    props: ['user'],
  data() {
    return {
      products: [],
      orderLists:[{item_no:1,unit_price:30,quanity:3,list_sum:90,oreder:1,prod_id:1},{item_no:2,unit_price:35,quanity:5,list_sum:175,oreder:1,prod_id:2}
      ],
      customerOrder:{},
      users : this.user,


    };
  },
  mounted() {
   
  },
  methods: {
      getOrderList(){
          axios
          .get(`http://localhost:3000/customer/profile/${this.users.member_id}`)
          .then((res)=>{
              this.orderLists = res.data.orderLists
          })
      }
    
  },
    computed:{
   
    },
    // created(){
    //     this.cart = JSON.parse(localStorage.getItem('cart'));
    //     this.total = JSON.parse(localStorage.getItem('total'));
    // },
};
</script>
