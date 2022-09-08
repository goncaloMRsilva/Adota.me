var express = require("express");
const db = require("../database");
var router = express.Router();
const bcrypt = require("bcrypt");
const crypto = require("crypto");

router.get("/", function (req, res, next) {
  res.render("registry/index", {title: 'Registo', paragraph: 'Crie uma conta no nosso sistema'});
});

router.post("/", function (req, res, next) {
  var frontName = req.body.name;
  var frontEmail = req.body.email;
  var frontEmail1 = req.body.email1;
  var frontPassword = req.body.password;
  var frontPassword1 = req.body.password1;
  var frontPhone = req.body.phone;

  if (frontEmail !== frontEmail1) {
    res.send("E-mail don`t match");
  } else if (frontPassword !== frontPassword1) {
    res.send("Password don`t match");
  }

  const saltRounds = 10;
  bcrypt.hash(frontPassword, saltRounds, function (err, hash) {
    if (err) {
      res.send("failed encrypt pass");
    } else {
      db.tx(async (t) => {
        var user = await t.one(
          `insert into adotame.user(id_user, name, email, phone) values($1, $2, $3, $4) returning id_user`,
          [crypto.randomUUID(), frontName, frontEmail, frontPhone]
        );

        await t.none(
          `insert into adotame.login(id_login, username, password, id_user) values($1, $2, $3, $4)`,
          [crypto.randomUUID(), frontEmail, hash, user.id_user]
        );
      })
        .then(() => {
          res.send(`Welcome ${frontName}!`);
        })
        .catch((error) => {
          console.log("ERROR:", error);
          res.send("failed encrypt pass");
        });
    }
  });
});

module.exports = router;
