
require('dotenv').config()
const postgres = require('postgres')

const sql = postgres(process.env.DB_URL, {
  host                 : process.env.DB_HOST |'',            // Postgres ip address[s] or domain name[s]
  port                 : process.env.DB_PORT | 5432,          // Postgres server port[s]
  database             : process.env.DB_NAME | '',            // Name of database to connect to
  username             : process.env.DB_USER | '',            // Username of database user
  password             : process.env.DB_PASSWORD | ''

})



module.exports = sql