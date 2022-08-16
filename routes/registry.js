var express = require('express');
const db = require('../database');
var router = express.Router();


router.get('/', function(req, res, next) {
  res.render('registry/index');
});


router.post("/", function(req,res, next) {
  var frontName = req.body.name;
  var frontEmail = req.body.email;
  var frontEmail1 = req.body.email1;
  var frontPassword = req.body.password;
  var frontPassword1 = req.body.password1;

  if (frontEmail !== frontEmail1){
    res.send("E-mail don`t match");
  }else if(frontPassword !== frontPassword1){
    res.send("Password don`t match");
  }

  db.one(`insert into adotame.user(id_user, name, email, phone) values($1, $2, $3, $4)`, [gen_random_uuid(), frontName, frontEmail], 12345).then(rows => {
    console.log(rows);
  });

  db.one(`insert into adotame.login(id_login, username, password) values($1, $2, $3)`, [gen_random_uuid(), frontEmail, frontPassword]).then(rows => {
    console.log(rows);
  });

  res.send(`HI ${frontName}`);
});

module.exports = router;
