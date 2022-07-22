var express = require('express');
var router = express.Router();


router.get('/', function(req, res, next) {
  res.render('donate/index');
});

router.post('/create', function(req, res, next) {
  res.render('donate/create-update');
});

module.exports = router;