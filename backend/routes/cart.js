const express = require("express");
const path = require("path");
const pool = require("../config");
const fs = require("fs");
const multer = require("multer");

router = express.Router();

// SET STORAGE

router.post("/customer/cart/:member_id", async function (req, res, next){

    const unit_price = req.body.unit_price;
    const quantity = req.body.quantity;
    const prod_id = req.body.prod_id;
    const list_sum = req.body.list_sum;
    // const order_id = req.body.order_id;
    const order_sum = req.body.order_sum;
   

    // Begin transaction
    const conn = await pool.getConnection();
    await conn.beginTransaction();
  
    try {
        const [row0,columns0] = await conn.query('SELECT customer_id From customer Where member_id=?',[req.params.member_id])
        const [rows,columns] = await conn.query('SELECT order_id FROM customer_order WHERE customer_id=?',[row0.insertId])
        const [rows2,columns2] = await conn.query('INSERT INTO customer_order(datetime,order_sum,customer_id) VALUES(CURRENT_TIMESTAMP,?,?)',[order_sum,row0.insertId])
        let results = await conn.query(
            "INSERT INTO list_item( unit_price, quantity, list_sum, order_id, prod_id) " +
            "VALUES( ?, ?, ?, ?,?);",
            [unit_price , quantity,list_sum,rows.insertId, prod_id]
        );
        
  
        await conn.commit();
        res.send("success!");
    } catch (err) {
      await conn.rollback();
      return res.status(400).json(err);
    } finally {
      conn.release();
    }
});

router.get("/customer/cart/:member_id", function (req, res, next) {
  // Query data from 3 tables
  const promise4 = pool.query("SELECT * FROM customer WHERE member_id=?", [req.params.member_id,]);
  const promise2 = pool.query("SELECT order_id FROM customer_order LEFT OUTER JOIN customer USING(customer_id) WHERE member_id=? and status is null", [req.params.member_id,]);
  const promise3 = pool.query("SELECT * FROM order_list LEFT OUTER JOIN customer_order USING (order_id) WHERE customer_order.order_id =(SELECT order_id FROM customer_order LEFT OUTER JOIN customer USING(customer_id) WHERE member_id=? and status is null)", [req.params.member_id,]);
 

  // Use Promise.all() to make sure that all queries are successful
  Promise.all([promise4, promise2, promise3])
    .then((results) => {
        const [customers, customersFields] = results[0];
        const [customersOrder, customersOrderFields] = results[1];
        const [orderLists, orderListFields] = results[2];
        res.json({
            customers: customers[0],
            customersOrder: customersOrder,
            orderLists: orderLists[0],
            error: null,
        });
    })
    .catch((err) => {
      return res.status(500).json(err);
    });
});

// router.put("/customer/cart/:member_id", function (req, res, next) {
//     const unit_price = req.body.unit_price;
//     const quantity = req.body.quantity;
//     const prod_id = req.body.prod_id;
//     const list_sum = req.body.list_sum;
//     const order_sum = req.body.order_sum;
//     const conn = await pool.getConnection()
//     await conn.beginTransaction();

//     try {
//         const [row,columns]= await conn.query(`SELECT `)
//         await conn.query(
//         'UPDATE order_list SET quantity=? Where ',[])
//         conn.commit()
//         res.send("success!");
//     } 
//     catch (err) {
//         await conn.rollback();
//         next(err);
//     } 
//     finally {
//         console.log('finally')
//         conn.release();
//     }
//     return;
// });
router.delete("/customer/cart/:member_id", function (req, res, next) {

});

exports.router = router;

const express = require("express");
const pool = require("../config");


router = express.Router();



router.get("/", async function (req, res, next) {
  try {
    const search = req.query.search || ''
    let sql = 'SELECT * FROM products'
    let cond = []
    if (search.length > 0) {
      sql = 'SELECT * FROM products AS a  WHERE a.prod_name LIKE ? OR a.descript LIKE ?;'
      cond = [`%${search}%`, `%${search}%`]
    }
    const [rows, fields] = await pool.query(sql, cond);
    // console.log(rows)
   
    
    return res.json(rows);
  } 
  catch (err) {
    return res.status(500).json(err)
  }
});

exports.router = router;

const express = require("express");
const path = require("path");
const pool = require("../config");


router = express.Router();

// SET STORAGE


router.get("/", function (req, res, next) {
  // Query data from 3 tables
  const promise1 = pool.query("SELECT * FROM products ");
  const promise4 = pool.query("SELECT * FROM customer WHERE member_id=?", [req.params.id,]);
  const promise2 = pool.query("SELECT * FROM customer_order LEFT OUTER JOIN customer USING(customer_id) WHERE member_id=? and status is null", [req.params.id,]);
  const promise3 = pool.query("SELECT * FROM order_list LEFT OUTER JOIN customer_order USING (order_id) WHERE customer_order.order_id =(SELECT order_id FROM customer_order LEFT OUTER JOIN customer USING(customer_id) WHERE member_id=? and status is null)", [req.params.id,]);
 

  // Use Promise.all() to make sure that all queries are successful
  Promise.all([promise1, promise2, promise3, promise4])
    .then((results) => {
      const [products, productFields] = results[0];
      const [cusOrder, cusOrderFields] = results[1];
      const [orderList, orderListFields] = results[2];
      const [customers, customerFields] = results[3];
      
     
      res.json({
        products: products[0],
        customers: customers,
        orderList: orderList[0],
        cusOrder: cusOrder,
        
        error: null,
      });
    })
    .catch((err) => {
      return res.status(500).json(err);
    });
});

router.put("/user/cart/:id", function (req, res, next) {

});
router.delete("/user/cart/:id", function (req, res, next) {

});

exports.router = router;

const express = require("express");
const path = require("path");
const pool = require("../config");
const fs = require("fs");
const multer = require("multer");


router = express.Router();


router.put("/blogs/addlike/:id", async function (req, res, next) {

});

router.post("/blogs", async function (req, res, next) {

});

router.get("/customer/profile/:member_id", function (req, res, next) {
    // const member_id = req.body.member_id
    console.log(req.params.member_id)
    const promise2 = pool.query("SELECT * FROM customer where member_id =? ",[req.params.member_id]);
    // Use Promise.all() to make sure that all queries are successful
    Promise.all([promise2])
        .then((results) => {
            
            const [customer, customerFields] = results[0];
            console.log(customer[0].email)
            res.json({
                customer:customer[0],
                error: null,
            });
        })
        .catch((err) => {
            return res.status(500).json(err);
        });
});

router.put("/customer/profile/:member_id", async function (req, res, next) {
    // Your code here
    const customer_id =req.body.customer_id
    const fname = req.body.fname;
    const lname = req.body.lname;
    const phone = req.body.phone;
    const email = req.body.email;
    const address = req.body.address;

    const conn = await pool.getConnection()
    await conn.beginTransaction();

    try {
       
        await conn.query(
        'UPDATE customer SET fname=?, lname=?, phone=?, email=?, address=? WHERE customer_id=?',[fname, lname, phone,email ,address, customer_id])
        conn.commit()
        res.send("success!");
    } 
    catch (err) {
        await conn.rollback();
        next(err);
    } 
    finally {
        console.log('finally')
        conn.release();
    }
    return;
});

exports.router = router;

const express = require("express")
const pool = require("../config")
const Joi = require('joi')
const bcrypt = require('bcrypt');
const { generateToken } = require("../utils/token");
const { isLoggedIn } = require('../middlewares')

router = express.Router();

const passwordValidator = (value, helpers) => {
    if (value.length < 8) {
        throw new Joi.ValidationError('Password must contain at least 8 characters')
    }
    if (!(value.match(/[a-z]/) && value.match(/[A-Z]/) && value.match(/[0-9]/))) {
        throw new Joi.ValidationError('Password must be harder')
    }
    return value
}

const usernameValidator = async (value, helpers) => {
    const [rows, _] = await pool.query("SELECT username FROM users WHERE username = ?", [value])
    if (rows.length > 0) {
        const message = 'This username is already taken'
        throw new Joi.ValidationError(message, { message })
    }
    return value
}

const signupSchema = Joi.object({
    email: Joi.string().required().email(),
    mobile: Joi.string().required().pattern(/0[0-9]{9}/),
    first_name: Joi.string().required().max(150),
    last_name: Joi.string().required().max(150),
    password: Joi.string().required().custom(passwordValidator),
    confirm_password: Joi.string().required().valid(Joi.ref('password')),
    username: Joi.string().required().min(5).max(20).external(usernameValidator),
})

router.post('/user/signup', async (req, res, next) => {
    try {
        await signupSchema.validateAsync(req.body, { abortEarly: false })
    } catch (err) {
        return res.status(400).send(err)
    }

    const conn = await pool.getConnection()
    await conn.beginTransaction()

    const username = req.body.username
    const password =  req.body.password
    const first_name = req.body.first_name
    const last_name = req.body.last_name
    const email = req.body.email
    const mobile = req.body.mobile

    try {
        await conn.query(
            'INSERT INTO member(username, password, member_level) VALUES (?, ?, customer)',
            [username, password]
        )
        conn.commit()
        res.status(201).send()
    } catch (err) {
        conn.rollback()
        res.status(400).json(err.toString());
    } finally {
        conn.release()
    }
})

const loginSchema = Joi.object({
    username: Joi.string().required(),
    password: Joi.string().required()
})

router.post('/user/login', async (req, res, next) => {
    try {
        await loginSchema.validateAsync(req.body, { abortEarly: false })
    } catch (err) {
        return res.status(400).send(err)
    }
    const username = req.body.username
    const password = req.body.password

    const conn = await pool.getConnection()
    await conn.beginTransaction()

    try {
        // Check if username is correct
        const [users] = await conn.query(
            'SELECT * FROM member WHERE username=?', 
            [username]
        )
        const user = users[0]
        if (!user) {    
            throw new Error('Incorrect username')
        }

        // Check if password is correct
        if (!(password == user.password)) {
            throw new Error('Incorrect password')
        }

        // Check if token already existed
        const [tokens] = await conn.query(
            'SELECT * FROM tokens WHERE member_id=?', 
            [user.member_id]
        )
        let token = tokens[0]?.token
        if (!token) {
            // Generate and save token into database
            token = generateToken()
            await conn.query(
                'INSERT INTO tokens(member_id, token) VALUES (?, ?)', 
                [user.member_id, token]
            )
        }

        conn.commit()
        res.status(200).json({'token': token})
    } catch (error) {
        conn.rollback()
        res.status(400).json(error.toString())
    } finally {
        conn.release()
    }
})

router.get('/user/me', isLoggedIn, async (req, res, next) => {
    // req.user ถูก save ข้อมูล user จาก database ใน middleware function "isLoggedIn"
    res.json(req.user)
})



exports.router = router
