const pgp = require("pg-promise")();
const connectionString = "postgresql://postgres:123@localhost:5432/postgres";

const db = pgp(connectionString);

module.exports = db;