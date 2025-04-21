CREATE TABLE `movie_ticket_booking`.`show_seat` (
  `id_show_seat` INT NOT NULL,
  `isReseerved` TINYINT NOT NULL,
  `price` DECIMAL(20,3) NOT NULL,
  `id_booking` INT NOT NULL,
  `id_show_ss` INT NOT NULL,
  `id_seat_ss` INT NOT NULL,
  PRIMARY KEY (`id_show_seat`),
  UNIQUE INDEX `id_booking_UNIQUE` (`id_show_seat` ASC) VISIBLE,
  INDEX `id_booking_idx` (`id_booking` ASC) VISIBLE,
  INDEX `id_show_idx` (`id_show_ss` ASC) VISIBLE,
  INDEX `id_seat_ss_idx` (`id_seat_ss` ASC) VISIBLE,
  CONSTRAINT `id_booking`
    FOREIGN KEY (`id_booking`)
    REFERENCES `movie_ticket_booking`.`booking` (`id_booking`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `id_show_ss`
    FOREIGN KEY (`id_show_ss`)
    REFERENCES `movie_ticket_booking`.`show` (`id_show`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `id_seat_ss`
    FOREIGN KEY (`id_seat_ss`)
    REFERENCES `movie_ticket_booking`.`cinema_hall_seat` (`id_seat`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);
