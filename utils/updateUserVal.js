const {checkBody, checkMinimumParams} = require('./customs.js')

const validations = {
  email: {
    optional: {
      options: {
        values: 'falsy'
      }
    },
    isEmail: {
      errorMessage: "Email inválido"
    }
  },
  provincia: {
    optional: {
      options: {
        values: 'falsy'
      }
    },
    isIn: {
      options: [["Jujuy","Salta","Tucumán","Catamarca","La Rioja","Santiago del Estero","Santa Fe","Entre Ríos","La Pampa","Córdoba","Ciudad Autónoma de Buenos Aires","Mendoza",
          "San Juan","San Luis","Misiones","Corrientes","Chaco","Formosa","Buenos Aires","Neuquén","Río Negro","Chubut","Santa Cruz", "Tierra del Fuego"]]
        },
      errorMessage: 'Provincia inválida'  
  }, 
  nombre: {
    optional: {
      options: {
        values: 'falsy'
      }
    },
    isString: {
      errorMessage: 'Tipo de dato inválido. Debe ser string.',
      bail: true
    },
    matches: {
      options: /^[a-zA-Z0-9]+$/,
      errorMessage: 'El nombre solo puede contener letras y números. Sin espacios ni caracteres especiales.',
      bail: true
    },
    isLength: {
      options: {
        min: 2,
        max: 50
      },
      errorMessage: "El nombre debe tener entre 2 y 50 caracteres",
      bail: true
    }},
    body: {
      custom: {
        options: (val, {req}) => {
          if(!checkBody(req, 3) ){
            return false
          }
          else return checkMinimumParams(req)
        },
        bail: true
      }
    }
}

module.exports = validations