<template>
  <div class="container is-widescreen">
    <section class="hero">
      <div class="hero-body">
        <div class="columns">
          <div class="column is-5 is-offset-3">
            <input class="input" type="text" v-model="search" placeholder="Search" />
          </div>
          <div class="column is-2">
            <button @click="getProducts" class="button is-link is-light px-3">Search</button>
          </div>
        </div>
      </div>
    </section>

    <section class="section" id="app">
       <div class="columns">
        <div class="column is-8 pt-2">
          <h1 class="is-size-4 mb-4">All Products ({{products.length}})</h1>
          <div class="container is-max-desktop">
            <div class="is-multiline columns is-variable is-2">
              <div class="column is-4 px-3" v-for="product in products" :key="product.prod_id">
                <div class="card has-background-white-bis">
                  <div class="card-image">
                    <figure class="image">
                      <img style="height: 250px" :src="imagePath(product.prod_pic1)" alt="Placeholder image"/>
                    </figure>
                  </div>
                  <div class="card-content ">
                    <div class="title" style="display: flex; ">{{ product.prod_name }}
                      <!-- <p class="title is-6 ml-4 mt-3">{{product.size}}</p> -->
                      <!-- <input class="input mx-1" style="width:35px" type="text" v-model ="product.size" disabled> -->
                    </div>
                    
                    <div class="title is-6">Size {{product.size}}</div>
                    <div class="content" >{{ shortContent(product.descript) }}</div>
                   
                    <div class="subtitle my-2" style="display: flex;justify-content: flex-end;">
                 
                    <!-- <p class="subtitle is-6 my-1 mx-1">Size </p>
                    <input class="input mx-1" style="width:35px" type="text" v-model ="product.size" disabled> -->
                  
                    <p  class="subtitle is-5 my-1 mx-1">Price </p>
                    <input class="input mx-2" style="width:42px" type="text" v-model ="product.unit_price" disabled> 

                    <div class="icon is-size-4 mt-2" @click="addToCart(product,index)">
                      <i class="fas fa-shopping-cart has-text-danger"></i>
                    </div>
                  </div>
                
                </div>
              </div>
            </div>
              
          </div>
        </div>          
      </div>
      <div class="column is-3 pt-6 pl-0 pr-5">
        <div style="display: flex;justify-content: space-between;">
          <span class="is-size-4 mb-4">Cart ({{cart.length}})</span>
          <a class="button is-danger is-light mb-4" @click="cart=[]">Clear</a>
        </div>

        <!-- Card element start here ------------------------------------------>
        <div class="card mb-4" v-for="(cart,index) in cart" :key="cart.prod_id">
          <div class="card-content p-0">
            <div class="media">
              <div class="media-left">
                <figure class="image is-96x96">
                  <img :src="imagePath(cart.prod_pic1)" alt="Placeholder image">
                </figure>
              </div>
              <div class="media-content pt-2">
                <p class="is-5">{{cart.prod_name}}</p>
                <div style="display: flex;justify-content: space-between;">
                  <div>
                    <!-- ราคาสินค้า------------------------------------------------ -->
                    <span class="is-6 has-text-danger">{{cart.unit_price}}</span>
                    <!-- จำนวนสินค้า----------------------------------------------- -->
                    <span>x{{cart.quantity}}</span>
                  </div>
                  <div >
                    <!-- icon รูปถังขยะ------------------------------------------- -->
                    <span class="icon mr-2" @click="removeFromCart(index)" key="false">
                      <i class="far fa-trash-alt"></i>
                    </span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div style="display: flex;justify-content: space-between;font-size: 1.25rem;">
          <span class="has-text-weight-bold">Total</span>
          <span>{{totalPrice}} Bath</span>
        </div>

          <!-- ปุ่ม Checkout ------------------------------------------------------------ -->
        <router-link  :to="{ name: 'cart', params: { member_id: user.member_id }}">
          <a class="button is-success is-light" style="width: 100%;" @click="addToOrderList()">Checkout</a>
        </router-link>
        
      </div>
    </div>
        
    </section>
  </div>
</template>

<script>
import axios from '@/plugins/axios'
// @ is an alias to /src
export default {
  props: ['user'],
  name: "Home",
  data() {
    return {
      search: "",
      products: [],
      orderLists:[],
      cart:[],
      unit_price:null,
      prod_id:null,
      quantity:1,
      order_sum:null,
      users:this.user,
    };
  },
  mounted() {
    this.getProducts();
  },
  methods: {
    getProducts() {
      axios
        .get("http://localhost:3000/", {
          params: {
            search: this.search,
          },
        })
        .then((response) => {
          this.products = response.data;
        })
        .catch((err) => {
          console.log(err);
        });
    },    
    imagePath(file_path) {
      if (file_path) {
        return "http://localhost:3000/" + file_path;
      } else {
        return "https://bulma.io/images/placeholders/640x360.png";
      }
    },
     shortContent(content) {
      if (content.length > 200) {
        return content.substring(0,95) + "...";
      }
      return content;
    },
    addToCart(product,index){
      let check = false
      for(let i=0;i<this.cart.length;i++){
        if(this.cart[i].prod_id === product.prod_id){
          this.cart[i].quantity++
          this.quantity = this.cart[i].quantity
          this. unit_price = this.cart[i].unit_price
          this.prod_id = this.cart[i].prod_id
          check = true
        }
      }
      if(check == false){
        // this.cart.push(product)
        // this.cart[this.cart.length-1].quantity = 1  
        this.cart.push({
          prod_id: product.prod_id,
          unit_price: product.unit_price,
          quantity: 1,

          prod_pic1: product.prod_pic1,
          prod_name: product.prod_name,
        })     
        this.quantity = this.cart[i].quantity
        this. unit_price = this.cart[i].unit_price
        this.prod_id = this.cart[i].prod_id     
      }
      // axios 
      // .post(`http://localhost:3000/customer/cart/${this.customer.customer_id}`,{
      //   unit_price : product.unit_price,
      //   quantity : this.cart[index].quantity,
      //   list_sum : unit_price*quantity,
      //   prod_id : product.prod_id,
      //   order_sum : this.totalPrice
      // })
      // .then((res) => {
      //   console.log(res);
      //   this.$router.push({ path: "/home" });
      // })
      // .catch((e) => console.log(e));
    
    },
    removeFromCart(index){
      this.cart.splice(index,1)
    },
  //   addToOrderList(){
  //     let formData = new FormData();
  //     for(let i=0;i<cart.length;i++){
  //       formData.append("unit_price", this.cart[i].unit_price);
  //       formData.append("quantity", this.cart[i].quantity);
  //       formData.append("list_sum", this.cart[i].quantity*this.cart[i].unit_price);
  //       formData.append("prod_id", this.cart[i].prod_id);
  //       formData.append("order_sum", this.totalPrice);
  //     }
  //     console.log()
     
  //     axios
  //     .post(`http://localhost:3000/customer/cart/${this.users.memer_id}`,formData)
  //     .then((res) => {
  //       console.log(res);
  //       this.$router.push({ name:'cart'});
  //     })
  //     .catch((e) => console.log(e));
      
  //   },
  },
  computed:{
    totalPrice(){
      let sum = 0
      for(let i = 0; i<this.cart.length;i++){
        sum += this.cart[i].unit_price * this.cart[i].quantity
      }
      return sum         
    },
    // addToOrderCart(){
    //   let check = false
    //   for(let i = 0;i<this.cart.length;i++){
    //     if(this.cart[i].prod_id === product.prod_id){
    //       check = true
    //       let quantity = this.cart[i].quantity
    //       let prod_id = this.cart[i].prod_id
    //       axios
    //       .put(`http://localhost:3000/customer/cart/${this.users.memer_id}`),{
    //         quantity: this.quantity,
    //         prod_id : this.prod_id,
    //         order_id : this.order_id
    //       }
    //     }
    //   }
      

    // }
  },
};
</script>
