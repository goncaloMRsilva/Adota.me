var express = require('express');
const db = require('../database');
var router = express.Router();


router.get('/', function(req, res, next) {
  res.render('registry/index');
});


router.post("/", function(req,res, next) {
  var name = req.body.name;
  var frontEmail = req.body.email;
  var frontEmail1 = req.body.email1;
  var frontPassword = req.body.password;
  var frontPassword1 = req.body.password1;

  if (frontEmail !== frontEmail1){
    res.send("E-mail don`t match");
  }else if(frontPassword !== frontPassword1){
    res.send("Password don`t match");
  }

  res.send(`HI ${name}`);
});

module.exports = router;
