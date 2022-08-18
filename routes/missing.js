var express = require('express');
var router = express.Router();


router.get('/', function(req, res, next) {
  res.render('missing/form');
});

router.get('/report', function(req, res, next) {
  res.render('missing/report');
});

router.get('/list', function(req, res, next) {
  res.render('missing/list');
});

module.exports = router;