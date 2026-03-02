-- phpMyAdmin SQL Dump
-- version 6.0.0-dev+20260214.bce032023e
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 02, 2026 at 05:03 AM
-- Server version: 8.4.3
-- PHP Version: 8.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tech4198_sistema_ods`
--

-- --------------------------------------------------------

--
-- Table structure for table `projetos`
--

CREATE TABLE `projetos` (
  `id` int NOT NULL,
  `id_usuario` int NOT NULL,
  `nome_projeto` varchar(255) NOT NULL,
  `pais` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `local` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `localizacao` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `painel_pbi` varchar(255) NOT NULL,
  `descricao` text,
  `criado_em` datetime DEFAULT CURRENT_TIMESTAMP,
  `caminho_excel` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `projetos`
--

INSERT INTO `projetos` (`id`, `id_usuario`, `nome_projeto`, `pais`, `local`, `localizacao`, `painel_pbi`, `descricao`, `criado_em`, `caminho_excel`) VALUES
(3, 4, 'Curso Seminário - Novos icones', '', '', '', '', 'Território Saudável e Sustentável no Brasil', '2025-05-20 17:02:13', ''),
(9, 4, 'TSSS BAHIA', '', '', '', '', 'Projeto Quintais Produtivos e Desenvolvimento Territorial Saudável, Sustentável e Solidário no Território Baiano.', '2025-08-05 10:03:18', ''),
(13, 4, 'Curso Seminário - Novos icones para oficina', '', '', '', '', 'Escolha dos icones', '2025-09-11 16:04:12', ''),
(18, 4, 'Diálogos Prospectivos Territorial', 'Brasil', 'Pinhão - PR', 'https://www.google.com/maps/d/embed?mid=1XRBGpKujQRPlFLkK5Whgtx2vCELs-T0&ehbc=2E312F&noprof=1', '', 'Oficina de prospectiva territorial com cooperativas, associações, universidade e governo de Pinhão no Paraná.', '2025-11-03 10:20:50', ''),
(19, 18, 'Rascunho - exportar ícones', '', '', '', '', '', '2025-11-17 10:55:45', ''),
(21, 10, 'Oficina Teste', '', '', '', '', 'Teste', '2026-01-22 14:36:44', ''),
(22, 10, 'teste mosaico', '', '', '', 'https://app.powerbi.com/view?r=eyJrIjoiYTAxMDI3MjAtMGJjZi00MDY3LWJhNzItYzFlZTVmYzc5YTlhIiwidCI6ImJjMzcyMWE2LTgwNjEtNGUxOS1hM2I0LTMxZTIwOTNlMjA5YSJ9', '', '2026-01-28 09:10:51', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `projetos`
--
ALTER TABLE `projetos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `projetos`
--
ALTER TABLE `projetos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `projetos`
--
ALTER TABLE `projetos`
  ADD CONSTRAINT `projetos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
