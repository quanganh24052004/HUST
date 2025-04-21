CREATE TABLE `movie_ticket_booking`.`cinema_hall_seat` (
  `id_seat` INT NOT NULL,
  `row` VARCHAR(2) NOT NULL,
  `col` VARCHAR(2) NOT NULL,
  `gerne` ENUM('Thường','VIP','Sweetbox') NOT NULL,
  `status` ENUM('Đóng','Mở') NOT NULL,
  `id_hall` INT NOT NULL,
  PRIMARY KEY (`id_seat`),
  INDEX `id_hall_idx` (`id_hall` ASC) VISIBLE,
  CONSTRAINT `id_hall`
    FOREIGN KEY (`id_hall`)
    REFERENCES `movie_ticket_booking`.`cinema_hall` (`id_hall`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);
