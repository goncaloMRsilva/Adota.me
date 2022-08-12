var express = require('express');
const db = require('../database');
var router = express.Router();
const bcrypt = require("bcrypt");

router.get('/', function(req, res, next) {
  res.render('login/index');
});

router.post('/', function(req, res, next){
  const bodyEmail = req.body.email;
  const Password = req.body.password;
  console.log(bodyEmail);
  console.log(Password);

  db.any(`select * from adotame.user u
          inner join adotame.login l on l.id_user = u.id_user
          where u.email = $1
          and l.password = $2`, [bodyEmail, Password]).then(rows =>{
    
          if (rows.length > 0) {
            res.send("Welcome");
          }else{
            res.send("Invalid User");
          }
  });
});

router.get('/update/:id', function(req, res, next) {
    res.render('login/create-update', { id: req.params.id });
});

router.get('/create', function(req, res, next) {
    res.render('login/create-update', { id : null });
});

router.get('/list', function(req, res, next) {
    res.render('login/list');
});

module.exports = router;