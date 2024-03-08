// llamar a la conexión 
const sql = require('../connection.js')
const bcrypt = require('bcrypt')
const { generateToken } = require('../utils/token')
const jwt = require('jsonwebtoken')
require('dotenv').config()

const userController = {

  'login': async function (req, res) {
    // Metodo GET
    // Chequea los elementos en el body del mensaje ("usuario", "password") y compara primero el usuario y luego el hash del password guardado en la BDD.
    // Genera un token y la cookie 'jwt', que representa la session, con un vencimiento de 30'

    const usuario = req.body.usuario
    const password = req.body.password
    const send = {}
    try {
      const data = await sql`SELECT * FROM usuarios WHERE usuario = ${usuario}`
      const user = data[0]
      if (data.length === 0) {
        return res.status(409).send({ errors: [{ status: "409", title: "Conflict", message: 'El usuario no existe' }] })
      }
      else if (bcrypt.compareSync(password, user.pass)) {
        const token = generateToken(user)
        const userData = {
          usuario: user.usuario,
          nombre_usuario: user.nombre_usuario
        }
        send.data = { type: 'response', attributes: { status: "200", title: "Transaction OK", message: 'Sesión iniciada', user: userData } }
        res.cookie('jwt', token, { expires: new Date(Date.now() + 30 * 24 * 60 * 60 * 1000), httpOnly: true })
      }
      else {
        send.errors = [{ status: "409", title: "Conflict", message: 'Usuario o contraseña incorrectos' }]
      }
      return res.send(send)
    }
    catch {
      res.status(500).send({ errors: [ { "status": 500,"title": "Internal error", "message": "Error del servidor, contáctese con el administrador" }]})
    }
  },

  'createUser': async function (req, res) {
    // Método POST
    // Crea un usuario mediante los elementos del body del mensaje {"email", "provincia", "password", "nombre"}
    // No permite un email repetido y asigna automaticamente un id de usuario
    
    const email = req.body.email,
    provincia = req.body.provincia,
    password = req.body.password,
    nombre = req.body.nombre;

    try {
      const test = await sql`SELECT checkUserName(${email})`
      if (test.length >= 1) {
        return res.send({ errors: [{  "status": 409, "title": "Conflict", "message": "Email en uso. Utilice otro" }] })
      } 
      else {
        // Proceso de hasheo de password mediante metodo salt
        const hashPass = bcrypt.hashSync(password, 12)
        await sql`SELECT createUser(${email}, ${provincia}, ${hashPass}, ${nombre})`
        return res.send({ type: 'response', attributes: { status: "200", title: "Transaction OK", message: 'Usuario creado exitosamente, ya puede iniciar sesión' } })
      }
    } catch {
      return res.status(500).send({ errors: [ { "status": 500,"title": "Internal error","message": "Error del servidor, contáctese con el administrador" }] })
    }
  },

  'getFavs': async function (req, res) {
    // Retorna todas los nombres de las plantas favoritas del usuario logueado, precisa que el mismo este en sesion iniciada
    // Se extraen las credenciales del usuario en sesión mediante decodificación del token de la cookie

    var loggedUser = jwt.decode(req.cookies.jwt, process.env.SECRET)
    var extractedUserId = loggedUser["id_usuario"]
    const data = await sql`SELECT * FROM getFavs(${extractedUserId})`

    if (data.length === 0) return res.status(404).send({ errors: [{ "status": 404, "title": "Not Found", "message": "El usuario no tiene favoritos" }] })

    else {
      try {
        return res.send(data)
      } catch (error) {
        return res.status(500).send({ errors: [{ "status": 500, "title": "Internal error", "message": "Error del servidor, contáctese con el administrador" }] })
      }
    }
  },

  'setFav': async function (req, res) {    
    // Método POST
    // Agrega la id_planta indicada en el body al listado de favoritos del usuario o bien quita si la id_especie indicada ya existe en el listado del mismo
    // Datos de usuario tomados desde la cookie

    var loggedUser = jwt.decode(req.cookies.jwt, process.env.SECRET)
    var id_usuario = loggedUser["id_usuario"]
    var id_especie = req.body.id_especie
    const plantTest = await sql`SELECT * FROM getById(${id_especie})`

    if (plantTest.length === 0) return res.status(404).send({ errors: [{ "status": 404, "title": "Not found", "message": "La planta ingresada no existe" }] })

    else {
      try {
        await sql`SELECT setFav(${id_usuario},${id_especie})`
        return res.status(200).send({ errors: [{ "status": 200, "title": "Transaction OK", "message": "Favorito agregado" }] })
      }
      catch {
        // Borra la planta en el caso de que esta ya este en el listado de favoritos
        await sql`SELECT deleteFav(${id_usuario},${id_especie})`
        res.status(200).send({ errors: [{ "status": 200, "title": "Transaction OK", "message": "Planta eliminada del listado de favoritos del usuario" }] })
      }
    }
  },

  'updateUser': async function (req, res) {
    // Método SET
    // Actualiza los datos del usuario mediante el id_usuario tomado de la cookie del usuario sesionado
    // Se puede modificar segun los campos {"email","provincia","nombre"}
    
    const cookieToken = req.cookies.jwt
    const userData = jwt.verify(cookieToken, process.env.SECRET)

    const email = req.body.email || null
    const provincia = req.body.provincia || null
    const nombre = req.body.nombre || null

    // En el caso de que ya exista un correo en la BDD con el mismo nombre, o bien se lo quiera cambiar por el mismo, el endpoint envia un mensaje de error
    try {
      const test = await sql`SELECT checkUserName(${email})`
      if (test.length >= 1) {
        res.send({
          errors: [{ "status": 409, "title": "Conflict", "message": "El email ingresado es el mismo o bien ya existe en la base de datos. Cámbielo para continuar" }]})
      } 
      else {
        await sql`SELECT updateUser(${userData.id_usuario}, ${email}, ${provincia}, NULL , ${nombre})`

        // Obtiene datos actualizados del usuario, elimina la cookie actual y se crea una nueva para mantener la sesión iniciada
        const user = await sql`SELECT * FROM getUserById(${userData.id_usuario})`
        const token = generateToken(user[0])
        res.clearCookie.jwt
        res.cookie('jwt', token)

        // Envío de response junto a datos actualizados del usuario
        res.status(200).send({  type: 'response', 
                                attributes: { status: "200", title: "Transaction OK", message: 'Datos modificados correctamente' },
                                updated_data: { email: `${user[0].usuario}`, province: `${user[0].provincia }`, name: `${user[0].nombre}`}
                              })
      }
    } catch (err) {
      console.log(err)
      res.status(500).send({
        errors: [ {"status": 500,"title": "Internal error", "message": "Error del servidor, contáctese con el administrador" }]})
    }
  },

  'deleteUser': async function (req, res) {
    /*  Elimina un usuario pasado dentro del elemento del body "id_usuario" y activa un trigger 
        que elimina previamente todos sus favoritos */

    var loggedUser = jwt.decode(req.cookies.jwt, process.env.SECRET)
    var id_usuario = loggedUser['id_usuario']
    var key_usuario = req.body.password

    // Verifica si la password hasheada coincide con la enviada
    if (!bcrypt.compareSync(key_usuario, loggedUser.pass)) return res.status(401).send({ errors: [{ "status": 401, "title": "Unauthorized", "message": "Contraseña incorrecta" }] })

    else {
      try {
        await sql`SELECT deleteUser(${loggedUser.pass}, ${id_usuario})`
        res.clearCookie("jwt")
        return res.status(200).send({ response: [{ "status": 200, "title": "ransaction OK", "message": "Usuario correctamente eliminado" }] })
      }
      catch (error){
        console.log(error.message)
        return res.status(500).send({ errors: [{ "status": 500, "title": "Internal server error", "message": "Error del servidor, contáctese con el administrador" }] })
      }
    }
  },

  'setPassword': async function (req, res) {
    // Solo permite modificar la contraseña del usuario en sesión, tomando la id_usuario de la cookie.
    // Solo puede ser modificada si en el cuerpo del mensaje se escriben correctamente los campos {"passwordActual", "nuevoPassword", "passwordRepetido"}

    const passwordActual = req.body.passwordActual
    const nuevoPassword = req.body.nuevoPassword
    const cookieToken = req.cookies.jwt
    const userData = jwt.verify(cookieToken, process.env.SECRET)

    try {
      // Compara ambas contraseñas, la ingresada con la hasheada en la BDD
      if (!bcrypt.compareSync(passwordActual, userData.pass)) {
        return res.send({ errors: [{ "status": 409, "title": "Conflict","message": "Password incorrecto" }] })}

      else {
        // Si la comparacion es exitosa, realiza un nuevo hasheo de la contraseña ingresada y la modifica en la BDD
        const hashPass = bcrypt.hashSync(nuevoPassword, 12)
        await sql`SELECT updateUser(${userData.id_usuario}, NULL, NULL, ${hashPass} , NULL)`
        
        // Para asegurar establidad se elimina la cookie actual y se genera una nueva con los datos de usuario actualizados
        const user = await sql`SELECT * FROM usuarios WHERE id_usuario = ${userData.id_usuario}`
        const token = generateToken(user[0])
        res.clearCookie("jwt")
        res.cookie('jwt', token)
        return res.status(200).send({ type: 'response', attributes: { status: "200", title: "Transaction OK", message: 'Contraseña modificada correctamente' } })
      }
    } catch (err) {
      console.log(err)
      res.status(500).send({ errors: [ {"status": 500, "title": "Internal error","message": "Error del servidor, contáctese con el administrador" }]})
    }
  },

  'logout': function (req, res) {
    // solo verifica que haya una cookie (cualquiera con titulo jwt) para poder cerrar la sesion
    const inSession = req.cookies.jwt
    console.log(req.cookies)
    if (inSession) {
      res.clearCookie("jwt")
      res.status(200).send({ data: [{ 'status': 200, 'title': 'Transaction OK', 'Message': 'Sesion correctamente cerrada' }] })
    }
    else {
      res.status(403).send({ data: [{ 'status': 403, 'title': 'Forbidden', 'Message': 'Necesitas inciar sesion antes' }] })
    }
  }
}
module.exports = userController;