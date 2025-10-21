-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 21/10/2025 às 14:32
-- Versão do servidor: 5.7.23-23
-- Versão do PHP: 8.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `tech4198_sistema_ods`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `logs_auditoria`
--

CREATE TABLE `logs_auditoria` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `acao` varchar(20) DEFAULT NULL,
  `tabela_afetada` varchar(50) DEFAULT NULL,
  `id_registro` int(11) DEFAULT NULL,
  `detalhes` text,
  `data_hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `logs_auditoria`
--

INSERT INTO `logs_auditoria` (`id`, `id_usuario`, `acao`, `tabela_afetada`, `id_registro`, `detalhes`, `data_hora`) VALUES
(1, 1, 'INSERT', 'projetos_ods', 1, 'Associou ODS ID 15', '2025-05-05 20:23:11'),
(2, 1, 'INSERT', 'projetos_ods', 1, 'Associou ODS ID 16', '2025-05-05 20:23:11'),
(3, 1, 'INSERT', 'projetos_ods', 1, 'Associou ODS ID 17', '2025-05-05 20:23:11'),
(4, 1, 'INSERT', 'projetos', 2, 'Projeto criado: Ilha do Cumbú', '2025-05-05 21:41:00'),
(5, 1, 'INSERT', 'projetos_ods', 2, 'Associou ODS ID 102', '2025-05-05 21:56:42'),
(6, 1, 'INSERT', 'projetos_ods', 2, 'Associou ODS ID 103', '2025-05-05 21:56:42'),
(7, 1, 'INSERT', 'projetos_ods', 2, 'Associou ODS ID 206', '2025-05-20 19:10:48'),
(8, 1, 'INSERT', 'projetos_ods', 2, 'Associou ODS ID 2', '2025-05-20 19:10:48'),
(9, 1, 'INSERT', 'projetos_ods', 2, 'Associou ODS ID 7', '2025-05-20 19:10:48'),
(10, 1, 'INSERT', 'projetos_ods', 2, 'Associou ODS ID 8', '2025-05-20 19:10:48'),
(11, 4, 'INSERT', 'projetos', 3, 'Projeto criado: Programa Castanheiras - Amapá', '2025-05-20 20:02:13'),
(12, 4, 'INSERT', 'projetos', 4, 'Projeto criado: Programa Castanheiras - Amapá', '2025-05-20 20:02:25'),
(13, 1, 'INSERT', 'projetos', 5, 'Projeto criado: Teste', '2025-05-22 18:13:28'),
(14, 6, 'INSERT', 'projetos', 6, 'Projeto criado: Teste', '2025-05-26 21:33:03'),
(15, 6, 'INSERT', 'projetos_ods', 6, 'Associou ODS ID 206', '2025-05-26 21:33:37'),
(16, 6, 'INSERT', 'projetos_ods', 6, 'Associou ODS ID 19', '2025-05-26 21:33:37'),
(17, 6, 'INSERT', 'projetos_ods', 6, 'Associou ODS ID 22', '2025-05-26 21:33:37'),
(18, 7, 'INSERT', 'projetos', 7, 'Projeto criado: Tabira', '2025-05-26 21:33:40'),
(19, 1, 'INSERT', 'projetos', 8, 'Projeto criado: Teste', '2025-07-29 18:11:25'),
(20, 1, 'INSERT', 'projetos_ods', 8, 'Associou ODS ID 206', '2025-07-29 18:12:06'),
(21, 1, 'INSERT', 'projetos_ods', 8, 'Associou ODS ID 2', '2025-07-29 18:12:06'),
(22, 1, 'INSERT', 'projetos_ods', 8, 'Associou ODS ID 48', '2025-07-29 18:12:06'),
(23, 4, 'INSERT', 'projetos', 9, 'Projeto criado: TSSS BAHIA', '2025-08-05 13:03:18'),
(24, 4, 'INSERT', 'projetos', 10, 'Projeto criado: TSSS BAHIA', '2025-08-05 13:08:04'),
(25, 4, 'DELETE', 'projetos_ods', 10, 'Associações ODS removidas do projeto', '2025-08-05 13:08:17'),
(26, 4, 'DELETE', 'projetos', 10, 'Projeto excluído: TSSS BAHIA', '2025-08-05 13:08:17'),
(27, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 206', '2025-08-05 17:12:40'),
(28, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 2', '2025-08-05 17:12:40'),
(29, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 7', '2025-08-05 17:12:40'),
(30, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 8', '2025-08-05 17:12:40'),
(31, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 9', '2025-08-05 17:12:40'),
(32, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 12', '2025-08-05 17:12:40'),
(33, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 13', '2025-08-05 17:12:40'),
(34, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 14', '2025-08-05 17:12:40'),
(35, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 15', '2025-08-05 17:12:40'),
(36, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 18', '2025-08-05 17:17:20'),
(37, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 19', '2025-08-05 17:17:20'),
(38, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 20', '2025-08-05 17:17:20'),
(39, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 21', '2025-08-05 17:17:20'),
(40, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 22', '2025-08-05 17:17:20'),
(41, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 23', '2025-08-05 17:17:20'),
(42, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 24', '2025-08-05 17:17:20'),
(43, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 25', '2025-08-05 17:17:20'),
(44, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 26', '2025-08-05 17:17:20'),
(45, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 27', '2025-08-05 17:17:20'),
(46, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 28', '2025-08-05 17:17:20'),
(47, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 29', '2025-08-05 17:17:20'),
(48, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 31', '2025-08-05 17:17:20'),
(49, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 34', '2025-08-05 17:17:20'),
(50, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 35', '2025-08-05 17:17:20'),
(51, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 36', '2025-08-05 17:17:20'),
(52, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 38', '2025-08-05 17:17:20'),
(53, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 40', '2025-08-05 17:17:20'),
(54, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 41', '2025-08-05 17:17:20'),
(55, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 43', '2025-08-05 17:17:20'),
(56, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 45', '2025-08-05 17:17:20'),
(57, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 46', '2025-08-05 17:17:20'),
(58, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 48', '2025-08-05 17:17:20'),
(59, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 49', '2025-08-05 17:17:20'),
(60, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 50', '2025-08-05 17:17:20'),
(61, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 54', '2025-08-05 17:17:20'),
(62, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 55', '2025-08-05 17:17:20'),
(63, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 56', '2025-08-05 17:17:20'),
(64, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 58', '2025-08-05 17:17:20'),
(65, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 60', '2025-08-05 17:17:20'),
(66, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 61', '2025-08-05 17:17:20'),
(67, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 62', '2025-08-05 17:17:20'),
(68, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 63', '2025-08-05 17:17:20'),
(69, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 64', '2025-08-05 17:17:20'),
(70, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 65', '2025-08-05 17:17:20'),
(71, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 66', '2025-08-05 17:17:20'),
(72, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 68', '2025-08-05 17:17:20'),
(73, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 70', '2025-08-05 17:17:20'),
(74, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 71', '2025-08-05 17:17:20'),
(75, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 72', '2025-08-05 17:17:20'),
(76, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 73', '2025-08-05 17:17:20'),
(77, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 74', '2025-08-05 17:17:20'),
(78, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 77', '2025-08-05 17:17:20'),
(79, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 78', '2025-08-05 17:17:20'),
(80, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 79', '2025-08-05 17:17:20'),
(81, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 80', '2025-08-05 17:17:20'),
(82, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 81', '2025-08-05 17:17:20'),
(83, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 82', '2025-08-05 17:17:20'),
(84, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 83', '2025-08-05 17:17:20'),
(85, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 84', '2025-08-05 17:17:20'),
(86, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 85', '2025-08-05 17:17:20'),
(87, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 87', '2025-08-05 17:17:20'),
(88, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 89', '2025-08-05 17:17:20'),
(89, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 92', '2025-08-05 17:17:20'),
(90, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 93', '2025-08-05 17:17:20'),
(91, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 94', '2025-08-05 17:17:20'),
(92, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 95', '2025-08-05 17:17:20'),
(93, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 96', '2025-08-05 17:17:20'),
(94, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 97', '2025-08-05 17:17:20'),
(95, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 103', '2025-08-05 17:17:20'),
(96, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 105', '2025-08-05 17:17:20'),
(97, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 108', '2025-08-05 17:17:20'),
(98, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 111', '2025-08-05 17:17:20'),
(99, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 112', '2025-08-05 17:17:20'),
(100, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 113', '2025-08-05 17:17:20'),
(101, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 114', '2025-08-05 17:17:20'),
(102, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 115', '2025-08-05 17:17:20'),
(103, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 117', '2025-08-05 17:17:20'),
(104, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 120', '2025-08-05 17:17:20'),
(105, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 121', '2025-08-05 17:17:20'),
(106, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 122', '2025-08-05 17:17:20'),
(107, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 123', '2025-08-05 17:17:20'),
(108, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 124', '2025-08-05 17:17:20'),
(109, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 125', '2025-08-05 17:17:20'),
(110, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 126', '2025-08-05 17:17:20'),
(111, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 127', '2025-08-05 17:17:20'),
(112, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 129', '2025-08-05 17:17:20'),
(113, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 134', '2025-08-05 17:17:20'),
(114, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 136', '2025-08-05 17:17:20'),
(115, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 138', '2025-08-05 17:17:20'),
(116, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 139', '2025-08-05 17:17:20'),
(117, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 141', '2025-08-05 17:17:20'),
(118, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 144', '2025-08-05 17:17:20'),
(119, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 146', '2025-08-05 17:17:20'),
(120, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 147', '2025-08-05 17:17:20'),
(121, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 175', '2025-08-05 17:17:20'),
(122, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 176', '2025-08-05 17:17:20'),
(123, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 177', '2025-08-05 17:17:20'),
(124, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 178', '2025-08-05 17:17:20'),
(125, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 179', '2025-08-05 17:17:20'),
(126, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 187', '2025-08-05 17:17:20'),
(127, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 189', '2025-08-05 17:17:20'),
(128, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 190', '2025-08-05 17:17:20'),
(129, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 191', '2025-08-05 17:17:20'),
(130, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 193', '2025-08-05 17:17:20'),
(131, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 194', '2025-08-05 17:17:20'),
(132, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 196', '2025-08-05 17:17:20'),
(133, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 198', '2025-08-05 17:17:20'),
(134, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 200', '2025-08-05 17:17:20'),
(135, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 204', '2025-08-05 17:17:20'),
(136, 4, 'DELETE', 'projetos_ods', 8, 'Associações ODS removidas do projeto', '2025-08-05 17:20:48'),
(137, 4, 'DELETE', 'projetos', 8, 'Projeto excluído: Teste', '2025-08-05 17:20:48'),
(138, 4, 'DELETE', 'projetos_ods', 7, 'Associações ODS removidas do projeto', '2025-08-05 17:21:02'),
(139, 4, 'DELETE', 'projetos', 7, 'Projeto excluído: Tabira', '2025-08-05 17:21:02'),
(140, 4, 'DELETE', 'projetos_ods', 6, 'Associações ODS removidas do projeto', '2025-08-05 17:21:08'),
(141, 4, 'DELETE', 'projetos', 6, 'Projeto excluído: Teste', '2025-08-05 17:21:08'),
(142, 4, 'DELETE', 'projetos_ods', 5, 'Associações ODS removidas do projeto', '2025-08-05 17:21:20'),
(143, 4, 'DELETE', 'projetos', 5, 'Projeto excluído: Teste', '2025-08-05 17:21:20'),
(144, 11, 'INSERT', 'projetos', 11, 'Projeto criado: teste_fabricio', '2025-09-08 18:53:25'),
(145, 11, 'INSERT', 'projetos_ods', 11, 'Associou ODS ID 61', '2025-09-08 18:55:19'),
(146, 11, 'INSERT', 'projetos_ods', 11, 'Associou ODS ID 66', '2025-09-08 18:55:19'),
(147, 11, 'INSERT', 'projetos_ods', 11, 'Associou ODS ID 68', '2025-09-08 18:55:19'),
(148, 11, 'INSERT', 'projetos_ods', 11, 'Associou ODS ID 70', '2025-09-08 18:55:19'),
(149, 11, 'INSERT', 'projetos_ods', 11, 'Associou ODS ID 71', '2025-09-08 18:55:19'),
(150, 11, 'INSERT', 'projetos_ods', 11, 'Associou ODS ID 72', '2025-09-08 18:55:19'),
(151, 11, 'INSERT', 'projetos_ods', 11, 'Associou ODS ID 73', '2025-09-08 18:55:19'),
(152, 11, 'INSERT', 'projetos_ods', 11, 'Associou ODS ID 74', '2025-09-08 18:55:19'),
(153, 11, 'INSERT', 'projetos_ods', 11, 'Associou ODS ID 77', '2025-09-08 18:55:19'),
(154, 11, 'INSERT', 'projetos_ods', 11, 'Associou ODS ID 78', '2025-09-08 18:55:19'),
(155, 11, 'INSERT', 'projetos_ods', 11, 'Associou ODS ID 79', '2025-09-08 18:55:19'),
(156, 11, 'INSERT', 'projetos_ods', 11, 'Associou ODS ID 80', '2025-09-08 18:55:19'),
(157, 11, 'INSERT', 'projetos_ods', 11, 'Associou ODS ID 84', '2025-09-08 18:55:19'),
(158, 11, 'INSERT', 'projetos_ods', 11, 'Associou ODS ID 85', '2025-09-08 18:55:19'),
(159, 12, 'INSERT', 'projetos', 12, 'Projeto criado: Colômbia - Santa Marta 2025 - Taller', '2025-09-09 14:47:09'),
(160, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 206', '2025-09-10 13:12:29'),
(161, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 2', '2025-09-10 13:12:29'),
(162, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 7', '2025-09-10 13:12:29'),
(163, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 8', '2025-09-10 13:12:29'),
(164, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 9', '2025-09-10 13:12:29'),
(165, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 12', '2025-09-10 13:12:29'),
(166, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 13', '2025-09-10 13:12:29'),
(167, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 14', '2025-09-10 13:12:29'),
(168, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 15', '2025-09-10 13:12:29'),
(169, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 18', '2025-09-10 13:12:29'),
(170, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 19', '2025-09-10 13:12:29'),
(171, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 20', '2025-09-10 13:12:29'),
(172, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 21', '2025-09-10 13:12:29'),
(173, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 22', '2025-09-10 13:12:29'),
(174, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 23', '2025-09-10 13:12:29'),
(175, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 24', '2025-09-10 13:12:29'),
(176, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 25', '2025-09-10 13:12:29'),
(177, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 26', '2025-09-10 13:12:29'),
(178, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 27', '2025-09-10 13:12:29'),
(179, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 28', '2025-09-10 13:12:29'),
(180, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 29', '2025-09-10 13:12:29'),
(181, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 31', '2025-09-10 13:12:29'),
(182, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 34', '2025-09-10 13:12:29'),
(183, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 35', '2025-09-10 13:12:29'),
(184, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 36', '2025-09-10 13:12:29'),
(185, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 38', '2025-09-10 13:12:29'),
(186, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 40', '2025-09-10 13:12:29'),
(187, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 41', '2025-09-10 13:12:29'),
(188, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 43', '2025-09-10 13:12:29'),
(189, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 45', '2025-09-10 13:12:29'),
(190, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 46', '2025-09-10 13:12:29'),
(191, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 48', '2025-09-10 13:12:29'),
(192, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 49', '2025-09-10 13:12:29'),
(193, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 50', '2025-09-10 13:12:29'),
(194, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 54', '2025-09-10 13:12:29'),
(195, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 55', '2025-09-10 13:12:29'),
(196, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 56', '2025-09-10 13:12:29'),
(197, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 58', '2025-09-10 13:12:29'),
(198, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 60', '2025-09-10 13:12:29'),
(199, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 61', '2025-09-10 13:12:29'),
(200, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 62', '2025-09-10 13:12:29'),
(201, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 63', '2025-09-10 13:12:29'),
(202, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 64', '2025-09-10 13:12:29'),
(203, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 65', '2025-09-10 13:12:29'),
(204, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 66', '2025-09-10 13:12:29'),
(205, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 68', '2025-09-10 13:12:29'),
(206, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 70', '2025-09-10 13:12:29'),
(207, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 71', '2025-09-10 13:12:29'),
(208, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 72', '2025-09-10 13:12:29'),
(209, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 73', '2025-09-10 13:12:29'),
(210, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 74', '2025-09-10 13:12:29'),
(211, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 77', '2025-09-10 13:12:29'),
(212, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 78', '2025-09-10 13:12:29'),
(213, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 79', '2025-09-10 13:12:29'),
(214, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 80', '2025-09-10 13:12:29'),
(215, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 81', '2025-09-10 13:12:29'),
(216, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 82', '2025-09-10 13:12:29'),
(217, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 85', '2025-09-10 13:12:29'),
(218, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 87', '2025-09-10 13:12:29'),
(219, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 92', '2025-09-10 13:12:29'),
(220, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 93', '2025-09-10 13:12:29'),
(221, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 94', '2025-09-10 13:12:29'),
(222, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 95', '2025-09-10 13:12:29'),
(223, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 96', '2025-09-10 13:12:29'),
(224, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 97', '2025-09-10 13:12:29'),
(225, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 98', '2025-09-10 13:12:29'),
(226, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 99', '2025-09-10 13:12:29'),
(227, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 101', '2025-09-10 13:12:29'),
(228, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 103', '2025-09-10 13:12:29'),
(229, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 105', '2025-09-10 13:12:29'),
(230, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 108', '2025-09-10 13:12:29'),
(231, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 109', '2025-09-10 13:12:29'),
(232, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 111', '2025-09-10 13:12:29'),
(233, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 112', '2025-09-10 13:12:29'),
(234, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 113', '2025-09-10 13:12:29'),
(235, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 114', '2025-09-10 13:12:29'),
(236, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 115', '2025-09-10 13:12:29'),
(237, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 117', '2025-09-10 13:12:29'),
(238, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 120', '2025-09-10 13:12:29'),
(239, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 121', '2025-09-10 13:12:29'),
(240, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 122', '2025-09-10 13:12:29'),
(241, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 123', '2025-09-10 13:12:29'),
(242, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 124', '2025-09-10 13:12:29'),
(243, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 125', '2025-09-10 13:12:29'),
(244, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 127', '2025-09-10 13:12:29'),
(245, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 129', '2025-09-10 13:12:29'),
(246, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 134', '2025-09-10 13:12:29'),
(247, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 136', '2025-09-10 13:12:29'),
(248, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 138', '2025-09-10 13:12:29'),
(249, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 139', '2025-09-10 13:12:29'),
(250, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 141', '2025-09-10 13:12:29'),
(251, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 144', '2025-09-10 13:12:29'),
(252, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 146', '2025-09-10 13:12:29'),
(253, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 147', '2025-09-10 13:12:29'),
(254, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 149', '2025-09-10 13:12:29'),
(255, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 150', '2025-09-10 13:12:29'),
(256, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 151', '2025-09-10 13:12:29'),
(257, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 153', '2025-09-10 13:12:29'),
(258, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 155', '2025-09-10 13:12:29'),
(259, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 157', '2025-09-10 13:12:29'),
(260, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 158', '2025-09-10 13:12:29'),
(261, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 159', '2025-09-10 13:12:29'),
(262, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 162', '2025-09-10 13:12:29'),
(263, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 164', '2025-09-10 13:12:29'),
(264, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 166', '2025-09-10 13:12:29'),
(265, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 167', '2025-09-10 13:12:29'),
(266, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 168', '2025-09-10 13:12:29'),
(267, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 169', '2025-09-10 13:12:29'),
(268, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 175', '2025-09-10 13:12:29'),
(269, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 176', '2025-09-10 13:12:29'),
(270, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 177', '2025-09-10 13:12:29'),
(271, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 178', '2025-09-10 13:12:29'),
(272, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 179', '2025-09-10 13:12:29'),
(273, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 187', '2025-09-10 13:12:29'),
(274, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 189', '2025-09-10 13:12:29'),
(275, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 190', '2025-09-10 13:12:29'),
(276, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 191', '2025-09-10 13:12:29'),
(277, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 193', '2025-09-10 13:12:29'),
(278, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 194', '2025-09-10 13:12:29'),
(279, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 196', '2025-09-10 13:12:29'),
(280, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 198', '2025-09-10 13:12:29'),
(281, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 200', '2025-09-10 13:12:29'),
(282, 4, 'INSERT', 'projetos_ods', 3, 'Associou ODS ID 204', '2025-09-10 13:12:29'),
(283, 4, 'DELETE', 'projetos_ods', 4, 'Associações ODS removidas do projeto', '2025-09-10 13:13:26'),
(284, 4, 'DELETE', 'projetos', 4, 'Projeto excluído: Programa Castanheiras - Amapá', '2025-09-10 13:13:26'),
(285, 4, 'UPDATE', 'projetos', 3, 'Projeto editado: Curso Seminário - Novos icones', '2025-09-10 13:16:50'),
(286, 4, 'INSERT', 'projetos', 13, 'Projeto criado: Curso Seminário - Novos icones para oficina', '2025-09-11 19:04:12'),
(287, 4, 'INSERT', 'projetos_ods', 13, 'Associou ODS ID 9', '2025-09-11 19:06:37'),
(288, 4, 'INSERT', 'projetos_ods', 13, 'Associou ODS ID 12', '2025-09-11 19:06:37'),
(289, 4, 'INSERT', 'projetos_ods', 13, 'Associou ODS ID 28', '2025-09-11 19:06:37'),
(290, 4, 'INSERT', 'projetos_ods', 13, 'Associou ODS ID 31', '2025-09-11 19:06:37'),
(291, 4, 'INSERT', 'projetos_ods', 13, 'Associou ODS ID 114', '2025-09-11 19:06:37'),
(292, 4, 'INSERT', 'projetos_ods', 13, 'Associou ODS ID 127', '2025-09-11 19:06:37'),
(293, 4, 'INSERT', 'projetos_ods', 13, 'Associou ODS ID 144', '2025-09-11 19:06:37'),
(294, 4, 'INSERT', 'projetos_ods', 13, 'Associou ODS ID 190', '2025-09-11 19:06:37'),
(295, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 206', '2025-09-15 18:58:29'),
(296, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 2', '2025-09-15 18:58:29'),
(297, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 7', '2025-09-15 18:58:29'),
(298, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 8', '2025-09-15 18:58:29'),
(299, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 13', '2025-09-15 18:58:29'),
(300, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 14', '2025-09-15 18:58:29'),
(301, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 15', '2025-09-15 18:58:29'),
(302, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 18', '2025-09-15 18:58:29'),
(303, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 19', '2025-09-15 18:58:29'),
(304, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 20', '2025-09-15 18:58:29'),
(305, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 21', '2025-09-15 18:58:29'),
(306, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 22', '2025-09-15 18:58:29'),
(307, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 23', '2025-09-15 18:58:29'),
(308, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 24', '2025-09-15 18:58:29'),
(309, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 25', '2025-09-15 18:58:29'),
(310, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 26', '2025-09-15 18:58:29'),
(311, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 27', '2025-09-15 18:58:29'),
(312, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 29', '2025-09-15 18:58:29'),
(313, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 34', '2025-09-15 18:58:29'),
(314, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 35', '2025-09-15 18:58:29'),
(315, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 36', '2025-09-15 18:58:29'),
(316, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 38', '2025-09-15 18:58:29'),
(317, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 40', '2025-09-15 18:58:29'),
(318, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 41', '2025-09-15 18:58:29'),
(319, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 43', '2025-09-15 18:58:29'),
(320, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 45', '2025-09-15 18:58:29'),
(321, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 46', '2025-09-15 18:58:29'),
(322, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 48', '2025-09-15 18:58:29'),
(323, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 49', '2025-09-15 18:58:29'),
(324, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 50', '2025-09-15 18:58:29'),
(325, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 54', '2025-09-15 18:58:29'),
(326, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 55', '2025-09-15 18:58:29'),
(327, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 56', '2025-09-15 18:58:29'),
(328, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 58', '2025-09-15 18:58:29'),
(329, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 60', '2025-09-15 18:58:29'),
(330, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 61', '2025-09-15 18:58:29'),
(331, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 62', '2025-09-15 18:58:29'),
(332, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 63', '2025-09-15 18:58:29'),
(333, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 64', '2025-09-15 18:58:29'),
(334, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 65', '2025-09-15 18:58:29'),
(335, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 66', '2025-09-15 18:58:29'),
(336, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 68', '2025-09-15 18:58:29'),
(337, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 70', '2025-09-15 18:58:29'),
(338, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 71', '2025-09-15 18:58:29'),
(339, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 72', '2025-09-15 18:58:29'),
(340, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 73', '2025-09-15 18:58:29'),
(341, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 74', '2025-09-15 18:58:29'),
(342, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 77', '2025-09-15 18:58:29'),
(343, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 78', '2025-09-15 18:58:29'),
(344, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 79', '2025-09-15 18:58:29'),
(345, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 80', '2025-09-15 18:58:29'),
(346, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 81', '2025-09-15 18:58:29'),
(347, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 82', '2025-09-15 18:58:29'),
(348, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 85', '2025-09-15 18:58:29'),
(349, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 87', '2025-09-15 18:58:29'),
(350, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 92', '2025-09-15 18:58:29'),
(351, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 93', '2025-09-15 18:58:29'),
(352, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 94', '2025-09-15 18:58:29'),
(353, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 95', '2025-09-15 18:58:29'),
(354, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 96', '2025-09-15 18:58:29'),
(355, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 97', '2025-09-15 18:58:29'),
(356, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 98', '2025-09-15 18:58:29'),
(357, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 99', '2025-09-15 18:58:29'),
(358, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 101', '2025-09-15 18:58:29'),
(359, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 103', '2025-09-15 18:58:29'),
(360, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 105', '2025-09-15 18:58:29'),
(361, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 108', '2025-09-15 18:58:29'),
(362, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 109', '2025-09-15 18:58:29'),
(363, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 111', '2025-09-15 18:58:29'),
(364, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 112', '2025-09-15 18:58:29'),
(365, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 113', '2025-09-15 18:58:29'),
(366, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 115', '2025-09-15 18:58:29'),
(367, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 117', '2025-09-15 18:58:29'),
(368, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 120', '2025-09-15 18:58:29'),
(369, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 121', '2025-09-15 18:58:29'),
(370, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 122', '2025-09-15 18:58:29'),
(371, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 123', '2025-09-15 18:58:29'),
(372, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 124', '2025-09-15 18:58:29'),
(373, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 125', '2025-09-15 18:58:29'),
(374, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 127', '2025-09-15 18:58:29'),
(375, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 129', '2025-09-15 18:58:29'),
(376, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 134', '2025-09-15 18:58:29'),
(377, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 136', '2025-09-15 18:58:30'),
(378, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 138', '2025-09-15 18:58:30'),
(379, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 139', '2025-09-15 18:58:30'),
(380, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 141', '2025-09-15 18:58:30'),
(381, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 146', '2025-09-15 18:58:30'),
(382, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 147', '2025-09-15 18:58:30'),
(383, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 149', '2025-09-15 18:58:30'),
(384, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 150', '2025-09-15 18:58:30'),
(385, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 151', '2025-09-15 18:58:30'),
(386, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 153', '2025-09-15 18:58:30'),
(387, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 155', '2025-09-15 18:58:30'),
(388, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 157', '2025-09-15 18:58:30'),
(389, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 158', '2025-09-15 18:58:30'),
(390, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 159', '2025-09-15 18:58:30'),
(391, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 162', '2025-09-15 18:58:30'),
(392, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 164', '2025-09-15 18:58:30'),
(393, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 166', '2025-09-15 18:58:30'),
(394, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 167', '2025-09-15 18:58:30'),
(395, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 168', '2025-09-15 18:58:30'),
(396, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 169', '2025-09-15 18:58:30'),
(397, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 175', '2025-09-15 18:58:30'),
(398, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 176', '2025-09-15 18:58:30'),
(399, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 177', '2025-09-15 18:58:30'),
(400, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 178', '2025-09-15 18:58:30'),
(401, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 179', '2025-09-15 18:58:30'),
(402, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 187', '2025-09-15 18:58:30'),
(403, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 189', '2025-09-15 18:58:30'),
(404, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 191', '2025-09-15 18:58:30'),
(405, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 193', '2025-09-15 18:58:30'),
(406, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 194', '2025-09-15 18:58:30'),
(407, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 196', '2025-09-15 18:58:30'),
(408, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 198', '2025-09-15 18:58:30'),
(409, 4, 'DELETE', 'projetos_ods', 3, 'Desassociou ODS ID 204', '2025-09-15 18:58:30'),
(410, 4, 'DELETE', 'projetos_ods', 13, 'Desassociou ODS ID 127', '2025-09-15 19:00:14'),
(411, 4, 'INSERT', 'projetos_ods', 13, 'Associou ODS ID 200', '2025-09-15 19:00:14'),
(412, 1, 'INSERT', 'projetos', 14, 'Projeto criado: Teste', '2025-09-17 20:47:19'),
(413, 1, 'DELETE', 'projetos_ods', 14, 'Associações ODS removidas do projeto', '2025-09-17 20:47:32'),
(414, 1, 'DELETE', 'projetos', 14, 'Projeto excluído: Teste', '2025-09-17 20:47:32'),
(415, 4, 'UPDATE', 'projetos', 9, 'Projeto editado: TSSS BAHIA', '2025-09-29 18:05:39'),
(416, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 157', '2025-09-29 19:28:59'),
(417, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 158', '2025-09-29 19:28:59'),
(418, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 159', '2025-09-29 19:28:59'),
(419, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 162', '2025-09-29 19:28:59'),
(420, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 164', '2025-09-29 19:28:59'),
(421, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 166', '2025-09-29 19:28:59'),
(422, 4, 'INSERT', 'projetos_ods', 9, 'Associou ODS ID 168', '2025-09-29 19:28:59');

-- --------------------------------------------------------

--
-- Estrutura para tabela `ods`
--

CREATE TABLE `ods` (
  `id` int(11) NOT NULL,
  `imagem` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `numero_ods` int(11) DEFAULT NULL,
  `nome_ods` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `numero_item` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `metas_ipea` text COLLATE utf8_unicode_ci NOT NULL,
  `fatores` text COLLATE utf8_unicode_ci NOT NULL,
  `icone_fator` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `imagem_ameaca` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Caminho da imagem de Ameaça (A)',
  `imagem_vulnerabilidade` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Caminho da imagem de Vulnerabilidade (V)',
  `imagem_resiliencia` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Caminho da imagem de Resiliência (R)',
  `imagem_sagrado` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Caminho da imagem de Sagrado (S)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `ods`
--

INSERT INTO `ods` (`id`, `imagem`, `numero_ods`, `nome_ods`, `numero_item`, `metas_ipea`, `fatores`, `icone_fator`, `imagem_ameaca`, `imagem_vulnerabilidade`, `imagem_resiliencia`, `imagem_sagrado`) VALUES
(2, '1.png', 1, 'ERRADICAÇÃO DA POBREZA', '1.3', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Serviços públicos e políticas de proteção social', 'uploads/1_3.png', 'ODS_1.3_A.png', 'ODS_1.3_V.png', 'ODS_1.3_R.png', 'ODS_1.3_S.png'),
(7, '2.png', 2, 'FOME ZERO E AGRICULTURA SUSTENTÁVEL', '2.1', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Alimentos seguros/suficientes e produção sustentável', 'uploads/2_1.png', 'ODS_2.1_A.png', 'ODS_2.1_V.png', 'ODS_2.1_R.png', 'ODS_2.1_S.png'),
(8, '2.png', 2, 'FOME ZERO E AGRICULTURA SUSTENTÁVEL', '2.2', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Desnutrição', 'uploads/2_2.png', 'ODS_2.2_A.png', 'ODS_2.2_V.png', 'ODS_2.2_R.png', 'ODS_2.2_S.png'),
(9, '2.png', 2, 'FOME ZERO E AGRICULTURA SUSTENTÁVEL', '2.3', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Agricultura Familiar ', 'uploads/2_3.png', 'ODS_2.3_A.png', 'ODS_2.3_V.png', 'ODS_2.3_R.png', 'ODS_2.3_S.png'),
(12, '2.png', 2, 'FOME ZERO E AGRICULTURA SUSTENTÁVEL', '2.6', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Iniciativas de Economia Solidária', 'uploads/2_6.png', 'ODS_2.6_A.png', 'ODS_2.6_V.png', 'ODS_2.6_R.png', 'ODS_2.6_S.png'),
(13, '2.png', 2, 'FOME ZERO E AGRICULTURA SUSTENTÁVEL', '2.7', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Sistemas sustentáveis de produção de alimentos ', 'uploads/2_7.png', 'ODS_2.7_A.png', 'ODS_2.7_V.png', 'ODS_2.7_R.png', 'ODS_2.7_S.png'),
(14, '2.png', 2, 'FOME ZERO E AGRICULTURA SUSTENTÁVEL', '2.8', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Produção Orgânica', 'uploads/2_8.png', 'ODS_2.8_A.png', 'ODS_2.8_V.png', 'ODS_2.8_R.png', 'ODS_2.8_S.png'),
(15, '2.png', 2, 'FOME ZERO E AGRICULTURA SUSTENTÁVEL', '2.9', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Meio-ambiente e ecossistemas', 'uploads/2_9.png', 'ODS_2.9_A.png', 'ODS_2.9_V.png', 'ODS_2.9_R.png', 'ODS_2.9_S.png'),
(18, '3.png', 3, 'SAÚDE E BEM ESTAR', '3.1', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Mortalidade materna', 'uploads/3_1.png', 'ODS_3.1_A.png', 'ODS_3.1_V.png', 'ODS_3.1_R.png', 'ODS_3.1_S.png'),
(19, '3.png', 3, 'SAÚDE E BEM ESTAR', '3.2', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Mortalidade neonatal', 'uploads/3_2.png', 'ODS_3.2_A.png', 'ODS_3.2_V.png', 'ODS_3.2_R.png', 'ODS_3.2_S.png'),
(20, '3.png', 3, 'SAÚDE E BEM ESTAR', '3.3', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Mortalidade infantil', 'uploads/3_3.png', 'ODS_3.3_A.png', 'ODS_3.3_V.png', 'ODS_3.3_R.png', 'ODS_3.3_S.png'),
(21, '3.png', 3, 'SAÚDE E BEM ESTAR', '3.4', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Disseminação de doenças e epidemias ', 'uploads/3_4.png', 'ODS_3.4_A.png', 'ODS_3.4_V.png', 'ODS_3.4_R.png', 'ODS_3.4_S.png'),
(22, '3.png', 3, 'SAÚDE E BEM ESTAR', '3.5', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Dengue', 'uploads/3_5.png', 'ODS_3.5_A.png', 'ODS_3.5_V.png', 'ODS_3.5_R.png', 'ODS_3.5_S.png'),
(23, '3.png', 3, 'SAÚDE E BEM ESTAR', '3.6', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Doenças Transmissíveis', 'uploads/3_6.png', 'ODS_3.6_A.png', 'ODS_3.6_V.png', 'ODS_3.6_R.png', 'ODS_3.6_S.png'),
(24, '3.png', 3, 'SAÚDE E BEM ESTAR', '3.7', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Doenças não transmissíveis', 'uploads/3_7.png', 'ODS_3.7_A.png', 'ODS_3.7_V.png', 'ODS_3.7_R.png', 'ODS_3.7_S.png'),
(25, '3.png', 3, 'SAÚDE E BEM ESTAR', '3.8', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Uso abusivo de drogas e álcool', 'uploads/3_8.png', 'ODS_3.8_A.png', 'ODS_3.8_V.png', 'ODS_3.8_R.png', 'ODS_3.8_S.png'),
(26, '3.png', 3, 'SAÚDE E BEM ESTAR', '3.9', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Acidentes em estradas', 'uploads/3_9.png', 'ODS_3.9_A.png', 'ODS_3.9_V.png', 'ODS_3.9_R.png', 'ODS_3.9_S.png'),
(27, '3.png', 3, 'SAÚDE E BEM ESTAR', '3.10', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Saúde sexual e reprodutiva', 'uploads/3_10.png', 'ODS_3.10_A.png', 'ODS_3.10_V.png', 'ODS_3.10_R.png', 'ODS_3.10_S.png'),
(28, '3.png', 3, 'SAÚDE E BEM ESTAR', '3.11', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Serviços de saúde e o acesso a medicamentos e vacinas', 'uploads/3_11.png', 'ODS_3.11_A.png', 'ODS_3.11_V.png', 'ODS_3.11_R.png', 'ODS_3.11_S.png'),
(29, '3.png', 3, 'SAÚDE E BEM ESTAR', '3.12', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Plantas medicinais', 'uploads/3_12.png', 'ODS_3.12_A.png', 'ODS_3.12_V.png', 'ODS_3.12_R.png', 'ODS_3.12_S.png'),
(31, '3.png', 3, 'SAÚDE E BEM ESTAR', '3.14', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Contaminação e poluição do ar, da água e do solo', 'uploads/3_14.png', 'ODS_3.14_A.png', 'ODS_3.14_V.png', 'ODS_3.14_R.png', 'ODS_3.14_S.png'),
(34, '3.png', 3, 'SAÚDE E BEM ESTAR', '3.17', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Profissionais de saúde', 'uploads/3_17.png', 'ODS_3.17_A.png', 'ODS_3.17_V.png', 'ODS_3.17_R.png', 'ODS_3.17_S.png'),
(35, '3.png', 3, 'SAÚDE E BEM ESTAR', '3.18', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Gestão de riscos e emergências', 'uploads/3_18.png', 'ODS_3.18_A.png', 'ODS_3.18_V.png', 'ODS_3.18_R.png', 'ODS_3.18_S.png'),
(36, '4.png', 4, 'EDUCAÇÃO E QUALIDADE', '4.1', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Educação - ensino primário', 'uploads/4_1.png', 'ODS_4.1_A.png', 'ODS_4.1_V.png', 'ODS_4.1_R.png', 'ODS_4.1_S.png'),
(38, '4.png', 4, 'EDUCAÇÃO E QUALIDADE', '4.3', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Educação Técnica', 'uploads/4_3.png', 'ODS_4.3_A.png', 'ODS_4.3_V.png', 'ODS_4.3_R.png', 'ODS_4.3_S.png'),
(40, '4.png', 4, 'EDUCAÇÃO E QUALIDADE', '4.5', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Educação Superior', 'uploads/4_5.png', 'ODS_4.5_A.png', 'ODS_4.5_V.png', 'ODS_4.5_R.png', 'ODS_4.5_S.png'),
(41, '4.png', 4, 'EDUCAÇÃO E QUALIDADE', '4.6', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Tecnologias de informação e comunicação', 'uploads/4_6.png', 'ODS_4.6_A.png', 'ODS_4.6_V.png', 'ODS_4.6_R.png', 'ODS_4.6_S.png'),
(43, '4.png', 4, 'EDUCAÇÃO E QUALIDADE', '4.8', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Alfabetização - EJA', 'uploads/4_8.png', 'ODS_4.8_A.png', 'ODS_4.8_V.png', 'ODS_4.8_R.png', 'ODS_4.8_S.png'),
(45, '4.png', 4, 'EDUCAÇÃO E QUALIDADE', '4.10', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Bolsas de estudo', 'uploads/4_10.png', 'ODS_4.10_A.png', 'ODS_4.10_V.png', 'ODS_4.10_R.png', 'ODS_4.10_S.png'),
(46, '4.png', 4, 'EDUCAÇÃO E QUALIDADE', '4.11', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Professores qualificados', 'uploads/4_11.png', 'ODS_4.11_A.png', 'ODS_4.11_V.png', 'ODS_4.11_R.png', 'ODS_4.11_S.png'),
(48, '5.png', 5, 'IGUALDADE DE GÊNERO', '5.2', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Violência contra mulheres e meninas', 'uploads/5_2.png', 'ODS_5.2_A.png', 'ODS_5.2_V.png', 'ODS_5.2_R.png', 'ODS_5.2_S.png'),
(49, '5.png', 5, 'IGUALDADE DE GÊNERO', '5.3', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', ' Casamentos prematuros, forçados e de crianças e mutilações genitais', 'uploads/5_3.png', 'ODS_5.3_A.png', 'ODS_5.3_V.png', 'ODS_5.3_R.png', 'ODS_5.3_S.png'),
(50, '5.png', 5, 'IGUALDADE DE GÊNERO', '5.4', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Trabalho de assistência e doméstico não remunerado', 'uploads/5_4.png', 'ODS_5.4_A.png', 'ODS_5.4_V.png', 'ODS_5.4_R.png', 'ODS_5.4_S.png'),
(54, '5.png', 5, 'IGUALDADE DE GÊNERO', '5.8', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Propriedade e controle sobre a terra', 'uploads/5_8.png', 'ODS_5.8_A.png', 'ODS_5.8_V.png', 'ODS_5.8_R.png', 'ODS_5.8_S.png'),
(55, '5.png', 5, 'IGUALDADE DE GÊNERO', '5.9', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Tecnologias de informação e comunicação', 'uploads/5_9.png', 'ODS_5.9_A.png', 'ODS_5.9_V.png', 'ODS_5.9_R.png', 'ODS_5.9_S.png'),
(56, '5.png', 5, 'IGUALDADE DE GÊNERO', '5.10', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Igualdade de oportunidades', 'uploads/5_10.png', 'ODS_5.10_A.png', 'ODS_5.10_V.png', 'ODS_5.10_R.png', 'ODS_5.10_S.png'),
(58, '5.png', 5, 'IGUALDADE DE GÊNERO', '5.12', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Ação do Estado na coordenação e coerência de políticas para igualdade de gênero', 'uploads/5_12.png', 'ODS_5.12_A.png', 'ODS_5.12_V.png', 'ODS_5.12_R.png', 'ODS_5.12_S.png'),
(60, '6.png', 6, 'ÁGUA POTÁVEL E SANEAMENTO', '6.1', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Acesso à água e saneamento', 'uploads/6_1.png', 'ODS_6.1_A.png', 'ODS_6.1_V.png', 'ODS_6.1_R.png', 'ODS_6.1_S.png'),
(61, '6.png', 6, 'ÁGUA POTÁVEL E SANEAMENTO', '6.2', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Contaminação e poluição do ar, da água e do solo', 'uploads/6_2.png', 'ODS_6.2_A.png', 'ODS_6.2_V.png', 'ODS_6.2_R.png', 'ODS_6.2_S.png'),
(62, '6.png', 6, 'ÁGUA POTÁVEL E SANEAMENTO', '6.3', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Redução, reciclagem e reúso', 'uploads/6_3.png', 'ODS_6.3_A.png', 'ODS_6.3_V.png', 'ODS_6.3_R.png', 'ODS_6.3_S.png'),
(63, '6.png', 6, 'ÁGUA POTÁVEL E SANEAMENTO', '6.4', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Gestão da água e saneamento - uso da água em todos os setores e escassez', 'uploads/6_4.png', 'ODS_6.4_A.png', 'ODS_6.4_V.png', 'ODS_6.4_R.png', 'ODS_6.4_S.png'),
(64, '6.png', 6, 'ÁGUA POTÁVEL E SANEAMENTO', '6.5', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Meio Ambiente e Ecossistemas', 'uploads/6_5.png', 'ODS_6.5_A.png', 'ODS_6.5_V.png', 'ODS_6.5_R.png', 'ODS_6.5_S.png'),
(65, '6.png', 6, 'ÁGUA POTÁVEL E SANEAMENTO', '6.6', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Gestão da água e saneamento - participação das comunidades locais', 'uploads/6_6.png', 'ODS_6.6_A.png', 'ODS_6.6_V.png', 'ODS_6.6_R.png', 'ODS_6.6_S.png'),
(66, '7.png', 7, 'ENERGIA LIMPA E ACESSÍVEL', '7.1', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Serviços de Energia', 'uploads/7_1.png', 'ODS_7.1_A.png', 'ODS_7.1_V.png', 'ODS_7.1_R.png', 'ODS_7.1_S.png'),
(68, '7.png', 7, 'ENERGIA LIMPA E ACESSÍVEL', '7.3', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Serviços de Energia modernos e sustentáveis', 'uploads/7_3.png', 'ODS_7.3_A.png', 'ODS_7.3_V.png', 'ODS_7.3_R.png', 'ODS_7.3_S.png'),
(70, '8.png', 8, 'TRABALHO DECENTE E CRESCIMENTO ECONÔMICO', '8.2', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Geração de emprego e renda', 'uploads/8_2.png', 'ODS_8.2_A.png', 'ODS_8.2_V.png', 'ODS_8.2_R.png', 'ODS_8.2_S.png'),
(71, '8.png', 8, 'TRABALHO DECENTE E CRESCIMENTO ECONÔMICO', '8.3', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Empreendedorismo, criatividade e inovação', 'uploads/8_3.png', 'ODS_8.3_A.png', 'ODS_8.3_V.png', 'ODS_8.3_R.png', 'ODS_8.3_S.png'),
(72, '8.png', 8, 'TRABALHO DECENTE E CRESCIMENTO ECONÔMICO', '8.4', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Formalização', 'uploads/8_4.png', 'ODS_8.4_A.png', 'ODS_8.4_V.png', 'ODS_8.4_R.png', 'ODS_8.4_S.png'),
(73, '8.png', 8, 'TRABALHO DECENTE E CRESCIMENTO ECONÔMICO', '8.5', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Promoção de investimento local', 'uploads/8_5.png', 'ODS_8.5_A.png', 'ODS_8.5_V.png', 'ODS_8.5_R.png', 'ODS_8.5_S.png'),
(74, '8.png', 8, 'TRABALHO DECENTE E CRESCIMENTO ECONÔMICO', '8.6', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Iniciativas de Economia Solidária', 'uploads/8_6.png', 'ODS_8.6_A.png', 'ODS_8.6_V.png', 'ODS_8.6_R.png', 'ODS_8.6_S.png'),
(77, '8.png', 8, 'TRABALHO DECENTE E CRESCIMENTO ECONÔMICO', '8.9', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Desemprego', 'uploads/8_9.png', 'ODS_8.9_A.png', 'ODS_8.9_V.png', 'ODS_8.9_R.png', 'ODS_8.9_S.png'),
(78, '8.png', 8, 'TRABALHO DECENTE E CRESCIMENTO ECONÔMICO', '8.10', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Educação para trabalho ', 'uploads/8_10.png', 'ODS_8.10_A.png', 'ODS_8.10_V.png', 'ODS_8.10_R.png', 'ODS_8.10_S.png'),
(79, '8.png', 8, 'TRABALHO DECENTE E CRESCIMENTO ECONÔMICO', '8.11', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Trabalho infantil ', 'uploads/8_11.png', 'ODS_8.11_A.png', 'ODS_8.11_V.png', 'ODS_8.11_R.png', 'ODS_8.11_S.png'),
(80, '8.png', 8, 'TRABALHO DECENTE E CRESCIMENTO ECONÔMICO', '8.12', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Trabalho em condições análogas às de escravo', 'uploads/8_12.png', 'ODS_8.12_A.png', 'ODS_8.12_V.png', 'ODS_8.12_R.png', 'ODS_8.12_S.png'),
(81, '8.png', 8, 'TRABALHO DECENTE E CRESCIMENTO ECONÔMICO', '8.13', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Tráfico de pessoas', 'uploads/8_13.png', 'ODS_8.13_A.png', 'ODS_8.13_V.png', 'ODS_8.13_R.png', 'ODS_8.13_S.png'),
(82, '8.png', 8, 'TRABALHO DECENTE E CRESCIMENTO ECONÔMICO', '8.14', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Ambientes de trabalho seguros', 'uploads/8_14.png', 'ODS_8.14_A.png', 'ODS_8.14_V.png', 'ODS_8.14_R.png', 'ODS_8.14_S.png'),
(83, '8.png', 8, 'TRABALHO DECENTE E CRESCIMENTO ECONÔMICO', '8.15', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Direitos fundamentais', 'uploads/8_15.png', 'ODS_8.15_A.png', 'ODS_8.15_V.png', 'ODS_8.15_R.png', 'ODS_8.15_S.png'),
(84, '8.png', 8, 'TRABALHO DECENTE E CRESCIMENTO ECONÔMICO', '8.16', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Ação do Estado na coordenação e coerência de políticas para turismo', 'uploads/8_16.png', 'ODS_8.16_A.png', 'ODS_8.16_V.png', 'ODS_8.16_R.png', 'ODS_8.16_S.png'),
(85, '8.png', 8, 'TRABALHO DECENTE E CRESCIMENTO ECONÔMICO', '8.17', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Geração de emprego e renda relacionado ao turismo', 'uploads/8_17.png', 'ODS_8.17_A.png', 'ODS_8.17_V.png', 'ODS_8.17_R.png', 'ODS_8.17_S.png'),
(87, '8.png', 8, 'TRABALHO DECENTE E CRESCIMENTO ECONÔMICO', '8.19', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Promoção de cultura', 'uploads/8_19.png', 'ODS_8.19_A.png', 'ODS_8.19_V.png', 'ODS_8.19_R.png', 'ODS_8.19_S.png'),
(89, '8.png', 8, 'TRABALHO DECENTE E CRESCIMENTO ECONÔMICO', '8.21', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Serviços bancários', 'uploads/8_21.png', 'ODS_8.21_A.png', 'ODS_8.21_V.png', 'ODS_8.21_R.png', 'ODS_8.21_S.png'),
(92, '9.png', 9, 'INDÚSTRIA, INOVAÇÃO E INFRAESTRUTURA', '9.1', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Sistema viário', 'uploads/9_1.png', 'ODS_9.1_A.png', 'ODS_9.1_V.png', 'ODS_9.1_R.png', 'ODS_9.1_S.png'),
(93, '9.png', 9, 'INDÚSTRIA, INOVAÇÃO E INFRAESTRUTURA', '9.2', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Industrialização inclusiva e sustentável', 'uploads/9_2.png', 'ODS_9.2_A.png', 'ODS_9.2_V.png', 'ODS_9.2_R.png', 'ODS_9.2_S.png'),
(94, '9.png', 9, 'INDÚSTRIA, INOVAÇÃO E INFRAESTRUTURA', '9.3', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Geração de emprego e renda pela indústria', 'uploads/9_3.png', 'ODS_9.3_A.png', 'ODS_9.3_V.png', 'ODS_9.3_R.png', 'ODS_9.3_S.png'),
(95, '9.png', 9, 'INDÚSTRIA, INOVAÇÃO E INFRAESTRUTURA', '9.4', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Crédito para micro e pequenas empresas e cooperativas', 'uploads/9_4.png', 'ODS_9.4_A.png', 'ODS_9.4_V.png', 'ODS_9.4_R.png', 'ODS_9.4_S.png'),
(96, '9.png', 9, 'INDÚSTRIA, INOVAÇÃO E INFRAESTRUTURA', '9.5', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Atividades econômicas sustentáveis', 'uploads/9_5.png', 'ODS_9.5_A.png', 'ODS_9.5_V.png', 'ODS_9.5_R.png', 'ODS_9.5_S.png'),
(97, '9.png', 9, 'INDÚSTRIA, INOVAÇÃO E INFRAESTRUTURA', '9.6', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Tecnologias ambientalmente corretas', 'uploads/9_6.png', 'ODS_9.6_A.png', 'ODS_9.6_V.png', 'ODS_9.6_R.png', 'ODS_9.6_S.png'),
(98, '9.png', 9, 'INDÚSTRIA, INOVAÇÃO E INFRAESTRUTURA', '9.7', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Pesquisa científica e inovação', 'uploads/9_7.png', 'ODS_9.7_A.png', 'ODS_9.7_V.png', 'ODS_9.7_R.png', 'ODS_9.7_S.png'),
(99, '9.png', 9, 'INDÚSTRIA, INOVAÇÃO E INFRAESTRUTURA', '9.8', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', ' infraestrutura sustentável e resiliente', 'uploads/9_8.png', 'ODS_9.8_A.png', 'ODS_9.8_V.png', 'ODS_9.8_R.png', 'ODS_9.8_S.png'),
(101, '9.png', 9, 'INDÚSTRIA, INOVAÇÃO E INFRAESTRUTURA', '9.10', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Tecnologias de informação e comunicação', 'uploads/9_10.png', 'ODS_9.10_A.png', 'ODS_9.10_V.png', 'ODS_9.10_R.png', 'ODS_9.10_S.png'),
(103, '10.png', 10, 'REDUÇÃO DAS DESIGUALDADES', '10.2', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Empoderamento e inclusão social, econômica e política', 'uploads/10_2.png', 'ODS_10.2_A.png', 'ODS_10.2_V.png', 'ODS_10.2_R.png', 'ODS_10.2_S.png'),
(105, '10.png', 10, 'REDUÇÃO DAS DESIGUALDADES', '10.4', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Igualdade de oportunidades', 'uploads/10_4.png', 'ODS_10.4_A.png', 'ODS_10.4_V.png', 'ODS_10.4_R.png', 'ODS_10.4_S.png'),
(108, '10.png', 10, 'REDUÇÃO DAS DESIGUALDADES', '10.7', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Serviços públicos e políticas de proteção social', 'uploads/10_7.png', 'ODS_10.7_A.png', 'ODS_10.7_V.png', 'ODS_10.7_R.png', 'ODS_10.7_S.png'),
(109, '10.png', 10, 'REDUÇÃO DAS DESIGUALDADES', '10.8', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Regulamentação e monitoramento dos mercados e instituições ', 'uploads/10_8.png', 'ODS_10.8_A.png', 'ODS_10.8_V.png', 'ODS_10.8_R.png', 'ODS_10.8_S.png'),
(111, '10.png', 10, 'REDUÇÃO DAS DESIGUALDADES', '10.10', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Migração', 'uploads/10_10.png', 'ODS_10.10_A.png', 'ODS_10.10_V.png', 'ODS_10.10_R.png', 'ODS_10.10_S.png'),
(112, '11.png', 11, 'CIDADES E COMUNIDADES SUSTENTÁVEIS', '11.1', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Habitação', 'uploads/11_1.png', 'ODS_11.1_A.png', 'ODS_11.1_V.png', 'ODS_11.1_R.png', 'ODS_11.1_S.png'),
(113, '11.png', 11, 'CIDADES E COMUNIDADES SUSTENTÁVEIS', '11.2', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Transportes seguros', 'uploads/11_2.png', 'ODS_11.2_A.png', 'ODS_11.2_V.png', 'ODS_11.2_R.png', 'ODS_11.2_S.png'),
(114, '11.png', 11, 'CIDADES E COMUNIDADES SUSTENTÁVEIS', '11.3', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', ' Urbanização e infraestrutura', 'uploads/11_3.png', 'ODS_11.3_A.png', 'ODS_11.3_V.png', 'ODS_11.3_R.png', 'ODS_11.3_S.png'),
(115, '11.png', 11, 'CIDADES E COMUNIDADES SUSTENTÁVEIS', '11.4', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Patrimônio cultural e natural', 'uploads/11_4.png', 'ODS_11.4_A.png', 'ODS_11.4_V.png', 'ODS_11.4_R.png', 'ODS_11.4_S.png'),
(117, '11.png', 11, 'CIDADES E COMUNIDADES SUSTENTÁVEIS', '11.6', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Qualidade do ar', 'uploads/11_6.png', 'ODS_11.6_A.png', 'ODS_11.6_V.png', 'ODS_11.6_R.png', 'ODS_11.6_S.png'),
(120, '11.png', 11, 'CIDADES E COMUNIDADES SUSTENTÁVEIS', '11.9', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Esportes', 'uploads/11_9.png', 'ODS_11.9_A.png', 'ODS_11.9_V.png', 'ODS_11.9_R.png', 'ODS_11.9_S.png'),
(121, '11.png', 11, 'CIDADES E COMUNIDADES SUSTENTÁVEIS', '11.10', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Segurança', 'uploads/11_10.png', 'ODS_11.10_A.png', 'ODS_11.10_V.png', 'ODS_11.10_R.png', 'ODS_11.10_S.png'),
(122, '11.png', 11, 'CIDADES E COMUNIDADES SUSTENTÁVEIS', '11.11', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Biblioteca', 'uploads/11_11.png', 'ODS_11.11_A.png', 'ODS_11.11_V.png', 'ODS_11.11_R.png', 'ODS_11.11_S.png'),
(123, '11.png', 11, 'CIDADES E COMUNIDADES SUSTENTÁVEIS', '11.12', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Lazer', 'uploads/11_12.png', 'ODS_11.12_A.png', 'ODS_11.12_V.png', 'ODS_11.12_R.png', 'ODS_11.12_S.png'),
(124, '11.png', 11, 'CIDADES E COMUNIDADES SUSTENTÁVEIS', '11.13', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Violência', 'uploads/11_13.png', 'ODS_11.13_A.png', 'ODS_11.13_V.png', 'ODS_11.13_R.png', 'ODS_11.13_S.png'),
(125, '11.png', 11, 'CIDADES E COMUNIDADES SUSTENTÁVEIS', '11.14', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Gestão de riscos e emergências', 'uploads/11_14.png', 'ODS_11.14_A.png', 'ODS_11.14_V.png', 'ODS_11.14_R.png', 'ODS_11.14_S.png'),
(126, '11.png', 11, 'CIDADES E COMUNIDADES SUSTENTÁVEIS', '11.15', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Ação do Estado na coordenação e coerência de políticas', 'uploads/11_15.png', 'ODS_11.15_A.png', 'ODS_11.15_V.png', 'ODS_11.15_R.png', 'ODS_11.15_S.png'),
(127, '11.png', 11, 'CIDADES E COMUNIDADES SUSTENTÁVEIS', '11.16', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Construções sustentáveis e resilientes', 'uploads/11_16.png', 'ODS_11.16_A.png', 'ODS_11.16_V.png', 'ODS_11.16_R.png', 'ODS_11.16_S.png'),
(128, '11.png', 11, 'CIDADES E COMUNIDADES SUSTENTÁVEIS', '11.17', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Parcerias multissetoriais', 'uploads/11_17.png', 'ODS_11.17_A.png', 'ODS_11.17_V.png', 'ODS_11.17_R.png', 'ODS_11.17_S.png'),
(129, '12.png', 12, 'CONSUMO E PRODUÇÃO RESPONSÁVEIS', '12.1', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Sistemas sustentáveis de produção de alimentos', 'uploads/12_1.png', 'ODS_12.1_A.png', 'ODS_12.1_V.png', 'ODS_12.1_R.png', 'ODS_12.1_S.png'),
(134, '12.png', 12, 'CONSUMO E PRODUÇÃO RESPONSÁVEIS', '12.6', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Gestão sustentável do meio ambiente e ecossistemas', 'uploads/12_6.png', 'ODS_12.6_A.png', 'ODS_12.6_V.png', 'ODS_12.6_R.png', 'ODS_12.6_S.png'),
(136, '12.png', 12, 'CONSUMO E PRODUÇÃO RESPONSÁVEIS', '12.8', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Redução, reciclagem e reúso', 'uploads/12_8.png', 'ODS_12.8_A.png', 'ODS_12.8_V.png', 'ODS_12.8_R.png', 'ODS_12.8_S.png'),
(138, '12.png', 12, 'CONSUMO E PRODUÇÃO RESPONSÁVEIS', '12.10', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Economia circular', 'uploads/12_10.png', 'ODS_12.10_A.png', 'ODS_12.10_V.png', 'ODS_12.10_R.png', 'ODS_12.10_S.png'),
(139, '12.png', 12, 'CONSUMO E PRODUÇÃO RESPONSÁVEIS', '12.11', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Acesso à informação de qualidade', 'uploads/12_11.png', 'ODS_12.11_A.png', 'ODS_12.11_V.png', 'ODS_12.11_R.png', 'ODS_12.11_S.png'),
(141, '12.png', 12, 'CONSUMO E PRODUÇÃO RESPONSÁVEIS', '12.13', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Tecnologias ambientalmente corretas', 'uploads/12_13.png', 'ODS_12.13_A.png', 'ODS_12.13_V.png', 'ODS_12.13_R.png', 'ODS_12.13_S.png'),
(144, '13.png', 13, 'AÇÃO CONTRA A MUDANÇA GLOBAL DO CLIMA', '13.1', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Gestão de riscos e emergências', 'uploads/13_1.png', 'ODS_13.1_A.png', 'ODS_13.1_V.png', 'ODS_13.1_R.png', 'ODS_13.1_S.png'),
(146, '13.png', 13, 'AÇÃO CONTRA A MUDANÇA GLOBAL DO CLIMA', '13.3', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Educação para mitigação, adaptação, redução de impacto e alerta precoce da mudança do clima', 'uploads/13_3.png', 'ODS_13.3_A.png', 'ODS_13.3_V.png', 'ODS_13.3_R.png', 'ODS_13.3_S.png'),
(147, '13.png', 13, 'AÇÃO CONTRA A MUDANÇA GLOBAL DO CLIMA', '13.4', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Planejamento relacionado à mudança do clima e à gestão eficaz', 'uploads/13_4.png', 'ODS_13.4_A.png', 'ODS_13.4_V.png', 'ODS_13.4_R.png', 'ODS_13.4_S.png'),
(149, '14.png', 14, 'VIDA NA ÁGUA', '14.2', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Gerenciar e proteger os oceanos, os mares e os recursos marinhos de forma  sustentável ', 'uploads/14_2.png', 'ODS_14.2_A.png', 'ODS_14.2_V.png', 'ODS_14.2_R.png', 'ODS_14.2_S.png'),
(150, '14.png', 14, 'VIDA NA ÁGUA', '14.3', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Cooperação científica ', 'uploads/14_3.png', 'ODS_14.3_A.png', 'ODS_14.3_V.png', 'ODS_14.3_R.png', 'ODS_14.3_S.png'),
(151, '14.png', 14, 'VIDA NA ÁGUA', '14.4', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Sobrepesca e pesca ilegal - regulação e restauraçõa de populações', 'uploads/14_4.png', 'ODS_14.4_A.png', 'ODS_14.4_V.png', 'ODS_14.4_R.png', 'ODS_14.4_S.png'),
(153, '14.png', 14, 'VIDA NA ÁGUA', '14.6', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Gestão sustentável da pesca, aquicultura e turismo', 'uploads/14_6.png', 'ODS_14.6_A.png', 'ODS_14.6_V.png', 'ODS_14.6_R.png', 'ODS_14.6_S.png'),
(155, '14.png', 14, 'VIDA NA ÁGUA', '14.8', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', ' Pescadores artesanais', 'uploads/14_8.png', 'ODS_14.8_A.png', 'ODS_14.8_V.png', 'ODS_14.8_R.png', 'ODS_14.8_S.png'),
(157, '15.png', 15, 'VIDA TERRESTRE', '15.1', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Gestão sustentável do meio ambiente e ecossistemas terrestres e de água doce', 'uploads/15_1.png', 'ODS_15.1_A.png', 'ODS_15.1_V.png', 'ODS_15.1_R.png', 'ODS_15.1_S.png'),
(158, '15.png', 15, 'VIDA TERRESTRE', '15.2', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Promoção da Gestão sustentável do meio ambiente e ecossistemas', 'uploads/15_2.png', 'ODS_15.2_A.png', 'ODS_15.2_V.png', 'ODS_15.2_R.png', 'ODS_15.2_S.png'),
(159, '15.png', 15, 'VIDA TERRESTRE', '15.3', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Desmatamento', 'uploads/15_3.png', 'ODS_15.3_A.png', 'ODS_15.3_V.png', 'ODS_15.3_R.png', 'ODS_15.3_S.png'),
(162, '15.png', 15, 'VIDA TERRESTRE', '15.6', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Gestão sustentável do meio ambiente e ecossistemas - especies ameaçadas', 'uploads/15_6.png', 'ODS_15.6_A.png', 'ODS_15.6_V.png', 'ODS_15.6_R.png', 'ODS_15.6_S.png'),
(164, '15.png', 15, 'VIDA TERRESTRE', '15.8', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Conhecimentos e práticas tradicionais de conservação e uso sustentável', 'uploads/15_8.png', 'ODS_15.8_A.png', 'ODS_15.8_V.png', 'ODS_15.8_R.png', 'ODS_15.8_S.png'),
(166, '15.png', 15, 'VIDA TERRESTRE', '15.10', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Tráfico de espécies da flora e fauna', 'uploads/15_10.png', 'ODS_15.10_A.png', 'ODS_15.10_V.png', 'ODS_15.10_R.png', 'ODS_15.10_S.png'),
(167, '15.png', 15, 'VIDA TERRESTRE', '15.11', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Espécies exóticas invasoras ', 'uploads/15_11.png', 'ODS_15.11_A.png', 'ODS_15.11_V.png', 'ODS_15.11_R.png', 'ODS_15.11_S.png'),
(168, '15.png', 15, 'VIDA TERRESTRE', '15.12', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Gestão sustentável da biodiversidade para o desenvolvimento e redução da pobreza', 'uploads/15_12.png', 'ODS_15.12_A.png', 'ODS_15.12_V.png', 'ODS_15.12_R.png', 'ODS_15.12_S.png'),
(169, '15.png', 15, 'VIDA TERRESTRE', '15.13', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Recursos financeiros para gestão, conservação sustentável da biodiversidade', 'uploads/15_13.png', 'ODS_15.13_A.png', 'ODS_15.13_V.png', 'ODS_15.13_R.png', 'ODS_15.13_S.png'),
(175, '16.png', 16, 'PAZ, JUSTIÇA E INSTITUIÇÕES EFICAZES', '16.5', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Fluxos financeiros e de armas ilegais', 'uploads/16_5.png', 'ODS_16.5_A.png', 'ODS_16.5_V.png', 'ODS_16.5_R.png', 'ODS_16.5_S.png'),
(176, '16.png', 16, 'PAZ, JUSTIÇA E INSTITUIÇÕES EFICAZES', '16.6', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Corrupção e o suborno', 'uploads/16_6.png', 'ODS_16.6_A.png', 'ODS_16.6_V.png', 'ODS_16.6_R.png', 'ODS_16.6_S.png'),
(177, '16.png', 16, 'PAZ, JUSTIÇA E INSTITUIÇÕES EFICAZES', '16.7', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Instituições públicas e privadas em todos os níveis', 'uploads/16_7.png', 'ODS_16.7_A.png', 'ODS_16.7_V.png', 'ODS_16.7_R.png', 'ODS_16.7_S.png'),
(178, '16.png', 16, 'PAZ, JUSTIÇA E INSTITUIÇÕES EFICAZES', '16.8', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Tomada de decisão responsiva, inclusiva e participativa', 'uploads/16_8.png', 'ODS_16.8_A.png', 'ODS_16.8_V.png', 'ODS_16.8_R.png', 'ODS_16.8_S.png'),
(179, '16.png', 16, 'PAZ, JUSTIÇA E INSTITUIÇÕES EFICAZES', '16.10', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Direitos fundamentais - Registro de Nascimento e Registro geral/RG', 'uploads/16_10.png', 'ODS_16.10_A.png', 'ODS_16.10_V.png', 'ODS_16.10_R.png', 'ODS_16.10_S.png'),
(187, '17.png', 17, 'PARCERIA E MEIOS DE IMPLEMENTAÇÃO', '17.3', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Tecnologias ambientalmente corretas', 'uploads/17_3.png', 'ODS_17.3_A.png', 'ODS_17.3_V.png', 'ODS_17.3_R.png', 'ODS_17.3_S.png'),
(189, '17.png', 17, 'PARCERIA E MEIOS DE IMPLEMENTAÇÃO', '17.5', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Ação do Estado na coordenação e coerência de políticas', 'uploads/17_5.png', 'ODS_17.5_A.png', 'ODS_17.5_V.png', 'ODS_17.5_R.png', 'ODS_17.5_S.png'),
(190, '17.png', 17, 'PARCERIA E MEIOS DE IMPLEMENTAÇÃO', '17.6', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Parcerias multissetoriais', 'uploads/17_6.png', 'ODS_17.6_A.png', 'ODS_17.6_V.png', 'ODS_17.6_R.png', 'ODS_17.6_S.png'),
(191, '17.png', 17, 'PARCERIA E MEIOS DE IMPLEMENTAÇÃO', '17.7', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Apoio a Instituições públicas, privadas e com a sociedade civil', 'uploads/17_7.png', 'ODS_17.7_A.png', 'ODS_17.7_V.png', 'ODS_17.7_R.png', 'ODS_17.7_S.png'),
(193, '17.png', 17, 'PARCERIA E MEIOS DE IMPLEMENTAÇÃO', '17.9', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Experiências das estratégias de mobilização', 'uploads/17_9.png', 'ODS_17.9_A.png', 'ODS_17.9_V.png', 'ODS_17.9_R.png', 'ODS_17.9_S.png'),
(194, '18.png', 18, 'IGUALDADE ÉTNICO-RACIAL', '18.1', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Discriminação racial - todas as formas', 'uploads/18_1.png', 'ODS_18.1_A.png', 'ODS_18.1_V.png', 'ODS_18.1_R.png', 'ODS_18.1_S.png'),
(196, '18.png', 18, 'IGUALDADE ÉTNICO-RACIAL', '18.3', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Direitos fundamentais  pessoas em situação de vulnerabilidade social', 'uploads/18_3.png', 'ODS_18.3_A.png', 'ODS_18.3_V.png', 'ODS_18.3_R.png', 'ODS_18.3_S.png'),
(198, '18.png', 18, 'IGUALDADE ÉTNICO-RACIAL', '18.5', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Serviços públicos e políticas de proteção social  para pessoas em situação de vulnerabilidade social', 'uploads/18_5.png', 'ODS_18.5_A.png', 'ODS_18.5_V.png', 'ODS_18.5_R.png', 'ODS_18.5_S.png'),
(200, '18.png', 18, 'IGUALDADE ÉTNICO-RACIAL', '18.7', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', ' Igualdade racial', 'uploads/18_7.png', 'ODS_18.7_A.png', 'ODS_18.7_V.png', 'ODS_18.7_R.png', 'ODS_18.7_S.png'),
(204, '18.png', 18, 'IGUALDADE ÉTNICO-RACIAL', '18.11', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Igualdade de direitos à propriedade e controle da terra.', 'uploads/18_11.png', 'ODS_18.11_A.png', 'ODS_18.11_V.png', 'ODS_18.11_R.png', 'ODS_18.11_S.png'),
(206, '1.png', 1, 'ERRADICAÇÃO DA POBREZA', '1.1', 'Até 2030, o objetivo é reduzir pela metade a proporção de pessoas, independentemente da idade ou gênero, que vivem na pobreza em todas as suas dimensões, conforme as definições nacionais', 'Pobreza', 'uploads/1.1.png', 'ODS_1.1_A.png', 'ODS_1.1_V.png', 'ODS_1.1_R.png', 'ODS_1.1_S.png');

-- --------------------------------------------------------

--
-- Estrutura para tabela `projetos`
--

CREATE TABLE `projetos` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `nome_projeto` varchar(255) NOT NULL,
  `descricao` text,
  `criado_em` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `projetos`
--

INSERT INTO `projetos` (`id`, `id_usuario`, `nome_projeto`, `descricao`, `criado_em`) VALUES
(1, 1, 'Teste', 'Teste', '2025-04-22 11:07:37'),
(2, 1, 'Ilha do Cumbú', 'Projeto realizado na ilha do cumbú em 2025', '2025-05-05 18:41:00'),
(3, 4, 'Curso Seminário - Novos icones', 'Território Saudável e Sustentável no Brasil', '2025-05-20 17:02:13'),
(9, 4, 'TSSS BAHIA', 'Projeto Quintais Produtivos e Desenvolvimento Territorial Saudável, Sustentável e Solidário no Território Baiano.', '2025-08-05 10:03:18'),
(11, 11, 'teste_fabricio', 'esse é um projeto de teste', '2025-09-08 15:53:25'),
(12, 12, 'Colômbia - Santa Marta 2025 - Taller', 'Colômbia - Santa Marta 2025 - Taller', '2025-09-09 11:47:09'),
(13, 4, 'Curso Seminário - Novos icones para oficina', 'Escolha dos icones', '2025-09-11 16:04:12');

-- --------------------------------------------------------

--
-- Estrutura para tabela `projetos_ods`
--

CREATE TABLE `projetos_ods` (
  `id` int(11) NOT NULL,
  `id_projeto` int(11) NOT NULL,
  `id_ods` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `projetos_ods`
--

INSERT INTO `projetos_ods` (`id`, `id_projeto`, `id_ods`) VALUES
(64, 1, 7),
(65, 1, 2),
(70, 1, 15),
(74, 2, 103),
(75, 2, 206),
(76, 2, 2),
(77, 2, 7),
(78, 2, 8),
(85, 9, 206),
(86, 9, 2),
(87, 9, 7),
(88, 9, 8),
(89, 9, 9),
(90, 9, 12),
(91, 9, 13),
(92, 9, 14),
(93, 9, 15),
(94, 9, 18),
(95, 9, 19),
(96, 9, 20),
(97, 9, 21),
(98, 9, 22),
(99, 9, 23),
(100, 9, 24),
(101, 9, 25),
(102, 9, 26),
(103, 9, 27),
(104, 9, 28),
(105, 9, 29),
(106, 9, 31),
(107, 9, 34),
(108, 9, 35),
(109, 9, 36),
(110, 9, 38),
(111, 9, 40),
(112, 9, 41),
(113, 9, 43),
(114, 9, 45),
(115, 9, 46),
(116, 9, 48),
(117, 9, 49),
(118, 9, 50),
(119, 9, 54),
(120, 9, 55),
(121, 9, 56),
(122, 9, 58),
(123, 9, 60),
(124, 9, 61),
(125, 9, 62),
(126, 9, 63),
(127, 9, 64),
(128, 9, 65),
(129, 9, 66),
(130, 9, 68),
(131, 9, 70),
(132, 9, 71),
(133, 9, 72),
(134, 9, 73),
(135, 9, 74),
(136, 9, 77),
(137, 9, 78),
(138, 9, 79),
(139, 9, 80),
(140, 9, 81),
(141, 9, 82),
(142, 9, 83),
(143, 9, 84),
(144, 9, 85),
(145, 9, 87),
(146, 9, 89),
(147, 9, 92),
(148, 9, 93),
(149, 9, 94),
(150, 9, 95),
(151, 9, 96),
(152, 9, 97),
(153, 9, 103),
(154, 9, 105),
(155, 9, 108),
(156, 9, 111),
(157, 9, 112),
(158, 9, 113),
(159, 9, 114),
(160, 9, 115),
(161, 9, 117),
(162, 9, 120),
(163, 9, 121),
(164, 9, 122),
(165, 9, 123),
(166, 9, 124),
(167, 9, 125),
(168, 9, 126),
(169, 9, 127),
(170, 9, 129),
(171, 9, 134),
(172, 9, 136),
(173, 9, 138),
(174, 9, 139),
(175, 9, 141),
(176, 9, 144),
(177, 9, 146),
(178, 9, 147),
(179, 9, 175),
(180, 9, 176),
(181, 9, 177),
(182, 9, 178),
(183, 9, 179),
(184, 9, 187),
(185, 9, 189),
(186, 9, 190),
(187, 9, 191),
(188, 9, 193),
(189, 9, 194),
(190, 9, 196),
(191, 9, 198),
(192, 9, 200),
(193, 9, 204),
(194, 11, 61),
(195, 11, 66),
(196, 11, 68),
(197, 11, 70),
(198, 11, 71),
(199, 11, 72),
(200, 11, 73),
(201, 11, 74),
(202, 11, 77),
(203, 11, 78),
(204, 11, 79),
(205, 11, 80),
(206, 11, 84),
(207, 11, 85),
(212, 3, 9),
(213, 3, 12),
(227, 3, 28),
(229, 3, 31),
(283, 3, 114),
(299, 3, 144),
(323, 3, 190),
(329, 3, 200),
(331, 13, 9),
(332, 13, 12),
(333, 13, 28),
(334, 13, 31),
(335, 13, 114),
(337, 13, 144),
(338, 13, 190),
(339, 13, 200),
(340, 9, 157),
(341, 9, 158),
(342, 9, 159),
(343, 9, 162),
(344, 9, 164),
(345, 9, 166),
(346, 9, 168);

-- --------------------------------------------------------

--
-- Estrutura para tabela `recuperacao_senhas`
--

CREATE TABLE `recuperacao_senhas` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `token` varchar(100) NOT NULL,
  `validade` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `recuperacao_senhas`
--

INSERT INTO `recuperacao_senhas` (`id`, `id_usuario`, `token`, `validade`) VALUES
(1, 1, 'c1e23b13a5932a7000f7ad567acb00cb', '2025-05-06 00:47:21'),
(2, 1, 'b0275e6923414e44fe418b98d4060304', '2025-05-06 00:52:42'),
(3, 8, 'a410093c98e5dabb0f5b7aede02128fa', '2025-08-18 15:50:30'),
(4, 8, '9c274cb6036fe3c1a8b410103eb4f64c', '2025-08-18 15:50:31'),
(5, 4, '1b433d1504cf9651a31b1c6cfd416a43', '2025-09-08 10:57:36');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `perfil` enum('admin','usuario') NOT NULL,
  `criado_em` datetime DEFAULT CURRENT_TIMESTAMP,
  `ativo` tinyint(4) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `perfil`, `criado_em`, `ativo`) VALUES
(1, 'Teste gleidson', 'bob_glei@hotmail.com', '$2y$10$oAqcTfpD1n3NbtyXUB0ZhuLKpdPLYkExFhBV98zc9A/9B5Xicsdky', 'admin', '2025-04-21 23:09:18', 1),
(2, 'Administrador', 'admin@sistema.com', '$2y$10$UazOugXfMKx2J.fZg.qHReS9Qa0ss1z5BMJzUoAPOcm5PPqQrffKO', 'admin', '2025-04-22 10:38:36', 1),
(3, 'Usuário Teste', 'usuario@sistema.com', '$2y$10$UazOugXfMKx2J.fZg.qHReS9Qa0ss1z5BMJzUoAPOcm5PPqQrffKO', 'usuario', '2025-04-22 10:38:36', 1),
(4, 'Alba Mendes', 'alba.mendes@fiocruz.br', '$2y$10$DyNzGAGbFyIUSWtswkfDru0wr38iXS/duYsqorDa3pG.oVc1Fw4wq', 'admin', '2025-05-20 16:36:25', 1),
(5, 'Wagner Martins', 'wagner.martins@fiocruz.br', '$2y$10$p9EFaUSrQph7nkkkYwzWp.uCvnm9b.vXVnNH1QOS8RsXt.0xEFyXO', 'usuario', '2025-05-23 12:08:31', 1),
(6, 'Picaps', 'picaps@fiocruz.br', '$2y$10$VD2msXcikHMNrwqkHu811O2ot7HtevEEyDq81pT547oepEeXS8RWe', 'usuario', '2025-05-26 18:32:37', 1),
(7, 'Jeferson', 'jeferson.castro@fiocruz.br', '$2y$10$q.Wp2PILBF5uQ7rW2DDQ9ekGE1AERAW9cVpjO.XUGKxIS0KwiM7eK', 'usuario', '2025-05-26 18:33:14', 1),
(8, 'Thiago Frinhani', 'frinhani.frinhani@gmail.com', '$2y$10$d.uP60y3kPxDMCH8vO1YCOCg/w0jIKMTaywJkbCkqncLxoDlLkTT6', 'admin', '2025-08-18 14:50:05', 1),
(9, 'Jaqueline Rico', 'jaqueline.rico@gmail.com', '$2y$10$oAqcTfpD1n3NbtyXUB0ZhuLKpdPLYkExFhBV98zc9A/9B5Xicsdky', 'admin', '2025-08-18 16:13:23', 1),
(10, 'teste', 'teste@teste', '$2y$10$jHcbSW.wnxudNkVJjnLhSOn38iPtlPp57yGz84MWOBb/K2gbZdLTi', 'admin', '2025-08-18 16:16:51', 1),
(11, 'Fabricio', 'fabricio.pereira@fiocruz.br', '$2y$10$yjukOFvZC2/h5vcYbmseM.f1tWG3IoLcFUFrPv7.zDVAiKcjML17G', 'usuario', '2025-09-08 15:52:52', 1),
(12, 'Edward', 'edward.maia@fiocruz.br', '$2y$10$Y/kFOmtCGcyyf3JtuZ/73Oao0Vw.XD1O8VnT2EuL7rdrI/LMlr.ji', 'usuario', '2025-09-09 11:45:16', 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `logs_auditoria`
--
ALTER TABLE `logs_auditoria`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `ods`
--
ALTER TABLE `ods`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `projetos`
--
ALTER TABLE `projetos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Índices de tabela `projetos_ods`
--
ALTER TABLE `projetos_ods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_projeto` (`id_projeto`),
  ADD KEY `id_ods` (`id_ods`);

--
-- Índices de tabela `recuperacao_senhas`
--
ALTER TABLE `recuperacao_senhas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `logs_auditoria`
--
ALTER TABLE `logs_auditoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=423;

--
-- AUTO_INCREMENT de tabela `ods`
--
ALTER TABLE `ods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

--
-- AUTO_INCREMENT de tabela `projetos`
--
ALTER TABLE `projetos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `projetos_ods`
--
ALTER TABLE `projetos_ods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=347;

--
-- AUTO_INCREMENT de tabela `recuperacao_senhas`
--
ALTER TABLE `recuperacao_senhas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `projetos`
--
ALTER TABLE `projetos`
  ADD CONSTRAINT `projetos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `projetos_ods`
--
ALTER TABLE `projetos_ods`
  ADD CONSTRAINT `projetos_ods_ibfk_1` FOREIGN KEY (`id_projeto`) REFERENCES `projetos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `projetos_ods_ibfk_2` FOREIGN KEY (`id_ods`) REFERENCES `ods` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `recuperacao_senhas`
--
ALTER TABLE `recuperacao_senhas`
  ADD CONSTRAINT `recuperacao_senhas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
