-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 06/05/2025 às 00:25
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

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
  `detalhes` text DEFAULT NULL,
  `data_hora` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `logs_auditoria`
--

INSERT INTO `logs_auditoria` (`id`, `id_usuario`, `acao`, `tabela_afetada`, `id_registro`, `detalhes`, `data_hora`) VALUES
(1, 1, 'INSERT', 'projetos_ods', 1, 'Associou ODS ID 15', '2025-05-05 20:23:11'),
(2, 1, 'INSERT', 'projetos_ods', 1, 'Associou ODS ID 16', '2025-05-05 20:23:11'),
(3, 1, 'INSERT', 'projetos_ods', 1, 'Associou ODS ID 17', '2025-05-05 20:23:11'),
(4, 1, 'INSERT', 'projetos', 2, 'Projeto criado: Ilha do Cumbú', '2025-05-05 21:41:00'),
(5, 1, 'INSERT', 'projetos_ods', 2, 'Associou ODS ID 102', '2025-05-05 21:56:42'),
(6, 1, 'INSERT', 'projetos_ods', 2, 'Associou ODS ID 103', '2025-05-05 21:56:42');

-- --------------------------------------------------------

--
-- Estrutura para tabela `ods`
--

CREATE TABLE `ods` (
  `id` int(11) NOT NULL,
  `imagem` varchar(255) NOT NULL,
  `numero_ods` int(11) DEFAULT NULL,
  `nome_ods` varchar(255) DEFAULT NULL,
  `numero_item` varchar(10) NOT NULL,
  `metas_ipea` text NOT NULL,
  `fatores` text NOT NULL,
  `icone_fator` varchar(255) NOT NULL,
  `imagem_ameaca` varchar(255) DEFAULT NULL COMMENT 'Caminho da imagem de Ameaça (A)',
  `imagem_vulnerabilidade` varchar(255) DEFAULT NULL COMMENT 'Caminho da imagem de Vulnerabilidade (V)',
  `imagem_resiliencia` varchar(255) DEFAULT NULL COMMENT 'Caminho da imagem de Resiliência (R)',
  `imagem_sagrado` varchar(255) DEFAULT NULL COMMENT 'Caminho da imagem de Sagrado (S)'
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
  `descricao` text DEFAULT NULL,
  `criado_em` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `projetos`
--

INSERT INTO `projetos` (`id`, `id_usuario`, `nome_projeto`, `descricao`, `criado_em`) VALUES
(1, 1, 'Teste', 'Teste', '2025-04-22 11:07:37'),
(2, 1, 'Ilha do Cumbú', 'Projeto realizado na ilha do cumbú em 2025', '2025-05-05 18:41:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `projetos_ods`
--

CREATE TABLE `projetos_ods` (
  `id` int(11) NOT NULL,
  `id_projeto` int(11) NOT NULL,
  `id_ods` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `projetos_ods`
--

INSERT INTO `projetos_ods` (`id`, `id_projeto`, `id_ods`) VALUES
(64, 1, 7),
(65, 1, 2),
(70, 1, 15),
(74, 2, 103);

-- --------------------------------------------------------

--
-- Estrutura para tabela `recuperacao_senhas`
--

CREATE TABLE `recuperacao_senhas` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `token` varchar(100) NOT NULL,
  `validade` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `recuperacao_senhas`
--

INSERT INTO `recuperacao_senhas` (`id`, `id_usuario`, `token`, `validade`) VALUES
(1, 1, 'c1e23b13a5932a7000f7ad567acb00cb', '2025-05-06 00:47:21'),
(2, 1, 'b0275e6923414e44fe418b98d4060304', '2025-05-06 00:52:42');

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
  `criado_em` datetime DEFAULT current_timestamp(),
  `ativo` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `perfil`, `criado_em`, `ativo`) VALUES
(1, 'Teste gleidson', 'bob_glei@hotmail.com', '$2y$10$oAqcTfpD1n3NbtyXUB0ZhuLKpdPLYkExFhBV98zc9A/9B5Xicsdky', 'admin', '2025-04-21 23:09:18', 1),
(2, 'Administrador', 'admin@sistema.com', '$2y$10$UazOugXfMKx2J.fZg.qHReS9Qa0ss1z5BMJzUoAPOcm5PPqQrffKO', 'admin', '2025-04-22 10:38:36', 1),
(3, 'Usuário Teste', 'usuario@sistema.com', '$2y$10$UazOugXfMKx2J.fZg.qHReS9Qa0ss1z5BMJzUoAPOcm5PPqQrffKO', 'usuario', '2025-04-22 10:38:36', 1);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `ods`
--
ALTER TABLE `ods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

--
-- AUTO_INCREMENT de tabela `projetos`
--
ALTER TABLE `projetos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `projetos_ods`
--
ALTER TABLE `projetos_ods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT de tabela `recuperacao_senhas`
--
ALTER TABLE `recuperacao_senhas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
