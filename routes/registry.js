var express = require("express")
const db = require("../database")
var router = express.Router()
const bcrypt = require("bcrypt")
const { v4: uuidv4} = require("uuid");

router.get("/", function (req, res, next) {
  res.render("registry/index", {
    title: "Registo",
    paragraph: "Crie uma conta no nosso sistema",
  })
})

router.post("/", function (req, res, next) {
  console.log("Register api ", req.body)
  var frontName = req.body.name
  var frontEmail = req.body.email
  var frontEmail1 = req.body.email1
  var frontPassword = req.body.password
  var frontPassword1 = req.body.password1
  var frontPhone = req.body.phone

  console.log("start verification");
  if (frontEmail !== frontEmail1) {
    res.status(400).json({ message: "E-mail don`t match" })
  } else if (frontPassword !== frontPassword1) {
    res.status(400).json({ message: "Password don`t match" })
  }else{
    const saltRounds = 10
    bcrypt.hash(frontPassword, saltRounds, function (err, hash) {
      if (err) {
        res.status(500).json({ message: "failed encrypt pass" })
        console.log(err);
      } else {
        db.tx(async (t) => {
          var user = await t.one(
            `insert into adotame.user(id_user, name, email, phone) values($1, $2, $3, $4) returning id_user`,
            [uuidv4(), frontName, frontEmail, frontPhone]
          )

          await t.none(
            `insert into adotame.login(id_login, username, password, id_user) values($1, $2, $3, $4)`,
            [uuidv4(), frontEmail, hash, user.id_user]
          )
        })
          .then(() => {
            res.status(200).json({message: ''});
          })
          .catch((error) => {
            console.log("ERROR:", error)
            res.status(500).json({
              message: "failed when save user",
            })
          })
      }
    })
  }
})

module.exports = router
