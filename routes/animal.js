var express = require('express');
var router = express.Router();


router.get('/', function(req, res, next) {
  res.render('animal/list', {nome: 'bobby'});
});


router.post('/create', function(req, res, next) {
  res.render('animal/create-update');
});


router.put('/update/:id', function(req, res, next) {
  res.render('animal/create-update');
});


module.exports = router;