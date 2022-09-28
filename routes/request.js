const { request } = require('express');
var express = require('express');
const db = require('../database');
var router = express.Router();


router.get('/', function(req, res, next) {
    res.render('request/index', { title: 'Pedidos', paragraph: 'Crie um pedido à sua escolha'});
});

router.get('/create', function(req, res, next) {
  res.render('request/create-update', {title: 'create request'});
});

router.get('/list', function(req, res, next) {
  db.any(`select * from adotame.request r
  inner join adotame.request_type rt
  on r.id_request_type = rt.id_request_type
  inner join adotame.animal a 
  on r.id_animal = a.id_animal 
  where r.status = 'Pendente'`)
  .then(rows => {
    console.log(rows);
    res.render('request/list', {requests: rows, title: 'Lista de Pedidos', paragraph: 'Consulte e valide os diversos pedidos propostos'});
  }).catch(err => {
    console.log(err);
    res.render('error', {error: err, message: 'Not possible render this page'});
  })
});

module.exports = router;