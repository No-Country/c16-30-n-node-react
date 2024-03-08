const { param } = require('express-validator')

const validations = [
  param('id')
  .notEmpty().withMessage('Error: Debe especificar un id')
  .isInt().withMessage('Parámetro id inválido. Ingrese un número')
]

module.exports = validations