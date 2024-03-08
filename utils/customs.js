const customs = {
  "checkBody": (req, min) =>{
    const body = req.body
    const bodyLength = Object.entries(body).length
    if(bodyLength < min){
      throw new Error()
    }  
    return true
  },
"checkMinimumParams":(req) =>{
    const body = req.body
    const values = Object.entries(body).some(el => el[1])
  
    if(!values){
      throw new Error('Debe especificar al menos un valor')
    }  
    return true
  },
  "checkPass": (val, {req}) => {
    const nuevoPassword = req.body.nuevoPassword
    const passwordRepetido = req.body.passwordRepetido

    return nuevoPassword === passwordRepetido
  }
}

module.exports = customs