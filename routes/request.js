var express = require('express');
var router = express.Router();

/* GET request listing. */
router.get('/create', function(req, res, next) {
  res.render('request/create-update', {title: 'Express'});
});


router.get('/list', function(req, res, next) {
  res.render('request/list', {title: 'Express'});
});

module.exports = router;