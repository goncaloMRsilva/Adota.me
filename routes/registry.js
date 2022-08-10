var express = require('express');
const db = require('../database');
var router = express.Router();


router.get('/', function(req, res, next) {
  res.render('registry/index');
});

module.exports = router;
