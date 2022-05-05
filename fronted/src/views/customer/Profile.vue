<template>
    <section class="section" id="app">
        <center><h1 class="title mb-4">My Profile</h1></center>
            <div class="columns is-multiline">
               
            <div class="column is-3" ></div>
              <div class="column is-6" >
                <!-- <div class="columns">
                    <div class="column">
                        <label class="label">Username</label>
                        <div class="control">
                            <input class="input" type="text" v-model ="username" :disabled="disabled == 0">
                        </div>
                    </div>
                </div> -->
                <div class="columns">
                    <div class="column">
                        <label class="label">Firstname</label>
                        <div class="control">
                            <input class="input" type="text" v-model ="customer.fname" :disabled="disabled == 0">
                        </div>
                    </div>
                    <div class="column">
                        <label class="label">Lastname</label>
                        <div class="control">
                            <input class="input" type="text"  v-model ="customer.lname" :disabled="disabled == 0">
                        </div>
                    </div>
                </div>
                <div class="columns">
                    <div class="column">
                        <label class="label">Tel</label>
                        <div class="control">
                            <input class="input" type="text"  v-model ="customer.phone" :disabled="disabled == 0">
                        </div>
                    </div>
                </div>
                <div class="columns">
                    <div class="column">
                        <label class="label">Email</label>
                        <div class="control">
                            <input class="input" type="text"  v-model ="customer.email" :disabled="disabled == 0">
                        </div>
                    </div>
                </div>
    
                <div class="columns">
                    <div class="column">
                        <label class="label">ที่อยู่</label>
                        <textarea class="textarea"  v-model ="customer.address" placeholder="e.g. บ้านเลขที่ 123 ลาดกระบัง ...." :disabled="disabled == 0"></textarea>
                        <!-- <p>กำลังพิมพ์...</p> -->
                    </div>
                </div>
                <!-- click this button to open Order modal ----------------- -->
                <center><a class="button is-info is-light">Log Out</a>
                    <button class="button is-success is-light mx-1" @click="disabled = (disabled + 1) % 2" v-show="disabled == 0">Edit</button>
                    <button class="button is-success is-light mx-1" @click="disabled = (disabled + 1) % 2;submit()" v-show="disabled == 1">Save</button>
                    <!-- <button class="button is-danger is-light" @click="modal_ChangePassword = !modal_ChangePassword" >Change Password</button> -->
                </center>
                
        </div>
        <div class="modal" v-bind:class="{'is-active':modal_ChangePassword}">
            <div class="modal-background" @click="modal_ChangePassword = !modal_ChangePassword"></div>
                <div class="modal-card" style="max-width: 960px;width: 30%;">
                    <header class = "modal-card-head">
                     <p class = "modal-card-title">Change Password</p>
                     <button class = "delete" aria-label = "close" @click="modal_ChangePassword = !modal_ChangePassword"></button>
                    </header>
                    <section class="modal-card-body">
                        <!-- <center> -->
                        <div class="column " >
                            <div class="columns">
                                <div class="column" >
                                    <p class="subtitle">{{users.username}}</p>
                                </div>
                          
                            </div>
                            <div class="columns">
                                <div class="column">
                                    <label class="label">New Password</label>
                                    <div class="control">
                                        <input class="input" type="text" v-model ="oldPassword">
                                    </div>
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column">
                                    <label class="label">Confirm Password</label>
                                    <div class="control">
                                        <input class="input" type="text" v-model ="newPassword">
                                        <p>{{c_password}}</p>
                                    </div>
                                </div>
                            </div>
                            <center>
                            <button class = "button mx-1"  @click="modal_ChangePassword = !modal_ChangePassword">cancel</button>
                            <button class = "button mx-1"  @click="changePassword()">confirm</button>
                            </center>
                        </div>
                        
                    </section>
                </div>
            </div>
        </div>
    </section>
</template>
    
<script >
  import axios from '@/plugins/axios'
    // @ is an alias to /src
    export default {
        props: ['user'],
    
    data() {
        return {
            customer:null,
            disabled: 0,
            modal_ChangePassword:false,
            newPassword:null,
            oldPassword:null,
            c_password:null,
            users : this.user,
        };
    },
    mounted() {
        this.getDetail();
    },
    methods: {
        submit() {

            axios
            .put(`http://localhost:3000/customer/profile/${this.users.member_id}`, {
                customer_id :this.customer.customer_id,
                fname : this.customer.fname,
                lname : this.customer.lname,
                phone : this.customer.phone,
                email : this.customer.email,
                address : this.customer.address
            })
            .then((res) => {
                console.log(res);
                this.$router.push({ name: "profile" });
            })
            .catch((e) => console.log(e));
        },
        getDetail(){

            axios
            .get(`http://localhost:3000/customer/profile/${this.users.member_id}`)
            .then((res) => {
                console.log(res.data.customer);
                this.customer = res.data.customer;
            })
            .catch((e) => console.log(e));

        }
        // changePassword(){
        //     if(this.newPassword == this.oldPassword){
        //         this.newPassword =""
        //         this.oldPassword=""
        //         alert("Change Password Success!")
        //         this.modal_ChangePassword=false
        //         axios
        //         .put(`http://localhost:3000/customer/profile`)
        //     }
        //     else{
        //         this.newPassword =""
        //         this.oldPassword=""
        //         alert("Password not match Please fill again!!")
        //     }      
        // }
    },
    
    computed:{  
      
    },
    created(){
        // axios
        //     .get(`http://localhost:3000/customer/profile/${this.users.member_id}`)
        //     then((res) => {
        //         console.log(res);
        //         this.customer = response.data;
        //     })
        //     .catch((e) => console.log(e));
    }
};
    </script>
