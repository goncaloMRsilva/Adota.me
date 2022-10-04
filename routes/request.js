const { request } = require("express");
var express = require("express");
const db = require("../database");
var router = express.Router();
const shareFunction = require('./shareFunctions');

router.get("/", function (req, res, next) {
  res.render("request/index", {
    title: "Pedidos",
    paragraph: "Crie um pedido à sua escolha",
  });
});

router.get("/create", function (req, res, next) {
  res.render("request/create-update", { title: "create request" });
});

router.post("post", function (req, res) {
  shareFunction.createAnimal(req.body.request_name, etc); 
})

router.get("/list", function (req, res, next) {
  var status = req.query.status || "Pendente";
  db.any(
    `select rt.id_request_type, rt.request_name, r.report_animal_photo, a.photo, a.id_animal, r.id_request from adotame.request r
     inner join adotame.request_type rt
     on r.id_request_type = rt.id_request_type
     left join adotame.animal a 
     on r.id_animal = a.id_animal
     where r.status = $1`,
     [status]
  )
    .then((rows) => {
      console.log(rows);
      rows = rows.map((row) => {
        row.photo = row.photo || row.report_animal_photo;
        return row;
      });
      res.render("request/list", {
        requests: rows,
        title: "Lista de Pedidos",
        paragraph: "Consulte e valide os diversos pedidos propostos",
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
