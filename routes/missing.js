var express = require("express");
var router = express.Router();
const db = require("../database");
const crypto = require("crypto");

router.get("/", function (req, res, next) {
  res.render("missing/list");
});

router.get("/report", function (req, res, next) {
  res.render("missing/report", {
    title: "Reportar desaparecido",
    paragraph: "Reporte um caso de desaparecimento",
  });
});

router.post("/report", function (req, res, next) {
  db.one(
    `insert into adotame.request(id_request, date_request, status, id_user, id_request_type, report_animal_name, report_animal_photo, report_animal_size,
        report_animal_type, report_animal_gender, report_animal_fur, report_animal_breed, report_animal_color, last_seen_place, description, id_animal)
       VALUES($1, now(), 'Pendente', 'cb3d1fb7-e106-4359-baae-d4edaf577e9a', 'd424c2e6-c010-409d-9977-69ce230c7306', $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12)
       returning id_request`,
    [
      crypto.randomUUID(),
      req.body.report_animal_name,
      req.body.report_animal_photo,
      req.body.report_animal_size,
      req.body.report_animal_type,
      req.body.report_animal_gender,
      req.body.report_animal_fur,
      req.body.report_animal_breed,
      req.body.report_animal_color,
      req.body.last_seen_place,
      req.body.description,
      crypto.randomUUID()
    ]
  )
  .then(rows => {
    res.send("Pedido enviado com sucesso!");
    console.log(rows);
  }).catch(error => {
    console.log("Error:", error);
    res.status(500).end();
  });
});

router.get("/seen", function (req, res, next) {
  res.render("missing/form", {
    title: "Desaparecido avistado",
    paragraph: "Encontrou algum animal desaparecido?",
  });
});


router.get("/data/:id", function (req, res, next) {
  var id_adopt = req.params.id;
  db.one(`select r.id_request, r.date_request, r.id_user, r.married, r.childs, r.live_with, r.home_agreement,
          r.allergies_in_relatives, r.main_caregiver_name, r.caregiver_long, r.caregiver_illness_name,
          r.why_adopt, yard, r.animal_sleep_place, r.animal_loneless_daytime, r.animal_alone_place,
          r.playtime, r.pet_before, r.pet_nowdays, r.animal_cares_expenses, r.teach_plans, r.moving_home_animal_effects,
          r.give_up_circumstances, r.id_animal, rt.id_request_type 
          from adotame.request r
          inner join adotame.request_type rt 
          on r.id_request_type = rt.id_request_type
          where rt.id_request_type = $1`, [id_adopt]
          )
          .then(rows => {
            console.log(rows);
            res.render("adopt/list", {title: 'Formulário preenchido', paragraph: "", id_adopt: req.params.id, adopts: rows});
          })
          .catch(error => {
            res.status(500).end();
            console.log(error); 
          })
});

module.exports = router;
