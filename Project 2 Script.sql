-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cs_bag15552
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cs_bag15552
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cs_bag15552` DEFAULT CHARACTER SET utf8 ;
USE `cs_bag15552` ;

-- -----------------------------------------------------
-- Table `cs_bag15552`.`Family_Account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_bag15552`.`Family_Account` (
  `idFamily_Account` INT NOT NULL,
  `Family_Name` VARCHAR(45) NULL,
  PRIMARY KEY (`idFamily_Account`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_bag15552`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_bag15552`.`User` (
  `idUser` INT NOT NULL,
  `Family_Account_idFamily_Account` INT NOT NULL,
  `First_Name` VARCHAR(45) NULL,
  `Last_Name` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Password` VARCHAR(45) NULL,
  PRIMARY KEY (`idUser`),
  INDEX `fk_User_Family_Account1_idx` (`Family_Account_idFamily_Account` ASC) VISIBLE,
  CONSTRAINT `fk_User_Family_Account1`
    FOREIGN KEY (`Family_Account_idFamily_Account`)
    REFERENCES `cs_bag15552`.`Family_Account` (`idFamily_Account`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_bag15552`.`Subscription_Plan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_bag15552`.`Subscription_Plan` (
  `idSubscription_Plan` INT NOT NULL,
  `Type` VARCHAR(45) NULL,
  `Price` INT NULL,
  `Resolution` VARCHAR(45) NULL,
  PRIMARY KEY (`idSubscription_Plan`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_bag15552`.`Subscription_Plan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_bag15552`.`Subscription_Plan` (
  `idSubscription_Plan` INT NOT NULL,
  `Type` VARCHAR(45) NULL,
  `Price` INT NULL,
  `Resolution` VARCHAR(45) NULL,
  PRIMARY KEY (`idSubscription_Plan`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_bag15552`.`Payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_bag15552`.`Payment` (
  `User_idUser` INT NOT NULL,
  `Subscription_Plan_idSubscription_Plan` INT NOT NULL,
  `Date` DATE NULL,
  `Payment_Type` VARCHAR(45) NULL,
  PRIMARY KEY (`User_idUser`, `Subscription_Plan_idSubscription_Plan`),
  INDEX `fk_User_has_Subscription_Plan_Subscription_Plan1_idx` (`Subscription_Plan_idSubscription_Plan` ASC) VISIBLE,
  INDEX `fk_User_has_Subscription_Plan_User_idx` (`User_idUser` ASC) VISIBLE,
  CONSTRAINT `fk_User_has_Subscription_Plan_User`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `cs_bag15552`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Subscription_Plan_Subscription_Plan1`
    FOREIGN KEY (`Subscription_Plan_idSubscription_Plan`)
    REFERENCES `cs_bag15552`.`Subscription_Plan` (`idSubscription_Plan`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_bag15552`.`Genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_bag15552`.`Genre` (
  `idGenre` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Description` VARCHAR(150) NULL,
  PRIMARY KEY (`idGenre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_bag15552`.`Movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_bag15552`.`Movie` (
  `idMovie` INT NOT NULL,
  `Genre_idGenre` INT NOT NULL,
  `Title` VARCHAR(45) NULL,
  `Release_year` YEAR(4) NULL,
  `Duration` TIME NULL,
  `Age_rating` VARCHAR(45) NULL,
  `Language` VARCHAR(45) NULL,
  PRIMARY KEY (`idMovie`),
  INDEX `fk_Movie_Genre1_idx` (`Genre_idGenre` ASC) VISIBLE,
  CONSTRAINT `fk_Movie_Genre1`
    FOREIGN KEY (`Genre_idGenre`)
    REFERENCES `cs_bag15552`.`Genre` (`idGenre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_bag15552`.`Watch_History`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_bag15552`.`Watch_History` (
  `User_idUser` INT NOT NULL,
  `Movie_idMovie` INT NOT NULL,
  `Date_watched` DATE NULL,
  PRIMARY KEY (`User_idUser`, `Movie_idMovie`),
  INDEX `fk_User_has_Movie_Movie1_idx` (`Movie_idMovie` ASC) VISIBLE,
  INDEX `fk_User_has_Movie_User1_idx` (`User_idUser` ASC) VISIBLE,
  CONSTRAINT `fk_User_has_Movie_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `cs_bag15552`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Movie_Movie1`
    FOREIGN KEY (`Movie_idMovie`)
    REFERENCES `cs_bag15552`.`Movie` (`idMovie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_bag15552`.`Reviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_bag15552`.`Reviews` (
  `User_idUser` INT NOT NULL,
  `Movie_idMovie` INT NOT NULL,
  `Score` INT NULL,
  `Comments` VARCHAR(100) NULL,
  PRIMARY KEY (`User_idUser`, `Movie_idMovie`),
  INDEX `fk_User_has_Movie_Movie2_idx` (`Movie_idMovie` ASC) VISIBLE,
  INDEX `fk_User_has_Movie_User2_idx` (`User_idUser` ASC) VISIBLE,
  CONSTRAINT `fk_User_has_Movie_User2`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `cs_bag15552`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Movie_Movie2`
    FOREIGN KEY (`Movie_idMovie`)
    REFERENCES `cs_bag15552`.`Movie` (`idMovie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_bag15552`.`Device`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_bag15552`.`Device` (
  `idDevice` INT NOT NULL,
  `User_idUser` INT NOT NULL,
  `Type` VARCHAR(45) NULL,
  `Last_access_date` DATE NULL,
  `OS` VARCHAR(45) NULL,
  PRIMARY KEY (`idDevice`),
  INDEX `fk_Device_User1_idx` (`User_idUser` ASC) VISIBLE,
  CONSTRAINT `fk_Device_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `cs_bag15552`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_bag15552`.`User_Preferences`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_bag15552`.`User_Preferences` (
  `User_idUser` INT NOT NULL,
  `Genre_idGenre` INT NOT NULL,
  PRIMARY KEY (`User_idUser`, `Genre_idGenre`),
  INDEX `fk_User_has_Genre_Genre1_idx` (`Genre_idGenre` ASC) VISIBLE,
  INDEX `fk_User_has_Genre_User1_idx` (`User_idUser` ASC) VISIBLE,
  CONSTRAINT `fk_User_has_Genre_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `cs_bag15552`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Genre_Genre1`
    FOREIGN KEY (`Genre_idGenre`)
    REFERENCES `cs_bag15552`.`Genre` (`idGenre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_bag15552`.`Watch_List`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_bag15552`.`Watch_List` (
  `User_idUser` INT NOT NULL,
  `Movie_idMovie` INT NOT NULL,
  PRIMARY KEY (`User_idUser`, `Movie_idMovie`),
  INDEX `fk_User_has_Movie_Movie3_idx` (`Movie_idMovie` ASC) VISIBLE,
  INDEX `fk_User_has_Movie_User3_idx` (`User_idUser` ASC) VISIBLE,
  CONSTRAINT `fk_User_has_Movie_User3`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `cs_bag15552`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Movie_Movie3`
    FOREIGN KEY (`Movie_idMovie`)
    REFERENCES `cs_bag15552`.`Movie` (`idMovie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO `cs_bag15552`.`Family_Account` (`idFamily_Account`, `Family_Name`) VALUES
(1, 'Smith'),
(2, 'Johnson'),
(3, 'Williams'),
(4, 'Brown'),
(5, 'Jones'),
(6, 'Garcia'),
(7, 'Miller'),
(8, 'Davis'),
(9, 'Rodriguez'),
(10, 'Martinez');

INSERT INTO `cs_bag15552`.`User` (`idUser`, `Family_Account_idFamily_Account`, `First_Name`, `Last_Name`, `Email`, `Password`) VALUES
(1, 1, 'John', 'Smith', 'john.smith@example.com', 'password123'),
(2, 1, 'Emma', 'Smith', 'emma.smith@example.com', 'secure456'),
(3, 2, 'Liam', 'Johnson', 'liam.johnson@example.com', 'mypassword789'),
(4, 2, 'Sophia', 'Johnson', 'sophia.johnson@example.com', 'test5678'),
(5, 3, 'Noah', 'Williams', 'noah.williams@example.com', 'welcome4321'),
(6, 3, 'Olivia', 'Williams', 'olivia.williams@example.com', 'secure6543'),
(7, 4, 'James', 'Brown', 'james.brown@example.com', 'mypassword123'),
(8, 4, 'Mia', 'Brown', 'mia.brown@example.com', 'password7890'),
(9, 5, 'Benjamin', 'Jones', 'benjamin.jones@example.com', 'pass6789'),
(10, 5, 'Charlotte', 'Jones', 'charlotte.jones@example.com', 'default123'),
(11, 6, 'Elijah', 'Garcia', 'elijah.garcia@example.com', 'admin5678'),
(12, 6, 'Amelia', 'Garcia', 'amelia.garcia@example.com', 'guest1111'),
(13, 7, 'Lucas', 'Miller', 'lucas.miller@example.com', 'mypassword444'),
(14, 7, 'Isabella', 'Miller', 'isabella.miller@example.com', 'secure9999'),
(15, 8, 'Henry', 'Davis', 'henry.davis@example.com', 'user6666'),
(16, 8, 'Harper', 'Davis', 'harper.davis@example.com', 'welcome0000'),
(17, 9, 'Alexander', 'Rodriguez', 'alexander.rodriguez@example.com', 'secure1010'),
(18, 9, 'Evelyn', 'Rodriguez', 'evelyn.rodriguez@example.com', 'guest2121'),
(19, 10, 'Jack', 'Martinez', 'jack.martinez@example.com', 'test3434'),
(20, 10, 'Ava', 'Martinez', 'ava.martinez@example.com', 'mypassword6767');

INSERT INTO `cs_bag15552`.`Subscription_Plan` (`idSubscription_Plan`, `Type`, `Price`, `Resolution`) VALUES
(1, 'Basic', 8, 'SD'),
(2, 'Standard', 12, 'HD'),
(3, 'Premium', 16, '4K');

INSERT INTO `cs_bag15552`.`Genre` (`idGenre`, `Name`, `Description`) VALUES
(1, 'Action', 'Fast-paced movies with intense sequences.'),
(2, 'Comedy', 'Movies designed to make the audience laugh.'),
(3, 'Drama', 'Serious storytelling often with emotional themes.'),
(4, 'Horror', 'Designed to scare and thrill the audience.'),
(5, 'Romance', 'Centers on love and relationships.'),
(6, 'Science Fiction', 'Focuses on futuristic or technological themes.'),
(7, 'Fantasy', 'Features magical or supernatural elements.'),
(8, 'Adventure', 'Exploration and heroic journeys.'),
(9, 'Thriller', 'Suspenseful and intense narratives.'),
(10, 'Mystery', 'Focuses on solving a puzzle or crime.'),
(11, 'Documentary', 'Non-fiction films showcasing real events.'),
(12, 'Biography', 'Life stories of notable individuals.'),
(13, 'Animation', 'Movies using animated sequences.'),
(14, 'Musical', 'Combines music, song, and dance.'),
(15, 'War', 'Focuses on military conflicts.'),
(16, 'Crime', 'Explores criminal activities and justice.'),
(17, 'Western', 'Set in the American Old West.'),
(18, 'Historical', 'Depicts events from history.'),
(19, 'Family', 'Movies suitable for all ages.'),
(20, 'Sports', 'Centers on athletic events or themes.');

INSERT INTO `cs_bag15552`.`Movie` (`idMovie`, `Genre_idGenre`, `Title`, `Release_year`, `Duration`, `Age_rating`, `Language`) VALUES
(1, 1, 'The Fast Escape', 2020, '01:50:00', 'PG-13', 'English'),
(2, 2, 'Laugh It Out', 2021, '01:30:00', 'PG', 'English'),
(3, 3, 'A Tearful Journey', 2019, '02:00:00', 'R', 'English'),
(4, 4, 'Haunted Night', 2022, '01:45:00', 'PG-13', 'English'),
(5, 5, 'Love Beyond Time', 2020, '02:10:00', 'PG', 'English'),
(6, 6, 'Space Odyssey 3000', 2018, '02:30:00', 'PG-13', 'English'),
(7, 7, 'The Magic Realm', 2021, '02:20:00', 'PG', 'English'),
(8, 8, 'Lost in the Wild', 2019, '01:55:00', 'PG', 'English'),
(9, 9, 'Suspicious Minds', 2022, '02:05:00', 'R', 'English'),
(10, 10, 'The Missing Piece', 2020, '01:40:00', 'PG', 'English'),
(11, 11, 'Earth Chronicles', 2017, '02:15:00', 'G', 'English'),
(12, 12, 'The Innovator', 2019, '02:00:00', 'PG', 'English'),
(13, 13, 'Animated Tales', 2021, '01:20:00', 'G', 'English'),
(14, 14, 'Dancing Dreams', 2020, '01:50:00', 'PG', 'English'),
(15, 15, 'Frontline Stories', 2018, '02:40:00', 'R', 'English'),
(16, 16, 'Criminal Pursuit', 2022, '01:35:00', 'PG-13', 'English'),
(17, 17, 'The Lone Cowboy', 2021, '01:45:00', 'PG', 'English'),
(18, 18, 'The History Makers', 2020, '02:10:00', 'PG', 'English'),
(19, 19, 'Family Adventures', 2018, '01:25:00', 'G', 'English'),
(20, 20, 'Champion’s Glory', 2022, '02:00:00', 'PG', 'English');

INSERT INTO `cs_bag15552`.`Payment` (`User_idUser`, `Subscription_Plan_idSubscription_Plan`, `Date`, `Payment_Type`) VALUES
(1, 1, '2023-01-15', 'Credit Card'),
(2, 2, '2023-01-20', 'PayPal'),
(3, 3, '2023-02-01', 'Credit Card'),
(4, 1, '2023-02-10', 'Debit Card'),
(5, 2, '2023-02-15', 'Credit Card'),
(6, 3, '2023-03-05', 'PayPal'),
(7, 1, '2023-03-10', 'Credit Card'),
(8, 2, '2023-03-15', 'Debit Card'),
(9, 3, '2023-04-01', 'Credit Card'),
(10, 1, '2023-04-10', 'PayPal'),
(11, 2, '2023-04-15', 'Debit Card'),
(12, 3, '2023-05-01', 'Credit Card'),
(13, 1, '2023-05-10', 'Credit Card'),
(14, 2, '2023-05-15', 'PayPal'),
(15, 3, '2023-06-01', 'Debit Card'),
(16, 1, '2023-06-10', 'Credit Card'),
(17, 2, '2023-06-15', 'Credit Card'),
(18, 3, '2023-07-01', 'PayPal'),
(19, 1, '2023-07-10', 'Debit Card'),
(20, 2, '2023-07-15', 'Credit Card');

INSERT INTO `cs_bag15552`.`Watch_History` (`User_idUser`, `Movie_idMovie`, `Date_watched`) VALUES
(1, 1, '2023-01-01'),
(1, 2, '2023-01-05'),
(2, 3, '2023-01-10'),
(2, 4, '2023-01-15'),
(3, 5, '2023-02-01'),
(3, 6, '2023-02-07'),
(4, 7, '2023-02-15'),
(4, 8, '2023-02-20'),
(5, 9, '2023-03-01'),
(5, 10, '2023-03-10'),
(6, 11, '2023-03-20'),
(6, 12, '2023-03-25'),
(7, 13, '2023-04-01'),
(7, 14, '2023-04-07'),
(8, 15, '2023-04-15'),
(8, 16, '2023-04-20'),
(9, 17, '2023-05-01'),
(9, 18, '2023-05-05'),
(10, 19, '2023-05-15'),
(10, 20, '2023-05-20');

INSERT INTO `cs_bag15552`.`Reviews` (`User_idUser`, `Movie_idMovie`, `Score`, `Comments`) VALUES
(1, 1, 5, 'Amazing action sequences!'),
(1, 2, 4, 'Pretty funny!'),
(2, 3, 3, 'It was okay, a bit too slow.'),
(2, 4, 4, 'Scary but enjoyable.'),
(3, 5, 5, 'A beautiful love story.'),
(3, 6, 5, 'Loved the futuristic visuals!'),
(4, 7, 4, 'Magical and imaginative.'),
(4, 8, 3, 'Adventure was a bit lacking.'),
(5, 9, 5, 'Thrilling and suspenseful!'),
(5, 10, 4, 'Mystery solved well.'),
(6, 11, 5, 'Very informative documentary.'),
(6, 12, 4, 'Interesting life story.'),
(7, 13, 5, 'Kids loved it!'),
(7, 14, 4, 'Great musical numbers.'),
(8, 15, 5, 'A raw and emotional war film.'),
(8, 16, 4, 'Engaging crime drama.'),
(9, 17, 3, 'A slow-paced western.'),
(9, 18, 5, 'Fascinating historical drama.'),
(10, 19, 5, 'Perfect for family viewing!'),
(10, 20, 5, 'An inspiring sports story.');

INSERT INTO `cs_bag15552`.`User_Preferences` (`User_idUser`, `Genre_idGenre`) VALUES
(1, 1),
(1, 6),
(2, 2),
(2, 5),
(3, 3),
(3, 7),
(4, 4),
(4, 8),
(5, 9),
(5, 10),
(6, 11),
(6, 13),
(7, 14),
(7, 15),
(8, 16),
(8, 17),
(9, 18),
(9, 19),
(10, 20),
(10, 1);

INSERT INTO `cs_bag15552`.`Watch_List` (`User_idUser`, `Movie_idMovie`) VALUES
(1, 2),
(1, 5),
(2, 4),
(2, 6),
(3, 7),
(3, 10),
(4, 1),
(4, 9),
(5, 12),
(5, 14),
(6, 15),
(6, 20),
(7, 8),
(7, 18),
(8, 11),
(8, 13),
(9, 16),
(9, 17),
(10, 19),
(10, 3);


#query number one
SELECT Family_Account.Family_Name, SUM(Revenue) AS Total_Revenue
FROM Family_Account
JOIN (
    SELECT User.Family_Account_idFamily_Account, SUM(Subscription_Plan.Price) AS Revenue
    FROM User 
    JOIN Payment ON User.idUser = Payment.User_idUser
    JOIN Subscription_Plan ON 
    Payment.Subscription_Plan_idSubscription_Plan = Subscription_Plan.idSubscription_Plan
    GROUP BY User.Family_Account_idFamily_Account
) AS RevenuePerFamily ON Family_Account.idFamily_Account = RevenuePerFamily.Family_Account_idFamily_Account
GROUP BY Family_Account.Family_Name
ORDER BY Total_Revenue DESC;

#Query number two
# For each user who has watched a movie after March 1, 2023, what is their first name, last name, 
# the total number of distinct movies on their watchlist, their average review score (only for users 
# with an average score of 4 or higher), and their most recent subscription type?
  
SELECT 
    User.idUser,
    User.First_Name,
    User.Last_Name,
    COUNT(DISTINCT Watch_List.Movie_idMovie) AS Total_Watchlist,
    AVG(Reviews.Score) AS Average_Review_Score,
    Subscription_Plan.Type AS Subscription_Type
FROM 
    User
JOIN 
    Watch_List ON User.idUser = Watch_List.User_idUser
JOIN 
    Reviews ON User.idUser = Reviews.User_idUser
JOIN 
    Subscription_Plan ON Subscription_Plan.idSubscription_Plan = (
        SELECT Payment.Subscription_Plan_idSubscription_Plan 
        FROM Payment
        WHERE Payment.User_idUser = User.idUser 
        ORDER BY Payment.Date DESC 
        LIMIT 1
    )
WHERE 
    User.idUser IN (
        SELECT DISTINCT Watch_History.User_idUser 
        FROM Watch_History 
        WHERE Watch_History.Date_watched > '2023-03-01'
    )
GROUP BY 
    User.idUser, User.First_Name, User.Last_Name, Subscription_Plan.Type
HAVING 
    AVG(Reviews.Score) >= 4
ORDER BY 
    Average_Review_Score DESC;


# Query number three
# Which users have watched recent movies (released after 2020), what are their favorite genres, 
# and what subscription plans are they using?

select 
    User.idUser,
    User.First_Name as First_Name,
    User.Last_Name as Last_Name,
    (select count(*) 
     from Watch_History 
     where Watch_History.User_idUser = User.idUser) as Total_Movies_Watched,
    (select Genre.Name 
     from Genre 
     join User_Preferences on Genre.idGenre = User_Preferences.Genre_idGenre 
     where User_Preferences.User_idUser = User.idUser 
     limit 1) as Favorite_Genre,
    Subscription_Plan.Type as Subscription_Type
from 
    User
join 
    Payment on User.idUser = Payment.User_idUser
join 
    Subscription_Plan on Payment.Subscription_Plan_idSubscription_Plan = Subscription_Plan.idSubscription_Plan
where 
    User.idUser in (
        select User_idUser 
        from Watch_History 
        where Movie_idMovie in (
            select idMovie 
            from Movie 
            where Release_year > 2020
        )
    )
order by 
    Total_Movies_Watched desc;


