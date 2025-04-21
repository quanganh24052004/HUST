CREATE TABLE `movie_ticket_booking`.`show` (
  `id_show` INT NOT NULL,
  `gerne` VARCHAR(255) NOT NULL,
  `col` VARCHAR(2) NOT NULL,
  `status` VARCHAR(15) NOT NULL,
  `date` DATE NOT NULL,
  `time` TIME NOT NULL,
  `id_admin_s` INT NOT NULL,
  `id_movie` INT NOT NULL,
  `id_hall_s` INT NOT NULL,
  PRIMARY KEY (`id_show`),
  INDEX `id_admin_idx` (`id_admin_s` ASC) VISIBLE,
  INDEX `id_movie_idx` (`id_movie` ASC) VISIBLE,
  INDEX `id_cinema_hall_idx` (`id_hall_s` ASC) VISIBLE,
  CONSTRAINT `id_admin_s`
    FOREIGN KEY (`id_admin_s`)
    REFERENCES `movie_ticket_booking`.`admin` (`id_admin`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `id_movie`
    FOREIGN KEY (`id_movie`)
    REFERENCES `movie_ticket_booking`.`movie` (`id_movie`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `id_hall_s`
    FOREIGN KEY (`id_hall_s`)
    REFERENCES `movie_ticket_booking`.`cinema_hall` (`id_hall`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);
    