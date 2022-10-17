const db = require("../database");
const { v4: uuidv4} = require("uuid");
const { response } = require("express");

module.exports = {
  createAnimal: (
    name,
    type,
    photo,
    gender,
    birth_date,
    size,
    fur,
    breed,
    color,
    vaccines,
    portion,
    health,
    cares,
    location
  ) => {
    return db
      .one(
        `insert into adotame.request(id_request, date_request, status, id_user, id_request_type,
            report_animal_name, report_animal_type, report_animal_photo, report_animal_gender,
            report_animal_birth_date, report_animal_size, report_animal_fur, report_animal_breed,
            report_animal_color, report_animal_vaccines, report_animal_portion, report_animal_health,
            report_animal_cares, report_animal_location)
            VALUES($1, now(), 'Pendente', '188b1825-a609-4ebf-ac5f-be848f80bae7',
            '5d387a92-1940-4cb6-bab8-d34ea89ec423', $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15) returning id_request`,
        [
          uuidv4(),
          name,
          type,
          photo,
          gender,
          birth_date,
          size,
          fur,
          breed,
          color,
          vaccines,
          portion,
          health,
          cares,
          location,
        ]
      )
      .then((response) => response);
  },

  rejectRequest: (id_request) => {
    return db
      .one(
        `UPDATE adotame.request
         SET status = 'Reprovado'
         where id_request = '${id_request}'`
      )
      .then((response) => response);
  },

  acceptRequest: (id_request) => {
    return db
      .one(
        `UPDATE adotame.request
         SET status = 'Aprovado'
         where id_request = '${id_request}'`
      )
      .then((response) => response);
  }
};
