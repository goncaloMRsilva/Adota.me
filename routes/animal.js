var express = require('express');
var router = express.Router();
const db = require("../database");
const crypto = require("crypto");


router.get('/', function(req, res, next) {
  var animal = [
    {name: 'Bobby', type: 'dog', gender: 'M', age: 13}
  ];

  res.render('animal/list', {animals: animal});
});


router.get('/create', function(req, res, next) {
  res.render('animal/create-update');
});

router.post('/create', function(req, res, next) {
  var name = req.body.name;
  console.log(name);
  
  db.one(`insert into adotame.animal(id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares)
  values($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15) returning id_animal`,
  [crypto.randomUUID(), req.body.name, req.body.type, req.body.photo, req.body.gender, req.body.age, req.body.size, req.body.fur,
    req.body.breed, req.body.color, req.body.vaccines, req.body.portion, req.body.health, req.body.cares]).then(data => {
      console.log(data.id_animal);
    }).catch(error => {
      console.log('ERROR:', error);
    });

  res.send("OK");

  if((name.length >= 15) || (name.length < 2)) {
    res.send("Name is not valid");
  }else{
    res.send("OK");
  }

});


router.get('/update/:id', function(req, res, next) {
  res.render('animal/create-update');
});


module.exports = router;