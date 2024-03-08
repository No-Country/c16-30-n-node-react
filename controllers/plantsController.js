const { escape } = require('mysql2')
const sql = require('../connection.js')
const jwt = require('jsonwebtoken')
require('dotenv').config()

const plantsController = {

  'filterBy': async function (req, res) {
    // Filtra dinamicamente por parametros url opcionales de clima, provincia y tipo_planta. 
    // Se puede especificar cuantos items se quiere por pagina agregando el parametro limit_param
    
    var page = parseInt(req.query.page) || 1
    var limit = parseInt(req.query.limit) || 15
    var clima = (req.query.clima) || null
    var provincia = (req.query.provincia) || null
    var tipoPlanta = (req.query.tipo_planta) || null
    var nombrePlanta = (req.query.nombre) || ""       // Agregado parametro "nombrePlanta"
    
    // Lógica de paginado
    // Evita poner un previous_url si se encuentra en la 1er pag y un next_url si se encuentra en la ultima o es solo una pagina
    
    const startIndex = (page - 1) * limit
    const endIndex = page * limit

    try {

      // Evita parametros null pasados como string y decodifica los parametros para los links de paginas en formato URI
      tipoPlanta === "null" ? tipoPlanta = null : decodeURIComponent(tipoPlanta)
      provincia === "null" ? provincia = null : decodeURIComponent(provincia)
      clima === "null" ? clima = null : decodeURIComponent(clima)

      /* 
      En el caso de que no se pase ningun nombre de planta por parametro, no se toma en cuenta y devuelve items organizados por paginacion y filtros. Caso contrario elimina la
      paginacion, dado que ningun vegetal supera los 15 por pagina.
      Esto es porque la llamada se realiza directamente con la solicitud de paginacion y hay un error cuando se busca una planta que queda fuera del limite de rows devueltas.
      */
      if (nombrePlanta.length > 0){
        limit = null
        nombrePlanta = nombrePlanta.charAt(0).toUpperCase() + nombrePlanta.slice(1).toLowerCase()
      }
      
      const totalPags = await sql`SELECT * FROM filterBy(provincia_param => ${provincia}, clima_param => ${clima}, tipo_planta_param =>${tipoPlanta}) WHERE nombre LIKE '%' || ${nombrePlanta} || '%'`
      const data = await sql`SELECT * FROM filterBy(offset_param => ${startIndex}, limit_param => ${limit}, provincia_param => ${provincia}, clima_param => ${clima}, tipo_planta_param =>${tipoPlanta}) WHERE nombre LIKE '%' || ${nombrePlanta} || '%'`
      const paginado = {
        total: totalPags.length,
        items_per_page: limit == null ? 'all' : limit,
        current_page: page,
        total_pages: limit == null ? 1 : Math.ceil(totalPags.length / limit)

      }

      // Todos los parametros de busqueda que fueron incluidos en el filtro son codificados antes de ser enviados para poder ser accedidos

      if (startIndex > 0) {
        paginado.previous_page = page - 1
        paginado.previous_url = (`${process.env.HOST_URL}/plants/filterBy?page=${page - 1}&limit=${limit}&clima=${encodeURIComponent(clima)}&provincia=${encodeURIComponent(provincia)}&tipoPlanta=${encodeURIComponent(tipoPlanta)}`)
      }

      if (endIndex < totalPags.length - 1 && paginado.total_pages > 1) {
        paginado.next_page = page + 1;
        paginado.next_url = (`${process.env.HOST_URL}/plants/filterBy?page=${page + 1}&limit=${limit}&clima=${encodeURIComponent(clima)}&provincia=${encodeURIComponent(provincia)}&tipoPlanta=${encodeURIComponent(tipoPlanta)}`)
      }
      res.send({ pagination: paginado, data: data })
    } catch (err) {
      console.log(err)
      res.status(500).send({ errors: [{ "status": 500, "title": "Internal error", "message": "Error del servidor, contáctese con el administrador" }] })
    }
  },

  'getPlantById': async function (req, res) {
    const id = req.params.id

    try {
      const data = await sql`SELECT * FROM getByID(${id})`
      if (data.length === 0) res.status(404).send({ "errors": [{ "status": 404, "title": "Not found", "message": "No existe esa planta" }] })

      else res.send({ "data": data })
    }
    catch {
      res.status(500).send({ errors: [{ "status": 500, "title": "Internal error", "message": "Error del servidor, contáctese con el administrador" }] })
    }
  },

  'getCards': async function (req, res) {
    // Retorna los datos de todas las plantas para confeccionar tarjetas
    // Campos que retorna: id_especie, nombre, imagen_path, provincias donde se planta, climas ideales, tipo de planta y si es toxica o no para mascotas
    const page = parseInt(req.query.page) || 1
    const limit = parseInt(req.query.limit) || 15
    
    const startIndex = (page - 1) * limit
    const endIndex = page * limit
    
    // Lógica de paginado
    try {
      const totalPags = await sql`SELECT * FROM getCards()`
      const data = await sql`SELECT * FROM getCards(offset_val => ${startIndex}, limit_val => ${limit})`
      const paginado = {
        total: totalPags.length,
        items_per_page: limit,
        current_page: page,
        total_pages: Math.ceil(totalPags.length / limit)
        
      }

      // Evita poner un previous_url si se encuentra en la 1er pag y un next_url si se encuentra en la ultima o es solo una pagina
      if (startIndex > 0) {
        paginado.previous_page = page - 1
        paginado.previous_url = (`${process.env.HOST_URL}/plants/getCards?page=${page - 1}&limit=${limit}`)

      }
      if (endIndex < totalPags.length - 1 && paginado.total_pages > 1) {
        paginado.next_page = page + 1;
        paginado.next_url = `${process.env.HOST_URL}/plants/getCards?page=${page + 1}&limit=${limit}`
      }

      res.send({ pagination: paginado, data: data })
    } catch (err) {
      console.log(err)
      res.status(500).send({ errors: [{ "status": 500, "title": "Internal error", "message": "Error del servidor, contáctese con el administrador" }] })
    }
  },

  'getSelectors': async function (req, res) {
    // Devuelve listado completo de climas con su numero de Id
    try {
      const data = []
      data.push({"climas": await sql `SELECT * FROM getWeathers()`})
      data.push({"tipos_planta": await sql `SELECT * FROM getPlantTypes()`})
      data.push({"provincias": await sql `SELECT * FROM getProvinces()`})
      return res.send({ data })
    } catch {
      return res.status(500).send({ errors: [{ "status": 500, "title": "Internal error", "message": "Error del servidor, contáctese con el administrador" }] })
    }
  },

  'recommendedPlants': async function (req, res) {
    // Este endpoint solo puede ser accedido por un usuario logueado. 
    // Retorna un filtro prediseñado para que indique las tarjetas de plantas recomendadas por la provincia de residencia
    var page = parseInt(req.query.page) || 1
    var limit = parseInt(req.query.limit) || 15
    const cookieToken = req.cookies.jwt
    const userData = jwt.verify(cookieToken, process.env.SECRET)
    var provinciaData = await sql`SELECT * FROM getUserById(${userData.id_usuario}) `
    var provincia = provinciaData[0].provincia

    console.log(page)

    // Lógica de paginado
    const startIndex = (page - 1) * limit
    const endIndex = page * limit

    try {
      const totalPags = await sql`SELECT * FROM filterBy(provincia_param => ${provincia})`
      const data = await sql`SELECT id_especie, nombre, img, climas, tipo_planta, toxica_para_mascotas FROM filterBy(offset_param => ${startIndex}, limit_param => ${limit}, provincia_param => ${provincia})`
      const paginado = {
        total: totalPags.length,
        items_per_page: limit,
        current_page: page,
        total_pages: Math.ceil(totalPags.length / limit)
      }
      
    // Evita poner un previous_url si se encuentra en la 1er pag y un next_url si se encuentra en la ultima o es solo una pagina
    if (startIndex > 0) {
        paginado.previous_page = page - 1
        paginado.previous_url = (`${process.env.HOST_URL}/plants/recommendedPlants?page=${page - 1}&limit=${limit}`)
      }

      if (endIndex < totalPags.length - 1 && paginado.total_pages > 1) {
        paginado.next_page = page + 1;
        paginado.next_url = (`${process.env.HOST_URL}/plants/recommendedPlants?page=${page + 1}&limit=${limit}`)
      }
      res.send({ pagination: paginado, data: data })
    } catch (err) {
      console.log(err)
      res.status(500).send({ errors: [{ "status": 500, "title": "Internal error", "message": "Error del servidor, contáctese con el administrador" }] })
    }

  },

  'getCardsByName': async function (req, res) {
    // Retorna todas las cards de especies que inicien con los caracteres ingresados en el buscador (por params). Si tiene un numero en la cadena, se bloquea el envio mediante el validador
    try {
      capWord = req.charAt(0).toUpperCase() + req.slice(1).toLowerCase()
      console.log(capWord)
      var getCardList = await sql `SELECT * FROM getCards(limit_val => 100) WHERE nombre LIKE '%'|| ${capWord} || '%'`
      var totalElements = Object.keys(getCardList).length

      if(totalElements == 0) return res.status(404).send({errors: [{"status" : 404, "title" : "Not Found", "message" : "No se ha encontrado ninguna especie que tenga ese nombre"}]}) 

      else return res.status(200).send({data: getCardList})
    } 
    catch (error) {
      return res.status(500).send({errors: [{"status" : 500, "title" : "Internal error", "message" : "Error del servidor, comuníquese con un administrador"}]})        
    }
  }
}

module.exports = plantsController
