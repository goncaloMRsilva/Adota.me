var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('animal/create-update', { title: 'Express' });
});

router.get('/crc', function(req, res, next) {
  res.render('animal/list', { title: 'Express' });
});

module.exports = router;