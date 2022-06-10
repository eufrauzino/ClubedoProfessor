-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Máquina: 127.0.0.1
-- Data de Criação: 01-Nov-2013 às 22:08
-- Versão do servidor: 5.6.11
-- versão do PHP: 5.5.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de Dados: `clubesys`
--
CREATE DATABASE IF NOT EXISTS `clubesys` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `clubesys`;

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
(18, '2013-10-28', '', '', '2013-10-28 12:13:16', 1, 1),
(25, '2013-09-14', '', '', '2013-09-14 19:15:41', 1, 1),
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
(1, '340.23', 'SOCIO COMUM'),
(2, '0.00', 'NAO SOCIO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `catdependencia`
--

CREATE TABLE IF NOT EXISTS `catdependencia` (
  `catdep_id` int(11) NOT NULL AUTO_INCREMENT,
  `catdep_descricao` varchar(30) NOT NULL,
  PRIMARY KEY (`catdep_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `catdependencia`
--

INSERT INTO `catdependencia` (`catdep_id`, `catdep_descricao`) VALUES
(1, 'Festas e Eventos'),
(2, 'Esportes');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Extraindo dados da tabela `catfreq`
--

INSERT INTO `catfreq` (`catfreq_id`, `mensalidade_valor`, `catfreq_descricao`, `catfreq_atualizacao`, `catfreq_tipo`) VALUES
(1, '450.00', 'SOCIO EFETIVO', '2013-10-28 20:46:06', 1),
(2, '100.00', 'SOCIO COLABORADOR', '2013-09-06 15:39:47', 1),
(3, '0.00', 'ACADEMIA T/DIAS', '2013-09-21 15:01:44', 4),
(4, '0.00', 'NAO FREQUENTA ACADEMIA', '2013-08-05 16:30:10', 4),
(6, '25.00', 'SOCIO FUTEBOL', '2013-10-28 12:23:04', 2),
(7, '25.00', 'ACADEMIA', '2013-10-28 12:22:43', 2),
(8, '50.00', 'ACADEMIA + FUTEBOL', '2013-10-28 12:17:31', 2);

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
-- Estrutura da tabela `cupom`
--

CREATE TABLE IF NOT EXISTS `cupom` (
  `cupom_id` int(11) NOT NULL AUTO_INCREMENT,
  `cupom_valor` decimal(10,2) NOT NULL,
  `cupom_socio` int(11) NOT NULL,
  `cupom_data` datetime NOT NULL,
  `cupom_usado` tinyint(4) NOT NULL,
  PRIMARY KEY (`cupom_id`),
  KEY `cupom_socio` (`cupom_socio`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=46 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `dependencia`
--

CREATE TABLE IF NOT EXISTS `dependencia` (
  `objeto_id` int(11) NOT NULL AUTO_INCREMENT,
  `objeto_descricao` varchar(45) DEFAULT NULL,
  `obeto_disponivel` tinyint(1) DEFAULT NULL,
  `objeto_estoque` int(11) DEFAULT NULL,
  `objeto_categoria` int(11) NOT NULL,
  `objeto_foto` varchar(100) NOT NULL,
  PRIMARY KEY (`objeto_id`),
  KEY `fk_obj_categoria` (`objeto_categoria`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `dependencia`
--

INSERT INTO `dependencia` (`objeto_id`, `objeto_descricao`, `obeto_disponivel`, `objeto_estoque`, `objeto_categoria`, `objeto_foto`) VALUES
(1, 'SALAO SOCIAL', 1, 1, 1, 'salao.jpg'),
(2, 'CHURRASQUEIRA GRANDE', 1, 1, 1, 'chu_grande.jpg'),
(3, 'CHURRASQUEIRA PEQUENA', 1, 1, 1, 'chu_peq.jpg');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `grauloc`
--

INSERT INTO `grauloc` (`grauloc_id`, `grauloc_descricao`) VALUES
(1, 'FAMILIARES'),
(2, 'PARENTES'),
(3, 'TERCEIROS');

-- --------------------------------------------------------

--
-- Estrutura da tabela `itemcupom`
--

CREATE TABLE IF NOT EXISTS `itemcupom` (
  `itemcupom_id` int(11) NOT NULL AUTO_INCREMENT,
  `itemcupom_cupom` int(11) DEFAULT NULL,
  `itemcupom_locacao` int(11) DEFAULT NULL,
  `itemcupom_valor` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`itemcupom_id`),
  KEY `itemcupom_cupom_idx` (`itemcupom_cupom`),
  KEY `itemcupom_locacao_idx` (`itemcupom_locacao`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=517 ;

--
-- Extraindo dados da tabela `itemlocacao`
--

INSERT INTO `itemlocacao` (`itemobj_id`, `itemobj_tipoloc`, `itemobj_locacao`, `itemobj_parente`, `itemobj_evento`, `itemobj_responsavel`, `itemobj_data`) VALUES
(398, 3, 80, 1, 1, '', '2013-10-05'),
(516, 1, 158, 3, 1, '', '2013-11-23');

-- --------------------------------------------------------

--
-- Estrutura da tabela `itemproduto`
--

CREATE TABLE IF NOT EXISTS `itemproduto` (
  `itemprod_id` int(11) NOT NULL AUTO_INCREMENT,
  `itemprod_objetos` int(11) DEFAULT NULL,
  `itemprod_qtd` int(11) DEFAULT NULL,
  `itemprod_valor` decimal(10,2) DEFAULT NULL,
  `itemprod_itemlocacao` int(11) DEFAULT NULL,
  PRIMARY KEY (`itemprod_id`),
  KEY `fkobjeto_idx` (`itemprod_objetos`),
  KEY `itemprod_itemlocacao` (`itemprod_itemlocacao`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `itemproduto`
--

INSERT INTO `itemproduto` (`itemprod_id`, `itemprod_objetos`, `itemprod_qtd`, `itemprod_valor`, `itemprod_itemlocacao`) VALUES
(1, 1, 10, '100.00', 398);

-- --------------------------------------------------------

--
-- Estrutura da tabela `lc_cat`
--

CREATE TABLE IF NOT EXISTS `lc_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `lc_cat`
--

INSERT INTO `lc_cat` (`id`, `nome`) VALUES
(1, 'LOCACAO'),
(2, 'MENSALIDADE'),
(3, 'CONTA DE AGUA'),
(4, 'PAGAMENTO DE PEDREIRO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `lc_movimento`
--

CREATE TABLE IF NOT EXISTS `lc_movimento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` int(11) DEFAULT NULL,
  `dia` int(11) DEFAULT NULL,
  `mes` int(11) DEFAULT NULL,
  `ano` int(11) DEFAULT NULL,
  `cat` int(11) DEFAULT NULL,
  `descricao` longtext,
  `valor` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=118 ;

--
-- Extraindo dados da tabela `lc_movimento`
--

INSERT INTO `lc_movimento` (`id`, `tipo`, `dia`, `mes`, `ano`, `cat`, `descricao`, `valor`) VALUES
(22, 1, 28, 10, 2013, 1, 'Locacao - Dependencia: SALAO SOCIAL Socio: DOUGLAS EUFRAUZINO SOUZA Acao: 100', 700),
(23, 1, 28, 10, 2013, 1, 'Acao: 100 DOUGLAS EUFRAUZINO SOUZA  - CHURRASQUEIRA GRANDE  ', 60),
(24, 1, 28, 10, 2013, 1, 'Locacao - Dependencia: CHURRASQUEIRA PEQUENA  Socio: DOUGLAS EUFRAUZINO SOUZA Acao: 100', 30),
(44, 1, 28, 10, 2013, 2, 'Mensalidade JAQUELINE ', 155.87),
(45, 1, 28, 10, 2013, 2, 'Mensalidade BRUNA ', 155.87),
(46, 1, 28, 10, 2013, 2, 'Mensalidade Camila do Santos ', 155.87),
(47, 1, 28, 10, 2013, 2, 'Mensalidade DOUGLAS EUFRAUZINO SOUZA ', 155.87),
(48, 1, 28, 10, 2013, 2, 'Mensalidade RODOLFO ', 155.87),
(49, 1, 28, 10, 2013, 2, 'Mensalidade Joao da Silva ', 155.87),
(50, 1, 28, 10, 2013, 2, 'Mensalidade TEREZA EUFRAUZINO MELLO ', 155.87),
(51, 1, 28, 10, 2013, 2, 'Mensalidade Camila do Santos ', 88),
(52, 1, 28, 10, 2013, 2, 'Mensalidade DOUGLAS EUFRAUZINO SOUZA ', 88),
(53, 1, 28, 10, 2013, 2, 'Mensalidade Joao da Silva ', 88),
(54, 1, 28, 10, 2013, 2, 'Mensalidade JAQUELINE ', 88),
(55, 1, 28, 10, 2013, 2, 'Mensalidade RODOLFO ', 88),
(56, 1, 28, 10, 2013, 2, 'Mensalidade ddddd ', 100),
(57, 1, 28, 10, 2013, 2, 'Mensalidade Camila do Santos ', 88),
(58, 1, 28, 10, 2013, 2, 'Mensalidade RODOLFO ', 88),
(59, 1, 28, 10, 2013, 2, 'Mensalidade ddddd ', 100),
(60, 1, 28, 10, 2013, 2, 'Mensalidade DOUGLAS EUFRAUZINO SOUZA ', 155.87),
(61, 1, 28, 10, 2013, 1, 'Locacao - Dependencia: SALAO SOCIAL Socio: Joao da Silva Acao: 57', 700),
(62, 1, 28, 10, 2013, 1, 'Locacao - Dependencia: SALAO SOCIAL Socio: TEREZA EUFRAUZINO MELLO Acao: 48', 700),
(63, 1, 28, 10, 2013, 1, 'Locacao - Dependencia: SALAO SOCIAL Socio: TEREZA EUFRAUZINO MELLO Acao: 48', 700),
(64, 1, 28, 10, 2013, 1, 'Locacao - Dependencia: CHURRASQUEIRA GRANDE Socio: TEREZA EUFRAUZINO MELLO Acao: 48', 350),
(65, 1, 28, 10, 2013, 2, 'Mensalidade ADW ', 155.87),
(66, 1, 28, 10, 2013, 2, 'Mensalidade Joao da Silva ', 155.87),
(67, 1, 28, 10, 2013, 2, 'Mensalidade ddddd ', 100),
(68, 1, 28, 10, 2013, 2, 'Mensalidade Camila do Santos ', 155.87),
(69, 1, 28, 10, 2013, 2, 'Mensalidade RODOLFO ', 155.87),
(70, 1, 28, 10, 2013, 2, 'Mensalidade ADW ', 450),
(71, 1, 28, 10, 2013, 2, 'Mensalidade ddddd ', 100),
(72, 1, 28, 10, 2013, 2, 'Mensalidade Joao da Silva ', 450),
(73, 1, 28, 10, 2013, 2, 'Mensalidade RODOLFO ', 450),
(74, 1, 28, 10, 2013, 2, 'Mensalidade TEREZA EUFRAUZINO MELLO ', 450),
(75, 1, 28, 10, 2013, 2, 'Mensalidade DOUGLAS EUFRAUZINO SOUZA ', 450),
(76, 1, 29, 10, 2013, 2, 'Mensalidade DOUGLAS EUFRAUZINO SOUZA ', 450),
(77, 1, 29, 10, 2013, 2, 'Mensalidade TEREZA EUFRAUZINO MELLO ', 450),
(78, 1, 30, 10, 2013, 2, 'Mensalidade Camila do Santos ', 450),
(79, 1, 30, 10, 2013, 2, 'Mensalidade RODOLFO ', 450),
(80, 1, 30, 10, 2013, 2, 'Mensalidade ADW ', 450),
(81, 1, 30, 10, 2013, 2, 'Mensalidade ddddd ', 100),
(82, 1, 30, 10, 2013, 2, 'Mensalidade Joao da Silva ', 450),
(83, 1, 30, 10, 2013, 2, 'Mensalidade TEREZA EUFRAUZINO MELLO ', 450),
(84, 1, 30, 10, 2013, 1, 'Locacao - Dependencia: SALAO SOCIAL Socio: ADW Acao: 290', 700),
(85, 1, 30, 10, 2013, 1, 'Locacao - Dependencia: SALAO SOCIAL Socio: ADW Acao: 290', 700),
(86, 1, 30, 10, 2013, 1, 'Locacao - Dependencia: SALAO SOCIAL Socio: ddddd Acao: 150', 700),
(87, 1, 30, 10, 2013, 1, 'Locacao - Dependencia: SALAO SOCIAL Socio: DOUGLAS EUFRAUZINO SOUZA Acao: 100', 700),
(88, 1, 30, 10, 2013, 1, 'Locacao - Dependencia: SALAO SOCIAL Socio: DOUGLAS EUFRAUZINO SOUZA Acao: 100', 700),
(89, 1, 30, 10, 2013, 1, 'Locacao - Dependencia: SALAO SOCIAL Socio: ADW Acao: 290', 700),
(90, 1, 30, 10, 2013, 1, 'Locacao - Dependencia: CHURRASQUEIRA GRANDE Socio: DOUGLAS EUFRAUZINO SOUZA Acao: 100', 60),
(91, 1, 30, 10, 2013, 1, 'Locacao - Dependencia: SALAO SOCIAL Socio: RODOLFO Acao: 12', 700),
(92, 1, 30, 10, 2013, 1, 'Locacao - Dependencia: CHURRASQUEIRA GRANDE Socio: DOUGLAS EUFRAUZINO SOUZA Acao: 100', 60),
(93, 1, 30, 10, 2013, 1, 'Locacao - Dependencia: SALAO SOCIAL Socio: DOUGLAS EUFRAUZINO SOUZA Acao: 100', 700),
(94, 1, 30, 10, 2013, 1, 'Locacao - Dependencia: SALAO SOCIAL Socio: TEREZA EUFRAUZINO MELLO Acao: 48', 700),
(95, 1, 30, 10, 2013, 1, 'Locacao - Dependencia: SALAO SOCIAL Socio: TEREZA EUFRAUZINO MELLO Acao: 48', 700),
(96, 1, 30, 10, 2013, 1, 'Locacao - Dependencia: SALAO SOCIAL Socio: RODOLFO Acao: 12', 700),
(97, 1, 30, 10, 2013, 1, 'Locacao - Dependencia: SALAO SOCIAL Socio: RODOLFO Acao: 12', 700),
(98, 1, 31, 10, 2013, 2, 'Mensalidade ddddd ', 100),
(99, 1, 31, 10, 2013, 2, 'Mensalidade DOUGLAS EUFRAUZINO SOUZA ', 450),
(100, 1, 31, 10, 2013, 1, 'Locacao - Dependencia: SALAO SOCIAL Socio: TEREZA EUFRAUZINO MELLO Acao: 48', 700),
(101, 1, 31, 10, 2013, 1, 'Locacao - Dependencia: CHURRASQUEIRA GRANDE Socio: TEREZA EUFRAUZINO MELLO Acao: 48', 350),
(102, 1, 31, 10, 2013, 1, 'Locacao - Dependencia: SALAO SOCIAL Socio: DOUGLAS EUFRAUZINO SOUZA Acao: 100', 700),
(103, 1, 31, 10, 2013, 1, 'Locacao - Dependencia: SALAO SOCIAL Socio: DOUGLAS EUFRAUZINO SOUZA Acao: 100', 150),
(104, 1, 31, 10, 2013, 1, 'Locacao - Dependencia: CHURRASQUEIRA GRANDE Socio: DOUGLAS EUFRAUZINO SOUZA Acao: 100', 60),
(105, 1, 31, 10, 2013, 1, 'Locacao - Dependencia: CHURRASQUEIRA GRANDE Socio: Camila do Santos Acao: 25', 60),
(106, 1, 31, 10, 2013, 1, 'Locacao - Dependencia: CHURRASQUEIRA GRANDE Socio: ADW Acao: 290', 60),
(107, 1, 31, 10, 2013, 1, 'Locacao - Dependencia: SALAO SOCIAL Socio: TEREZA EUFRAUZINO MELLO Acao: 48', 700),
(108, 1, 31, 10, 2013, 1, 'Locacao - Dependencia: CHURRASQUEIRA GRANDE Socio: TEREZA EUFRAUZINO MELLO Acao: 48', 60),
(109, 1, 31, 10, 2013, 1, 'Locacao - Dependencia: SALAO SOCIAL Socio: TEREZA EUFRAUZINO MELLO Acao: 48', 700),
(110, 1, 31, 10, 2013, 1, 'Locacao - Dependencia: SALAO SOCIAL Socio: TEREZA EUFRAUZINO MELLO Acao: 48', 150),
(111, 1, 31, 10, 2013, 1, 'Locacao - Dependencia: SALAO SOCIAL Socio: TEREZA EUFRAUZINO MELLO Acao: 48', 700),
(112, 1, 31, 10, 2013, 1, 'Locacao - Dependencia: CHURRASQUEIRA GRANDE Socio: TEREZA EUFRAUZINO MELLO Acao: 48', 60),
(113, 1, 31, 10, 2013, 1, 'Locacao - Dependencia: SALAO SOCIAL Socio: DOUGLAS EUFRAUZINO SOUZA Acao: 100', 700),
(114, 1, 31, 10, 2013, 1, 'Locacao - Dependencia: SALAO SOCIAL Socio: DOUGLAS EUFRAUZINO SOUZA Acao: 100', 150),
(115, 1, 1, 11, 2013, 1, 'Locacao - Dependencia: SALAO SOCIAL Socio: DOUGLAS EUFRAUZINO SOUZA Acao: 100', 150),
(116, 1, 1, 11, 2013, 1, 'Locacao - Dependencia: SALAO SOCIAL Socio: DOUGLAS EUFRAUZINO SOUZA Acao: 100', 700),
(117, 1, 1, 11, 2013, 1, 'Locacao - Dependencia: SALAO SOCIAL Socio: DOUGLAS EUFRAUZINO SOUZA Acao: 100', 700);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=159 ;

--
-- Extraindo dados da tabela `locacao`
--

INSERT INTO `locacao` (`locacao_id`, `locacao_data`, `locacao_pago`, `locacao_total`, `locacao_socio`, `locacao_socionome`) VALUES
(80, '2013-09-06 00:00:00', 1, '700.00', 14, 'Joao da Silva'),
(158, '2013-11-01 18:58:50', 0, '150.00', 15, 'DOUGLAS EUFRAUZINO SOUZA');

-- --------------------------------------------------------

--
-- Estrutura da tabela `mespagamento`
--

CREATE TABLE IF NOT EXISTS `mespagamento` (
  `mespag_id` int(11) NOT NULL AUTO_INCREMENT,
  `mespag_ano` year(4) DEFAULT NULL,
  `mespag_mes` int(11) DEFAULT NULL,
  PRIMARY KEY (`mespag_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Extraindo dados da tabela `mespagamento`
--

INSERT INTO `mespagamento` (`mespag_id`, `mespag_ano`, `mespag_mes`) VALUES
(27, 2013, 11),
(28, 2013, 12),
(29, 2013, 9),
(30, 2013, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=495 ;

--
-- Extraindo dados da tabela `pagmensalidade`
--

INSERT INTO `pagmensalidade` (`pag_mens_id`, `pag_mens_data`, `pag_mens_status`, `pag_mens_valor`, `pag_mens_socio`, `pag_mens_mes`) VALUES
(474, '2013-10-29 21:44:24', 1, '100.00', 6, 30),
(475, '2013-10-29 21:44:24', 1, '450.00', 11, 30),
(476, '2013-10-29 21:44:24', 1, '450.00', 13, 30),
(477, '2013-10-29 21:44:24', 1, '450.00', 14, 30),
(478, '2013-10-29 21:44:24', 0, '450.00', 15, 30),
(479, '2013-10-29 21:44:24', 1, '450.00', 16, 30),
(480, '2013-10-29 21:44:24', 1, '450.00', 17, 30),
(481, '2013-10-29 23:33:09', 1, '100.00', 6, 28),
(482, '2013-10-29 23:33:09', 0, '450.00', 11, 28),
(483, '2013-10-29 23:33:09', 0, '450.00', 13, 28),
(484, '2013-10-29 23:33:09', 0, '450.00', 14, 28),
(485, '2013-10-30 19:53:01', 1, '450.00', 15, 28),
(486, '2013-10-30 19:53:08', 1, '450.00', 16, 28),
(487, '2013-10-29 23:33:09', 0, '450.00', 17, 28),
(488, '2013-10-30 22:59:10', 0, '100.00', 6, 29),
(489, '2013-10-30 23:02:14', 1, '450.00', 11, 29),
(490, '2013-10-30 22:59:10', 0, '450.00', 13, 29),
(491, '2013-10-30 22:59:10', 0, '450.00', 14, 29),
(492, '2013-10-31 19:13:23', 0, '450.00', 15, 29),
(493, '2013-10-30 22:59:10', 0, '450.00', 16, 29),
(494, '2013-10-30 22:59:10', 0, '450.00', 17, 29);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

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
  `produto_estoque` int(11) DEFAULT NULL,
  `produto_cat_obj` int(11) NOT NULL,
  PRIMARY KEY (`produto_id`),
  KEY `produto_cat_obj` (`produto_cat_obj`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`produto_id`, `produto_descricao`, `produto_disponivel`, `produto_valor`, `produto_estoque`, `produto_cat_obj`) VALUES
(1, 'TAMPAO', 1, '5.00', 30, 1),
(2, 'PRATO', 1, '1.20', 100, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

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
(16, 48, 'TEREZA EUFRAUZINO MELLO', '87.707-030', 'RUA FRANSCISCO A. NASCIMENTO', '1843', 'JD AEROPORTO', 2, '(44) 3045-67', '(44) 9985-55', '1.111.111-1', '172.265.979-', '0000-00-00', 'SOLTEIRO', 'F', 'PROFESSORA', 'MANHA', 'ENIRA', '123123123', '', 'terezamello1@hotmail.com', '0000-00-00', 1, '', 1, 4),
(17, 25, 'Camila do Santos', '88.774-575', 'Rua dos Testes ', '7777', 'Bairro dos Testes', 1, '(44) 3545-58', '(44) 8552-58', '5.555.555-5', '888.888.888-', '0000-00-00', 'SOLTEIRO', 'F', 'Parteira', '', '', '', '', 'ca@ca.com', '0000-00-00', 1, '', 1, 3);

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
(1, 'SALAO SOCIAL', '150.00', 1, 1, 1),
(2, 'SALAO SOCIAL', '150.00', 1, 1, 2),
(3, 'SALAO SOCIAL', '700.00', 1, 2, 1),
(5, 'SALAO SOCIAL', '150.00', 1, 2, 2),
(6, 'SALAO SOCIAL', '700.00', 1, 3, 1),
(7, 'SALAO SOCIAL', '700.00', 1, 3, 2),
(8, 'CHURRASQUEIRA GRANDE', '60.00', 2, 1, 3),
(9, 'CHURRASQUEIRA PEQUENA ', '30.00', 3, 1, 3),
(10, 'CHURRASQUEIRA GRANDE', '350.00', 2, 3, 1),
(11, 'CHURRASQUEIRA GRANDE', '350.00', 2, 3, 2);

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
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `acao`
--
ALTER TABLE `acao`
  ADD CONSTRAINT `fk_acao_tipo` FOREIGN KEY (`acao_tipo`) REFERENCES `tipo_freq` (`tipo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cat_acao` FOREIGN KEY (`acao_cat_acao`) REFERENCES `catacao` (`cat_acao_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `cargo`
--
ALTER TABLE `cargo`
  ADD CONSTRAINT `fk_cargo_tipo` FOREIGN KEY (`cargo_tipo`) REFERENCES `tipo_freq` (`tipo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `catfreq`
--
ALTER TABLE `catfreq`
  ADD CONSTRAINT `fk_cat_freqtipo` FOREIGN KEY (`catfreq_tipo`) REFERENCES `tipo_freq` (`tipo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `convite`
--
ALTER TABLE `convite`
  ADD CONSTRAINT `convite_socio` FOREIGN KEY (`c_socio`) REFERENCES `socio` (`socio_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tipo` FOREIGN KEY (`c_tipo`) REFERENCES `convite_tipo` (`convite_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `venda_c` FOREIGN KEY (`c_vendedor`) REFERENCES `funcionario` (`funcionario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `cupom`
--
ALTER TABLE `cupom`
  ADD CONSTRAINT `cupom_socio` FOREIGN KEY (`cupom_socio`) REFERENCES `socio` (`socio_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `dependente`
--
ALTER TABLE `dependente`
  ADD CONSTRAINT `fk_dependesocio` FOREIGN KEY (`dependente_socio`) REFERENCES `socio` (`socio_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_parente` FOREIGN KEY (`dependente_parentesco`) REFERENCES `parentesco` (`parentesco_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `diretoria`
--
ALTER TABLE `diretoria`
  ADD CONSTRAINT `fk_dir_cargo` FOREIGN KEY (`dir_cargo`) REFERENCES `cargo` (`cargo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_socio_dir` FOREIGN KEY (`dir_socio`) REFERENCES `socio` (`socio_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `divida`
--
ALTER TABLE `divida`
  ADD CONSTRAINT `fk_div_socio` FOREIGN KEY (`divida_socio`) REFERENCES `socio` (`socio_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `fluxocaixa`
--
ALTER TABLE `fluxocaixa`
  ADD CONSTRAINT `categoria` FOREIGN KEY (`fluxo_categoria`) REFERENCES `catfluxocaixa` (`cat_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `fk_func_cargo` FOREIGN KEY (`funcionario_cargo`) REFERENCES `cargo` (`cargo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `itemcupom`
--
ALTER TABLE `itemcupom`
  ADD CONSTRAINT `itemcupom_cupom` FOREIGN KEY (`itemcupom_cupom`) REFERENCES `cupom` (`cupom_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `itemcupom_locacao` FOREIGN KEY (`itemcupom_locacao`) REFERENCES `locacao` (`locacao_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `itemlocacao`
--
ALTER TABLE `itemlocacao`
  ADD CONSTRAINT `fkobjeto_locacao` FOREIGN KEY (`itemobj_locacao`) REFERENCES `locacao` (`locacao_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fkobjeto_tipoloc` FOREIGN KEY (`itemobj_tipoloc`) REFERENCES `tipolocacao` (`obj_tipo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_objeto_evento` FOREIGN KEY (`itemobj_evento`) REFERENCES `evento` (`evento_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_objeto_parente` FOREIGN KEY (`itemobj_parente`) REFERENCES `parentesco` (`parentesco_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `itemproduto`
--
ALTER TABLE `itemproduto`
  ADD CONSTRAINT `itemproduto_ibfk_1` FOREIGN KEY (`itemprod_itemlocacao`) REFERENCES `itemlocacao` (`itemobj_id`),
  ADD CONSTRAINT `itemproduto_ibfk_2` FOREIGN KEY (`itemprod_objetos`) REFERENCES `produto` (`produto_id`);

--
-- Limitadores para a tabela `locacao`
--
ALTER TABLE `locacao`
  ADD CONSTRAINT `fklocacao_socio` FOREIGN KEY (`locacao_socio`) REFERENCES `socio` (`socio_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `n_socio`
--
ALTER TABLE `n_socio`
  ADD CONSTRAINT `convidadobolacidade` FOREIGN KEY (`nsocio_cidade`) REFERENCES `tb_cidades` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `convidado_mensalidade` FOREIGN KEY (`nsocio_catfreq`) REFERENCES `catfreq` (`catfreq_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ConvidadoBola_Acao1` FOREIGN KEY (`nsocio_acao`) REFERENCES `acao` (`acao_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `pagmensalidade`
--
ALTER TABLE `pagmensalidade`
  ADD CONSTRAINT `pag_mens_mes` FOREIGN KEY (`pag_mens_mes`) REFERENCES `mespagamento` (`mespag_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pag_mens_socio` FOREIGN KEY (`pag_mens_socio`) REFERENCES `socio` (`socio_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `parentesco`
--
ALTER TABLE `parentesco`
  ADD CONSTRAINT `fk_obj_grau` FOREIGN KEY (`parentesco_tipo_grau`) REFERENCES `grauloc` (`grauloc_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`produto_cat_obj`) REFERENCES `catdependencia` (`catdep_id`);

--
-- Limitadores para a tabela `socio`
--
ALTER TABLE `socio`
  ADD CONSTRAINT `cidade_atual` FOREIGN KEY (`socio_cidade`) REFERENCES `tb_cidades` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fksocio_cat` FOREIGN KEY (`socio_cat`) REFERENCES `catfreq` (`catfreq_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_SocioEfetivo_Acao1` FOREIGN KEY (`socio_acao`) REFERENCES `acao` (`acao_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_socio_academia` FOREIGN KEY (`socio_academia`) REFERENCES `catfreq` (`catfreq_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_cidades`
--
ALTER TABLE `tb_cidades`
  ADD CONSTRAINT `estado` FOREIGN KEY (`estado`) REFERENCES `tb_estados` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tipolocacao`
--
ALTER TABLE `tipolocacao`
  ADD CONSTRAINT `fk_evento` FOREIGN KEY (`obj_tipo_evento`) REFERENCES `evento` (`evento_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_obj_grauloc` FOREIGN KEY (`obj_tipo_grauloc`) REFERENCES `grauloc` (`grauloc_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_obj_tipo_obj` FOREIGN KEY (`obj_tipo_obj`) REFERENCES `dependencia` (`objeto_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
