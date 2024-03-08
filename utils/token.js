require('dotenv').config()
require('cookie-parser')
const jwt = require('jsonwebtoken')

const tokenFunctions = {
  "generateToken": (user) => {
    return jwt.sign(user, process.env.SECRET, { expiresIn: "30m" })
  },
  "validateToken": (req, res, next) => {
    const accessToken = req.cookies.jwt
    if (!accessToken) {
      return res.status(401).send({ errors: [{ status: "401", title: "unauthorized", message: 'No autorizado' }] })
    }
    jwt.verify(accessToken, process.env.SECRET, (err, user) => {
      if (err) {
        console.log(err)
        res.clearCookie('jwt')
        return res.status(401).send({ errors: [{ status: "401", title: "unauthorized", message: 'Token expirado o incorrecto. Logueese nuevamente' }] })
      } else {
        return next()
      }
    })
  },
  "isLoggedIn": (req,res,next) =>{
    const cookieExists = req.cookies.jwt
    if(cookieExists){
      return res.status(403).send({errors: [{ status: "403", title: "forbidden", message: 'Usuario ya logueado, salga de la sesion para poder acceder a esta funcion'}]})
    }
    else{
      return  next()
    }
  }
}

module.exports = tokenFunctions