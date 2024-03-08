const express = require('express')
const router = express.Router()
const {getCardsByName,recommendedPlants, filterBy, getPlantById, getCards, getSelectors } = require('../controllers/plantsController')
const { validationResult } = require('express-validator')
const validators = require('../utils/plantVal.js')
const nameValidators = require('../utils/plantNameVal.js')
const cookieParser = require('cookie-parser')
router.use(cookieParser())
const { validateToken } = require('../utils/token')


router.get('/recommendedPlants', validateToken, recommendedPlants)  // Precisa que el usuario esté logueado

router.get('/getPlantById/:id', validators, function(req, res){
const invalid = validationResult(req)
console.log(invalid)
if(invalid.errors.length > 0){
  res.send(invalid)
} else {
  getPlantById(req, res)
}
})

router.get('/getSelectors', getSelectors)

router.get('/getCards', getCards)

router.get('/getCards/:plantName', nameValidators, function(req,res) {  
  const invalid = validationResult(req)
  console.log(invalid)
  if(invalid.errors.length > 0){
    res.send(invalid)
  } 
  else  getCardsByName(req.params.plantName,res)
})

router.get('/filterBy', filterBy)

module.exports = router;