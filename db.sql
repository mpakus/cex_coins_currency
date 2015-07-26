CREATE TABLE IF NOT EXISTS `currencies` (
  `id` int(11) NOT NULL,
  `created_on` date NOT NULL,
  `currency` varchar(8) NOT NULL,
  `amount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
