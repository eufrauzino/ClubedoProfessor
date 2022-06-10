-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tempo de Geração: 
-- Versão do Servidor: 5.5.27
-- Versão do PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `clubesys`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `acao`
--

CREATE TABLE IF NOT EXISTS `acao` (
  `acao_id` int(11) NOT NULL,
  `acao_data` date DEFAULT NULL,
  `acao_socioant` varchar(45) DEFAULT NULL,
  `acao_obs` varchar(255) DEFAULT NULL,
  `acao_atualizacao` datetime DEFAULT NULL,
  `acao_cat_acao` int(11) DEFAULT NULL,
  `acao_tipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`acao_id`),
  KEY `fk_cat_acao_idx` (`acao_cat_acao`),
  KEY `fk_acao_tipo_idx` (`acao_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `acao`
--

INSERT INTO `acao` (`acao_id`, `acao_data`, `acao_socioant`, `acao_obs`, `acao_atualizacao`, `acao_cat_acao`, `acao_tipo`) VALUES
(12, '2013-08-06', 'rODRI', '', '0000-00-00 00:00:00', 2, 1),
(48, '2013-08-22', '', '', '2013-08-22 20:12:10', 1, 1),
(57, '2013-08-14', 'a', '', '2013-08-13 23:54:48', 1, 1),
(100, '2013-08-05', '', '', '0000-00-00 00:00:00', 2, 1),
(150, '0000-00-00', '', '', '2013-08-05 21:01:15', 1, 1),
(290, '2013-08-05', '', '', '2013-08-05 16:28:55', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargo`
--

CREATE TABLE IF NOT EXISTS `cargo` (
  `cargo_id` int(11) NOT NULL AUTO_INCREMENT,
  `cargo_descricao` varchar(45) DEFAULT NULL,
  `cargo_nivel` int(11) DEFAULT NULL,
  `cargo_tipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`cargo_id`),
  KEY `fk_cargo_tipo_idx` (`cargo_tipo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `cargo`
--

INSERT INTO `cargo` (`cargo_id`, `cargo_descricao`, `cargo_nivel`, `cargo_tipo`) VALUES
(1, 'ADMINISTRADOR', 3, 3),
(2, 'TESOUREIRO', 3, 1),
(3, 'DIRETOR ESPORTIVO', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `catacao`
--

CREATE TABLE IF NOT EXISTS `catacao` (
  `cat_acao_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_acao_valor` decimal(10,2) DEFAULT NULL,
  `cat_acao_descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cat_acao_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `catacao`
--

INSERT INTO `catacao` (`cat_acao_id`, `cat_acao_valor`, `cat_acao_descricao`) VALUES
(1, 340.23, 'SOCIO COMUM'),
(2, 0.00, 'NAO SOCIO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `catfluxocaixa`
--

CREATE TABLE IF NOT EXISTS `catfluxocaixa` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `catfreq`
--

CREATE TABLE IF NOT EXISTS `catfreq` (
  `catfreq_id` int(11) NOT NULL AUTO_INCREMENT,
  `mensalidade_valor` decimal(10,2) NOT NULL,
  `catfreq_descricao` varchar(45) DEFAULT NULL,
  `catfreq_atualizacao` datetime DEFAULT NULL,
  `catfreq_tipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`catfreq_id`),
  KEY `fk_cat_freqtipo_idx` (`catfreq_tipo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Extraindo dados da tabela `catfreq`
--

INSERT INTO `catfreq` (`catfreq_id`, `mensalidade_valor`, `catfreq_descricao`, `catfreq_atualizacao`, `catfreq_tipo`) VALUES
(1, 500.00, 'SOCIO EFETIVO', '2013-08-22 20:35:43', 1),
(2, 100.00, 'SOCIO COLABORADOR', '2013-08-06 17:02:15', 1),
(3, 0.00, 'ACADEMIA T/DIAS', '2013-08-23 20:38:55', 4),
(4, 0.00, 'NAO FREQUENTA ACADEMIA', '2013-08-05 16:30:10', 4),
(6, 15.50, 'SOCIO FUTEBOL', '2013-08-23 20:31:19', 2),
(7, 100.00, 'ACADEMIA', '2013-08-23 20:41:10', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `convite`
--

CREATE TABLE IF NOT EXISTS `convite` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_tipo` int(11) DEFAULT NULL,
  `c_socio` int(11) DEFAULT NULL,
  `c_pessoa` varchar(45) DEFAULT NULL,
  `c_vendedor` int(11) DEFAULT NULL,
  `c_validade` varchar(45) DEFAULT NULL,
  `c_status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`c_id`),
  KEY `tipo_idx` (`c_tipo`),
  KEY `venda_c_idx` (`c_vendedor`),
  KEY `convite_socio_idx` (`c_socio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `convite_tipo`
--

CREATE TABLE IF NOT EXISTS `convite_tipo` (
  `convite_id` int(11) NOT NULL AUTO_INCREMENT,
  `convite_descricao` varchar(45) DEFAULT NULL,
  `convite_valor` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`convite_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `dependencia`
--

CREATE TABLE IF NOT EXISTS `dependencia` (
  `objeto_id` int(11) NOT NULL AUTO_INCREMENT,
  `objeto_descricao` varchar(45) DEFAULT NULL,
  `obeto_disponivel` tinyint(1) DEFAULT NULL,
  `objeto_estoque` int(11) DEFAULT NULL,
  PRIMARY KEY (`objeto_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `dependencia`
--

INSERT INTO `dependencia` (`objeto_id`, `objeto_descricao`, `obeto_disponivel`, `objeto_estoque`) VALUES
(1, 'SALAO SOCIAL', 1, 1),
(2, 'CHURRASQUEIRA GRANDE', 1, 1),
(3, 'CHURRASQUEIRA PEQUENA', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `dependente`
--

CREATE TABLE IF NOT EXISTS `dependente` (
  `dependente_id` int(11) NOT NULL AUTO_INCREMENT,
  `dependente_nome` varchar(50) DEFAULT NULL,
  `dependente_nascimento` date DEFAULT NULL,
  `dependente_fone_res` varchar(12) DEFAULT NULL,
  `dependente_fone_cel` varchar(12) DEFAULT NULL,
  `dependente_parentesco` int(11) DEFAULT NULL,
  `dependente_socio` int(11) NOT NULL,
  PRIMARY KEY (`dependente_id`),
  KEY `fk_parente_idx` (`dependente_parentesco`),
  KEY `fk_dependesocio_idx` (`dependente_socio`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `dependente`
--

INSERT INTO `dependente` (`dependente_id`, `dependente_nome`, `dependente_nascimento`, `dependente_fone_res`, `dependente_fone_cel`, `dependente_parentesco`, `dependente_socio`) VALUES
(1, 'DOUGLAS', '2013-08-07', NULL, NULL, 2, 1),
(2, 'AWDAWD', '2013-08-07', 'AWDAWD', 'AWDAWD', 3, 1),
(3, 'AWDAWD', '2013-08-07', 'AWDAWD', 'AWDAWD', 6, 11);

-- --------------------------------------------------------

--
-- Estrutura da tabela `diretoria`
--

CREATE TABLE IF NOT EXISTS `diretoria` (
  `dir_id` int(11) NOT NULL AUTO_INCREMENT,
  `dir_socio` int(11) NOT NULL,
  `dir_login` varchar(45) DEFAULT NULL,
  `dir_senha` varchar(45) DEFAULT NULL,
  `dir_cargo` int(11) NOT NULL,
  PRIMARY KEY (`dir_id`),
  UNIQUE KEY `dir_cargo_UNIQUE` (`dir_cargo`),
  UNIQUE KEY `dir_socio_UNIQUE` (`dir_socio`),
  KEY `fk_socio_dir_idx` (`dir_socio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `divida`
--

CREATE TABLE IF NOT EXISTS `divida` (
  `divida_id` int(11) NOT NULL,
  `divida_descricao` varchar(100) DEFAULT NULL,
  `divida_valor` decimal(10,2) DEFAULT NULL,
  `divida_status` tinyint(1) DEFAULT NULL,
  `divida_socio` int(11) DEFAULT NULL,
  `dividacol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`divida_id`),
  KEY `fk_div_socio_idx` (`divida_socio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `evento`
--

CREATE TABLE IF NOT EXISTS `evento` (
  `evento_id` int(11) NOT NULL,
  `evento_descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`evento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `evento`
--

INSERT INTO `evento` (`evento_id`, `evento_descricao`) VALUES
(1, 'CASAMENTO'),
(2, 'ANIVERSARIO'),
(3, 'CONFRATERNIZACAO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `exame`
--

CREATE TABLE IF NOT EXISTS `exame` (
  `exame_id` int(11) NOT NULL AUTO_INCREMENT,
  `exame_validade` date DEFAULT NULL,
  `exame_medico` varchar(45) DEFAULT NULL,
  `exame_dono` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`exame_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fluxocaixa`
--

CREATE TABLE IF NOT EXISTS `fluxocaixa` (
  `fluxo_id` int(11) NOT NULL AUTO_INCREMENT,
  `fluxo_descricao` varchar(45) DEFAULT NULL,
  `fluxo_tipo` char(1) DEFAULT NULL,
  `fluxo_parcelas` int(11) DEFAULT NULL,
  `fluxo_valor` decimal(10,0) DEFAULT NULL,
  `fluxo_data` date DEFAULT NULL,
  `fluxo_categoria` int(11) DEFAULT NULL,
  PRIMARY KEY (`fluxo_id`),
  KEY `categoria_idx` (`fluxo_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE IF NOT EXISTS `funcionario` (
  `funcionario_id` int(11) NOT NULL AUTO_INCREMENT,
  `funcionario_nome` varchar(45) DEFAULT NULL,
  `funcionario_funcao` varchar(45) DEFAULT NULL,
  `funcionario_salario` decimal(10,2) DEFAULT NULL,
  `funcionario_login` varchar(20) DEFAULT NULL,
  `funcionario_senha` varchar(8) DEFAULT NULL,
  `funcionario_cargo` int(11) DEFAULT NULL,
  PRIMARY KEY (`funcionario_id`),
  KEY `fk_func_cargo_idx` (`funcionario_cargo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `grauloc`
--

CREATE TABLE IF NOT EXISTS `grauloc` (
  `grauloc_id` int(11) NOT NULL AUTO_INCREMENT,
  `grauloc_descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`grauloc_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `grauloc`
--

INSERT INTO `grauloc` (`grauloc_id`, `grauloc_descricao`) VALUES
(1, 'FAMILIARES'),
(2, 'PARENTES'),
(3, 'TERCEIROS');

-- --------------------------------------------------------

--
-- Estrutura da tabela `itemlocacao`
--

CREATE TABLE IF NOT EXISTS `itemlocacao` (
  `itemobj_id` int(11) NOT NULL AUTO_INCREMENT,
  `itemobj_tipoloc` int(11) DEFAULT NULL,
  `itemobj_locacao` int(11) DEFAULT NULL,
  `itemobj_parente` int(11) DEFAULT NULL,
  `itemobj_evento` int(11) DEFAULT NULL,
  `itemobj_responsavel` varchar(45) DEFAULT NULL,
  `itemobj_data` date DEFAULT NULL,
  PRIMARY KEY (`itemobj_id`),
  KEY `fkprodest_locacao_idx` (`itemobj_locacao`),
  KEY `fkobjeto_tipoloc_idx` (`itemobj_tipoloc`),
  KEY `fk_objeto_parente_idx` (`itemobj_parente`),
  KEY `fk_objeto_evento_idx` (`itemobj_evento`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=388 ;

--
-- Extraindo dados da tabela `itemlocacao`
--

INSERT INTO `itemlocacao` (`itemobj_id`, `itemobj_tipoloc`, `itemobj_locacao`, `itemobj_parente`, `itemobj_evento`, `itemobj_responsavel`, `itemobj_data`) VALUES
(267, 8, 33, 3, 3, '', '2013-08-29'),
(268, 8, 33, 3, 3, '', '2013-08-31'),
(270, 3, 33, 1, 1, '', '2013-08-07'),
(271, 3, 33, 11, 1, '', '2013-08-22'),
(279, 1, 34, 3, 1, '', '2013-08-01'),
(280, 5, 34, 1, 2, '', '2013-09-14'),
(281, 8, 34, 3, 3, '', '2013-08-02'),
(282, 8, 34, 3, 3, '', '2013-08-12'),
(284, 8, 34, 3, 3, '', '2013-08-01'),
(285, 2, 34, 3, 2, '', '2013-08-02'),
(290, 3, 36, 1, 1, '', '2013-08-18'),
(291, 8, 36, 3, 3, '', '2013-08-18'),
(292, 1, 37, 3, 1, '', '2013-08-23'),
(293, 8, 37, 3, 3, '', '2013-08-23'),
(294, 8, 38, 3, 3, '', '2013-08-17'),
(295, 3, 38, 1, 1, '', '2013-08-17'),
(296, 2, 38, 3, 2, '', '2013-08-16'),
(301, 5, 40, 1, 2, '', '2013-08-15'),
(302, 5, 41, 4, 2, '', '2013-08-16'),
(304, 3, 43, 9, 1, '', '2013-08-31'),
(306, 3, 43, 1, 1, '', '2013-08-24'),
(309, 8, 43, 3, 3, '', '2013-08-06'),
(320, 3, 47, 1, 1, '', '2013-08-04'),
(321, 3, 47, 1, 1, '', '2013-08-28'),
(326, 3, 47, 1, 1, '', '2013-09-12'),
(336, 3, 48, 1, 1, '', '2015-08-31'),
(337, 3, 51, 1, 1, '', '2013-10-19'),
(338, 3, 52, 1, 1, '', '2025-05-14'),
(339, 3, 53, 1, 1, '', '2013-12-20'),
(340, 6, 54, 6, 1, '', '2013-11-15'),
(341, 3, 54, 1, 1, '', '2013-08-26'),
(342, 3, 55, 1, 1, '', '2013-09-06'),
(343, 3, 56, 1, 1, '', '2013-11-07'),
(344, 3, 56, 1, 1, '', '2013-08-30'),
(345, 3, 56, 1, 1, '', '2013-08-09'),
(346, 6, 57, 2, 1, '', '2013-11-16'),
(347, 3, 57, 1, 1, '', '2013-12-15'),
(348, 3, 57, 1, 1, '', '2013-10-11'),
(349, 3, 57, 1, 1, '', '2013-11-08'),
(350, 3, 57, 1, 1, '', '2014-01-17'),
(352, 8, 57, 3, 3, '', '2013-08-16'),
(353, 9, 58, 3, 3, '', '2013-08-23'),
(354, 9, 58, 7, 3, '', '2015-08-01'),
(355, 10, 58, 10, 1, 'GABRIEL', '2013-08-09'),
(356, 10, 58, 2, 1, '', '2013-12-12'),
(358, 10, 57, 2, 1, 'NEIMAR', '2013-08-15'),
(359, 11, 57, 10, 2, 'RODRIGO', '2013-08-22'),
(360, 11, 58, 6, 2, '', '2013-08-07'),
(361, 11, 59, 2, 2, '', '2013-08-30'),
(362, 9, 58, 7, 3, '', '2013-08-01'),
(364, 9, 61, 3, 3, '', '2013-08-10'),
(365, 11, 63, 2, 2, '', '2013-11-15'),
(366, 1, 65, 5, 1, '', '2013-10-18'),
(367, 1, 68, 5, 1, 'DOUGLAS', '2013-09-13'),
(368, 8, 68, 5, 3, 'DOUGLAS', '2013-09-25'),
(369, 10, 67, 2, 1, '', '2013-09-13'),
(370, 6, 69, 2, 1, '', '2013-12-24'),
(371, 10, 70, 2, 1, '', '2013-12-24'),
(372, 5, 57, 4, 2, '', '2014-03-13'),
(373, 3, 57, 1, 1, '', '2014-02-15'),
(374, 3, 57, 1, 1, '', '2014-02-15'),
(375, 3, 57, 1, 1, '', '2014-04-26'),
(376, 5, 69, 9, 2, '', '2017-08-17'),
(381, 9, 73, 5, 3, '', '2013-08-30'),
(382, 11, 73, 2, 2, '', '2013-12-13'),
(383, 11, 74, 6, 2, 'JAQUELINE', '2013-09-01'),
(384, 5, 74, 1, 2, '', '2013-09-01'),
(385, 3, 75, 1, 1, '', '2013-08-08'),
(386, 10, 75, 2, 1, '', '2013-12-25'),
(387, 9, 75, 3, 3, '', '2013-12-25');

-- --------------------------------------------------------

--
-- Estrutura da tabela `itemproduto`
--

CREATE TABLE IF NOT EXISTS `itemproduto` (
  `objetoadd_id` int(11) NOT NULL AUTO_INCREMENT,
  `objetoadd_objetos` int(11) DEFAULT NULL,
  `objetoadd_qtd` int(11) DEFAULT NULL,
  `objetoadd_valor` decimal(10,2) DEFAULT NULL,
  `objetoadd_termo` tinyint(1) DEFAULT NULL,
  `produtoadd_locacao` int(11) DEFAULT NULL,
  PRIMARY KEY (`objetoadd_id`),
  KEY `fklocacao_idx` (`produtoadd_locacao`),
  KEY `fkobjeto_idx` (`objetoadd_objetos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `locacao`
--

CREATE TABLE IF NOT EXISTS `locacao` (
  `locacao_id` int(11) NOT NULL AUTO_INCREMENT,
  `locacao_data` datetime DEFAULT NULL,
  `locacao_pago` tinyint(1) DEFAULT NULL,
  `locacao_total` decimal(10,2) DEFAULT NULL,
  `locacao_socio` int(11) DEFAULT NULL,
  `locacao_socionome` varchar(100) NOT NULL,
  PRIMARY KEY (`locacao_id`),
  KEY `fklocacao_socio_idx` (`locacao_socio`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=76 ;

--
-- Extraindo dados da tabela `locacao`
--

INSERT INTO `locacao` (`locacao_id`, `locacao_data`, `locacao_pago`, `locacao_total`, `locacao_socio`, `locacao_socionome`) VALUES
(33, '2013-08-20 21:47:22', 1, 1520.00, 13, 'RODOLFO'),
(34, '2013-08-20 22:30:00', 1, 630.00, 11, 'ADW'),
(36, '2013-08-21 00:13:53', 1, 760.00, 13, 'RODOLFO'),
(37, '2013-08-21 10:28:09', 1, 210.00, 13, 'RODOLFO'),
(38, '2013-08-21 10:54:03', 1, 910.00, 13, 'RODOLFO'),
(40, '2013-08-21 11:14:00', 1, 150.00, 6, 'ddddd'),
(41, '2013-08-21 11:27:27', 1, 150.00, 13, 'RODOLFO'),
(43, '2013-08-21 11:30:26', 1, 1460.00, 6, 'ddddd'),
(47, '2013-08-21 14:22:49', 1, 2100.00, 11, 'ADW'),
(48, '2013-08-21 14:30:00', 1, 700.00, 14, 'Joao da Silva'),
(51, '2013-08-21 15:56:10', 1, 700.00, 6, 'ddddd'),
(52, '2013-08-21 15:58:24', 1, 700.00, 11, 'ADW'),
(53, '2013-08-21 16:00:51', 1, 700.00, 11, 'ADW'),
(54, '2013-08-21 16:06:48', 1, 1400.00, 11, 'ADW'),
(55, '2013-08-21 16:21:06', 1, 700.00, 14, 'Joao da Silva'),
(56, '2013-08-21 16:24:31', 1, 2100.00, 13, 'RODOLFO'),
(57, '2013-08-21 16:40:14', 0, 6510.00, 14, 'Joao da Silva'),
(58, '2013-08-21 18:13:52', 0, 1140.00, 11, 'ADW'),
(59, '2013-08-21 23:46:34', 0, 350.00, 6, 'ddddd'),
(61, '2013-08-22 18:16:08', 1, 30.00, 15, 'DOUGLAS EUFRAUZINO SOUZA'),
(62, '2013-08-22 18:25:05', 0, NULL, 15, 'DOUGLAS EUFRAUZINO SOUZA'),
(63, '2013-08-22 18:35:31', 0, 350.00, 6, 'ddddd'),
(64, '2013-08-22 18:40:44', 0, NULL, 11, 'ADW'),
(65, '2013-08-22 19:20:05', 0, 150.00, 14, 'Joao da Silva'),
(66, '2013-08-22 20:07:41', 0, NULL, 14, 'Joao da Silva'),
(67, '2013-08-22 20:11:31', 1, 350.00, 15, 'DOUGLAS EUFRAUZINO SOUZA'),
(68, '2013-08-22 20:16:51', 1, 210.00, 16, 'TEREZA EUFRAUZINO MELLO'),
(69, '2013-08-22 20:26:47', 1, 850.00, 16, 'TEREZA EUFRAUZINO MELLO'),
(70, '2013-08-22 20:27:41', 0, 350.00, 11, 'ADW'),
(71, '2013-08-22 20:41:10', 0, NULL, 14, 'Joao da Silva'),
(73, '2013-08-24 03:24:23', 0, 380.00, 16, 'TEREZA EUFRAUZINO MELLO'),
(74, '2013-08-24 20:49:58', 1, 500.00, 15, 'DOUGLAS EUFRAUZINO SOUZA'),
(75, '2013-08-26 11:27:50', 0, 1080.00, 16, 'TEREZA EUFRAUZINO MELLO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `mespagamento`
--

CREATE TABLE IF NOT EXISTS `mespagamento` (
  `mespag_id` int(11) NOT NULL AUTO_INCREMENT,
  `mespag_ano` year(4) DEFAULT NULL,
  `mespag_mes` int(11) DEFAULT NULL,
  PRIMARY KEY (`mespag_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Extraindo dados da tabela `mespagamento`
--

INSERT INTO `mespagamento` (`mespag_id`, `mespag_ano`, `mespag_mes`) VALUES
(1, 2013, 8),
(5, 2013, 9),
(6, 2013, 10),
(9, 2013, 6),
(10, 2013, 11),
(11, 2013, 9),
(12, 2013, 12);

-- --------------------------------------------------------

--
-- Estrutura da tabela `n_socio`
--

CREATE TABLE IF NOT EXISTS `n_socio` (
  `nsocio_id` int(11) NOT NULL AUTO_INCREMENT,
  `nsocio_acao` int(11) NOT NULL,
  `nsocio_nome` varchar(255) NOT NULL,
  `nsocio_cep` varchar(10) NOT NULL,
  `nsocio_endereco` varchar(255) NOT NULL,
  `nsocio_num_res` varchar(10) NOT NULL,
  `nsocio_bairro` varchar(45) NOT NULL,
  `nsocio_fone_res` varchar(11) DEFAULT NULL,
  `nsocio_fone_cel` varchar(11) DEFAULT NULL,
  `nsocio_email` varchar(45) DEFAULT NULL,
  `nsocio_catfreq` int(11) DEFAULT NULL,
  `nsocio_cidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`nsocio_id`),
  KEY `convidado_mensalidade_idx` (`nsocio_catfreq`),
  KEY `convidadobolacidade_idx` (`nsocio_cidade`),
  KEY `fk_ConvidadoBola_Acao1_idx` (`nsocio_acao`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagmensalidade`
--

CREATE TABLE IF NOT EXISTS `pagmensalidade` (
  `pag_mens_id` int(11) NOT NULL AUTO_INCREMENT,
  `pag_mens_data` datetime DEFAULT NULL,
  `pag_mens_status` tinyint(1) DEFAULT NULL,
  `pag_mens_valor` decimal(10,2) DEFAULT NULL,
  `pag_mens_socio` int(11) DEFAULT NULL,
  `pag_mens_mes` int(11) DEFAULT NULL,
  PRIMARY KEY (`pag_mens_id`),
  KEY `pag_mens_socio_idx` (`pag_mens_socio`),
  KEY `pag_mens_mes_idx` (`pag_mens_mes`),
  KEY `pag_mens_mes` (`pag_mens_mes`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=94 ;

--
-- Extraindo dados da tabela `pagmensalidade`
--

INSERT INTO `pagmensalidade` (`pag_mens_id`, `pag_mens_data`, `pag_mens_status`, `pag_mens_valor`, `pag_mens_socio`, `pag_mens_mes`) VALUES
(1, '2013-08-06 16:34:04', 0, 84.00, 1, 1),
(2, '2013-08-06 16:34:05', 0, 84.00, 11, 1),
(3, '2013-08-06 16:34:05', 0, 100.00, 2, 1),
(4, '2013-08-06 16:34:05', 0, 100.00, 6, 1),
(5, '2013-08-06 16:58:48', 0, 84.00, 1, 5),
(6, '2013-08-06 16:58:48', 0, 84.00, 11, 5),
(7, '2013-08-06 16:58:48', 0, 100.00, 2, 5),
(8, '2013-08-06 16:58:48', 0, 100.00, 6, 5),
(9, '2013-08-06 18:39:32', 0, 84.00, 1, 1),
(10, '2013-08-06 18:39:32', 0, 84.00, 11, 1),
(11, '2013-08-06 18:39:32', 0, 100.00, 2, 1),
(12, '2013-08-06 18:39:32', 0, 100.00, 6, 1),
(13, '2013-08-11 15:34:35', 0, 84.00, 1, 6),
(14, '2013-08-11 15:34:35', 0, 84.00, 11, 6),
(15, '2013-08-11 15:34:35', 0, 100.00, 2, 6),
(16, '2013-08-11 15:34:35', 0, 100.00, 6, 6),
(17, '2013-08-11 17:56:47', 0, 84.00, 1, 5),
(18, '2013-08-11 17:56:47', 0, 84.00, 11, 5),
(19, '2013-08-11 17:56:47', 0, 100.00, 2, 5),
(20, '2013-08-11 17:56:47', 0, 100.00, 6, 5),
(21, '2013-08-11 18:03:40', 0, 84.00, 1, 5),
(22, '2013-08-11 18:03:40', 0, 84.00, 11, 5),
(23, '2013-08-11 18:03:40', 0, 100.00, 2, 5),
(24, '2013-08-11 18:03:40', 0, 100.00, 6, 5),
(25, '2013-08-11 18:56:44', 0, 84.00, 1, 9),
(26, '2013-08-11 18:56:44', 0, 84.00, 11, 9),
(27, '2013-08-11 18:56:44', 0, 100.00, 2, 9),
(28, '2013-08-11 18:56:44', 0, 100.00, 6, 9),
(29, '2013-08-11 19:19:54', 0, 84.00, 1, 6),
(30, '2013-08-11 19:19:54', 0, 84.00, 11, 6),
(31, '2013-08-11 19:19:54', 0, 100.00, 2, 6),
(32, '2013-08-11 19:19:55', 0, 100.00, 6, 6),
(33, '2013-08-11 19:24:48', 0, 84.00, 1, 10),
(34, '2013-08-11 19:24:48', 0, 84.00, 11, 10),
(35, '2013-08-11 19:24:48', 0, 100.00, 2, 10),
(36, '2013-08-11 19:24:48', 0, 100.00, 6, 10),
(37, '2013-08-11 19:41:00', 0, 84.00, 1, 10),
(38, '2013-08-11 19:41:00', 0, 84.00, 11, 10),
(39, '2013-08-11 19:41:00', 0, 100.00, 2, 10),
(40, '2013-08-11 19:41:00', 0, 100.00, 6, 10),
(41, '2013-08-11 19:42:26', 0, 84.00, 1, 9),
(42, '2013-08-11 19:42:26', 0, 84.00, 11, 9),
(43, '2013-08-11 19:42:26', 0, 100.00, 2, 9),
(44, '2013-08-11 19:42:26', 0, 100.00, 6, 9),
(45, '2013-08-11 19:45:06', 0, 84.00, 1, 10),
(46, '2013-08-11 19:45:07', 0, 84.00, 11, 10),
(47, '2013-08-11 19:45:07', 0, 100.00, 2, 10),
(48, '2013-08-11 19:45:07', 0, 100.00, 6, 10),
(49, '2013-08-11 19:47:12', 0, 84.00, 1, 10),
(50, '2013-08-11 19:47:12', 0, 84.00, 11, 10),
(51, '2013-08-11 19:47:12', 0, 100.00, 2, 10),
(52, '2013-08-11 19:47:12', 0, 100.00, 6, 10),
(53, '2013-08-14 18:29:34', 0, 84.00, 1, 10),
(54, '2013-08-14 18:29:34', 0, 84.00, 11, 10),
(55, '2013-08-14 18:29:34', 0, 100.00, 2, 10),
(56, '2013-08-14 18:29:34', 0, 100.00, 6, 10),
(57, '2013-08-17 18:50:34', 0, 84.00, 1, 1),
(58, '2013-08-17 18:50:34', 0, 84.00, 11, 1),
(59, '2013-08-17 18:50:34', 0, 100.00, 2, 1),
(60, '2013-08-17 18:50:34', 0, 100.00, 6, 1),
(61, '2013-08-17 21:33:44', 0, 84.00, 1, 1),
(62, '2013-08-17 21:33:44', 0, 84.00, 11, 1),
(63, '2013-08-17 21:33:44', 0, 84.00, 12, 1),
(64, '2013-08-17 21:33:44', 0, 100.00, 2, 1),
(65, '2013-08-17 21:33:44', 0, 100.00, 6, 1),
(66, '2013-08-20 21:15:24', 0, 84.00, 1, 10),
(67, '2013-08-20 21:15:24', 0, 84.00, 11, 10),
(68, '2013-08-20 21:15:24', 0, 84.00, 12, 10),
(69, '2013-08-20 21:15:24', 0, 84.00, 13, 10),
(70, '2013-08-20 21:15:24', 0, 100.00, 2, 10),
(71, '2013-08-20 21:15:24', 0, 100.00, 6, 10),
(72, '2013-08-21 10:35:34', 0, 84.00, 1, 11),
(73, '2013-08-21 10:35:34', 0, 84.00, 11, 11),
(74, '2013-08-21 10:35:34', 0, 84.00, 12, 11),
(75, '2013-08-21 10:35:34', 0, 84.00, 13, 11),
(76, '2013-08-21 10:35:34', 0, 100.00, 2, 11),
(77, '2013-08-21 10:35:34', 0, 100.00, 6, 11),
(78, '2013-08-21 23:46:12', 0, 88.00, 1, 10),
(79, '2013-08-21 23:46:12', 0, 88.00, 11, 10),
(80, '2013-08-21 23:46:12', 0, 88.00, 12, 10),
(81, '2013-08-21 23:46:12', 0, 88.00, 13, 10),
(82, '2013-08-21 23:46:12', 0, 88.00, 14, 10),
(83, '2013-08-21 23:46:12', 0, 100.00, 2, 10),
(84, '2013-08-21 23:46:12', 0, 100.00, 6, 10),
(85, '2013-08-22 20:36:21', 0, 500.00, 1, 12),
(86, '2013-08-22 20:36:21', 0, 100.00, 2, 12),
(87, '2013-08-22 20:36:21', 0, 100.00, 6, 12),
(88, '2013-08-22 20:36:21', 0, 500.00, 11, 12),
(89, '2013-08-22 20:36:21', 0, 500.00, 12, 12),
(90, '2013-08-22 20:36:21', 0, 500.00, 13, 12),
(91, '2013-08-22 20:36:21', 0, 500.00, 14, 12),
(92, '2013-08-22 20:36:21', 0, 500.00, 15, 12),
(93, '2013-08-22 20:36:21', 0, 500.00, 16, 12);

-- --------------------------------------------------------

--
-- Estrutura da tabela `parentesco`
--

CREATE TABLE IF NOT EXISTS `parentesco` (
  `parentesco_id` int(11) NOT NULL AUTO_INCREMENT,
  `parentesco_descricao` varchar(45) DEFAULT NULL,
  `parentesco_tipo_grau` int(11) DEFAULT NULL,
  PRIMARY KEY (`parentesco_id`),
  KEY `fk_obj_grau_idx` (`parentesco_tipo_grau`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Extraindo dados da tabela `parentesco`
--

INSERT INTO `parentesco` (`parentesco_id`, `parentesco_descricao`, `parentesco_tipo_grau`) VALUES
(1, 'IRMAO', 2),
(2, 'PRIMO', 3),
(3, 'MAE', 1),
(4, 'AVOS', 2),
(5, 'FILHO(A)', 1),
(6, 'NAMORADO(A)', 3),
(7, 'CONJUGE', 1),
(8, 'TIO', 3),
(9, 'SOBRINHO', 2),
(10, 'AMIGO(A)', 3),
(11, 'NETO', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE IF NOT EXISTS `produto` (
  `produto_id` int(11) NOT NULL AUTO_INCREMENT,
  `produto_descricao` varchar(30) DEFAULT NULL,
  `produto_disponivel` tinyint(1) DEFAULT NULL,
  `produto_valor` decimal(10,2) DEFAULT NULL COMMENT 'definir valores diferentes',
  `produto_desconto` decimal(10,2) DEFAULT NULL,
  `produto_estoque` int(11) DEFAULT NULL,
  PRIMARY KEY (`produto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `socio`
--

CREATE TABLE IF NOT EXISTS `socio` (
  `socio_id` int(11) NOT NULL AUTO_INCREMENT,
  `socio_acao` int(11) DEFAULT NULL,
  `socio_nome` varchar(255) NOT NULL,
  `socio_cep` varchar(10) DEFAULT NULL,
  `socio_endereco` varchar(255) DEFAULT NULL,
  `socio_num_res` varchar(6) DEFAULT NULL,
  `socio_bairro` varchar(100) DEFAULT NULL,
  `socio_cidade` int(11) DEFAULT NULL,
  `socio_fone_res` varchar(12) DEFAULT NULL,
  `socio_fone_cel` varchar(12) DEFAULT NULL,
  `socio_rg` varchar(15) DEFAULT NULL,
  `socio_cpf` varchar(12) DEFAULT NULL,
  `socio_nascimento` date DEFAULT NULL,
  `socio_civil` varchar(20) DEFAULT NULL,
  `socio_sexo` char(1) DEFAULT NULL,
  `socio_profissao` varchar(30) DEFAULT NULL,
  `socio_regime_trabalho` varchar(45) DEFAULT NULL,
  `socio_local_trabalho` varchar(50) DEFAULT NULL,
  `socio_fone_trabalho` varchar(12) DEFAULT NULL,
  `socio_observacao` text,
  `socio_email` varchar(50) DEFAULT NULL,
  `socio_data_cadastro` date DEFAULT NULL,
  `socio_ativo` tinyint(1) DEFAULT NULL,
  `socio_foto` varchar(45) DEFAULT NULL,
  `socio_cat` int(11) DEFAULT NULL,
  `socio_academia` int(11) DEFAULT NULL,
  PRIMARY KEY (`socio_id`),
  UNIQUE KEY `socio_acao_UNIQUE` (`socio_acao`),
  KEY `cidade_atual_idx` (`socio_cidade`),
  KEY `fk_SocioEfetivo_Acao1_idx` (`socio_acao`),
  KEY `fksocio_cat_idx` (`socio_cat`),
  KEY `fk_socio_academia_idx` (`socio_academia`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Extraindo dados da tabela `socio`
--

INSERT INTO `socio` (`socio_id`, `socio_acao`, `socio_nome`, `socio_cep`, `socio_endereco`, `socio_num_res`, `socio_bairro`, `socio_cidade`, `socio_fone_res`, `socio_fone_cel`, `socio_rg`, `socio_cpf`, `socio_nascimento`, `socio_civil`, `socio_sexo`, `socio_profissao`, `socio_regime_trabalho`, `socio_local_trabalho`, `socio_fone_trabalho`, `socio_observacao`, `socio_email`, `socio_data_cadastro`, `socio_ativo`, `socio_foto`, `socio_cat`, `socio_academia`) VALUES
(1, NULL, 'BRUNA', '', '', '', '', 1, '', '', '', '', '0000-00-00', 'SOLTEIRO', 'F', '', '', '', '', '', '', '0000-00-00', 0, '', 1, 3),
(2, NULL, 'awd', '123123', '123123', '123123', '123123', 1, '123123', '123123', '123123', '123123', '0000-00-00', 'SOLTEIRO', 'M', '123123', '123123', '123123', '123123', '', '123123', '0000-00-00', 0, '123123', 2, 4),
(6, 150, 'ddddd', '1', '1', '1', '1', 2, '1', '1', '1', '1', '0000-00-00', 'SOLTEIRO', 'M', '1', '1', '1', '1', '1', '1', '0000-00-00', 1, '1', 2, 4),
(11, 290, 'ADW', '', '', '', '', 1, 'AWD', 'AWD', 'AWD', 'AWD', '0000-00-00', 'CASADO', 'M', '', '', '', '', '', '', '0000-00-00', 1, '', 1, 3),
(12, NULL, 'JAQUELINE', '35135135', 'RUA DA MANDIOCA', '351313', 'JD SIMARA', 1, '1251', '21475', '1252', '1252', '0000-00-00', 'SOLTEIRO', 'F', 'PROFESSORA', 'VESPERTINO', 'FATECIE MAX', '3215252', 'NAMORADA DO DOUGLAS', 'keyne_pvai@hotmail.com', '0000-00-00', 0, '', 1, 4),
(13, 12, 'RODOLFO', '', '', '', '', 1, '', '', '21312', '123', '0000-00-00', 'SOLTEIRO', 'F', '', '', '', '', '', '', '0000-00-00', 1, '', 1, 3),
(14, 57, 'Joao da Silva', '87.705-036', '', '', '', 1, '(44) 3045-67', '(44) 8855-25', '5.887.555-2', '022.855.422-', '2000-01-24', 'CASADO', 'M', '', '', '', '', '', '', '0000-00-00', 1, '', 1, 3),
(15, 100, 'DOUGLAS EUFRAUZINO SOUZA', '87.707-030', 'RUA FRANSCISCO ALVES DO NASCIMENTO', '1843', 'JD SIMARA', 1, '(44) 3046-67', '(44) 8439-52', '8.861.315-5', '045.950.729-', '0000-00-00', 'SOLTEIRO', 'M', 'TEC. PROGRAMACAO', 'PLANTAO', 'RPC TV', '4430444567', '', 'douglas__es@hotmail.com', '0000-00-00', 1, '', 1, 3),
(16, 48, 'TEREZA EUFRAUZINO MELLO', '87.707-030', 'RUA FRANSCISCO A. NASCIMENTO', '1843', 'JD AEROPORTO', 2, '(44) 3045-67', '(44) 9985-55', '1.111.111-1', '172.265.979-', '0000-00-00', 'SOLTEIRO', 'F', 'PROFESSORA', 'MANHA', 'ENIRA', '123123123', '', 'terezamello1@hotmail.com', '0000-00-00', 1, '', 1, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cidades`
--

CREATE TABLE IF NOT EXISTS `tb_cidades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` int(11) DEFAULT NULL,
  `uf` varchar(4) DEFAULT NULL,
  `c_nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estado_idx` (`estado`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `tb_cidades`
--

INSERT INTO `tb_cidades` (`id`, `estado`, `uf`, `c_nome`) VALUES
(1, 1, 'PR', 'PARANAVAI'),
(2, 2, 'SP', 'MARILIA');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_estados`
--

CREATE TABLE IF NOT EXISTS `tb_estados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uf` varchar(2) DEFAULT NULL,
  `e_nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `tb_estados`
--

INSERT INTO `tb_estados` (`id`, `uf`, `e_nome`) VALUES
(1, 'PR', 'PARANA'),
(2, 'SP', 'SAO PAULO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipolocacao`
--

CREATE TABLE IF NOT EXISTS `tipolocacao` (
  `obj_tipo_id` int(11) NOT NULL AUTO_INCREMENT,
  `obj_tipo_descricao` varchar(45) DEFAULT NULL,
  `obj_tipo_valor` decimal(10,2) DEFAULT NULL,
  `obj_tipo_obj` int(11) DEFAULT NULL,
  `obj_tipo_grauloc` int(11) DEFAULT NULL,
  `obj_tipo_evento` int(11) DEFAULT NULL,
  PRIMARY KEY (`obj_tipo_id`),
  KEY `fk_obj_tipo_obj_idx` (`obj_tipo_obj`),
  KEY `fk_obj_grauloc_idx` (`obj_tipo_grauloc`),
  KEY `fk_evento_idx` (`obj_tipo_evento`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Extraindo dados da tabela `tipolocacao`
--

INSERT INTO `tipolocacao` (`obj_tipo_id`, `obj_tipo_descricao`, `obj_tipo_valor`, `obj_tipo_obj`, `obj_tipo_grauloc`, `obj_tipo_evento`) VALUES
(1, 'SALAO SOCIAL', 150.00, 1, 1, 1),
(2, 'SALAO SOCIAL', 150.00, 1, 1, 2),
(3, 'SALAO SOCIAL', 700.00, 1, 2, 1),
(5, 'SALAO SOCIAL', 150.00, 1, 2, 2),
(6, 'SALAO SOCIAL', 700.00, 1, 3, 1),
(7, 'SALAO SOCIAL', 700.00, 1, 3, 2),
(8, 'CHURRASQUEIRA GRANDE', 60.00, 2, 1, 3),
(9, 'CHURRASQUEIRA PEQUENA ', 30.00, 3, 1, 3),
(10, 'CHURRASQUEIRA GRANDE', 350.00, 2, 3, 1),
(11, 'CHURRASQUEIRA GRANDE', 350.00, 2, 3, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_freq`
--

CREATE TABLE IF NOT EXISTS `tipo_freq` (
  `tipo_id` int(11) NOT NULL,
  `tipo_descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`tipo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tipo_freq`
--

INSERT INTO `tipo_freq` (`tipo_id`, `tipo_descricao`) VALUES
(1, 'SOCIO'),
(2, 'NAO SOCIO'),
(3, 'FUNCIONARIO'),
(4, 'ACADEMIA SOCIO');

--
-- Restrições para as tabelas dumpadas
--

--
-- Restrições para a tabela `acao`
--
ALTER TABLE `acao`
  ADD CONSTRAINT `fk_acao_tipo` FOREIGN KEY (`acao_tipo`) REFERENCES `tipo_freq` (`tipo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cat_acao` FOREIGN KEY (`acao_cat_acao`) REFERENCES `catacao` (`cat_acao_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `cargo`
--
ALTER TABLE `cargo`
  ADD CONSTRAINT `fk_cargo_tipo` FOREIGN KEY (`cargo_tipo`) REFERENCES `tipo_freq` (`tipo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `catfreq`
--
ALTER TABLE `catfreq`
  ADD CONSTRAINT `fk_cat_freqtipo` FOREIGN KEY (`catfreq_tipo`) REFERENCES `tipo_freq` (`tipo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `convite`
--
ALTER TABLE `convite`
  ADD CONSTRAINT `convite_socio` FOREIGN KEY (`c_socio`) REFERENCES `socio` (`socio_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tipo` FOREIGN KEY (`c_tipo`) REFERENCES `convite_tipo` (`convite_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `venda_c` FOREIGN KEY (`c_vendedor`) REFERENCES `funcionario` (`funcionario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `dependente`
--
ALTER TABLE `dependente`
  ADD CONSTRAINT `fk_dependesocio` FOREIGN KEY (`dependente_socio`) REFERENCES `socio` (`socio_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_parente` FOREIGN KEY (`dependente_parentesco`) REFERENCES `parentesco` (`parentesco_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `diretoria`
--
ALTER TABLE `diretoria`
  ADD CONSTRAINT `fk_dir_cargo` FOREIGN KEY (`dir_cargo`) REFERENCES `cargo` (`cargo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_socio_dir` FOREIGN KEY (`dir_socio`) REFERENCES `socio` (`socio_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `divida`
--
ALTER TABLE `divida`
  ADD CONSTRAINT `fk_div_socio` FOREIGN KEY (`divida_socio`) REFERENCES `socio` (`socio_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `fluxocaixa`
--
ALTER TABLE `fluxocaixa`
  ADD CONSTRAINT `categoria` FOREIGN KEY (`fluxo_categoria`) REFERENCES `catfluxocaixa` (`cat_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `fk_func_cargo` FOREIGN KEY (`funcionario_cargo`) REFERENCES `cargo` (`cargo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `itemlocacao`
--
ALTER TABLE `itemlocacao`
  ADD CONSTRAINT `fkobjeto_locacao` FOREIGN KEY (`itemobj_locacao`) REFERENCES `locacao` (`locacao_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fkobjeto_tipoloc` FOREIGN KEY (`itemobj_tipoloc`) REFERENCES `tipolocacao` (`obj_tipo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_objeto_evento` FOREIGN KEY (`itemobj_evento`) REFERENCES `evento` (`evento_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_objeto_parente` FOREIGN KEY (`itemobj_parente`) REFERENCES `parentesco` (`parentesco_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `itemproduto`
--
ALTER TABLE `itemproduto`
  ADD CONSTRAINT `fklocacao` FOREIGN KEY (`produtoadd_locacao`) REFERENCES `locacao` (`locacao_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fkobjeto` FOREIGN KEY (`objetoadd_objetos`) REFERENCES `produto` (`produto_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `locacao`
--
ALTER TABLE `locacao`
  ADD CONSTRAINT `fklocacao_socio` FOREIGN KEY (`locacao_socio`) REFERENCES `socio` (`socio_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `n_socio`
--
ALTER TABLE `n_socio`
  ADD CONSTRAINT `convidadobolacidade` FOREIGN KEY (`nsocio_cidade`) REFERENCES `tb_cidades` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `convidado_mensalidade` FOREIGN KEY (`nsocio_catfreq`) REFERENCES `catfreq` (`catfreq_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ConvidadoBola_Acao1` FOREIGN KEY (`nsocio_acao`) REFERENCES `acao` (`acao_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `pagmensalidade`
--
ALTER TABLE `pagmensalidade`
  ADD CONSTRAINT `pag_mens_mes` FOREIGN KEY (`pag_mens_mes`) REFERENCES `mespagamento` (`mespag_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pag_mens_socio` FOREIGN KEY (`pag_mens_socio`) REFERENCES `socio` (`socio_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `parentesco`
--
ALTER TABLE `parentesco`
  ADD CONSTRAINT `fk_obj_grau` FOREIGN KEY (`parentesco_tipo_grau`) REFERENCES `grauloc` (`grauloc_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `socio`
--
ALTER TABLE `socio`
  ADD CONSTRAINT `cidade_atual` FOREIGN KEY (`socio_cidade`) REFERENCES `tb_cidades` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fksocio_cat` FOREIGN KEY (`socio_cat`) REFERENCES `catfreq` (`catfreq_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_SocioEfetivo_Acao1` FOREIGN KEY (`socio_acao`) REFERENCES `acao` (`acao_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_socio_academia` FOREIGN KEY (`socio_academia`) REFERENCES `catfreq` (`catfreq_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `tb_cidades`
--
ALTER TABLE `tb_cidades`
  ADD CONSTRAINT `estado` FOREIGN KEY (`estado`) REFERENCES `tb_estados` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `tipolocacao`
--
ALTER TABLE `tipolocacao`
  ADD CONSTRAINT `fk_evento` FOREIGN KEY (`obj_tipo_evento`) REFERENCES `evento` (`evento_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_obj_grauloc` FOREIGN KEY (`obj_tipo_grauloc`) REFERENCES `grauloc` (`grauloc_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_obj_tipo_obj` FOREIGN KEY (`obj_tipo_obj`) REFERENCES `dependencia` (`objeto_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
