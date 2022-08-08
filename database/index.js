const pgp = require("pg-promise")();
const connectionString = "postgresql://postgres:bdadota.megs@localhost:5432/postgres";

const db = pgp(connectionString);

module.exports = db;