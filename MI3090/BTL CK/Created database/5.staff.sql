CREATE TABLE `movie_ticket_booking`.`staff` (
  `id_staff` INT NOT NULL,
  `id_person_s` INT NOT NULL,
  PRIMARY KEY (`id_staff`),
  INDEX `id_person_s_idx` (`id_person_s` ASC) VISIBLE,
  CONSTRAINT `id_person_s`
    FOREIGN KEY (`id_person_s`)
    REFERENCES `movie_ticket_booking`.`person` (`id_person`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);