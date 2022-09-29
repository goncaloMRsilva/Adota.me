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
       VALUES($1, now(), 'Pendente', 'fc8df893-ac5a-491f-bd56-97c080ed31c7', '96e84f8c-3eca-4402-9b62-6a7c0c503501', $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12)
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

module.exports = router;
