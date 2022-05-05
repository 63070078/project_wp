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
