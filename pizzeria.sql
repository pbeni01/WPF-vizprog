-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Máj 17. 17:37
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `pizzeria`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pizzeria_deliveries`
--

CREATE TABLE `pizzeria_deliveries` (
  `delivery_id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `delivery_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `pizzeria_deliveries`
--

INSERT INTO `pizzeria_deliveries` (`delivery_id`, `address`, `delivery_time`) VALUES
(1, 'Alapértelmezett cím', '2024-05-16 21:44:35'),
(2, 'Cím', '2024-05-16 21:46:20'),
(3, 'Cím', '2024-05-16 22:10:17'),
(4, 'valami utca 23', '2024-05-16 22:49:21'),
(5, 'ut ut 12', '2024-05-17 15:12:23'),
(6, 'asd asd', '2024-05-17 15:46:38'),
(7, 'asdfasd ', '2024-05-17 15:53:06'),
(8, 'erwerw', '2024-05-17 15:54:49'),
(9, 'asdasdasd', '2024-05-17 15:59:34'),
(10, 'vasut ut', '2024-05-17 16:02:37'),
(11, 'efrwefrwefrsw', '2024-05-17 16:05:22'),
(12, 'w3erwer', '2024-05-17 16:18:21'),
(13, 'rtzrz', '2024-05-17 16:19:04'),
(14, 'valammi út 12', '2024-05-17 16:32:04'),
(15, 'valami utca 12', '2024-05-17 16:32:23'),
(16, 'pelda utca 10', '2024-05-17 16:40:44'),
(17, 'utca ut 55', '2024-05-17 16:47:53');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pizzeria_ingredients`
--

CREATE TABLE `pizzeria_ingredients` (
  `ingredient_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `pizzeria_ingredients`
--

INSERT INTO `pizzeria_ingredients` (`ingredient_id`, `name`, `quantity`) VALUES
(1, 'Paradicsom', 100),
(2, 'Mozzarella', 76),
(3, 'Bazsalikom', 44),
(4, 'Pepperoni', 70),
(5, 'Sonka', 60),
(6, 'Ananász', 40),
(7, 'BBQ Szósz', 28),
(8, 'Csirke', 78),
(9, 'Vöröshagyma', 89),
(10, 'Koriander', 19),
(11, 'Kaliforniai paprika', 49),
(12, 'Gomba', 69),
(13, 'Olívabogyó', 49),
(14, 'Szalonna', 50),
(15, 'Parmezán', 50),
(16, 'Gorgonzola', 50),
(17, 'Kecskesajt', 50),
(18, 'Fokhagyma', 40),
(19, 'Petrezselyem', 30),
(20, 'Ranch Szósz', 30);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pizzeria_orders`
--

CREATE TABLE `pizzeria_orders` (
  `order_id` int(11) NOT NULL,
  `pizza_id` int(11) NOT NULL,
  `delivery_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `pizzeria_orders`
--

INSERT INTO `pizzeria_orders` (`order_id`, `pizza_id`, `delivery_id`) VALUES
(1, 4, 2),
(2, 5, 2),
(3, 6, 3),
(4, 4, 3),
(5, 1, 4),
(6, 2, 4),
(7, 10, 5),
(8, 6, 5),
(9, 3, 5),
(10, 1, 6),
(11, 1, 7),
(12, 5, 8),
(13, 1, 9),
(14, 1, 10),
(15, 1, 11),
(16, 4, 12),
(17, 1, 13),
(18, 1, 13),
(19, 1, 13),
(20, 1, 14),
(21, 5, 15),
(22, 1, 16),
(23, 1, 17);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pizzeria_pizzas`
--

CREATE TABLE `pizzeria_pizzas` (
  `pizza_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `recipe` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `pizzeria_pizzas`
--

INSERT INTO `pizzeria_pizzas` (`pizza_id`, `name`, `price`, `recipe`) VALUES
(1, 'Margherita', 1000.00, 'Paradicsom, Mozzarella, Bazsalikom'),
(2, 'Pepperoni', 1200.00, 'Paradicsom, Mozzarella, Pepperoni'),
(3, 'Hawaii', 1300.00, 'Paradicsom, Mozzarella, Sonka, Ananász'),
(4, 'BBQ Csirke', 1400.00, 'BBQ Szósz, Mozzarella, Csirke, Vöröshagyma, Koriander'),
(5, 'Zöldséges', 1100.00, 'Paradicsom, Mozzarella, Kaliforniai paprika, Vöröshagyma, Gomba, Olívabogyó'),
(6, 'Húsimádó', 1500.00, 'Paradicsom, Mozzarella, Pepperoni, Kolbász, Sonka, Szalonna'),
(7, 'Négy sajt', 1300.00, 'Paradicsom, Mozzarella, Parmezán, Gorgonzola, Kecskesajt'),
(8, 'Buffalo Csirke', 1400.00, 'Buffalo Szósz, Mozzarella, Csirke, Vöröshagyma, Ranch'),
(9, 'Gombás', 1200.00, 'Paradicsom, Mozzarella, Gomba, Fokhagyma, Petrezselyem'),
(10, 'Supreme', 1600.00, 'Paradicsom, Mozzarella, Pepperoni, Kolbász, Kaliforniai paprika, Vöröshagyma, Olívabogyó, Gomba');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pizzeria_pizza_ingredients`
--

CREATE TABLE `pizzeria_pizza_ingredients` (
  `pizza_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `pizzeria_pizza_ingredients`
--

INSERT INTO `pizzeria_pizza_ingredients` (`pizza_id`, `ingredient_id`, `quantity`) VALUES
(1, 1, 2),
(1, 2, 3),
(1, 3, 1),
(2, 1, 2),
(2, 2, 3),
(2, 4, 4),
(3, 1, 2),
(3, 2, 3),
(3, 5, 2),
(3, 6, 2),
(4, 7, 2),
(4, 2, 3),
(4, 8, 2),
(4, 9, 1),
(5, 1, 2),
(5, 2, 3),
(5, 10, 1),
(5, 11, 1),
(5, 12, 1),
(5, 13, 1),
(6, 1, 2),
(6, 2, 3),
(6, 4, 2),
(6, 14, 1),
(6, 5, 1),
(6, 15, 1),
(7, 1, 2),
(7, 2, 3),
(7, 16, 1),
(7, 17, 1),
(7, 18, 1),
(8, 19, 2),
(8, 2, 3),
(8, 8, 2),
(8, 11, 1),
(8, 20, 1),
(9, 1, 2),
(9, 2, 3),
(9, 12, 2),
(10, 1, 2),
(10, 2, 3),
(10, 4, 2),
(10, 14, 1),
(10, 10, 1),
(10, 13, 1),
(10, 12, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pizzeria_time_logs`
--

CREATE TABLE `pizzeria_time_logs` (
  `log_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pizzeria_users`
--

CREATE TABLE `pizzeria_users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `pizzeria_users`
--

INSERT INTO `pizzeria_users` (`user_id`, `username`, `password`) VALUES
(2, 'teszt', 'teszt');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `pizzeria_deliveries`
--
ALTER TABLE `pizzeria_deliveries`
  ADD PRIMARY KEY (`delivery_id`);

--
-- A tábla indexei `pizzeria_ingredients`
--
ALTER TABLE `pizzeria_ingredients`
  ADD PRIMARY KEY (`ingredient_id`);

--
-- A tábla indexei `pizzeria_orders`
--
ALTER TABLE `pizzeria_orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `pizza_id` (`pizza_id`),
  ADD KEY `delivery_id` (`delivery_id`);

--
-- A tábla indexei `pizzeria_pizzas`
--
ALTER TABLE `pizzeria_pizzas`
  ADD PRIMARY KEY (`pizza_id`);

--
-- A tábla indexei `pizzeria_pizza_ingredients`
--
ALTER TABLE `pizzeria_pizza_ingredients`
  ADD KEY `pizza_id` (`pizza_id`),
  ADD KEY `ingredient_id` (`ingredient_id`);

--
-- A tábla indexei `pizzeria_time_logs`
--
ALTER TABLE `pizzeria_time_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `order_id` (`order_id`);

--
-- A tábla indexei `pizzeria_users`
--
ALTER TABLE `pizzeria_users`
  ADD PRIMARY KEY (`user_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `pizzeria_deliveries`
--
ALTER TABLE `pizzeria_deliveries`
  MODIFY `delivery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT a táblához `pizzeria_ingredients`
--
ALTER TABLE `pizzeria_ingredients`
  MODIFY `ingredient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `pizzeria_orders`
--
ALTER TABLE `pizzeria_orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT a táblához `pizzeria_pizzas`
--
ALTER TABLE `pizzeria_pizzas`
  MODIFY `pizza_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `pizzeria_time_logs`
--
ALTER TABLE `pizzeria_time_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `pizzeria_users`
--
ALTER TABLE `pizzeria_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `pizzeria_orders`
--
ALTER TABLE `pizzeria_orders`
  ADD CONSTRAINT `pizzeria_orders_ibfk_1` FOREIGN KEY (`pizza_id`) REFERENCES `pizzeria_pizzas` (`pizza_id`),
  ADD CONSTRAINT `pizzeria_orders_ibfk_2` FOREIGN KEY (`delivery_id`) REFERENCES `pizzeria_deliveries` (`delivery_id`);

--
-- Megkötések a táblához `pizzeria_pizza_ingredients`
--
ALTER TABLE `pizzeria_pizza_ingredients`
  ADD CONSTRAINT `pizzeria_pizza_ingredients_ibfk_1` FOREIGN KEY (`pizza_id`) REFERENCES `pizzeria_pizzas` (`pizza_id`),
  ADD CONSTRAINT `pizzeria_pizza_ingredients_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `pizzeria_ingredients` (`ingredient_id`);

--
-- Megkötések a táblához `pizzeria_time_logs`
--
ALTER TABLE `pizzeria_time_logs`
  ADD CONSTRAINT `pizzeria_time_logs_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `pizzeria_orders` (`order_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
