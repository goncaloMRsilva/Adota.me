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
  console.log(get_birth_date);
  var getSysDate = new Date();
  console.log(getSysDate);

  var yyyy = get_birth_date.getFullYear();
  var mm = get_birth_date.getMonth() + 1;
  var dd = get_birth_date.getDate();
  var req_birth_date = `${yyyy}-${mm}-${dd}`;
  console.log(req_birth_date);

  var year = getSysDate.getFullYear();
  var month = getSysDate.getMonth() + 1;
  var day = getSysDate.getDate();
  var system_date = `${year}-${month}-${day}`;
  console.log(system_date);

  console.log(
    get_birth_date.toLocaleString("en-ZA") > getSysDate.toLocaleString("en-ZA")
  );

  if (name.length >= 15 || name.length < 2) {
    res.send("Nome para este animal é inválido!");
  } else if (
    (dd > day && mm == month && yyyy == year) ||
    (yyyy == year && mm > month) ||
    (dd == day && mm == month && yyyy > year)
  ) {
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
        req_birth_date,
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
    res.send("OK");
  }
});

router.get("/profile", function (req, res, next) {
  db.any(`select * from adotame.animal`).then((rows) => {
    res.render("animal/profile", { animals: rows });
  });
});

// router.get('/profile/:id_animal', function(req, res, next) {
//   var id_animal = req.params.id_animal;
//   console.log(id_animal);
//   db.any(`select * from adotame.animal`).then(rows => {
//     res.render('animal/profile', {animals: rows});
//   })
// });

// router.get('/profile', function(req, res, next) {
//   db.any(`select name, vaccines, portion, health, cares, size, fur, breed, color from adotame.animal
//           where id_animal = $1`, [req.params.id_animal]).then(rows => {
//     res.render('animal/profile', {animals: rows});
//   })
// });

module.exports = router;
