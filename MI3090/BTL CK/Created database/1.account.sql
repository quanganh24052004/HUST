CREATE TABLE `movie_ticket_booking`.`account` (
  `id_account` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `status` VARCHAR(255) NOT NULL,
  `id_person` INT NOT NULL,
  PRIMARY KEY (`id_account`),
  INDEX `id_person_idx` (`id_person` ASC) VISIBLE,
  CONSTRAINT `id_person`
    FOREIGN KEY (`id_person`)
    REFERENCES `movie_ticket_booking`.`person` (`id_person`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);