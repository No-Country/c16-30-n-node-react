const { checkBody } = require('./customs.js')

const validations = {
  usuario: {
    notEmpty: {
      errorMessage: "Campo obligatorio",
      bail:true
    },
    isEmail: {
      errorMessage: "Email inválido"
    }
  },
  password: {
    notEmpty: {
      errorMessage: "campo obligatorio"
    }
  },
  body: {
    custom: {
      options:  (val, {req}) => checkBody(req, 2),
      bail: true
    }
  }
}

module.exports = validations