CREATE TABLE `movie_ticket_booking`.`movie` (
  `id_movie` INT NOT NULL,
  `name` VARCHAR(1023) NOT NULL,
  `gerne` VARCHAR(255) NOT NULL,
  `rating` VARCHAR(3) NOT NULL,
  `len_min` VARCHAR(3) NOT NULL,
  `status` ENUM('Sắp Chiếu','Chiếu sớm','Đang chiếu','Ngừng chiếu','Chiếu lại') NOT NULL,
  `id_admin` INT NOT NULL,
  PRIMARY KEY (`id_movie`),
  INDEX `id_admin_idx` (`id_admin` ASC) VISIBLE,
  CONSTRAINT `id_admin`
    FOREIGN KEY (`id_admin`)
    REFERENCES `movie_ticket_booking`.`admin` (`id_admin`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);
    