var express = require('express');
var router = express.Router();


router.get('/:type', function(req, res, next) {
  res.render('catalog/index', {type: req.params.type});
});


module.exports = router;