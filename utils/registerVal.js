const { checkBody } = require('./customs.js')

const validations = {
email: {
  notEmpty: {
    errorMessage: 'Campo obligatorio',
    bail: true
  },
  isEmail: {
    errorMessage: 'Email inválido',
    bail: true
  },
  isLength: {
    options: {
      min: 5,
      max: 45
    },
    errorMessage: "El email debe contener entre 5 y 45 caracteres"
  } 
},
provincia: {
  notEmpty: {
    errorMessage: 'Campo obligatorio',
    bail: true
  },
  isIn: {
options: [["Jujuy","Salta","Tucumán","Catamarca","La Rioja","Santiago del Estero","Santa Fe","Entre Ríos","La Pampa","Córdoba","Ciudad Autónoma de Buenos Aires","Mendoza",
"San Juan","San Luis","Misiones","Corrientes","Chaco","Formosa","Buenos Aires","Neuquén","Río Negro","Chubut","Santa Cruz", "Tierra del Fuego"]]
  },
  errorMessage: 'Provincia inválida'
},
password: {
  notEmpty: {
    errorMessage: 'Campo obligatorio',
    bail: true
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
nombre: {
  notEmpty: {
    errorMessage: 'Campo obligatorio',
    bail: true
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
      options: (val, {req}) => checkBody(req, 4),
      bail: true
    }
  }
}

module.exports = validations