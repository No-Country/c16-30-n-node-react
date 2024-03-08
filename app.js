const express = require('express')
const createError = require('http-errors')
const path = require('path')
const cookieParser = require('cookie-parser')
const morgan = require('morgan')
const session = require('express-session')
const methodoverride = require('method-override')
const cors = require('cors')

require('dotenv').config()

// conectar BD
const sql = require('./connection.js')

const connectDB = async () => {
  const con = await sql`SELECT * FROM especies`
  try {
    if(con){
      console.log('Conectado a BD')
    }
  } catch (error) {
    console.log(`ERROR DE CONEXIÓN: ${error}`)
  }
} 

connectDB()


// rutas
const userRouter = require('./routes/user.js')
const plantsRouter = require('./routes/plants.js')


const app = express()

// configurar sesión

// setup
app.use(morgan('dev'))
app.use(express.json())
app.use(cors({
  origin: ['http://localhost:5174', 'http://localhost:5173', 'https://huertafacil.netlify.app', 'https://huertafacilprueba.netlify.app', 'https://huertafacilfe-production-1804.up.railway.app/'], // Permitir solicitudes desde este origen
  credentials: true // Permitir el envío de cookies de origen cruzado
}));
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

//puerto (se puede especificar otro desde .env)
const port = process.env.PORT || 3000;
app.listen(port, function(){
  console.log(`Backend conectado al puerto ${port}`)
})

//error handler
app.use(function(err, req, res, next){
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // show error in console
  res.status(err.status || 500);
  if(typeof err.message !== 'undefined')
  console.log(err.nessage)
  next()
})


module.exports = app;