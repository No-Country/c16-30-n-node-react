const {checkBody, checkPass} = require('./customs.js')
// Validaciones para password
const validations = {
passwordActual: {
  notEmpty: {
    errorMessage: 'Campo obligatorio'
  }
},
nuevoPassword: {
  notEmpty: {
    errorMessage: 'Campo obligatorio'
  },
  isStrongPassword: {
    options: {minLength: 5,
    maxLength: 24,
    minLowercase: 1,
    minUppercase: 1,
    minNumbers: 1,
    minSymbols: 1
    },
    errorMessage: "La contraseña debe tener entre 5 y 24 caracteres, al menos una mayúscula, una minúscula, un número y un caracter especial."
  }
},
passwordRepetido: {
  notEmpty: {
    errorMessage: 'Campo obligatorio'
  },
  custom: {
    options: checkPass,
    errorMessage: "Las contraseñas no coinciden"
  }
},
body: {
  custom: {
    options: (val, {req}) => checkBody(req, 3),
    bail: true
  }
}
}
module.exports = validations