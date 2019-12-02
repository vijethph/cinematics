-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.17 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for project
CREATE DATABASE IF NOT EXISTS `project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `project`;

-- Dumping structure for table project.actor
CREATE TABLE IF NOT EXISTS `actor` (
  `name` varchar(50) NOT NULL,
  `dob` date DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `file_path` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table project.actor: ~10 rows (approximately)
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
INSERT INTO `actor` (`name`, `dob`, `age`, `gender`, `file_path`) VALUES
	('Aamir Khan', '1965-03-14', 54, 'Male', '/assets/images/aamirkhan.jpg'),
	('Chiranjeevi', '1955-08-22', 64, 'Male', '/assets/images/chiranjeevi.jpg'),
	('Chris Evans', '1981-06-13', 38, 'Male', '/assets/images/chrisevans.jpg'),
	('Prabhas', '1979-10-23', 40, 'Male', '/assets/images/prabhas.jpeg'),
	('Puneeth Rajkumar', '1975-03-17', 44, 'Male', '/assets/images/puneethrajkumar.jpg'),
	('Rajinikanth', '1950-12-12', 68, 'Male', '/assets/images/rajinikanth.jpg'),
	('Salman Khan', '1965-12-27', 53, 'Male', '/assets/images/salmankhan.jpg'),
	('Sam Worthington', '1976-08-02', 43, 'Male', '/assets/images/samworthington.jpg'),
	('Vijay', '1974-06-22', 45, 'Male', '/assets/images/vijay.jpg'),
	('Yash', '1986-01-08', 33, 'Male', '/assets/images/yash.jpg');
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;

-- Dumping structure for table project.actor_awards
CREATE TABLE IF NOT EXISTS `actor_awards` (
  `actor_name` varchar(50) NOT NULL,
  `award1` varchar(50) DEFAULT NULL,
  `award2` varchar(50) DEFAULT NULL,
  `award3` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`actor_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table project.actor_awards: ~10 rows (approximately)
/*!40000 ALTER TABLE `actor_awards` DISABLE KEYS */;
INSERT INTO `actor_awards` (`actor_name`, `award1`, `award2`, `award3`) VALUES
	('Aamir Khan', 'IIFA Awards', 'AACTA Awards', 'National Film Awards'),
	('Chiranjeevi', 'SIIMA Awards', 'Nandi Awards', 'Filmfare Awards'),
	('Chris Evans', 'Scream Awards', 'MTV Movie Awards', 'Teen Choice Awards'),
	('Prabhas', 'SIIMA Awards', 'IIFA Utsavam Awards', 'Filmfare Awards'),
	('Puneeth Rajkumar', 'SIIMA Awards', 'National Film Award', 'Filmfare Awards'),
	('Rajinikanth', 'IIFA Utsavam Awards', 'Vijay Awards', 'Filmfare Awards'),
	('Salman Khan', 'IIFA Awards', 'ITA Awards', 'National Film Awards'),
	('Sam Worthington', 'FCCA Awards', 'AFI Awards', 'IF Awards'),
	('Vijay', 'SIIMA Awards', 'BIFAN Awards', 'Vijay Awards'),
	('Yash', 'IIFA Utsavam Awards', 'SIIMA Awards', 'Filmfare Awards');
/*!40000 ALTER TABLE `actor_awards` ENABLE KEYS */;

-- Dumping structure for table project.also_an
CREATE TABLE IF NOT EXISTS `also_an` (
  `director_name` varchar(50) NOT NULL,
  `actor_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`director_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table project.also_an: ~0 rows (approximately)
/*!40000 ALTER TABLE `also_an` DISABLE KEYS */;
INSERT INTO `also_an` (`director_name`, `actor_name`) VALUES
	('Aamir Khan', 'Aamir Khan');
/*!40000 ALTER TABLE `also_an` ENABLE KEYS */;

-- Dumping structure for procedure project.check_profit_or_loss
DELIMITER //
CREATE DEFINER=`myself`@`%` PROCEDURE `check_profit_or_loss`(IN budget bigint,IN gross bigint,OUT diff bigint,OUT msg varchar(1000))
BEGIN
    SET diff=gross-budget;
    IF(diff<0) THEN
        SET msg='Movie in loss';
    ELSE
        SET msg='Movie in profit';
    END IF;
END//
DELIMITER ;

-- Dumping structure for table project.directed_by
CREATE TABLE IF NOT EXISTS `directed_by` (
  `movie_id` int(11) NOT NULL,
  `director_name` varchar(50) NOT NULL,
  PRIMARY KEY (`movie_id`,`director_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table project.directed_by: ~10 rows (approximately)
/*!40000 ALTER TABLE `directed_by` DISABLE KEYS */;
INSERT INTO `directed_by` (`movie_id`, `director_name`) VALUES
	(101, 'Russo Brothers'),
	(102, 'James Cameron'),
	(103, 'Aamir Khan'),
	(104, 'Kabir Khan'),
	(105, 'Prashanth Neel'),
	(106, 'Santosh Anandram'),
	(107, 'S.Shankar'),
	(108, 'Atlee'),
	(109, 'Surender Reddy'),
	(110, 'Sujeeth');
/*!40000 ALTER TABLE `directed_by` ENABLE KEYS */;

-- Dumping structure for table project.director
CREATE TABLE IF NOT EXISTS `director` (
  `name` varchar(50) NOT NULL,
  `dob` date DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `filmography` varchar(200) DEFAULT NULL,
  `file_path` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table project.director: ~10 rows (approximately)
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
INSERT INTO `director` (`name`, `dob`, `age`, `filmography`, `file_path`) VALUES
	('Aamir Khan', '1965-03-14', 54, 'Dangal, Taare Zameen Par, Lagaan, Ghajini', '/assets/images/aamirkhan.jpg'),
	('Atlee', '1986-09-21', 33, 'Theri, Mersal, Bigil', '/assets/images/atlee.jpg'),
	('James Cameron', '1954-07-16', 65, 'The Terminator Series', '/assets/images/jamescameron.jpg'),
	('Kabir Khan', '1971-05-21', 48, 'Ek Tha Tiger, Bajrangi Bhaijaan, Phantom', '/assets/images/kabirkhan.jpg'),
	('Prashanth Neel', '1980-06-04', 39, 'Ugramm, KGF Series', '/assets/images/prashanthneel.jpg'),
	('Russo Brothers', '1970-02-03', 49, 'Captain America Series', '/assets/images/russobros.jpeg'),
	('S.Shankar', '1963-08-17', 56, 'Sivaji-The Boss, Enthiran, 2.0', '/assets/images/sshankar.jpg'),
	('Santhosh Anandram', '1985-08-15', 34, 'Mr and Mrs Ramachari, Rocky, Raajakumara', '/assets/images/santoshanandram.jpg'),
	('Sujeeth', '1988-10-29', 31, 'Run Raja Run, Saaho', '/assets/images/sujeeth.jpg'),
	('Surender Reddy', '1975-12-07', 43, 'Race Gurram, Kick Series, Dhruva', '/assets/images/surenderreddy.jpg');
/*!40000 ALTER TABLE `director` ENABLE KEYS */;

-- Dumping structure for table project.movie
CREATE TABLE IF NOT EXISTS `movie` (
  `movie_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `length` int(11) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `budget` bigint(20) DEFAULT NULL,
  `gross` bigint(20) DEFAULT NULL,
  `company_name` varchar(50) DEFAULT NULL,
  `file_path` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table project.movie: ~10 rows (approximately)
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` (`movie_id`, `title`, `length`, `release_date`, `rating`, `language`, `budget`, `gross`, `company_name`, `file_path`) VALUES
	(101, 'Avengers Endgame', 181, '2019-04-22', 8.5, 'English', 356000000, 2798000000, 'Marvel Studios', '/assets/images/avengersendgame.jpg'),
	(102, 'Avatar', 161, '2009-12-10', 7.8, 'English', 237000000, 2790000000, 'Lightstorm Entertainment', '/assets/images/avatar.jpg'),
	(103, 'Taare Zameen Par', 164, '2007-12-14', 8.4, 'Hindi', 120000000, 889000000, 'Aamir Khan Productions', '/assets/images/threeidiots.jpg'),
	(104, 'Bajrangi Bhaijaan', 159, '2015-07-22', 8, 'Hindi', 90000000, 970000000, 'Salman Khan Films', '/assets/images/bhajrangi.jpg'),
	(105, 'KGF', 155, '2018-12-20', 8.2, 'Kannada', 50000000, 250000000, 'Hombale Films', '/assets/images/kgf.jpg'),
	(106, 'Raajakumara', 148, '2017-03-24', 8, 'Kannada', 200000000, 750000000, 'Jayanna Combines', '/assets/images/rajkumaara.jpg'),
	(107, '2.0', 147, '2018-11-29', 6.4, 'Tamil', 570000000, 821000000, 'Lyca Productions', '/assets/images/twopointo.jpg'),
	(108, 'Bigil', 177, '2019-10-25', 7.6, 'Tamil', 180000000, 270000000, 'AGS Entertainment', '/assets/images/bigil.jpg'),
	(109, 'Sye Raa Narasimha Reddy', 171, '2019-10-02', 8.1, 'Telugu', 250000000, 270000000, 'Konidela Production Company', '/assets/images/syeraa.jpg'),
	(110, 'Saaho', 170, '2019-08-30', 5.5, 'Telugu', 350000000, 433000000, 'UV Creations', '/assets/images/saaho.jpg');
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;

-- Dumping structure for table project.movie_genre
CREATE TABLE IF NOT EXISTS `movie_genre` (
  `movie_id` int(11) NOT NULL,
  `genre1` varchar(50) DEFAULT NULL,
  `genre2` varchar(50) DEFAULT NULL,
  `genre3` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table project.movie_genre: ~10 rows (approximately)
/*!40000 ALTER TABLE `movie_genre` DISABLE KEYS */;
INSERT INTO `movie_genre` (`movie_id`, `genre1`, `genre2`, `genre3`) VALUES
	(101, 'Action', 'Superhero', 'Adventure'),
	(102, 'Action', 'Science Fiction', 'Fantasy'),
	(103, 'Drama', 'Musical', 'Family'),
	(104, 'Drama', 'Comedy', 'Adventure'),
	(105, 'Thriller', 'Drama', 'Action'),
	(106, 'Family', 'Drama', 'Romance'),
	(107, 'Action', 'Science Fiction', 'Thriller'),
	(108, 'Drama', 'Sports', 'Adventure'),
	(109, 'Drama', 'History', 'War'),
	(110, 'Action', 'Thriller', 'Romance');
/*!40000 ALTER TABLE `movie_genre` ENABLE KEYS */;

-- Dumping structure for table project.performed_by
CREATE TABLE IF NOT EXISTS `performed_by` (
  `movie_id` int(11) NOT NULL,
  `actor_name` varchar(50) NOT NULL,
  PRIMARY KEY (`movie_id`,`actor_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table project.performed_by: ~10 rows (approximately)
/*!40000 ALTER TABLE `performed_by` DISABLE KEYS */;
INSERT INTO `performed_by` (`movie_id`, `actor_name`) VALUES
	(101, 'Chris Evans'),
	(102, 'Sam Worthington'),
	(103, 'Aamir Khan'),
	(104, 'Salman Khan'),
	(105, 'Yash'),
	(106, 'Puneeth Rajkumar'),
	(107, 'Rajinikanth'),
	(108, 'Vijay'),
	(109, 'Chiranjeevi'),
	(110, 'Prabhas');
/*!40000 ALTER TABLE `performed_by` ENABLE KEYS */;

-- Dumping structure for table project.production_company
CREATE TABLE IF NOT EXISTS `production_company` (
  `name` varchar(100) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table project.production_company: ~10 rows (approximately)
/*!40000 ALTER TABLE `production_company` DISABLE KEYS */;
INSERT INTO `production_company` (`name`, `address`) VALUES
	('Aamir Khan Productions', 'Mumbai, Maharashtra, India'),
	('AGS Entertainment', 'Chennai, Tamil Nadu, India'),
	('Hombale Films', 'Bengaluru, Karnataka, India'),
	('Jayanna Combines', 'Bengaluru, Karnataka, India'),
	('Konidela Production Company', 'Hyderabad, Telangana, India'),
	('Lightstorm Entertainment', 'Santa Monica, Los Angeles, California'),
	('Lyca Productions', 'Chennai, Tamil Nadu, India'),
	('Marvel Studios', '500 South Buena Vista Street, Burbank, California, United States'),
	('Salman Khan Films', 'Mumbai, Maharashtra, India'),
	('UV Creations', 'Hyderabad, Telangana, India');
/*!40000 ALTER TABLE `production_company` ENABLE KEYS */;

-- Dumping structure for table project.quote
CREATE TABLE IF NOT EXISTS `quote` (
  `actor_name` varchar(50) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `dialogue` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`actor_name`,`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table project.quote: ~9 rows (approximately)
/*!40000 ALTER TABLE `quote` DISABLE KEYS */;
INSERT INTO `quote` (`actor_name`, `movie_id`, `type`, `dialogue`) VALUES
	('Aamir Khan', 103, 'Drama', 'Let us not lose these stars on Earth'),
	('Chiranjeevi', 109, 'Stroke', 'Renadu Virulara..Charitralo Manam Undakapovachu, Charitra Ee Roju Manathone Modalavvali'),
	('Chris Evans', 101, 'Moment of truth', 'Some people move on, but not us.'),
	('Prabhas', 110, 'Delimiting', 'Gallilo Yavadina Sixer Kodathadu...Kaani Stadiumlo Kotivadike Okka Range Untadi'),
	('Puneeth Rajkumar', 106, 'Revolting', 'Neen noor sala nanna meele attack maadidru, noor sala naane hodiyoodu'),
	('Rajinikanth', 107, 'Zeitgeist', 'Vaangada selfie pullengala...I\'ll set your screen on fire'),
	('Salman Khan', 104, 'Zeitgeist', 'Hum bajrang bali ke bhakt hai koi kaam chori chupe nahi karte'),
	('Sam Worthington', 102, 'Memorable', 'The Na\'vi say, that every person is born twice.'),
	('Vijay', 108, 'Niche', 'Happy deepavali nanba'),
	('Yash', 105, 'Fad, Cutting Edge', 'If you think you are bad, I\'m your dad');
/*!40000 ALTER TABLE `quote` ENABLE KEYS */;

-- Dumping structure for trigger project.check_actor_age
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `check_actor_age` BEFORE UPDATE ON `actor` FOR EACH ROW BEGIN
SET NEW.age=TIMESTAMPDIFF(YEAR,OLD.dob,CURDATE());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger project.check_director_age
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `check_director_age` BEFORE UPDATE ON `director` FOR EACH ROW BEGIN
SET NEW.age=TIMESTAMPDIFF(YEAR,OLD.dob,CURDATE());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger project.check_rating
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `check_rating` BEFORE INSERT ON `movie` FOR EACH ROW BEGIN
    IF NEW.rating>10 THEN
        SET NEW.rating=10;
    ELSEIF NEW.rating<0 THEN
        SET NEW.rating=0;
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
