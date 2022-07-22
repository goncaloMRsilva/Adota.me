var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('login/index', { title: 'Express' });
});

router.get('/update/:id', function(req, res, next) {
    res.render('login/create-update', { id: req.params.id });
  });

  router.get('/create', function(req, res, next) {
    res.render('login/create-update', { id : null });
  });

  router.get('/list', function(req, res, next) {
    res.render('login/list');
  });

module.exports = router;