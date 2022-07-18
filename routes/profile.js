var express = require('express');
var router = express.Router();


router.get('/', function(req, res, next) {
  res.render('profile/index', { title: 'Express' });
});

router.put('/update/:id', function(req, res, next) {
    res.render('profile/create-update', { id: req.params.id });
  });

  router.post('/create', function(req, res, next) {
    res.render('profile/create-update', { id : null });
  });

  router.get('/list', function(req, res, next) {
    res.render('profile/list', { title: 'Express' });
  });

module.exports = router;