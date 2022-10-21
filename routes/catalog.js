var express = require("express");
const db = require("../database");
var router = express.Router();

router.get("/:type", function (req, res, next) {
  var type = req.params.type;
  var catalog = req.query.catalog || "Adotar e Apadrinhar";

  db.any(
    `select a.*, AGE(now(), a.birth_date) as age from adotame.animal a
     inner join adotame.catalog_animal ca
     on a.id_animal = ca.id_animal
     inner join adotame.catalog c
     on c.id_catalog = ca.id_catalog
     where a.type  ${type == "all" ? "<>" : "="} $1
     and c.name = $2
     and a.id_animal not in (
        select a.id_animal from adotame.animal a
        inner join adotame.catalog_animal ca
        on a.id_animal = ca.id_animal
        inner join adotame.catalog c
        on c.id_catalog = ca.id_catalog
        inner join adotame.animal_animal_status aas
        on a.id_animal = aas.id_animal
        inner join adotame.animal_status as2
        on as2.id_animal_status = aas.id_animal_status
        where a.type ${type == "all" ? "<>" : "="} $1
        and c.name = $2
        and as2.status = 'Adotar'
        or as2.status = 'Apadrinhar'
        or as2.status = 'Reportar desaparecido'
    )`,
    [type, catalog]
  )
    .then((rows) => {
      console.log(rows);
      res.render("catalog/index", {
        type: req.params.type,
        animals: rows,
        title: "Catálogo",
        paragraph: "Esperamos que encontre algum amiguinho novo!!",
      });
    })
    .catch((err) => {
      console.log(err);
      res.render("error", {
        error: err,
        message: "Not possible render this page",
      });
    });
});

module.exports = router;
