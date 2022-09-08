var express = require('express');
var router = express.Router();


router.get('/', function(req, res, next) {
  res.render('notification/list', {title: 'Notificações', paragraph: 'Veja o seu histórico'});
});


module.exports = router;