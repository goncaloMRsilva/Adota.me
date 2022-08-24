var express = require('express');
var router = express.Router();
const db = require("../database");
const crypto = require("crypto");

// var today = new Date();
// var d = today.getDay();
// var m = today.getMonth();
// var y = today.getFullYear();
// today = d + '-' + m + '-' + y;
// console.log(today);

// var today = new Date();
// console.log(today.toLocaleDateString());


router.get('/', function(req, res, next) {
  db.any(`select * from adotame.animal`).then(rows => {
    res.render('animal/list', {animals: rows});
  })
});


router.get('/create', function(req, res, next) {
  res.render('animal/create-update');
});

router.post('/create', function(req, res, next) {
  var name = req.body.name;
  
  var getBirthDate = new Date(req.body.age);
  console.log(getBirthDate);
  var getSysDate = new Date();
  console.log(getSysDate);

  if (getBirthDate > getSysDate) {
    res.send("Invalid Birth Date!!")
  }

  var datesDiff = getSysDate.getDate() - getBirthDate.getDate();
  console.log(datesDiff);

  if((name.length >= 15) || (name.length < 2)) {
    res.send("Name is not valid");
  }else{
    res.send("OK");
  }
  
  db.one(`insert into adotame.animal(id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares)
  values($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14)`,
  [crypto.randomUUID(), req.body.name, req.body.type, req.body.photo, req.body.gender, datesDiff, req.body.size, req.body.fur,
    req.body.breed, req.body.color, req.body.vaccines, req.body.portion, req.body.health, req.body.cares]).then(rows => {
      console.log(rows);
    }).catch(error => {
      console.log('ERROR:', error);
    });

  res.send("OK");
});


router.get('/profile', function(req, res, next) {
  db.any(`select * from adotame.animal`).then(rows => {
    res.render('animal/profile', {animals: rows});
  })
});


module.exports = router;