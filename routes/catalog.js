var express = require('express');
const db = require('../database');
var router = express.Router();


router.get('/:type', function(req, res, next) {
  var type = req.params.type;
  var catalog = req.query.catalog ||  "Adotar e Apadrinhar";
  if ( catalog !== 'Adotar e Apadrinhar' || catalog !== "Desaparecido") {
    catalog = "Adotar e Apadrinhar";
  }

  db.any(`select a.* from adotame.animal a 
  inner join adotame.catalog_animal ca 
  on a.id_animal = ca.id_animal 
  inner join adotame.catalog c 
  on c.id_catalog = ca.id_catalog
  where a.type  ${type == 'all' ? '<>' : '='} $1
  and c.name = $2`, [type, catalog])
  .then(rows => {
    console.log(rows);
    res.render('catalog/index', {type: req.params.type, animals: rows});       
})
.catch(err => {
    console.log(err);
    res.render('error', {error: err, message: 'Not possible render this page'});
})

});


module.exports = router;