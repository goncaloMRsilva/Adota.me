var express = require('express');
const db = require('../database');
var router = express.Router();
const bcrypt = require("bcrypt");

// const saltRounds = 10;  
// var password = "goncalo123"; 
// var password2 = "goncalo123"; 
// bcrypt.hash(password, saltRounds, function(err, hash) { 
//   bcrypt.compare(password2, hash, function(err, result) {  
//     if (result) {
//           console.log("It matches")
//     }else {
//           console.log("Invalid password");
//     }
//   });
// });

router.get('/', function(req, res, next) {
  res.render('login/index');
});

router.post('/', function(req, res, next){
  db.one(`select password from adotame.login l where l.username = $1`, [req.body.email]).then(response => {
        bcrypt.compare(req.body.password, response.password, function(err, result) {
         console.log(response.password);
          console.log(req.body.password);
          console.log(result);
          console.log(err);
          if (result) {
            res.send("welcome");   
          }else{
            res.send("invalid user");
          }
      });
    });
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