CREATE TABLE `movie_ticket_booking`.`customer` (
  `id_customer` INT NOT NULL,
  `id_person_c` INT NOT NULL,
  PRIMARY KEY (`id_customer`),
  INDEX `id_person_c_idx` (`id_person_c` ASC) VISIBLE,
  CONSTRAINT `id_person_c`
    FOREIGN KEY (`id_person_c`)
    REFERENCES `movie_ticket_booking`.`person` (`id_person`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);