var express = require('express');
var router = express.Router();


router.get('/', function(req, res, next) {
  var animal = [
    {name: 'Bobby', type: 'dog', gender: 'M', age: 13}
  ];

  res.render('animal/list', {animals: animal});
});


router.get('/create', function(req, res, next) {
  res.render('animal/create-update');
});


router.get('/update/:id', function(req, res, next) {
  res.render('animal/create-update');
});


module.exports = router;