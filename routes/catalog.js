var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('catalog/index', { title: 'Express' });
});

router.get('/AdotarApadrinhar-caes', function(req, res, next) {
  res.render('catalog/index', { title: 'Express' });
});

router.get('/AdotarApadrinhar-gatos', function(req, res, next) {
  res.render('catalog/index', { title: 'Express' });
});

module.exports = router;