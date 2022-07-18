var express = require('express');
var router = express.Router();


router.get('/', function(req, res, next) {
  res.render('missing/form', {title: 'Express'});
});

router.get('/report', function(req, res, next) {
  res.render('missing/report', {title: 'Express'});
});

router.get('/list', function(req, res, next) {
  res.render('missing/list', {title: 'Express'});
});

module.exports = router;