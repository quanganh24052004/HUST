CREATE TABLE `movie_ticket_booking`.`guest` (
  `id_guest` INT NOT NULL,
  `id_person_g` INT NULL,
  INDEX `id_person_idx` (`id_person_g` ASC) VISIBLE,
  CONSTRAINT `id_person_g`
    FOREIGN KEY (`id_person_g`)
    REFERENCES `movie_ticket_booking`.`person` (`id_person`)
    ON DELETE SET NULL
    ON UPDATE SET NULL);