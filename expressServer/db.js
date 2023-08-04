const Pool = require("pg").Pool;

const pool = new Pool({
    user: "jani",
    password: "7098",
    database: "irrigationClients",
    host: "localhost",
    port: 5432
})

module.exports = pool