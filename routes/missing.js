var express = require('express');
var router = express.Router();


router.get('/', function(req, res, next) {
  res.render('missing/list');
});

router.get('/report', function(req, res, next) {
  res.render('missing/report');
});

router.get('/seen', function(req, res, next) {
  res.render('missing/form');
});

module.exports = router;