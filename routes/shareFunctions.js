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
         VALUES($1, now(), 'Pendente', '79734220-0e4c-4d00-ba84-d0c8c2f7f8d6',
         '2f958f74-0e11-44f6-a343-05df75e5afd6', $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15) returning id_request`,
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
  }
};
