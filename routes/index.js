var express = require('express');
var router = express.Router();


router.get('/', function(req, res, next) {
  res.render('home/index', {layout: 'layouts/noaside'});
});

module.exports = router;
