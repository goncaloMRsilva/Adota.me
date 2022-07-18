var express = require('express');
var router = express.Router();


router.get('/', function(req, res, next) {
  res.render('animal/list', { title: 'Express' });
});


router.post('/create', function(req, res, next) {
  res.render('animal/create-update', { title: 'Express' });
});


router.put('/update/:id', function(req, res, next) {
  res.render('animal/create-update', { title: 'Express' });
});


module.exports = router;