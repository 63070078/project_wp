const express = require("express")

const app = express();
const cors = require('cors')
const { logger } = require('./middlewares')
app.use(logger)
app.use(cors())

// Statics
app.use(express.static('static'))
app.use(express.json()) // for parsing application/json
app.use(express.urlencoded({ extended: true })) // for parsing application/x-www-form-urlencoded

// routers
const indexRouter = require('./routes/index')
const customerCart = require('./routes/cart')
const customerProfile = require('./routes/profile')
const productRouter = require('./routes/products')
const userRouter = require('./routes/user')


app.use(indexRouter.router)
app.use(customerCart.router)
app.use(customerProfile.router)
app.use(productRouter.router)
app.use(userRouter.router)

app.listen(3000, () => {
  console.log(`Example app listening at http://localhost:3000`)
})