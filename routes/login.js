var express = require('express');
const db = require('../database');
var router = express.Router();
const bcrypt = require("bcrypt");

router.get('/', function(req, res, next) {
  res.render('login/index');
});

router.post('/', function(req, res, next){

  const bodyEmail = req.body.email;
  console.log(bodyEmail);


  db.any(`select u.* from adotame.user u
          where u.email = $1`, [bodyEmail]).then(rows =>{
    console.log(rows);
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