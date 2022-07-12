var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.render('user/index')
});

router.get('/create', function(req, res, next) {
  res.render('user/create-update')
});

router.get('/list', function(req, res, next) {
  res.render('user/list')
});

module.exports = router;
