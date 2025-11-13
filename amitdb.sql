-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2025 at 05:39 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `amitdb`
--
CREATE DATABASE IF NOT EXISTS `amitdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `amitdb`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` varchar(3) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
('HW', 'Hot Wheels'),
('LG', 'Lego'),
('PM', 'Pop Mart'),
('SYL', 'Sylvanian Family');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `order_id` int(11) NOT NULL,
  `product_id` varchar(10) NOT NULL,
  `price` decimal(4,2) NOT NULL,
  `unit` int(11) NOT NULL,
  `subtotal` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`order_id`, `product_id`, `price`, `unit`, `subtotal`) VALUES
(1, 'H0007', 99.99, 1, 99.99),
(1, 'H0012', 99.99, 1, 99.99),
(2, 'H0006', 99.99, 1, 99.99),
(2, 'M0003', 49.80, 2, 99.60),
(3, 'H0001', 59.90, 6, 359.40),
(3, 'H0002', 99.99, 6, 599.94);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `datetime` datetime NOT NULL,
  `count` int(11) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `datetime`, `count`, `total`, `user_id`, `status`) VALUES
(1, '2025-04-28 17:30:28', 2, 199.98, 3, 'Processing'),
(2, '2025-04-28 17:30:56', 3, 199.59, 3, 'Pending'),
(3, '2025-04-28 18:03:15', 12, 959.34, 3, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `image` varchar(255) NOT NULL,
  `id` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` double(10,2) NOT NULL,
  `description` longtext NOT NULL,
  `categories_id` varchar(3) NOT NULL,
  `video_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`image`, `id`, `name`, `price`, `description`, `categories_id`, `video_url`) VALUES
('hot1.webp', 'H0001', 'Fun in the City Playset', 59.90, 'The Fun in the City Playset is an exciting Hot Wheels set featuring city-themed elements like roads, ramps, and buildings.It includes interactive features, stunt areas, and a Hot Wheels car for action-packed play.Designed for creativity and high-speed adventures, it brings the thrill of a bustling city to life.', 'HW', 'https://www.youtube.com/watch?v=eoymg4jqnOw'),
('hot2.webp', 'H0002', 'Roller Coaster Rally', 244.90, 'The Hot Wheels Roller Coaster Rally is an action-packed track set featuring thrilling loops, steep drops, and high-speed turns.Designed for ultimate racing excitement, it allows cars to zoom through a roller coaster-inspired track.With dynamic stunts and fast-paced play, it delivers endless fun for Hot Wheels fans.', 'HW', 'https://www.youtube.com/watch?v=P7bOQJygkYw'),
('hot3.webp', 'H0003', 'T-Rex Chomp Down', 179.90, 'The Hot Wheels T-Rex Chomp Down is an exciting dinosaur-themed playset where kids race to escape a giant T-Rex.It features a launcher that sends cars speeding toward the rescue, with thrilling action as the T-Rex tries to chomp down.With fast-paced play and interactive elements, it offers endless fun for Hot Wheels fans.', 'HW', 'https://www.youtube.com/watch?v=5UyVfXUwIa0'),
('hot4.webp', 'H0004', 'Shark Chomp Transporter', 99.90, 'The Hot Wheels Shark Chomp Transporter is a fun and unique vehicle that combines car storage with exciting action.Designed like a giant shark, it can \"chomp\" down on cars as it rolls and store multiple vehicles inside. With a cool design and interactive play features, it adds adventure to any Hot Wheels collection.', 'HW', 'https://www.youtube.com/watch?v=QHfxyOw7L_g'),
('hot5.webp', 'H0005', 'Robo Beasts Stunt Garage', 169.90, 'The Hot Wheels Robo Beasts Stunt Garage is an action-packed multi-level playset featuring robotic animal-themed challenges.It includes ramps, stunt areas, and moving parts that test speed and skill. With space for parking multiple cars and exciting obstacles, it offers endless racing and stunt fun for Hot Wheels fans.', 'HW', 'https://www.youtube.com/watch?v=Du_SoEtaVlI'),
('hot6.webp', 'H0006', 'Super Recharge Fuel Station', 174.90, 'The Hot Wheels Super Recharge Fuel Station is a dynamic playset designed for refueling action and high-speed adventures.It features a realistic fuel station with interactive elements like a pump and service area, allowing kids to \"recharge\" their cars before racing off.With fun details and exciting play possibilities, it’s a great addition to any Hot Wheels collection.', 'HW', 'https://www.youtube.com/watch?v=Wr5nKJGTaC4'),
('hot7.webp', 'H0007', 'Monster Trucks Color Shifters Swamp Chomp', 169.90, 'The Hot Wheels Monster Trucks Color Shifters Swamp Chomp is an exciting playset featuring a giant alligator and color-changing Monster Trucks.Kids can drive through water to reveal color transformations while avoiding the chomping jaws of the alligator.With thrilling stunts and interactive features, it adds a fun twist to Monster Trucks action.', 'HW', 'https://www.youtube.com/watch?v=3r-jO38Y9pw'),
('hot8.webp', 'H0008', 'Super Loop Fire Station Playset', 174.90, 'The Hot Wheels Super Loop Fire Station Playset is an action-packed rescue-themed set featuring a thrilling loop and fire station details.Kids can launch their cars through the giant loop to race to the rescue, avoiding obstacles along the way.With exciting stunts and interactive play features, it brings high-speed firefighting adventures to life.', 'HW', 'https://www.youtube.com/watch?v=U7MmA_BDD04'),
('hot9.webp', 'H0009', 'Ultimate Hauler', 419.90, 'The Hot Wheels Ultimate Hauler is a versatile transport truck that transforms into an exciting raceway.It can store multiple Hot Wheels cars and features a built-in launcher for high-speed action.With its cool design and dual functionality, it’s perfect for racing, stunts, and on-the-go fun.', 'HW', 'https://www.youtube.com/watch?v=uK3kpb_C9H4'),
('hot10.webp', 'H0010', 'Mega Hauler', 119.90, 'The Hot Wheels Mega Hauler is a large transport truck designed to carry up to 50 Hot Wheels cars.It features multiple expandable levels for easy loading and unloading, making it perfect for storage and on-the-go racing fun.With its sturdy design and massive capacity, it’s a must-have for Hot Wheels collectors and fans.', 'HW', 'https://www.youtube.com/watch?v=qJUVAvzbR8E'),
('hot11.webp', 'H0011', 'Whip Around Raceway', 169.90, 'The Hot Wheels Whip Around Raceway is a high-speed track set featuring exciting loops, sharp turns, and fast-paced racing action. Designed for thrilling stunts and head-to-head competition, it challenges kids to test their speed and skill.With dynamic elements and interactive play, it’s a perfect addition to any Hot Wheels collection.', 'HW', 'https://www.youtube.com/watch?v=RhUhaLZh4PU'),
('hot12.webp', 'H0012', 'Action Loop Cyclone Challenge Track Set', 209.90, 'The Hot Wheels Action Loop Cyclone Challenge Track Set is an adrenaline-pumping playset featuring a massive loop and high-speed stunts.Kids can launch their cars through the loop and test their timing to complete thrilling challenges.With exciting action and fast-paced racing, it’s perfect for stunt lovers and Hot Wheels fans.', 'HW', 'https://www.youtube.com/watch?v=N53BuUJU-uk'),
('hot13.webp', 'H0013', 'Tunnel Twist Car Wash Track Set', 174.90, 'The Hot Wheels Tunnel Twist Car Wash Track Set is an interactive playset featuring a twisting tunnel and a fun car wash experience. Kids can send their cars through the wash, complete with water-themed elements and exciting twists.With dynamic action and imaginative play, it’s a great addition to any Hot Wheels collection.', 'HW', 'https://www.youtube.com/watch?v=zVCerrLODiw'),
('hot14.webp', 'H0014', 'Pizza Slam Cobra Attack Playset', 199.90, 'The Hot Wheels Pizza Slam Cobra Attack Playset is an action-packed track set featuring a giant cobra guarding a pizza shop.Kids can launch their cars at high speed to defeat the cobra and save the pizza.With exciting stunts, fun details, and interactive play, it adds thrilling adventure to any Hot Wheels collection.', 'HW', 'https://www.youtube.com/watch?v=KCLWM3r0PbU'),
('hot15.webp', 'H0015', 'Dragon Launch Transporter', 94.90, 'The Hot Wheels Dragon Launch Transporter is a fierce-looking truck that doubles as a car launcher.Designed like a dragon, it can store multiple cars and launch them into action with a cool flipping feature.With its unique design and interactive play, it brings exciting stunts and racing fun to any Hot Wheels collection.', 'HW', 'https://www.youtube.com/watch?v=1ijVeogpKkY'),
('hot16.webp', 'H0016', 'Scorpion Flex Attack', 134.90, 'The Hot Wheels Scorpion Flex Attack is an exciting track set featuring a giant scorpion with a flexible tail that challenges racers.Kids must launch their cars with precision to escape its grasp and defeat the creature.With thrilling stunts and interactive play, it adds action-packed adventure to any Hot Wheels collection.', 'HW', 'https://www.youtube.com/watch?v=QNZ1TPp872A'),
('pm1.jpg', 'M0001', 'Lil Peach Riot:Loading!Series Figures', 59.00, 'Lil Peach Riot: Loading! Series figures bring a futuristic and rebellious twist to the Lil Peach character. With a bold cyberpunk aesthetic, each figure features vibrant colors, edgy details, and dynamic poses that capture the energy of a digital world in motion. Perfect for collectors who love a mix of technology, attitude, and style! 🚀✨', 'PM', 'https://www.youtube.com/watch?v=mHnNuyqkA-E'),
('pm2.jpg', 'M0002', 'Peach Riot Witchy Punk Figures', 299.80, 'The Peach Riot Witchy Punk figure from POP MART blends rebellion and magic with a bold, gothic-punk aesthetic. Featuring striking orange hair, green eyes, and a black witch outfit, this figure exudes attitude and mystery. A must-have for collectors who love edgy, stylish designs with a touch of witchy charm! 🔥✨', 'PM', 'https://www.youtube.com/watch?v=hxQXddlMgaY'),
('pm3.jpg', 'M0003', 'DIMOO Weaving Wonders Series Figure', 49.80, 'The DIMOO Weaving Wonders Series by POP MART brings a dreamy, handcrafted aesthetic to the beloved DIMOO character. Each figure showcases intricate woven textures, cozy fabrics, and a soft, handmade feel, capturing the warmth and artistry of traditional weaving. Perfect for collectors who love whimsical and heartwarming designs! 🧶✨', 'PM', 'https://www.youtube.com/watch?v=bceXx6fi_zA'),
('pm4.jpg', 'M0004', 'Marvel Spider-Man Across the Spider-Verse Series F', 49.80, 'The Marvel Spider-Man: Across the Spider-Verse Series figures bring iconic characters from the film to life with detailed designs and dynamic poses. Featuring Miles Morales, Gwen Stacy, and other Spider-heroes, these collectibles capture the film’s vibrant style and multiversal action. A must-have for Spider-Man fans! 🕷️✨', 'PM', 'https://www.youtube.com/watch?v=tP81albVw3U'),
('pm5.jpg', 'M0005', 'NARUTO Ninkai Taisen Series', 59.00, 'The NARUTO Ninkai Taisen Series brings the epic ninja battles of Naruto to life with highly detailed figures. Featuring iconic characters in dynamic action poses, this collection captures the intensity of the Shinobi World War and Naruto’s journey. A must-have for anime fans and collectors! 🍥🔥', 'PM', 'https://www.youtube.com/watch?v=NOvwmUk_vl0'),
('pm6.jpg', 'M0006', 'Teletubbies Trendy Figures', 70.80, 'The Teletubbies Trendy Figures reimagine Tinky Winky, Dipsy, Laa-Laa, and Po with a stylish and modern twist. Featuring vibrant colors, unique outfits, and trendy designs, these figures bring a fresh, collectible take on the beloved childhood characters. Perfect for fans of nostalgia with a fashionable edge! 🌈✨', 'PM', 'https://www.youtube.com/watch?v=tvvnRWu4zhg'),
('pm7.jpg', 'M0007', 'Zsiga Scared Performer Figurine', 399.00, 'The Zsiga Scared Performer Figurine captures a dramatic and expressive character in a moment of fear and performance. With intricate details, bold colors, and a theatrical pose, this collectible blends art and emotion, making it a standout piece for fans of unique and storytelling-driven designs. 🎭✨', 'PM', 'https://www.youtube.com/watch?v=1lH6tGrAPFg'),
('pm8.jpg', 'M0008', 'PINO JELLY Birthday Bash Figurine', 399.00, 'The PINO JELLY Birthday Bash Figurine is a playful and festive collectible featuring vibrant colors, cute details, and a joyful birthday theme. With a whimsical design and celebratory vibe, it’s a perfect addition for collectors who love charming and fun figurines! 🎂🎉✨', 'PM', 'https://www.youtube.com/watch?v=IVKkRen15I4'),
('pm9.jpg', 'M0009', 'Sweet Bean Bedtime Story Figure', 130.80, 'The Sweet Bean Bedtime Story Figure is a cozy and dreamy collectible featuring Sweet Bean in an adorable bedtime theme. With soft pastel colors, cute details, and a relaxing vibe, this figure is perfect for fans who love whimsical and comforting designs. 🌙✨📖', 'PM', 'https://www.youtube.com/watch?v=lJeS5XmPA-g'),
('pm10.jpg', 'M0010', 'SpongeBob\'s Window', 105.80, 'SpongeBob\'s Window is a fun and nostalgic collectible capturing SpongeBob SquarePants peeking through his iconic porthole window. Featuring vivid colors and expressive details, this figure brings a classic moment from the show to life, perfect for SpongeBob fans and collectors! 🍍🌊✨', 'PM', 'https://www.youtube.com/watch?v=jiwucQDgQHU'),
('pm11.jpg', 'M0011', 'Hirono Shelter Series Figure', 49.80, 'The Hirono Shelter Series Figure features Hirono in a dreamy, melancholic world, embodying themes of protection, solitude, and hope. With intricate details, soft colors, and emotional depth, this collectible is perfect for fans of artistic and story-driven designs. 🌧️✨', 'PM', 'https://www.youtube.com/watch?v=rYaa8hcOL1g'),
('pm12.jpg', 'M0012', 'PUCKY The Feast Series Figures', 49.80, 'The PUCKY The Feast Series Figures bring a whimsical and delicious twist to the beloved PUCKY characters. Featuring adorable designs inspired by festive treats and meals, this collection blends fantasy and food into charming, collectible figures. Perfect for fans of cute and imaginative designs! 🍰✨', 'PM', 'https://www.youtube.com/watch?v=7SDONE56cow'),
('pm13.jpg', 'M0013', 'AZURA Dream Gate Unlocked Figures', 130.80, 'The AZURA Dream Gate Unlocked Figures feature mystical and ethereal designs, bringing a sense of fantasy and wonder to each piece. With intricate details, dreamy colors, and a magical aura, this collection is perfect for fans of enchanting and otherworldly collectibles. ✨🔮', 'PM', 'https://www.youtube.com/watch?v=Dtev2UNd5Co'),
('pm14.jpg', 'M0014', 'Chibi Maruko-chan\'s Interesting Life Series', 49.80, 'The Chibi Maruko-chan\'s Interesting Life Series captures heartwarming and nostalgic moments from Maruko-chan’s daily adventures. Featuring adorable designs, expressive poses, and playful details, this collection brings the beloved character’s charming world to life. Perfect for fans of wholesome and classic collectibles! 🍡✨', 'PM', 'https://www.youtube.com/watch?v=eTCKNSNBCj0'),
('pm15.jpg', 'M0015', 'Zimo Zodiac Series', 42.80, 'The Zimo Zodiac Series features whimsical and artistic figures inspired by the 12 zodiac signs. Each design blends astrology, fantasy, and intricate details, creating a magical and collectible set perfect for zodiac lovers and figure collectors! ✨♈♉♊', 'PM', 'https://www.youtube.com/watch?v=BwGOC_JTACg'),
('pm16.jpg', 'M0016', 'Universal Despicable Me 4 Series Figures', 49.80, 'The Universal Despicable Me 4 Series Figures bring the fun and chaos of Gru, the Minions, and new characters from Despicable Me 4 to life. With vibrant designs, playful poses, and iconic details, this collection is perfect for fans of the mischievous Minions! 🍌✨', 'PM', 'https://www.youtube.com/watch?v=OLiRuY8OQFI'),
('lego1.webp', 'P0001', 'Heartlake City Community Center', 679.90, 'The LEGO Friends Heartlake City Community Center (41748) is a colorful, multi-story building designed for creativity and fun.It features different activity rooms, including a music studio, art room, café, and rooftop garden.The set includes multiple mini-dolls and accessories, allowing for endless storytelling.Perfect for LEGO Friends fans who love community spaces and imaginative play! 🏡🎨🎶', 'LG', 'https://www.youtube.com/watch?v=tLVDKU0PpDc'),
('lego2.webp', 'P0002', 'Snow White and Seven Dwarfs Cottage', 799.90, 'The LEGO Disney Snow White and the Seven Dwarfs’ Cottage (43242) is a detailed fairytale-inspired set featuring the iconic woodland home from the classic Disney movie.The cozy cottage includes a detailed interior, with a kitchen, bedroom, and dining area, along with accessories from the story.The set also comes with Snow White, the Seven Dwarfs, and the Evil Queen in minifigure form.Perfect for Disney fans and collectors, this set brings a beloved fairytale to life! 🏡✨🍎', 'LG', 'https://www.youtube.com/watch?v=PrVbZiaaAwM'),
('lego3.webp', 'P0003', 'Young Simba the Lion King', 503.90, 'The LEGO Disney Young Simba (43247) is a detailed buildable model of Simba from The Lion King.Designed for display, this set captures Simba’s playful and curious expression, with posable features for different poses.The model stands on a decorative base, making it a perfect collectible for Disney and Lion King fans. 🦁👑', 'LG', 'https://www.youtube.com/watch?v=86LoNi2ioc8'),
('lego4.webp', 'P0004', 'Titanic', 2849.90, 'The LEGO Titanic (10294) is a highly detailed, 1:200 scale model of the famous RMS Titanic.With over 9,000 pieces, it is one of LEGO’s largest and most intricate sets.\r\nhe ship features authentic details, including the grand staircase, boiler rooms, first-class cabins, and iconic smokestacks.It can be separated into three sections to reveal its interior. Designed for history enthusiasts and advanced builders, this set is a stunning display piece that captures the elegance of the legendary ship. 🚢✨', 'LG', 'https://www.youtube.com/watch?v=c-QQNutH44Q'),
('lego5.webp', 'P0005', 'Dungeons & Dragons:Red Dragons Tail', 1599.90, 'The LEGO Ideas Dungeons & Dragons: Red Dragon’s Tale (21348) is a detailed fantasy-themed set celebrating 50 years of D&D.It features a fortress, dungeon, and a large red dragon, along with D&D-inspired minifigures and accessories.Perfect for fans of role-playing games and fantasy adventures! 🐉⚔️', 'LG', 'https://www.youtube.com/watch?v=6Ow3Pe2waLY'),
('lego6.webp', 'P0006', 'Vincent van Gogh-The Starry Night', 799.90, 'The LEGO Ideas Vincent van Gogh – The Starry Night (21333) is a 3D brick-built version of the famous painting.It captures the swirling night sky, rolling hills, and glowing moon using layered LEGO bricks.The set includes a mini Vincent van Gogh figure with an easel and paintbrush, making it a stunning display piece for art and LEGO fans. 🎨🖌✨\r\n           ', 'LG', 'https://www.youtube.com/watch?v=5ib8YD9-Tvo'),
('lego7.webp', 'P0007', 'BMW M 1000 RR', 1099.90, 'The LEGO Technic BMW M 1000 RR (42130) is a highly detailed, 1:5 scale model of BMW’s high-performance motorcycle.It features realistic functions, including a 3-speed gearbox, working suspension, chain drive, and a detailed engine.With over 1,900 pieces, this set is perfect for motorcycle enthusiasts and advanced LEGO builders, making it a stunning display piece. 🏍️🔥', 'LG', 'https://www.youtube.com/watch?v=Hn844mSVGBA'),
('lego8.webp', 'P0008', 'Hogwarts™ Castle', 1999.90, 'The LEGO Harry Potter Hogwarts™ Castle (71043) is a massive, highly detailed set that brings the iconic wizarding school to life.With over 6,000 pieces, it features famous locations like the Great Hall, Chamber of Secrets, and classrooms, along with mini Hogwarts professors, students, and magical creatures.Perfect for Harry Potter fans and collectors, this set is a stunning display piece full of magical details! 🏰✨', 'LG', 'https://www.youtube.com/watch?v=Y2Q0brTVQXs'),
('lego9.webp', 'P0009', 'PAC-MAN Arcade', 1199.90, 'The LEGO ICONS PAC-MAN Arcade (10323) is a nostalgic, buildable arcade machine inspired by the classic 1980s game.It features a mechanical chase function, where PAC-MAN and the ghosts move, along with a light-up coin slot for added realism.The set also includes a mini arcade cabinet and a figure of a player enjoying the game. Perfect for retro gaming fans and collectors, this set is a fun and interactive display piece! 🎮🟡👻', 'LG', 'https://www.youtube.com/watch?v=prTvoUht-aA'),
('lego10.webp', 'P0010', 'Optimus Prime', 829.90, 'The LEGO Transformers Optimus Prime (10302) is a buildable, 2-in-1 model that transforms between a robot and a truck without rebuilding.It features authentic details, including movable joints, an ion blaster, an Energon axe, and a Matrix of Leadership.Perfect for Transformers fans and collectors, this set brings the legendary Autobot leader to life! 🤖🚛🔥', 'LG', 'https://www.youtube.com/watch?v=JZK9T39i5RA'),
('lego11.webp', 'P0011', 'McLaren P1™', 1899.90, 'The LEGO Technic McLaren P1™ (42172) is a 1:8 scale model of McLaren’s hybrid hypercar.It features a detailed V8 engine, functional dihedral doors, working suspension, and an aerodynamic design.Perfect for car enthusiasts and LEGO builders, this set offers a realistic and immersive build experience. 🚗🔥', 'LG', 'https://www.youtube.com/watch?v=1NsswL5adK8'),
('lego12.webp', 'P0012', 'The Amazing Spider-Man', 899.90, 'The LEGO Art The Amazing Spider-Man (31209) is a 3D wall art set featuring Spider-Man in a dynamic pose, breaking out of the frame.Built with layered bricks for depth, it captures the comic book style and includes a printed Spider-Man signature tile.Perfect for Marvel fans and collectors, this set makes an eye-catching display piece! 🕷️🕸️🔥', 'LG', 'https://www.youtube.com/watch?v=-sEiJi_Sbk8'),
('lego13.webp', 'P0013', 'Great Deku Tree 2-in-1', 1299.90, 'The LEGO The Legend of Zelda Great Deku Tree 2-in-1 (77092) is a highly detailed set that allows builders to recreate the iconic Great Deku Tree in two styles: Ocarina of Time or Breath of the Wild.It features movable branches, a detailed interior, and Link minifigures from both games.Perfect for Zelda fans and collectors, this set brings the magic of Hyrule to life! 🌳🗡️✨', 'LG', 'https://www.youtube.com/watch?v=fa8rRJppEMg'),
('lego14.webp', 'P0014', 'Eiffel Tower', 2699.90, 'The LEGO Eiffel Tower (10307) is a massive, 1:200 scale model of the iconic Paris landmark.Standing at nearly 5 feet (149 cm) tall, this set features intricate architectural details, realistic iron framework, and four detailed viewing platforms.Designed for advanced builders and display, it’s a stunning tribute to one of the world’s most famous landmarks. 🗼✨', 'LG', 'https://www.youtube.com/watch?v=rQoBoEKOEoU'),
('lego15.webp', 'P0015', 'Disney Castle', 1699.90, 'The LEGO Disney Castle (43222) is a highly detailed, magical build inspired by the iconic Disney theme park castle.With 4,837 pieces, it features intricate interiors, hidden references to Disney movies, and multiple themed rooms.The set includes eight minifigures, including Mickey, Minnie, and Disney princesses.Perfect for Disney fans and collectors, this set is a stunning display piece full of nostalgic details! 🏰✨🎬\r\n            ', 'LG', 'https://www.youtube.com/watch?v=M_ki8MEI9WE'),
('lego16.webp', 'P0016', 'Tudor Corner', 999.90, 'The LEGO Icons Tudor Corner (10332) is a detailed modular building inspired by medieval Tudor-style architecture.It features half-timbered walls, a cozy pub, detailed interiors, and multiple minifigures.Designed to connect with other LEGO modular buildings, this set is perfect for collectors and city builders looking to add a historic touch to their display! 🏰✨', 'LG', 'https://www.youtube.com/watch?v=roLBhBHpPQI'),
('waubulan2.webp', 'P0017', 'Wau Bulan', 1999.99, 'Saya curi dari pasar  seni.So,ini sangat mahal kerana saya mungkin ditangkap oleh polis', 'LG', NULL),
('syl1.webp', 'S0001', 'Grocery Market', 124.90, 'The Sylvanian Families Grocery Market is a charming miniature shop where the woodland animal figures can buy fresh food and daily essentials.It features shelves stocked with fruits, vegetables, bread, and dairy products, along with a checkout counter, cash register, and small shopping baskets or carts.With detailed packaging and accessories, it adds to the storytelling fun, allowing kids to create realistic shopping adventures for their Sylvanian characters.', 'SYL', 'https://www.youtube.com/watch?v=2_iMAkWSX0c'),
('syl2.webp', 'S0002', 'Family Seven Seater Car', 94.90, 'The Family Seven Seater Car is a spacious vehicle in the Sylvanian Families series, perfect for family trips and adventures.It features a classic design with opening doors, removable seats, and a trunk for extra storage.With enough space to fit up to seven figures, it allows Sylvanian characters to travel together in style and comfort.', 'SYL', 'https://www.youtube.com/watch?v=JWIAJ1ASh_U'),
('syl3.webp', 'S0003', 'Country Tree School', 170.90, 'The Country Tree School is a beautiful school building in the Sylvanian Families series, where the woodland animal figures can learn and play.It features a classic design with a clock tower, desks, chairs, and a blackboard for lessons.The set also includes books and school accessories, making it perfect for creative storytelling and fun classroom adventures.', 'SYL', 'https://www.youtube.com/watch?v=EcFbYv-hYhY'),
('syl4.webp', 'S0004', 'Ice Cream Van', 144.90, 'The Ice Cream Van is a delightful vehicle in the Sylvanian Families series, perfect for serving sweet treats in the village.It features a classic design with a pastel-colored exterior, a serving counter, and storage for ice cream cones and toppings.With detailed accessories and a variety of flavors, it allows Sylvanian characters to enjoy fun and tasty ice cream adventures.', 'SYL', 'https://www.youtube.com/watch?v=ED7lJy-auaI'),
('syl5.webp', 'S0005', 'Raincoat Baby', 179.90, 'The Raincoat Baby is an adorable figure in the Sylvanian Families series, dressed in a cute raincoat and boots for rainy-day adventures.It features a tiny hooded coat, matching boots, and sometimes an umbrella or puddle accessories.Perfect for imaginative play, it allows Sylvanian characters to enjoy splashing in the rain in style.', 'SYL', 'https://www.youtube.com/watch?v=pB7EWW_ZP8M'),
('syl6.webp', 'S0006', 'New Chocolate Rabbit Family', 111.90, 'The New Chocolate Rabbit Family is a lovable set in the Sylvanian Families series,featuring four adorable rabbit figures with soft white fur and distinctive brown-tipped ears.The family includes a father, mother, brother, and sister, all dressed in beautifully detailed outfits. With their charming expressions and poseable limbs, they are perfect for storytelling and imaginative play in the Sylvanian village.', 'SYL', 'https://www.youtube.com/watch?v=8gzn4RDeHkA'),
('syl7.webp', 'S0007', 'Deer Family', 129.90, 'The Deer Family is a charming set in the Sylvanian Families series, featuring four adorable deer figures with soft brown fur and white spots.The family includes a father, mother, brother, and sister, all dressed in beautifully detailed outfits. With their gentle expressions and poseable limbs,they are perfect for storytelling and bringing woodland adventures to life in the Sylvanian village.', 'SYL', 'https://www.youtube.com/watch?v=P_bTN7QDql8'),
('syl8.webp', 'S0008', 'Mini Party Babies Series 1pcs', 19.90, 'The Mini Party Babies Series 1pcs is a delightful mystery figure from the Sylvanian Families series, featuring an adorable baby character dressed in a cute party-themed outfit.Each pack contains one randomly selected baby with unique accessories, making it a fun surprise for collectors.Perfect for storytelling and imaginative play, these mini figures add charm to any Sylvanian village celebration.', 'SYL', 'https://www.youtube.com/watch?v=HPWw4IRa2x8'),
('syl9.webp', 'S0009', 'Sweet Raspberry Home', 93.90, 'The Sweet Raspberry Home is a cozy starter house in the Sylvanian Families series, perfect for a single figure or a small family.It features a charming red roof, an open interior for decorating, and a front porch for added play value.With its compact design and adorable details, it’s a great addition to any Sylvanian village and ideal for imaginative storytelling.', 'SYL', 'https://www.youtube.com/watch?v=eHr4cDRPMtk'),
('syl10.webp', 'S0010', 'Baby Star Carousel', 69.90, 'The Baby Star Carousel is a magical amusement ride in the Sylvanian Families series, designed especially for baby figures.It features a pastel-colored star-themed design with rotating seats shaped like moons and stars.With a gentle spinning motion and charming details, it adds fun and excitement to any Sylvanian village, making playtime even more enchanting.', 'SYL', 'https://www.youtube.com/watch?v=0EHqXHxxaoM'),
('syl11.webp', 'S0011', 'Family Campervan', 144.90, 'The Family Campervan is a fun and adventurous vehicle in the Sylvanian Families series, perfect for family road trips.It features a classic design with opening doors, fold-out beds, a kitchen area, and plenty of storage space.With detailed accessories and room for multiple figures, it allows Sylvanian characters to enjoy exciting camping adventures in the great outdoors.', 'SYL', 'https://www.youtube.com/watch?v=6i5MNsj7MQg'),
('syl12.webp', 'S0012', 'Rainbow Fun Nursery Bus', 129.90, 'The Rainbow Fun Nursery Bus is a colorful and playful vehicle in the Sylvanian Families series, designed to transport baby figures to nursery school.It features a bright rainbow-themed design, movable wheels, and seats for multiple babies.With fun details like a slide and a cloud-shaped roof, it adds excitement to every journey, making playtime even more imaginative.', 'SYL', 'https://www.youtube.com/watch?v=cnFBNsexWMQ'),
('syl13.webp', 'S0013', 'Sunny Castle Nursery', 160.90, 'The Sunny Castle Nursery is a delightful schoolhouse in the Sylvanian Families series, designed for baby figures to learn and play.It features a charming castle-themed design with towers, a slide, and a spacious classroom.With adorable details like desks, chairs, and fun accessories, it creates the perfect setting for imaginative nursery school adventures in the Sylvanian village.', 'SYL', 'https://www.youtube.com/watch?v=-1O8SV3LhNo'),
('syl14.webp', 'S0014', 'Halloween Suprise Party Set', 129.90, 'The Halloween Surprise Party Set is a festive and spooky-themed set in the Sylvanian Families series, perfect for celebrating Halloween.It features adorable baby figures dressed in cute costumes, along with fun accessories like pumpkins, candy baskets, and decorations.With charming details and a playful atmosphere, it adds a touch of Halloween magic to any Sylvanian village adventure.', 'SYL', 'https://www.youtube.com/watch?v=wn6hHx6lclg'),
('syl15.webp', 'S0015', 'Popcorn Delivery Trike', 149.90, 'The Popcorn Delivery Trike is a fun and charming vehicle in the Sylvanian Families series, perfect for serving delicious popcorn around the village.It features a classic tricycle design with a popcorn cart attached, complete with a canopy, popcorn boxes, and detailed accessories.With its adorable style and movable wheels, it allows Sylvanian characters to enjoy popcorn treats on the go.', 'SYL', 'https://www.youtube.com/watch?v=zBVPioZX0p4'),
('syl17.webp', 'S0016', 'Nursery Friends - Sleepover Party', 89.90, 'The Nursery Friends - Sleepover Party is a delightful set in the Sylvanian Families series, featuring baby figures ready for a fun sleepover.It includes adorable characters dressed in cozy pajamas, along with cute accessories like sleeping bags, pillows, and bedtime essentials.With charming details and playful expressions, it’s perfect for creating cozy nighttime adventures in the Sylvanian village.', 'SYL', 'https://www.youtube.com/watch?v=AM-9DOd3Kgs');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` varchar(10) NOT NULL,
  `rating` tinyint(1) NOT NULL,
  `review_text` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`id`, `user_id`, `product_id`, `rating`, `review_text`, `image`, `created_at`) VALUES
(1, 3, 'M0001', 5, 'Lái cái lái\r\nLái cái lái\r\nLái cái lái\r\nLái cái lái', 'bieLaoZai.jpeg', '2025-04-27 16:26:58');

-- --------------------------------------------------------

--
-- Table structure for table `slideshow`
--

CREATE TABLE `slideshow` (
  `id` int(10) NOT NULL,
  `product_id` varchar(10) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `slideshow`
--

INSERT INTO `slideshow` (`id`, `product_id`, `image`, `created_at`) VALUES
(1, 'M0001', 'pm1.jpg', '2025-04-20 12:00:00'),
(3, 'S0013', 'syl13.webp', '2025-04-20 12:00:00'),
(0, 'M0003', 'pm3.jpg', '2025-04-28 09:50:28'),
(0, 'H0001', 'hot1.webp', '2025-04-28 10:09:27');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `role` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `firstname`, `lastname`, `email`, `password`, `phone`, `photo`, `role`) VALUES
(1, 'Gan', 'Ye Qing', 'admin1@gmail.com', 'e38ad214943daad1d64c102faec29de4afe9da3d', '0123456789', 'ma.webp', 'Admin'),
(2, 'Ning', 'Ning', 'iulenglui@gmail.com', '85a14f2930dd01488edb7b351bd84e722030436a', '0163213321', 'flower.webp', 'Member'),
(3, 'Lee', '123', 'jieun@gmail.com', '43ee94c4d8115abc5d6ab39c178e14b8e7d5f9d5', '456', 'bear.webp', 'Member'),
(4, 'Won', 'Woo', 'seventeen@gmail.com', 'd611a8c6c632f700583b1f0d5f280c0fcfc55516', '0125673214', 'von-sample-2.webp', 'Member'),
(5, 'Yo', 'Zi Zi', 'yozizi420@gmail.com', '794607375d0df6325d1d7bddcc37357df0bcb162', '0163214436', 'dino.webp', 'Member'),
(6, 'Jing', 'Wen', 'huangjingwen4@gmail.com', '7219e84b5eaaab5d42467d9a5832e58291302c97', '0134253678', 'flower.webp', 'Admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`order_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_id` (`categories_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);
--
-- Database: `csv_db 7`
--
CREATE DATABASE IF NOT EXISTS `csv_db 7` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `csv_db 7`;

-- --------------------------------------------------------

--
-- Table structure for table `hotwheels`
--

CREATE TABLE `hotwheels` (
  `COL 1` varchar(22) DEFAULT NULL,
  `COL 2` varchar(5) DEFAULT NULL,
  `COL 3` varchar(41) DEFAULT NULL,
  `COL 4` varchar(5) DEFAULT NULL,
  `COL 5` varchar(387) DEFAULT NULL,
  `COL 6` varchar(2) DEFAULT NULL,
  `COL 7` varchar(10) DEFAULT NULL,
  `COL 8` varchar(10) DEFAULT NULL,
  `COL 9` varchar(10) DEFAULT NULL,
  `COL 10` varchar(10) DEFAULT NULL,
  `COL 11` varchar(10) DEFAULT NULL,
  `COL 12` varchar(10) DEFAULT NULL,
  `COL 13` varchar(10) DEFAULT NULL,
  `COL 14` varchar(10) DEFAULT NULL,
  `COL 15` varchar(10) DEFAULT NULL,
  `COL 16` varchar(10) DEFAULT NULL,
  `COL 17` varchar(10) DEFAULT NULL,
  `COL 18` varchar(10) DEFAULT NULL,
  `COL 19` varchar(10) DEFAULT NULL,
  `COL 20` varchar(10) DEFAULT NULL,
  `COL 21` varchar(10) DEFAULT NULL,
  `COL 22` varchar(10) DEFAULT NULL,
  `COL 23` varchar(10) DEFAULT NULL,
  `COL 24` varchar(10) DEFAULT NULL,
  `COL 25` varchar(10) DEFAULT NULL,
  `COL 26` varchar(10) DEFAULT NULL,
  `COL 27` varchar(10) DEFAULT NULL,
  `COL 28` varchar(10) DEFAULT NULL,
  `COL 29` varchar(10) DEFAULT NULL,
  `COL 30` varchar(10) DEFAULT NULL,
  `COL 31` varchar(10) DEFAULT NULL,
  `COL 32` varchar(10) DEFAULT NULL,
  `COL 33` varchar(10) DEFAULT NULL,
  `COL 34` varchar(10) DEFAULT NULL,
  `COL 35` varchar(10) DEFAULT NULL,
  `COL 36` varchar(10) DEFAULT NULL,
  `COL 37` varchar(10) DEFAULT NULL,
  `COL 38` varchar(2) DEFAULT NULL,
  `COL 39` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `hotwheels`
--

INSERT INTO `hotwheels` (`COL 1`, `COL 2`, `COL 3`, `COL 4`, `COL 5`, `COL 6`, `COL 7`, `COL 8`, `COL 9`, `COL 10`, `COL 11`, `COL 12`, `COL 13`, `COL 14`, `COL 15`, `COL 16`, `COL 17`, `COL 18`, `COL 19`, `COL 20`, `COL 21`, `COL 22`, `COL 23`, `COL 24`, `COL 25`, `COL 26`, `COL 27`, `COL 28`, `COL 29`, `COL 30`, `COL 31`, `COL 32`, `COL 33`, `COL 34`, `COL 35`, `COL 36`, `COL 37`, `COL 38`, `COL 39`) VALUES
('imgHotWheel/hot1.webp', 'H0001', 'Fun in the City Playset', '59.90', 'The Fun in the City Playset is an exciting Hot Wheels set featuring city-themed elements like roads, ramps, and buildings.It includes interactive features, stunt areas, and a Hot Wheels car for action-packed play.Designed for creativity and high-speed adventures, it brings the thrill of a bustling city to life.', 'HW', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'HW', ''),
('imgHotWheel/hot2.webp', 'H0002', 'Roller Coaster Rally', '244.9', 'The Hot Wheels Roller Coaster Rally is an action-packed track set featuring thrilling loops, steep drops, and high-speed turns.Designed for ultimate racing excitement, it allows cars to zoom through a roller coaster-inspired track.With dynamic stunts and fast-paced play, it delivers endless fun for Hot Wheels fans.', 'HW', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'HW'),
('imgHotWheel/hot3.webp', 'H0003', 'T-Rex Chomp Down', '179.9', 'The Hot Wheels T-Rex Chomp Down is an exciting dinosaur-themed playset where kids race to escape a giant T-Rex.It features a launcher that sends cars speeding toward the rescue, with thrilling action as the T-Rex tries to chomp down.With fast-paced play and interactive elements, it offers endless fun for Hot Wheels fans.', 'HW', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
('imgHotWheel/hot4.webp', 'H0004', 'Shark Chomp Transporter', '99.90', 'The Hot Wheels Shark Chomp Transporter is a fun and unique vehicle that combines car storage with exciting action.Designed like a giant shark, it can \"chomp\" down on cars as it rolls and store multiple vehicles inside. With a cool design and interactive play features, it adds adventure to any Hot Wheels collection.', 'HW', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
('imgHotWheel/hot5.webp', 'H0005', 'Robo Beasts Stunt Garage', '169.9', 'The Hot Wheels Robo Beasts Stunt Garage is an action-packed multi-level playset featuring robotic animal-themed challenges.It includes ramps, stunt areas, and moving parts that test speed and skill. With space for parking multiple cars and exciting obstacles, it offers endless racing and stunt fun for Hot Wheels fans.', 'HW', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
('imgHotWheel/hot6.webp', 'H0006', 'Super Recharge Fuel Station', '174.9', 'The Hot Wheels Super Recharge Fuel Station is a dynamic playset designed for refueling action and high-speed adventures.It features a realistic fuel station with interactive elements like a pump and service area, allowing kids to \"recharge\" their cars before racing off.With fun details and exciting play possibilities, it’s a great addition to any Hot Wheels collection.                ', 'HW', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
('imgHotWheel/hot7.webp', 'H0007', 'Monster Trucks Color Shifters Swamp Chomp', '169.9', 'The Hot Wheels Monster Trucks Color Shifters Swamp Chomp is an exciting playset featuring a giant alligator and color-changing Monster Trucks.Kids can drive through water to reveal color transformations while avoiding the chomping jaws of the alligator.With thrilling stunts and interactive features, it adds a fun twist to Monster Trucks action.               ', 'HW', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
('imgHotWheel/hot8.webp', 'H0008', 'Super Loop Fire Station Playset', '174.9', 'The Hot Wheels Super Loop Fire Station Playset is an action-packed rescue-themed set featuring a thrilling loop and fire station details.Kids can launch their cars through the giant loop to race to the rescue, avoiding obstacles along the way.With exciting stunts and interactive play features, it brings high-speed firefighting adventures to life.', 'HW', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
('imgHotWheel/hot9.webp', 'H0009', 'Ultimate Hauler', '419.9', 'The Hot Wheels Ultimate Hauler is a versatile transport truck that transforms into an exciting raceway.It can store multiple Hot Wheels cars and features a built-in launcher for high-speed action.With its cool design and dual functionality, it’s perfect for racing, stunts, and on-the-go fun.', 'HW', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
('imgHotWheel/hot10.webp', 'H0010', 'Mega Hauler', '119.9', 'The Hot Wheels Mega Hauler is a large transport truck designed to carry up to 50 Hot Wheels cars.It features multiple expandable levels for easy loading and unloading, making it perfect for storage and on-the-go racing fun.With its sturdy design and massive capacity, it’s a must-have for Hot Wheels collectors and fans.', 'HW', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
('imgHotWheel/hot11.webp', 'H0011', 'Whip Around Raceway', '169.9', 'The Hot Wheels Whip Around Raceway is a high-speed track set featuring exciting loops, sharp turns, and fast-paced racing action. Designed for thrilling stunts and head-to-head competition, it challenges kids to test their speed and skill.With dynamic elements and interactive play, it’s a perfect addition to any Hot Wheels collection.', 'HW', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
('imgHotWheel/hot12.webp', 'H0012', 'Action Loop Cyclone Challenge Track Set', '209.9', 'The Hot Wheels Action Loop Cyclone Challenge Track Set is an adrenaline-pumping playset featuring a massive loop and high-speed stunts.Kids can launch their cars through the loop and test their timing to complete thrilling challenges.With exciting action and fast-paced racing, it’s perfect for stunt lovers and Hot Wheels fans.', 'HW', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
('imgHotWheel/ho13.webp', 'H0013', 'Tunnel Twist Car Wash Track Set', '174.9', 'The Hot Wheels Tunnel Twist Car Wash Track Set is an interactive playset featuring a twisting tunnel and a fun car wash experience. Kids can send their cars through the wash, complete with water-themed elements and exciting twists.With dynamic action and imaginative play, it’s a great addition to any Hot Wheels collection.', 'HW', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
('imgHotWheel/hot14.webp', 'H0014', 'Pizza Slam Cobra Attack Playset', '199.9', 'The Hot Wheels Pizza Slam Cobra Attack Playset is an action-packed track set featuring a giant cobra guarding a pizza shop.Kids can launch their cars at high speed to defeat the cobra and save the pizza.With exciting stunts, fun details, and interactive play, it adds thrilling adventure to any Hot Wheels collection.', 'HW', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
('imgHotWheel/hot15.webp', 'H0015', 'Dragon Launch Transporter', '94.90', 'The Hot Wheels Dragon Launch Transporter is a fierce-looking truck that doubles as a car launcher.Designed like a dragon, it can store multiple cars and launch them into action with a cool flipping feature.With its unique design and interactive play, it brings exciting stunts and racing fun to any Hot Wheels collection.', 'HW', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
('imgHotWheel/hot16.webp', 'H0016', 'Scorpion Flex Attack', '134.9', 'The Hot Wheels Scorpion Flex Attack is an exciting track set featuring a giant scorpion with a flexible tail that challenges racers.Kids must launch their cars with precision to escape its grasp and defeat the creature.With thrilling stunts and interactive play, it adds action-packed adventure to any Hot Wheels collection.', 'HW', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
--
-- Database: `db8`
--
CREATE DATABASE IF NOT EXISTS `db8` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db8`;

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE `token` (
  `id` varchar(100) NOT NULL,
  `expire` datetime NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `role` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `name`, `photo`, `role`) VALUES
(1, '1@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Lisa Manobal', '1.jpg', 'Admin'),
(2, '2@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Kim Jisoo', '2.jpg', 'Member'),
(3, 'ganyq-wm24@student.tarc.edu.my', '8cb2237d0679ca88db6464eac60da96345513964', 'gan', '67f7635f1bc56.jpg', 'Member');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `token`
--
ALTER TABLE `token`
  ADD CONSTRAINT `token_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Dumping data for table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"relation_lines\":\"true\",\"snap_to_grid\":\"off\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Dumping data for table `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'server', 'cherry', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"db_select[]\":[\"amitdb\",\"csv_db 7\",\"db8\",\"phpmyadmin\",\"test\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@SERVER@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_columns\":\"something\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"yaml_structure_or_data\":\"data\",\"\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"amitdb\",\"table\":\"product\"},{\"db\":\"amitdb\",\"table\":\"categories\"},{\"db\":\"amitdb\",\"table\":\"slideshow\"},{\"db\":\"amitdb\",\"table\":\"order\"},{\"db\":\"amitdb\",\"table\":\"item\"},{\"db\":\"amitdb\",\"table\":\"user\"},{\"db\":\"amitdb\",\"table\":\"review\"},{\"db\":\"amitdb\",\"table\":\"feedback\"},{\"db\":\"db8\",\"table\":\"user\"},{\"db\":\"db8\",\"table\":\"token\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

--
-- Dumping data for table `pma__table_info`
--

INSERT INTO `pma__table_info` (`db_name`, `table_name`, `display_field`) VALUES
('amitdb', 'item', 'product_id'),
('amitdb', 'order', 'status'),
('amitdb', 'product', 'image'),
('amitdb', 'review', 'product_id');

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'amitdb', 'product', '{\"CREATE_TIME\":\"2025-04-28 17:25:31\"}', '2025-05-01 11:22:16');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2025-05-02 03:38:10', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
