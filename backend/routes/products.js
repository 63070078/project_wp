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
