var express = require('express');
var router = express.Router();


router.get('/:animalId', function(req, res, next) {
  res.render('adopt/form', {type: req.params.type});
});

router.get('/', function(req, res, next) {
    res.render('adopt/list', {type: req.params.type});
});


module.exports = router;