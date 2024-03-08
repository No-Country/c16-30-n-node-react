const express = require('express');
const router = express.Router();
const validations = require('../utils/registerVal.js')
const idValidations = require('../utils/plantVal.js')
const favsValidations = require('../utils/favsVal.js')
const loginValidations = require('../utils/loginVal.js')
const updateUserValidations = require('../utils/updateUserVal.js')
const setPasswordValidations = require('../utils/setPasswordVal.js')
const { checkSchema, validationResult } = require('express-validator')
const {login, createUser, getFavs, setFav, updateUser, deleteUser, setPassword, logout } = require('../controllers/userController')
const cookieParser = require('cookie-parser')
const { validateToken, isLoggedIn } = require('../utils/token')

router.use(cookieParser())

router.post('/login', isLoggedIn, checkSchema(loginValidations), function(req,res) {
  const invalid = validationResult(req)
  if (!invalid.isEmpty()) {
    invalid.errors.some(el => el.path === 'body') ?
    res.status(400).send({ errors: [{
        "status": 400,
        "title": "Bad Request",
        "message": "Solicitud incorrecta, el request body debe contener email y password"
      }]
    })
    :
    res.send(invalid)
  }
  else {
    login(req, res)
  }
})

router.post('/createUser', isLoggedIn, checkSchema(validations), function (req, res) {
  const invalid = validationResult(req)
  if(!invalid.isEmpty()){
    invalid.errors.some(el => el.path === 'body') ?
    res.status(400).send({ errors: [{
        "status": 400,
        "title": "Bad Request",
        "message": "Solicitud incorrecta, el request body debe contener email, password, nombre y provincia"
      }]
    })
    :
    res.send(invalid)
  }
  else createUser(req, res)
})
// isLoggedIn verifica si el usuario esta logueado al querer acceder a dichas funciones. En caso positivo se bloquean.

router.get('/logout', logout)


// A partir de aqui todos los endpoints estan sujetos bajo validacion JWT. Mandatorio que exista una sesión correcta

router.use(validateToken)

router.get('/getFavs', getFavs)

router.delete('/deleteUser', deleteUser)

router.post('/setFav/', checkSchema(favsValidations), function (req, res) {
  const invalid = validationResult(req)
  if (!invalid.isEmpty()) {
    const send = {
      "errors": invalid
    }
    res.send(send)
  }
  else {
    setFav(req, res)
  }
})

router.put('/updateUser', checkSchema(updateUserValidations), function(req,res){
  const invalid = validationResult(req)
  
  if(!invalid.isEmpty()){
    if(invalid.errors.some(el => el.path === 'body')){
      const errorMsg = invalid.errors.find(el => el.path === 'body')
      res.status(400).send({ errors: [{
          "status": 400,
          "title": "Bad Request",
          "message": errorMsg.msg === 'Invalid value'? "Solicitud incorrecta, el request body debe contener email, nombre y provincia" : errorMsg.msg
        }]
      })
    }
    else res.status(400).send(invalid)
  }
  else updateUser(req, res)
})

router.put('/setPassword', checkSchema(setPasswordValidations), function(req, res){
  const invalid = validationResult(req)
  
  if(!invalid.isEmpty()){
    if(invalid.errors.some(el => el.path === 'body')){
      res.status(400).send({ errors: [{
          "status": 400,
          "title": "Bad Request",
          "message": "Solicitud incorrecta, el request body debe contener contraseña actual, nueva contraseña y nueva contraseña repetida" 
        }]
      })
    }
    else res.status(400).send(invalid)
  }
else setPassword(req, res)
})

module.exports = router;

