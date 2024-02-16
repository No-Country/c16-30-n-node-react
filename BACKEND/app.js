const express = require('express')
const createError = require('http-errors')
const path = require('path')
const cookieParser = require('cookie-parser')
const morgan = require('morgan')
const session = require('express-session')
const methodoverride = require('method-override')


// conectar BD




// rutas
const userRouter = require('./routes/user.js')
const plantsRouter = require('./routes/plants.js')


const app = express()

// configurar sesión

// setup
app.use(morgan('dev'))
app.use(express.json())
app.use(express.urlencoded({extended: false}))
app.use(express.static(path.join(__dirname, 'public')))
app.use(methodoverride('_method'))

//rutas
app.use('/user', userRouter)
app.use('/plants', plantsRouter)

//catch 404
app.use(function(req, res, next){
  next(createError(404))
})


//error handler
app.use(function(err, req, res, next){
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
})


module.exports = app;