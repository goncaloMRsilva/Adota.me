var express = require('express');
const db = require('../database');
var router = express.Router();


router.get('/', function(req, res, next) {
  var email = req.query.email;
  var password = req.query.password;

  db.any(`select $1, $2
  from adotame.user u , adotame.login l
  where u.id_user = l.id_user`, [email, password])
  .then(rows => {
    console.log(rows);
    res.render('login/index', {email, password});
  })
  .catch(err => {
    console.log(err);
    res.render('error', {error: err, message: 'Not possible render this page'});
  })
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