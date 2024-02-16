const express = require('express')
const router = express.Router()
const {getFilters, getPlantsById, getAllCards, filterBy } = require('../controllers/plantsController')

router.get('/getFilters', getFilters)
router.get('/getPlantsById/:id', getPlantsById)
router.get('/getAllCards', getAllCards)

router.post('/filterBy', filterBy)


module.exports = router;