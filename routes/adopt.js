var express = require("express");
var router = express.Router();
const db = require("../database");
const { v4: uuidv4} = require("uuid");
const { func } = require("../database");

router.get("/form/:id", function (req, res, next) {
  db.one(`select name, birth_date, photo from adotame.animal where id_animal = $1`, [
    req.params.id,
  ]).then((rows) => {
    res.render("adopt/form", { id: req.params.id, animal_name: rows, title: 'Catálogo > Adotar > Inquérito', paragraph: 'Esperemos que encontre algum amiguinho novo!!'});
  });
});

router.post("/form", function (req, res, next) {
  db.tx(async (t) => {
    var adoptRequest = await t.one(
        `insert into adotame.request(id_request, date_request, status, id_user, id_request_type, married, childs,
         live_with, home_agreement, allergies_in_relatives, main_caregiver_name, caregiver_long, caregiver_illness_name,
         why_adopt, yard, animal_sleep_place, animal_loneless_daytime, animal_alone_place, playtime, pet_before,
         pet_nowdays, animal_cares_expenses, teach_plans, moving_home_animal_effects, give_up_circumstances, id_animal)
         VALUES($1, now(), 'Pendente', '08ea5fbe-244b-4a8b-bab2-384e2d3c8069', '327bcd1d-5e81-4056-a955-7cd829b84ded', $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22)
         returning id_request`,
         [
          uuidv4(),
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
          req.body.give_up_circumstances,
          req.body.animalID
         ]
    )

    await t.none(
      `insert into adotame.animal_status(id_animal_status, status, start_date, id_request)
        values($1, 'Adotado', now(), $2)`,
        [
          uuidv4(),
          adoptRequest.id_request
        ]
    )
    .then(rows => {
      console.log(rows);
      res.send("Pedido enviado");
    })
    .catch(err => {
      console.log(err);
      res.status(500).json({
        message: "failed when save adopt request"
      });
    })
  })
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
    db.tx(async (t) => {
      var request = await t.one(
        `insert into adotame.request(id_request, date_request, status, id_user, id_request_type, birth_date, nif, address, postal_code, locality, phone, financial_payment_method, value_amount, hobby, id_animal)
         values($1, now(), 'Pendente', '08ea5fbe-244b-4a8b-bab2-384e2d3c8069', '8d5e180a-9732-418d-8ea6-79ec5ad9a949', $2, $3, $4, $5, $6, $7, $8, $9, $10, $11)
         returning id_request`,
         [
               uuidv4(),
               req.body.birth_date,
               req.body.nif,
               req.body.address,
               req.body.postal_code,
               req.body.locality,
               req.body.phone,
               req.body.financial_payment_method,
               req.body.value_amount,
               req.body.hobby,
               req.body.animal_ID
          ]
      )

      await t.none(
        `insert into adotame.animal_status(id_animal_status, status, start_date, id_request)
        values($1, 'Apadrinhado', now(), $2)`,
        [
          uuidv4(),
          request.id_request
        ]
      )
    })
    .then(rows => {
      console.log(rows);
      res.send("pedido enviado");
    })
    .catch(error => {
      console.log(error);
      res.status(500).json({
        message: "failed when save patronize request"
      })
    })
  }
});

module.exports = router;