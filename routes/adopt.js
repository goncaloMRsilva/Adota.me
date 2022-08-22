var express = require('express');
var router = express.Router();


router.get('/:animalId', function(req, res, next) {
  res.render('adopt/form');
});

router.get('/:animalId', function(req, res, next) {
    res.render('adopt/list');
});


module.exports = router;