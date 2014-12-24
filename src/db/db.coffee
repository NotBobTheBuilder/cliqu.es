knex = require('knex')(
  client: 'sqlite3'
  connection:
    filename: 'cliques.db'
)
module.exports = require('bookshelf')(knex)
