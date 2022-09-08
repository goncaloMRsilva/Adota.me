const { request } = require('express');
var express = require('express');
const db = require('../database');
var router = express.Router();


router.get('/', function(req, res, next) {
  db.any(`select name from adotame.request_type`)
  .then(rows => {
    console.log(rows);
    res.render('request/index', {requests: rows, title: 'Pedidos', paragraph: 'Crie um pedido à sua escolha'});
  })
  .catch(err => {
    console.log(err);
    res.render('error', {error: err, message: 'Not possible render this page'});
  })
});

router.get('/create', function(req, res, next) {
  res.render('request/create-update', {title: 'create request'});
});

router.get('/list', function(req, res, next) {
  res.render('request/list', {title: 'Lista de Pedidos', paragraph: 'Consulte e valide os diversos pedidos propostos'});
});

module.exports = router;