CREATE TABLE `movie_ticket_booking`.`cinema_hall` (
  `id_hall` INT NOT NULL,
  `name` VARCHAR(15) NOT NULL,
  `status` ENUM('Hoạt động','Bảo trì') NOT NULL,
  `gerne` ENUM('3D','4DX','IMAX','GoldClass','ScreenX','Lamour','Premium') NOT NULL,
  `no_seat` INT NOT NULL,
  `id_cinema` INT NOT NULL,
  PRIMARY KEY (`id_hall`),
  INDEX `id_cinema_idx` (`id_cinema` ASC) VISIBLE,
  CONSTRAINT `id_cinema`
    FOREIGN KEY (`id_cinema`)
    REFERENCES `movie_ticket_booking`.`cinema` (`id_cinema`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);