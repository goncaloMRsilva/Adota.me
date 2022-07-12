var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('catalog/index', { title: 'Express' });
});

router.get('/cats', function(req, res, next) {
  res.render('catalog/catsList', { id: req.params.id });
});

router.get('/dogs', function(req, res, next) {
  res.render('catalog/dogsList', { title: 'Express' });
});

router.get('/missing', function(req, res, next) {
  res.render('catalog/missOnesList', { title: 'Express' });
});

router.get('/list', function(req, res, next) {
  res.render('catalog/list', { title: 'Express' });
});

module.exports = router;