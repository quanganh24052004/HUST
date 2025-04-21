CREATE TABLE `movie_ticket_booking`.`admin` (
  `id_admin` INT NOT NULL,
  `id_person_a` INT NOT NULL,
  PRIMARY KEY (`id_admin`),
  INDEX `id_person_a_idx` (`id_person_a` ASC) VISIBLE,
  CONSTRAINT `id_person_a`
    FOREIGN KEY (`id_person_a`)
    REFERENCES `movie_ticket_booking`.`person` (`id_person`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);