var express = require('express');
var router = express.Router();


router.get('/', function(req, res, next) {
  res.render('home/index', {layout: 'layouts/noaside', title:'Bem-vindo!^^', paragraph: 'Esperemos que encontre algum amiguinho novo!!'});
});

module.exports = router;
