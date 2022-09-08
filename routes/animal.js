var express = require("express");
var router = express.Router();
const db = require("../database");
const crypto = require("crypto");

router.get("/", function (req, res, next) {
  db.any(`select * from adotame.animal`).then((rows) => {
    res.render("animal/list", { animals: rows });
  });
});

router.get("/create", function (req, res, next) {
  res.render("animal/create-update");
});

router.post("/create", function (req, res, next) {
  var name = req.body.name;

  var get_birth_date = new Date(req.body.birth_date);
  var getSysDate = new Date();

  if (name.length >= 15 || name.length < 2) {
    res.send("Nome para este animal é inválido!");
  } else if (get_birth_date.toLocaleString("pt-PT") > getSysDate.toLocaleString("pt-PT")) {
    res.send("Data inserida não pode ser maior do que a data atual!");
  } else {
    db.one(
      `insert into adotame.animal(id_animal, name, type, photo, gender, birth_date, size, fur, breed, color, vaccines, portion, health, cares)
    values($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14)`,
      [
        crypto.randomUUID(),
        req.body.name,
        req.body.type,
        req.body.photo,
        req.body.gender,
        get_birth_date,
        req.body.size,
        req.body.fur,
        req.body.breed,
        req.body.color,
        req.body.vaccines,
        req.body.portion,
        req.body.health,
        req.body.cares,
      ]
    )
      .then((rows) => {
        console.log(rows);
      })
      .catch((error) => {
        console.log("ERROR:", error);
      });
    res.send("Peddido enviado com sucesso");
  }
});

router.get("/profile/:id", function (req, res, next) {
  db.any(`select * from adotame.animal where id_animal = $1`, [req.params.id])
  .then((rows) => {
    res.render("animal/profile", {id: req.params.id, animals_data: rows });
  });
});

module.exports = router;
