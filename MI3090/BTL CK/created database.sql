-- Tạo schema 'movie_ticket_booking'
CREATE SCHEMA `movie_ticket_booking` ;
USE movie_ticket_booking;

-- 20227035_Nguyễn Quang Anh
-- Tạo bảng person
CREATE TABLE `movie_ticket_booking`.`person` (
  `id_person` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `phone` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`id_person`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC) VISIBLE);

-- 20227035_Nguyễn Quang Anh
-- Tạo bảng account
CREATE TABLE `movie_ticket_booking`.`acount` (
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

-- 20227035_Nguyễn Quang Anh
-- Tạo bảng guest
CREATE TABLE `movie_ticket_booking`.`guest` (
  `id_guest` INT NOT NULL,
  `id_person_g` INT NULL,
  INDEX `id_person_idx` (`id_person_g` ASC) VISIBLE,
  CONSTRAINT `id_person_g`
    FOREIGN KEY (`id_person_g`)
    REFERENCES `movie_ticket_booking`.`person` (`id_person`)
    ON DELETE SET NULL
    ON UPDATE SET NULL);

-- 20227035_Nguyễn Quang Anh
-- Tạo bảng admin
CREATE TABLE `movie_ticket_booking`.`admin` (
  `id_admin` INT NOT NULL,
  `id_person_a` INT NOT NULL,
  PRIMARY KEY (`id_admin`),
  INDEX `id_person_a_idx` (`id_person_a` ASC) VISIBLE,
  CONSTRAINT `id_person_a`
    FOREIGN KEY (`id_person_a`)
    REFERENCES `movie_ticket_booking`.`person` (`id_person`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);

-- 20227035_Nguyễn Quang Anh
-- Tạo bảng customer
CREATE TABLE `movie_ticket_booking`.`customer` (
  `id_customer` INT NOT NULL,
  `id_person_c` INT NOT NULL,
  PRIMARY KEY (`id_customer`),
  INDEX `id_person_c_idx` (`id_person_c` ASC) VISIBLE,
  CONSTRAINT `id_person_c`
    FOREIGN KEY (`id_person_c`)
    REFERENCES `movie_ticket_booking`.`person` (`id_person`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);
-- 20227035_Nguyễn Quang Anh
-- Tạo bảng staff
CREATE TABLE `movie_ticket_booking`.`staff` (
  `id_staff` INT NOT NULL,
  `id_person_s` INT NOT NULL,
  PRIMARY KEY (`id_staff`),
  INDEX `id_person_s_idx` (`id_person_s` ASC) VISIBLE,
  CONSTRAINT `id_person_s`
    FOREIGN KEY (`id_person_s`)
    REFERENCES `movie_ticket_booking`.`person` (`id_person`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);

-- 20227035_Nguyễn Quang Anh
-- Tạo bảng movie
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
    
-- 20227035_Nguyễn Quang Anh
-- Tạo bảng cinema
CREATE TABLE `movie_ticket_booking`.`cinema` (
  `id_cinema` INT NOT NULL,
  `name` VARCHAR(1023) NOT NULL,
  `address` VARCHAR(1023) NOT NULL,
  `status` ENUM('Mở cửa','Đóng cửa','Bảo trì') NOT NULL,
  PRIMARY KEY (`id_cinema`));

-- 20227035_Nguyễn Quang Anh
-- Tạo bảng cinema_hall
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

-- 20227035_Nguyễn Quang Anh
-- Tạo bảng cinema_hall_seat
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

-- 20227035_Nguyễn Quang Anh
-- Tạo bảng show
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
    
-- 20227035_Nguyễn Quang Anh
-- Tạo bảng booking
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

-- 20227035_Nguyễn Quang Anh
-- Tạo bảng showseat
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

-- 20227035_Nguyễn Quang Anh
-- Tạo bảng payment
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













