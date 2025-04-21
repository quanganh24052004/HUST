CREATE TABLE `movie_ticket_booking`.`cinema` (
  `id_cinema` INT NOT NULL,
  `name` VARCHAR(1023) NOT NULL,
  `address` VARCHAR(1023) NOT NULL,
  `status` ENUM('Mở cửa','Đóng cửa','Bảo trì') NOT NULL,
  PRIMARY KEY (`id_cinema`));
