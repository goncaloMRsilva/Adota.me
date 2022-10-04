const db = require("../database");
const crypto = require("crypto");
const { response } = require("express");

module.exports = {
    createAnimal: (name, type, photo, gender, birth_date, size, fur, breed, color, vaccines, portion, health, cares, location) => {
        return db.one(`insert into adotame.request(id_request, date_request, status, id_user, id_request_type,
            report_animal_name, report_animal_type, report_animal_photo, report_animal_gender,
            report_animal_birth_date, report_animal_size, report_animal_fur, report_animal_breed,
            report_animal_color, report_animal_vaccines, report_animal_portion, report_animal_health,
            report_animal_cares, report_animal_location)
            VALUES($1, now(), 'Pendente', 'cb3d1fb7-e106-4359-baae-d4edaf577e9a',
            '727d3ddf-4ec2-4df4-93e8-5457aeb270d1', $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15) returning id_request`,
            [
                crypto.randomUUID(),
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
            ]
        ).then(response => response)
    },

    rejectRequest: () => {
        return db.one(`UPDATE adotame.request
                       SET status = 'Reprovado'`
                    )
                    .then(response => response)
    }
};