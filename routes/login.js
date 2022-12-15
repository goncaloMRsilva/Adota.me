var express = require('express');
const db = require('../database');
var router = express.Router();
const bcrypt = require("bcrypt");

router.get('/', function(req, res, next) {
  res.render('login/index', {title: 'Login', paragraph: 'Faça login no sistema'});
});

router.post('/', function(req, res, next){
  db.one(`select password, username from adotame.login l where l.username = $1`, [req.body.email]).then(response => {
        bcrypt.compare(req.body.password, response.password, function(err, result) {
          if (result) {
            res.send(`Bem-vindo ${response.username}`);
          }else{
            res.send("Utilizador inválido!");
          }
      });
    });
});

router.get('/update/:id', function(req, res, next) {
    res.render('login/create-update', { id: req.params.id });
});

router.get('/list', function(req, res, next) {
    res.render('login/list');
});

module.exports = router;