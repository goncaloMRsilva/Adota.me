var express = require('express');
var router = express.Router();


router.get('/', function(req, res, next) {
  res.render('permission/list', { title: 'Express' });
});

router.get('/update/:id', function(req, res, next) {
    res.render('permission/create-update', { id: req.params.id });
  });

  router.get('/create', function(req, res, next) {
    res.render('permission/create-update', { id : null });
  });


module.exports = router;