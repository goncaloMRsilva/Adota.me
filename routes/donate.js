var express = require('express');
var router = express.Router();

router.get('/', function(req, res, next) {
  res.render('donate/index', {title: 'Doações', paragraph: 'Faça uma doação para ajudar os animais'});
});

module.exports = router;