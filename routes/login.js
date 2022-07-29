var express = require('express');
var router = express.Router();


router.get('/', function(req, res, next) {
  res.render('login/index', { title: 'Express' });
});

router.put('/update/:id', function(req, res, next) {
    res.render('login/create-update', { id: req.params.id });
});

router.post('/create', function(req, res, next) {
    res.render('login/create-update', { id : null });
});

router.get('/list', function(req, res, next) {
    res.render('login/list');
});

module.exports = router;