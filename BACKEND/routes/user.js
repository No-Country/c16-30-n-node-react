const express = require('express');
const router = express.Router();
const { login, createUser, getFavs, updateUser, deleteUser } = require('../controllers/userController')


router.post('/login', login)
router.post('/register', createUser)

router.get('/getFavs', getFavs) // ver qué enviar -> datos de sesión?

router.put('/updateUser', updateUser)

router.delete('/deleteUser', deleteUser)

module.exports = router;