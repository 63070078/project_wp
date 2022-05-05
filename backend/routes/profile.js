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
