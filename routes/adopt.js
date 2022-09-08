var express = require("express");
var router = express.Router();
const db = require("../database");
const crypto = require("crypto");

router.get("/form/:id", function (req, res, next) {
  db.one(`select name, birth_date from adotame.animal where id_animal = $1`, [
    req.params.id,
  ]).then((rows) => {
    res.render("adopt/form", { id: req.params.id, animal_name: rows });
  });
});

router.get("/patronize-form/:id", function (req, res, next) {
  db.one(`select name, birth_date from adotame.animal where id_animal = $1`, [
    req.params.id,
  ]).then((rows) => {
    res.render("adopt/patronize-form", {
      id: req.params.id,
      animal_name_date: rows,
    });
  });
});

router.post("/form", function (req, res, next) {
  db.one(
    `insert into adotame.request(id_request, date_request, status, id_user, id_request_type, married, childs,
            live_with, home_agreement, allergies_in_relatives, main_caregiver_name, caregiver_long, caregiver_illness_name,
            why_adopt, yard, animal_sleep_place, animal_loneless_daytime, animal_alone_place, playtime, pet_before,
            pet_nowdays, animal_cares_expenses, teach_plans, moving_home_animal_effects, give_up_circumstances)
            VALUES($1, now(), $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22, $23, $24)`,
    [
      crypto.randomUUID(),
      "Pendente",
      "41b2a5cd-fab8-48cf-9269-5a73a341826d",
      "7e3760d3-6d85-401b-81e1-490683bcd189",
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
    ]
  ).then((rows) => {
    console.log(rows);
    res.send("request send");
  });
});

module.exports = router;
