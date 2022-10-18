var express = require('express');
const db = require('../database');
var router = express.Router();


router.get('/', function(req, res, next) {
  db.one(
    `select status from adotame.request;`
  ).then((rows) => {
    res.render('notification/list', {title: 'Notificações', paragraph: 'Veja o seu histórico', notifis: rows});
    console.log(rows);
  })
  .catch(err => {
    console.error(err);
    res.status(500).end();
  })
});


module.exports = router;