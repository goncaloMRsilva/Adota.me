var express = require("express");
var router = express.Router();
const db = require("../database");
const crypto = require("crypto");
const { userInfo } = require("os");
const shareFunctions = require("./shareFunctions");

router.get("/", function (req, res, next) {
  db.any(`select * from adotame.animal`).then((rows) => {
    res.render("animal/list", { animals: rows});
  });
});

router.get("/create", function (req, res, next) {
  res.render("animal/create-update", {title: 'Adicionar animal', paragraph: 'Adicione um novo animal ao catálogo'});
});

router.post("/create", function (req, res, next) {
  var name = req.body.name;

  var get_birth_date = new Date(req.body.birth_date);
  var getSysDate = new Date();

  if (name.length >= 15 || name.length < 2) {
    res.send("Nome para este animal é inválido!");
  // } else if (get_birth_date.toLocaleString("pt-PT", {year: 'numeric', month: 'numeric', day: 'numeric'}) > getSysDate.toLocaleString("pt-PT", {year: 'numeric', month: 'numeric', day: 'numeric'})) {
  //   res.send("Data inserida não pode ser maior do que a data atual!");
  } else {

    shareFunctions.createAnimal(req.body.name, req.body.type, req.body.photo, req.body.gender,
      req.body.birth_date, req.body.size, req.body.fur, req.body.breed, req.body.color, req.body.vaccines,
      req.body.portion, req.body.health, req.body.cares, req.body.location)
      .then((rows) => {
        console.log(rows);
        res.send('Pedido enviado com sucesso');
      }).catch(error => {
        res.status(500).end();
        console.log(error);
      });

  // if utilizador sharedFunction.createAnimal(req.body.name,etc)
  // else faz o que esta abaixo

    // db.one(
    //   `insert into adotame.animal(id_animal, name, type, photo, gender, birth_date, size, fur, breed, color, vaccines, portion, health, cares, place_belongs)
    // values($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15) returning id_animal`,
    //   [
    //     crypto.randomUUID(),
    //     req.body.name,
    //     req.body.type,
    //     req.body.photo,
    //     req.body.gender,
    //     get_birth_date,
    //     req.body.size,
    //     req.body.fur,
    //     req.body.breed,
    //     req.body.color,
    //     req.body.vaccines,
    //     req.body.portion,
    //     req.body.health,
    //     req.body.cares,
    //     req.body.place_belongs
    //   ]
    // )
    //   .then((rows) => {
    //     res.send("Pedido enviado com sucesso");
    //     console.log(rows);
    //   })
    //   .catch((error) => {
    //     console.log("ERROR:", error);
    //   });
  }
});

router.get("/profile/:id", function (req, res, next) {
  db.any(`select * from adotame.animal where id_animal = $1`, [req.params.id])
  .then((rows) => {
    res.render("animal/profile", {id: req.params.id, animals_data: rows, title: 'Adotar', paragraph: 'Esperemos que encontre algum amiguinho novo!!'});
  });
});

module.exports = router;
