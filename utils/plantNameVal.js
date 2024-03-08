const { param } = require('express-validator')

const validations = [
  param('plantName')
  .notEmpty().withMessage('Error: Debe especificar las primeras letras de la planta')
  .matches(/^[a-zA-Z]+$/).withMessage('El parametro de entrada no puede poseer numeros, solo letras')
]

module.exports = validations