var express = require("express");
var router = express.Router();
const db = require("../database");
const crypto = require("crypto");
const { func } = require("../database");

router.get("/form/:id", function (req, res, next) {
  db.one(`select name, birth_date, photo from adotame.animal where id_animal = $1`, [
    req.params.id,
  ]).then((rows) => {
    res.render("adopt/form", { id: req.params.id, animal_name: rows, title: 'Catálogo > Adotar > Inquérito', paragraph: 'Esperemos que encontre algum amiguinho novo!!'});
  });
});

router.get("/patronize-form/:id", function (req, res, next) {
  db.one(`select name, birth_date, photo from adotame.animal where id_animal = $1`, [
    req.params.id,
  ]).then((rows) => {
    res.render("adopt/patronize-form", {
      id: req.params.id,
      animal_name_date: rows,
      title: 'Catálogo > Apadrinhar > Inquérito', paragraph: 'Esperemos que encontre algum amiguinho novo!!'
    });
  });
});

router.post("/patronize-form", function(req, res, next) {
  var get_birth_date = new Date(req.body.birth_date);
  var getSysDate = new Date();

  if (get_birth_date.toLocaleString("en-ZA", {year: 'numeric', month: 'numeric', day: 'numeric'}) > getSysDate.toLocaleString("en-ZA", {year: 'numeric', month: 'numeric', day: 'numeric'})){
    res.send("Data inválida!")
  }else{
    db.one(`insert into adotame.request(id_request, date_request, status, id_user, id_request_type, birth_date, nif, address, postal_code, locality, phone, financial_payment_method, value_amount, hobby)
            values($1, now(), 'Pendente', 'a3bf5656-3614-4176-a84a-233c2391cb04', '5995b6bf-3b93-4946-be1a-977e1864e0d5', $2, $3, $4, $5, $6, $7, $8, $9, $10)`,
            [
              crypto.randomUUID(),
              req.body.birth_date,
              req.body.nif,
              req.body.address,
              req.body.postal_code,
              req.body.locality,
              req.body.phone,
              req.body.financial_payment_method,
              req.body.value_amount,
              req.body.hobby
            ]
            ).then(rows => {
              console.log(rows);
            }).catch(error => {
              console.log("ERROR:", error);
            });
            res.send("Pedido enviado com sucesso!");
  }
});


router.post("/form", function (req, res, next) {
  db.one(
    `insert into adotame.request(id_request, date_request, status, id_user, id_request_type, married, childs,
            live_with, home_agreement, allergies_in_relatives, main_caregiver_name, caregiver_long, caregiver_illness_name,
            why_adopt, yard, animal_sleep_place, animal_loneless_daytime, animal_alone_place, playtime, pet_before,
            pet_nowdays, animal_cares_expenses, teach_plans, moving_home_animal_effects, give_up_circumstances)
            VALUES($1, now(), 'Pendente', 'a3bf5656-3614-4176-a84a-233c2391cb04', '1a87e1b7-2b89-4dc9-8185-5fd6490a0fac', $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21)`,
    [
      crypto.randomUUID(),
      req.body.married,
      req.body.childs,
      req.body.live_with,
      req.body.home_agreement,
      req.body.allergies_in_relatives,
      req.body.main_caregiver_name,
      req.body.caregiver_long,
      req.body.caregiver_illness_name,
      req.body.why_adopt,
      req.body.yard,
      req.body.animal_sleep_place,
      req.body.animal_loneless_daytime,
      req.body.animal_alone_place,
      req.body.playtime,
      req.body.pet_before,
      req.body.pet_nowdays,
      req.body.animal_cares_expenses,
      req.body.teach_plans,
      req.body.moving_home_animal_effects,
      req.body.give_up_circumstances
    ]
  ).then((rows) => {
    console.log(rows);
  }).catch(error => {
    console.log("ERROR:", error);
  });
  res.render("adopt/modal-thank", {title: null, paragraph: null});
});

module.exports = router;
