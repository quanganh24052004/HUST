CREATE TABLE `movie_ticket_booking`.`payment` (
  `id_payment` INT NOT NULL,
  `amount` DOUBLE NOT NULL,
  `createdOn` DATE NOT NULL,
  `status` ENUM('Unpaid','Pending','Completed','Failed','Declined','Cancelled','Abandoned','Settling','Settled','Refunded') NOT NULL,
  `methodPayment` ENUM('Cash','Banking','e-gift') NOT NULL,
  `id_booking_p` INT NOT NULL,
  PRIMARY KEY (`id_payment`),
  INDEX `id_booking_p_idx` (`id_booking_p` ASC) VISIBLE,
  CONSTRAINT `id_booking_p`
    FOREIGN KEY (`id_booking_p`)
    REFERENCES `movie_ticket_booking`.`booking` (`id_booking`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);