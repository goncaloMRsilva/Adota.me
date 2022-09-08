var express = require('express');
var router = express.Router();


router.get('/', function(req, res, next) {
  res.render('missing/list');
});

router.get('/report', function(req, res, next) {
  res.render('missing/report', {title: 'Reportar desaparecido', paragraph: 'Reporte um caso de desaparecimento'});
});

router.post('/report', function(req, res, next) {
  db.tx(async (t) => {
    var missing = await t.one(
      `insert into adotame.animal(id_animal, name, photo, size, type, gender, breed, fur, color)
       values($1, $2, $3, $4, $5, $6, $7, $8, $9) returning id_animal`,
      [crypto.randomUUID(), req.body.name, req.body.photo, req.body.size, req.body.type, req.body.gender,
        req.body.breed, req.body.fur, req.body.color]
    );

    await t.none(
      `insert into adotame.request(id_request, date_request, status, id_user, id_request_type, last_seen_place, description, id_animal)
       values($1, now(), 'Pendente', 'a3bf5656-3614-4176-a84a-233c2391cb04', '448cddae-5646-48fc-a4de-269f3cf74bbe', $2, $3, $4)`,
      [crypto.randomUUID(), req.body.last_seen_place, req.body.description, missing.id_animal]
    );
  })
    .then(() => {
      res.send(`Pedido enviado com sucesso!`);
    })
    .catch((error) => {
      console.log("ERROR:", error);
    });
});

router.get('/seen', function(req, res, next) {
  res.render('missing/form', {title: 'Desaparecido avistado', paragraph: 'Encontrou algum animal desaparecido?'});
});

module.exports = router;