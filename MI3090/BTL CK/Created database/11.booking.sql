CREATE TABLE `movie_ticket_booking`.`booking` (
  `id_booking` INT NOT NULL,
  `createdOn` DATE NOT NULL,
  `status` ENUM('Requested','Pending','Confirmed','Checked-in','Canceled','Abandoned') NOT NULL,
  `id_customer` INT NOT NULL,
  `id_staff` INT NOT NULL,
  `id_show` INT NOT NULL,
  PRIMARY KEY (`id_booking`),
  UNIQUE INDEX `id_booking_UNIQUE` (`id_booking` ASC) VISIBLE,
  INDEX `id_customer_idx` (`id_customer` ASC) VISIBLE,
  INDEX `id_staff_idx` (`id_staff` ASC) VISIBLE,
  INDEX `id_show_idx` (`id_show` ASC) VISIBLE,
  CONSTRAINT `id_customer`
    FOREIGN KEY (`id_customer`)
    REFERENCES `movie_ticket_booking`.`customer` (`id_customer`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `id_staff`
    FOREIGN KEY (`id_staff`)
    REFERENCES `movie_ticket_booking`.`staff` (`id_staff`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `id_show`
    FOREIGN KEY (`id_show`)
    REFERENCES `movie_ticket_booking`.`show` (`id_show`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);
