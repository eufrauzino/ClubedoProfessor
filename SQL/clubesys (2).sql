-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Máquina: 127.0.0.1
-- Data de Criação: 25-Jun-2014 às 20:21
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
(55, '2014-02-21', '', '', '2014-02-22 16:32:25', 1, 1),
(558, '2014-02-21', '', '', '2014-02-21 15:55:38', 1, 1),
(748, '0000-00-00', '', '', '2014-03-25 12:44:09', 1, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `catfreq`
--

INSERT INTO `catfreq` (`catfreq_id`, `mensalidade_valor`, `catfreq_descricao`, `catfreq_atualizacao`, `catfreq_tipo`) VALUES
(1, '250.00', 'SOCIO EFETIVO', '2014-03-25 13:09:42', 1),
(2, '120.00', 'SOCIO COLABORADOR', '2014-03-25 13:09:55', 1),
(6, '25.00', 'SOCIO FUTEBOL', '2013-10-28 12:23:04', 2);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Extraindo dados da tabela `cupom`
--

INSERT INTO `cupom` (`cupom_id`, `cupom_valor`, `cupom_socio`, `cupom_data`, `cupom_usado`) VALUES
(12, '452.00', 16, '2013-11-28 16:41:38', 0),
(13, '0.00', 15, '2013-11-28 20:45:30', 1),
(14, '0.00', 15, '2014-02-13 17:30:04', 1),
(15, '0.00', 24, '2014-02-17 17:28:03', 1),
(16, '762.00', 23, '2014-02-17 17:28:55', 0),
(17, '350.00', 24, '2014-02-20 19:24:13', 0),
(18, '1030.00', 16, '2014-05-09 02:37:41', 0),
(19, '1030.00', 16, '2014-05-09 02:37:48', 0),
(20, '877.00', 12, '2014-05-09 02:38:00', 0),
(21, '177.00', 12, '2014-05-09 02:38:04', 0),
(22, '250.00', 16, '2014-06-11 15:06:49', 0);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `depinativo`
--

CREATE TABLE IF NOT EXISTS `depinativo` (
  `depinativo_id` int(11) NOT NULL AUTO_INCREMENT,
  `depinativo_motivo` varchar(255) NOT NULL,
  `depinativo_inicio` date DEFAULT NULL,
  `depinativo_fim` date DEFAULT NULL,
  `depinativo_dep` int(11) DEFAULT NULL,
  PRIMARY KEY (`depinativo_id`),
  KEY `depinativo_dep` (`depinativo_dep`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `depinativo`
--

INSERT INTO `depinativo` (`depinativo_id`, `depinativo_motivo`, `depinativo_inicio`, `depinativo_fim`, `depinativo_dep`) VALUES
(4, 'REFORMA', '2013-11-29', '2013-11-30', 1),
(5, 'MANUTENCAO', '2014-01-01', '2014-01-20', 1),
(6, 'MANUTENCAO', '2014-02-14', '2014-02-20', 1);

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
(0, 'FORMATURA'),
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
  `exame_socio` int(11) DEFAULT NULL,
  PRIMARY KEY (`exame_id`),
  KEY `exame_socio` (`exame_socio`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `exame`
--

INSERT INTO `exame` (`exame_id`, `exame_validade`, `exame_medico`, `exame_socio`) VALUES
(1, '2013-11-10', 'Dr Osvaldo', 16);

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
  `funcionario_login` varchar(20) DEFAULT NULL,
  `funcionario_senha` varchar(8) DEFAULT NULL,
  `funcionario_cargo` int(11) DEFAULT NULL,
  PRIMARY KEY (`funcionario_id`),
  KEY `fk_func_cargo_idx` (`funcionario_cargo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`funcionario_id`, `funcionario_nome`, `funcionario_funcao`, `funcionario_login`, `funcionario_senha`, `funcionario_cargo`) VALUES
(1, 'Bruna', 'Administrativo', 'bruna', 'bruna', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `grauloc`
--

CREATE TABLE IF NOT EXISTS `grauloc` (
  `grauloc_id` int(11) NOT NULL AUTO_INCREMENT,
  `grauloc_descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`grauloc_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `grauloc`
--

INSERT INTO `grauloc` (`grauloc_id`, `grauloc_descricao`) VALUES
(1, 'FAMILIARES'),
(2, 'PARENTES'),
(3, 'TERCEIROS'),
(5, 'ALUNOS DA ESCOLA DO SOCIO');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `itemcupom`
--

INSERT INTO `itemcupom` (`itemcupom_id`, `itemcupom_cupom`, `itemcupom_locacao`, `itemcupom_valor`) VALUES
(1, 14, 260, '610.00'),
(2, 15, 267, '70.00'),
(3, 21, 278, '700.00');

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
  `itemobj_valor` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`itemobj_id`),
  KEY `fkprodest_locacao_idx` (`itemobj_locacao`),
  KEY `fkobjeto_tipoloc_idx` (`itemobj_tipoloc`),
  KEY `fk_objeto_parente_idx` (`itemobj_parente`),
  KEY `fk_objeto_evento_idx` (`itemobj_evento`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Extraindo dados da tabela `itemlocacao`
--

INSERT INTO `itemlocacao` (`itemobj_id`, `itemobj_tipoloc`, `itemobj_locacao`, `itemobj_parente`, `itemobj_evento`, `itemobj_responsavel`, `itemobj_data`, `itemobj_valor`) VALUES
(4, 3, 260, 9, 1, '', '2014-03-29', NULL),
(7, 13, 267, 3, 0, '', '2014-02-21', NULL),
(9, 8, 269, 3, 3, '', '2014-02-28', NULL),
(12, 3, 273, 1, 1, '', '2014-04-25', NULL),
(13, 8, 273, 3, 3, '', '2014-03-02', NULL),
(19, 7, 278, 6, 2, '', '2014-07-11', NULL),
(21, 3, 280, 4, 1, '', '2014-08-21', NULL),
(22, 1, 282, 14, 1, '', '2015-02-14', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `itemproduto`
--

CREATE TABLE IF NOT EXISTS `itemproduto` (
  `itemprod_id` int(11) NOT NULL AUTO_INCREMENT,
  `itemprod_objetos` int(11) DEFAULT NULL,
  `itemprod_qtd` int(11) DEFAULT NULL,
  `itemprod_itemlocacao` int(11) DEFAULT NULL,
  `itemprod_data` date NOT NULL,
  `itemprod_valor_un` decimal(10,2) NOT NULL,
  PRIMARY KEY (`itemprod_id`),
  KEY `fkobjeto_idx` (`itemprod_objetos`),
  KEY `itemprod_itemlocacao` (`itemprod_itemlocacao`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Extraindo dados da tabela `itemproduto`
--

INSERT INTO `itemproduto` (`itemprod_id`, `itemprod_objetos`, `itemprod_qtd`, `itemprod_itemlocacao`, `itemprod_data`, `itemprod_valor_un`) VALUES
(6, 1, 15, 9, '2014-02-28', '12.00'),
(7, 4, 4, 9, '2014-02-28', '0.00'),
(14, 5, 20, 13, '2014-03-02', '0.00'),
(15, 2, 20, 13, '2014-03-02', '0.00'),
(16, 1, 20, 22, '2015-02-14', '0.00'),
(17, 4, 2, 22, '2015-02-14', '0.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `lc_cat`
--

CREATE TABLE IF NOT EXISTS `lc_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `lc_cat`
--

INSERT INTO `lc_cat` (`id`, `nome`) VALUES
(1, 'LOCACAO'),
(2, 'MENSALIDADE'),
(3, 'CONTA DE AGUA'),
(4, 'PAGAMENTO DE PEDREIRO'),
(5, 'COMPRA');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=326 ;

--
-- Extraindo dados da tabela `lc_movimento`
--

INSERT INTO `lc_movimento` (`id`, `tipo`, `dia`, `mes`, `ano`, `cat`, `descricao`, `valor`) VALUES
(221, 1, 28, 11, 2013, 1, 'Locacao - Dependencia: SALAO SOCIAL(FORM/FAMILIA) Socio: DOUGLAS EUFRAUZINO SOUZA Acao: 100', 250),
(222, 1, 28, 11, 2013, 2, 'Mensalidade FERNANDO ', 450),
(223, 1, 28, 11, 2013, 2, 'Mensalidade Joao da Silva ', 450),
(224, 1, 28, 11, 2013, 2, 'Mensalidade ADW ', 450),
(225, 1, 28, 11, 2013, 2, 'Mensalidade ddddd ', 100),
(226, 1, 28, 11, 2013, 2, 'Mensalidade Camila do Santos ', 450),
(227, 1, 28, 11, 2013, 2, 'Mensalidade Maicon Jackson ', 450),
(228, 1, 28, 11, 2013, 2, 'Mensalidade RODOLFO ', 450),
(229, 1, 28, 11, 2013, 2, 'Mensalidade TEREZA EUFRAUZINO MELLO ', 450),
(230, 1, 28, 11, 2013, 2, 'Mensalidade TESTE ', 450),
(231, 1, 9, 12, 2013, 2, 'Mensalidade FERNANDO ', 150),
(232, 1, 9, 12, 2013, 2, 'Mensalidade RODOLFO ', 150),
(233, 1, 16, 12, 2013, 2, 'Mensalidade DOUGLAS EUFRAUZINO SOUZA ', 150),
(234, 1, 13, 2, 2014, 2, 'Mensalidade TEREZA EUFRAUZINO MELLO ', 150),
(235, 1, 13, 2, 2014, 2, 'Mensalidade FERNANDO ', 150),
(236, 1, 13, 2, 2014, 2, 'Mensalidade RODOLFO ', 150),
(237, 1, 13, 2, 2014, 1, 'Locacao - Dependencia: SALAO SOCIAL(FORM/FAMILIA) Socio: DOUGLAS EUFRAUZINO SOUZA Acao: 100', 250),
(238, 1, 13, 2, 2014, 1, 'Locacao - Dependencia: CHURRASQUEIRA GRANDE Socio: DOUGLAS EUFRAUZINO SOUZA Acao: 100', 60),
(239, 1, 13, 2, 2014, 1, 'Locacao - Dependencia: SALAO SOCIAL(FORM/FAMILIA) Socio: DOUGLAS EUFRAUZINO SOUZA Acao: 100', 250),
(240, 1, 17, 2, 2014, 1, 'Locacao - Dependencia: CHURRASQUEIRA GRANDE Socio: WALTER WHITE Acao: 18', 60),
(241, 1, 17, 2, 2014, 1, 'Locacao - Dependencia: SALAO SOCIAL(FORM/FAMILIA) Socio: WALTER WHITE Acao: 18', 250),
(242, 1, 20, 2, 2014, 2, 'Mensalidade DOUGLAS EUFRAUZINO SOUZA ', 150),
(243, 1, 20, 2, 2014, 2, 'Mensalidade FERNANDO ', 150),
(244, 1, 20, 2, 2014, 2, 'Mensalidade RODOLFO AAA ', 150),
(245, 1, 20, 2, 2014, 1, 'Locacao - Dependencia: CHURRASQUEIRA GRANDE Socio: WALTER WHITE Acao: ', 60),
(246, 1, 25, 3, 2014, 2, 'Mensalidade TEREZA EUFRAUZINO MELLO ', 150),
(247, 1, 25, 3, 2014, 2, 'Mensalidade ARTHUR ANDREY ', 150),
(248, 1, 25, 3, 2014, 2, 'Mensalidade JAQUELINE TASIANE DE SOUZA ', 150),
(249, 1, 25, 3, 2014, 2, 'Mensalidade RODOLFO AAA ', 150),
(250, 1, 25, 3, 2014, 2, 'Mensalidade TEREZA EUFRAUZINO MELLO ', 150),
(251, 1, 25, 3, 2014, 2, 'Mensalidade ARTHUR ANDREY ', 150),
(252, 1, 25, 3, 2014, 2, 'Mensalidade JAQUELINE TASIANE DE SOUZA ', 150),
(253, 1, 25, 3, 2014, 2, 'Mensalidade ARTHUR ANDREY ', 150),
(254, 1, 25, 3, 2014, 2, 'Mensalidade JAQUELINE TASIANE DE SOUZA ', 150),
(255, 1, 25, 3, 2014, 2, 'Mensalidade JAQUELINE TASIANE DE SOUZA ', 150),
(256, 1, 25, 3, 2014, 2, 'Mensalidade ARTHUR ANDREY ', 150),
(257, 1, 25, 3, 2014, 2, 'Mensalidade JAQUELINE TASIANE DE SOUZA ', 150),
(258, 1, 25, 3, 2014, 2, 'Mensalidade ARTHUR ANDREY ', 150),
(259, 1, 25, 3, 2014, 2, 'Mensalidade ARTHUR ANDREY ', 150),
(260, 1, 25, 3, 2014, 2, 'Mensalidade JAQUELINE TASIANE DE SOUZA ', 150),
(261, 1, 25, 3, 2014, 2, 'Mensalidade TEREZA EUFRAUZINO MELLO ', 150),
(262, 1, 25, 3, 2014, 2, 'Mensalidade DOUGLAS EUFRAUZINO SOUZA ', 150),
(263, 1, 25, 3, 2014, 2, 'Mensalidade ARTHUR ANDREY ', 150),
(264, 1, 25, 3, 2014, 2, 'Mensalidade JAQUELINE TASIANE DE SOUZA ', 150),
(265, 1, 25, 3, 2014, 2, 'Mensalidade TEREZA EUFRAUZINO MELLO ', 150),
(266, 1, 25, 3, 2014, 2, 'Mensalidade DOUGLAS EUFRAUZINO SOUZA ', 150),
(267, 1, 25, 3, 2014, 2, 'Mensalidade ARTHUR ANDREY ', 500),
(268, 1, 25, 3, 2014, 2, 'Mensalidade TEREZA EUFRAUZINO MELLO ', 500),
(269, 1, 25, 3, 2014, 2, 'Mensalidade TEREZA EUFRAUZINO MELLO ', 500),
(270, 1, 25, 3, 2014, 2, 'Mensalidade JAQUELINE TASIANE DE SOUZA ', 500),
(271, 1, 25, 3, 2014, 2, 'Mensalidade DOUGLAS EUFRAUZINO SOUZA ', 500),
(272, 1, 25, 3, 2014, 2, 'Mensalidade ARTHUR ANDREY ', 500),
(273, 1, 25, 3, 2014, 2, 'Mensalidade ARTHUR ANDREY ', 500),
(274, 1, 25, 3, 2014, 2, 'Mensalidade ARTHUR ANDREY ', 500),
(275, 1, 25, 3, 2014, 2, 'Mensalidade ARTHUR ANDREY ', 500),
(276, 1, 25, 3, 2014, 2, 'Mensalidade ARTHUR ANDREY ', 500),
(277, 1, 25, 3, 2014, 2, 'Mensalidade ARTHUR ANDREY ', 500),
(278, 1, 25, 3, 2014, 2, 'Mensalidade ARTHUR ANDREY ', 500),
(279, 1, 25, 3, 2014, 2, 'Mensalidade ARTHUR ANDREY ', 500),
(280, 1, 25, 3, 2014, 2, 'Mensalidade DOUGLAS EUFRAUZINO SOUZA ', 500),
(281, 1, 25, 3, 2014, 2, 'Mensalidade DOUGLAS EUFRAUZINO SOUZA ', 500),
(282, 1, 25, 3, 2014, 2, 'Mensalidade DOUGLAS EUFRAUZINO SOUZA ', 500),
(283, 1, 25, 3, 2014, 2, 'Mensalidade DOUGLAS EUFRAUZINO SOUZA ', 500),
(284, 1, 25, 3, 2014, 2, 'Mensalidade DOUGLAS EUFRAUZINO SOUZA ', 500),
(285, 1, 25, 3, 2014, 2, 'Mensalidade DOUGLAS EUFRAUZINO SOUZA ', 500),
(286, 1, 25, 3, 2014, 2, 'Mensalidade JAQUELINE TASIANE DE SOUZA ', 500),
(287, 1, 25, 3, 2014, 2, 'Mensalidade JAQUELINE TASIANE DE SOUZA ', 500),
(288, 1, 25, 3, 2014, 2, 'Mensalidade JAQUELINE TASIANE DE SOUZA ', 500),
(289, 1, 25, 3, 2014, 2, 'Mensalidade JAQUELINE TASIANE DE SOUZA ', 500),
(290, 1, 25, 3, 2014, 2, 'Mensalidade JAQUELINE TASIANE DE SOUZA ', 500),
(291, 1, 25, 3, 2014, 2, 'Mensalidade JAQUELINE TASIANE DE SOUZA ', 500),
(292, 1, 25, 3, 2014, 2, 'Mensalidade TEREZA EUFRAUZINO MELLO ', 500),
(293, 1, 25, 3, 2014, 2, 'Mensalidade TEREZA EUFRAUZINO MELLO ', 500),
(294, 1, 25, 3, 2014, 2, 'Mensalidade TEREZA EUFRAUZINO MELLO ', 500),
(295, 1, 25, 3, 2014, 2, 'Mensalidade TEREZA EUFRAUZINO MELLO ', 500),
(296, 1, 25, 3, 2014, 2, 'Mensalidade TEREZA EUFRAUZINO MELLO ', 500),
(297, 1, 25, 3, 2014, 2, 'Mensalidade TEREZA EUFRAUZINO MELLO ', 500),
(298, 1, 25, 3, 2014, 2, 'Mensalidade DOUGLAS EUFRAUZINO SOUZA ', 500),
(299, 1, 25, 3, 2014, 2, 'Mensalidade ARTHUR ANDREY ', 500),
(300, 1, 25, 3, 2014, 2, 'Mensalidade ARTHUR ANDREY ', 500),
(301, 1, 25, 3, 2014, 2, 'Mensalidade JAQUELINE TASIANE DE SOUZA ', 500),
(302, 1, 25, 3, 2014, 2, 'Mensalidade DOUGLAS EUFRAUZINO SOUZA ', 500),
(303, 1, 25, 3, 2014, 2, 'Mensalidade TEREZA EUFRAUZINO MELLO ', 500),
(304, 1, 25, 3, 2014, 2, 'Mensalidade DOUGLAS EUFRAUZINO SOUZA ', 500),
(305, 1, 25, 3, 2014, 2, 'Mensalidade TEREZA EUFRAUZINO MELLO ', 150),
(306, 1, 25, 3, 2014, 2, 'Mensalidade ARTHUR ANDREY ', 150),
(307, 1, 25, 3, 2014, 2, 'Mensalidade ARTHUR ANDREY ', 150),
(308, 1, 25, 3, 2014, 2, 'Mensalidade DOUGLAS EUFRAUZINO SOUZA ', 150),
(309, 1, 25, 3, 2014, 2, 'Mensalidade JAQUELINE TASIANE DE SOUZA ', 150),
(310, 1, 25, 3, 2014, 2, 'Mensalidade JAQUELINE TASIANE DE SOUZA ', 200),
(311, 1, 25, 3, 2014, 1, 'Locacao - Dependencia: CHURRASQUEIRA GRANDE Socio: JAQUELINE TASIANE DE SOUZA Acao: 18', 60),
(312, 1, 25, 3, 2014, 1, 'Locacao - Dependencia: SALAO SOCIAL Socio: JAQUELINE TASIANE DE SOUZA Acao: 18', 700),
(313, 1, 25, 3, 2014, 2, 'Mensalidade JAQUELINE TASIANE DE SOUZA ', 200),
(314, 1, 25, 3, 2014, 2, 'Mensalidade VANESSA HOBOLD ', 100),
(315, 1, 25, 3, 2014, 2, 'Mensalidade ARTHUR ANDREY ', 200),
(316, 1, 25, 3, 2014, 2, 'Mensalidade DOUGLAS EUFRAUZINO SOUZA ', 200),
(317, 1, 25, 3, 2014, 2, 'Mensalidade ARTHUR ANDREY ', 200),
(318, 1, 25, 3, 2014, 2, 'Mensalidade JAQUELINE TASIANE DE SOUZA ', 200),
(319, 1, 25, 3, 2014, 2, 'Mensalidade VANESSA HOBOLD ', 120),
(320, 1, 29, 3, 2014, 2, 'Mensalidade DOUGLAS EUFRAUZINO SOUZA ', 250),
(321, 1, 29, 3, 2014, 2, 'Mensalidade VANESSA HOBOLD ', 120),
(322, 1, 29, 3, 2014, 2, 'Mensalidade TEREZA EUFRAUZINO MELLO ', 250),
(323, 1, 9, 5, 2014, 2, 'Mensalidade DOUGLAS EUFRAUZINO SOUZA ', 250),
(324, 1, 9, 5, 2014, 1, 'Locacao - Dependencia: SALAO SOCIAL Socio: TEREZA EUFRAUZINO MELLO Acao: 55', 250),
(325, 1, 11, 6, 2014, 1, 'Locacao - Dependencia: SALAO SOCIAL Socio: TEREZA EUFRAUZINO MELLO Acao: 55', 250);

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
  `locacao_formapag` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`locacao_id`),
  KEY `fklocacao_socio_idx` (`locacao_socio`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=284 ;

--
-- Extraindo dados da tabela `locacao`
--

INSERT INTO `locacao` (`locacao_id`, `locacao_data`, `locacao_pago`, `locacao_total`, `locacao_socio`, `locacao_socionome`, `locacao_formapag`) VALUES
(253, '2013-11-28 16:41:42', 2, '0.00', 16, 'TEREZA EUFRAUZINO MELLO', 'cupom'),
(255, '2013-11-28 16:47:16', 2, '0.00', 16, 'TEREZA EUFRAUZINO MELLO', 'cupom'),
(257, '2013-11-28 20:42:27', 2, '0.00', 15, 'DOUGLAS EUFRAUZINO SOUZA', 'cupom'),
(258, '2013-11-28 20:46:41', 2, '20.00', 15, 'DOUGLAS EUFRAUZINO SOUZA', 'cupom e dinheiro ou cheque'),
(260, '2014-02-13 17:30:17', 2, '90.00', 15, 'DOUGLAS EUFRAUZINO SOUZA', 'cupom e dinheiro ou cheque'),
(267, '2014-02-17 17:28:10', 2, '180.00', 24, 'WALTER WHITE', 'cupom e dinheiro ou cheque'),
(269, '2014-02-17 17:43:21', 1, '175.00', 24, 'WALTER WHITE', 'dinheiro'),
(273, '2014-02-20 21:42:14', 0, '794.00', 26, 'ARTHUR ANDREY', NULL),
(278, '2014-05-09 02:38:14', 2, '0.00', 12, 'JAQUELINE TASIANE DE SOUZA', 'cupom'),
(280, '2014-06-11 15:06:54', 0, '700.00', 16, 'TEREZA EUFRAUZINO MELLO', NULL),
(281, '2014-06-11 15:15:53', 0, NULL, 26, 'ARTHUR ANDREY', NULL),
(282, '2014-06-11 15:16:06', 0, '670.00', 15, 'DOUGLAS EUFRAUZINO SOUZA', NULL),
(283, '2014-06-25 15:20:34', 0, '0.00', 12, 'JAQUELINE TASIANE DE SOUZA', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `mespagamento`
--

CREATE TABLE IF NOT EXISTS `mespagamento` (
  `mespag_id` int(11) NOT NULL AUTO_INCREMENT,
  `mespag_uso` tinyint(1) NOT NULL,
  `mespag_ano` year(4) DEFAULT NULL,
  `mespag_mes` int(11) DEFAULT NULL,
  PRIMARY KEY (`mespag_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=57 ;

--
-- Extraindo dados da tabela `mespagamento`
--

INSERT INTO `mespagamento` (`mespag_id`, `mespag_uso`, `mespag_ano`, `mespag_mes`) VALUES
(53, 1, 2014, 1),
(54, 1, 2014, 2),
(55, 1, 2014, 3),
(56, 1, 2014, 4);

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
  `pag_mens_cat` int(11) NOT NULL,
  PRIMARY KEY (`pag_mens_id`),
  KEY `pag_mens_socio_idx` (`pag_mens_socio`),
  KEY `pag_mens_mes_idx` (`pag_mens_mes`),
  KEY `pag_mens_mes` (`pag_mens_mes`),
  KEY `pag_mens_socio` (`pag_mens_socio`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=935 ;

--
-- Extraindo dados da tabela `pagmensalidade`
--

INSERT INTO `pagmensalidade` (`pag_mens_id`, `pag_mens_data`, `pag_mens_status`, `pag_mens_valor`, `pag_mens_socio`, `pag_mens_mes`, `pag_mens_cat`) VALUES
(916, '2014-03-25 12:41:37', 1, '200.00', 12, 53, 1),
(917, '2014-03-25 12:39:44', 1, '500.00', 15, 53, 1),
(918, '2014-03-28 23:09:44', 0, '150.00', 16, 53, 1),
(919, '2014-03-25 12:39:45', 1, '150.00', 26, 53, 1),
(920, '2014-03-25 12:46:58', 1, '150.00', 12, 54, 1),
(921, '2014-03-25 12:46:58', 1, '150.00', 15, 54, 1),
(922, '2014-03-25 12:46:58', 0, '250.00', 16, 54, 1),
(923, '2014-03-25 12:46:58', 1, '150.00', 26, 54, 1),
(924, '2014-03-25 12:46:58', 1, '120.00', 27, 54, 2),
(925, '2014-03-25 13:05:09', 1, '200.00', 12, 55, 1),
(926, '2014-03-25 13:05:09', 0, '250.00', 15, 55, 1),
(927, '2014-03-25 13:05:09', 0, '250.00', 16, 55, 1),
(928, '2014-03-25 13:05:09', 1, '200.00', 26, 55, 1),
(929, '2014-03-25 13:05:09', 1, '100.00', 27, 55, 2),
(930, '2014-06-25 15:21:21', 1, '200.00', 12, 56, 1),
(931, '2014-05-09 02:33:23', 1, '250.00', 15, 56, 1),
(932, '2014-03-25 13:07:34', 1, '250.00', 16, 56, 1),
(933, '2014-03-25 13:07:34', 1, '200.00', 26, 56, 1),
(934, '2014-03-25 13:07:34', 1, '120.00', 27, 56, 2);

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
(11, 'NETO', 2),
(12, 'CUNHADO(A)', 3),
(13, 'ALUNOS', 5),
(14, 'PROPRIO SOCIO', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE IF NOT EXISTS `produto` (
  `produto_id` int(11) NOT NULL AUTO_INCREMENT,
  `produto_descricao` varchar(30) DEFAULT NULL,
  `produto_disponivel` tinyint(1) DEFAULT NULL,
  `produto_valor` decimal(10,2) DEFAULT NULL,
  `produto_estoque` int(11) DEFAULT NULL,
  `produto_cat_obj` int(11) NOT NULL,
  `produto_img` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`produto_id`),
  KEY `produto_cat_obj` (`produto_cat_obj`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`produto_id`, `produto_descricao`, `produto_disponivel`, `produto_valor`, `produto_estoque`, `produto_cat_obj`, `produto_img`) VALUES
(1, 'TAMPAO', 1, '20.00', 30, 1, NULL),
(2, 'PRATO E TALHERES', 1, '1.20', 100, 1, 'talher_1.jpg'),
(3, 'TOALHA', 1, '2.00', 30, 1, NULL),
(4, 'GAS', 1, '10.00', 10, 1, NULL),
(5, 'COPO', 1, '0.50', 100, 1, 'copo_1.jpg'),
(6, 'PANELA', 1, '15.00', 10, 1, 'panela_1.jpg'),
(7, 'JOGO DE MESAS', 1, '0.00', 60, 1, NULL),
(8, 'GARFO', 1, '1.00', 30, 1, NULL);

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
  `socio_num_res` varchar(12) DEFAULT NULL,
  `socio_bairro` varchar(100) DEFAULT NULL,
  `socio_cidade` int(11) DEFAULT NULL,
  `socio_fone_res` varchar(15) DEFAULT NULL,
  `socio_fone_cel` varchar(15) DEFAULT NULL,
  `socio_rg` varchar(15) DEFAULT NULL,
  `socio_cpf` varchar(15) DEFAULT NULL,
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
  `socio_cat` int(11) DEFAULT NULL,
  `socio_academia` int(11) DEFAULT NULL,
  PRIMARY KEY (`socio_id`),
  UNIQUE KEY `socio_acao_UNIQUE` (`socio_acao`),
  KEY `cidade_atual_idx` (`socio_cidade`),
  KEY `fk_SocioEfetivo_Acao1_idx` (`socio_acao`),
  KEY `fksocio_cat_idx` (`socio_cat`),
  KEY `fk_socio_academia_idx` (`socio_academia`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Extraindo dados da tabela `socio`
--

INSERT INTO `socio` (`socio_id`, `socio_acao`, `socio_nome`, `socio_cep`, `socio_endereco`, `socio_num_res`, `socio_bairro`, `socio_cidade`, `socio_fone_res`, `socio_fone_cel`, `socio_rg`, `socio_cpf`, `socio_nascimento`, `socio_civil`, `socio_sexo`, `socio_profissao`, `socio_regime_trabalho`, `socio_local_trabalho`, `socio_fone_trabalho`, `socio_observacao`, `socio_email`, `socio_data_cadastro`, `socio_ativo`, `socio_cat`, `socio_academia`) VALUES
(12, 18, 'JAQUELINE TASIANE DE SOUZA', '35.135-135', 'RUA DA MANDIOCA', '351313', 'JD SIMARA', 1, '(44) 3424-2265', '(44) 8438-4540', '', '', '0000-00-00', 'SOLTEIRO', 'F', 'PROFESSORA', 'VESPERTINO', 'FATECIE MAX', '3215252', 'NAMORADA DO DOUGLAS', 'keyne_pvai@hotmail.com', '0000-00-00', 1, 1, NULL),
(13, NULL, 'RODOLFO AAA', '', '', '', '', 2, '', '', '', '', '0000-00-00', 'SOLTEIRO', 'F', '', '', '', '', '', '', '0000-00-00', 0, 1, NULL),
(15, 12, 'DOUGLAS EUFRAUZINO SOUZA', '87.707-030', 'RUA FRANSCISCO ALVES DO NASCIMENTO', '1843', 'JD SIMARA', 1, '', '', '8.861.315-5', '', '0000-00-00', 'SOLTEIRO', 'M', 'TEC. PROGRAMACAO', 'PLANTAO', 'RPC TV', '4430444567', '', 'douglas__es@hotmail.com', '0000-00-00', 1, 1, NULL),
(16, 55, 'TEREZA EUFRAUZINO MELLO', '87.707-030', 'RUA FRANSCISCO A. NASCIMENTO', '1843', 'JD AEROPORTO', 1, '', '', '1.111.111-1', '', '0000-00-00', 'SOLTEIRO', 'F', 'PROFESSORA', 'MANHA', 'ENIRA', '123123123', '', 'terezamello1@hotmail.com', '0000-00-00', 1, 1, NULL),
(23, NULL, 'FERNANDO', '87.787-788', 'RUA TESTE', '1842', 'TESTE', 1, '', '(44) 8555-2888', '8.545.754-2', '', '0000-00-00', 'CASADO', 'M', 'ESTUDANTE', '', '', '', '', '', '0000-00-00', 0, 1, NULL),
(24, NULL, 'WALTER WHITE', '52.885-852', 'RUA', '', 'BAITO', 1, '(44) 8755-5258', '(44) 8755-8585', '2.444.789-6', '054.455.888-55', '0000-00-00', 'CASADO', 'M', 'QUIMICO', '', '', '', '', '', '0000-00-00', 0, 1, NULL),
(26, 558, 'ARTHUR ANDREY', '', '', '', '', 1, '(44) 3045-6746', '(44) 9977-8558', '5.454.454-5', '545.454.545-45', '0000-00-00', 'SOLTEIRO', '', '', '', '', '', '', 'artur@hotmail.coml', '0000-00-00', 1, 1, NULL),
(27, 748, 'VANESSA HOBOLD', '87.747-441', 'RUA SOUZA NAVES ', '4485', 'CENTRO', 1, '(44) 3423-3356', '(44) 9965-8885', '5.288.525-8', '254.025.822-58', '0000-00-00', 'SOLTEIRO', 'F', 'ESTUDANTE', '', '', '4434233526', '', 'vanessa_hobold@gmail.com', '0000-00-00', 1, 2, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Extraindo dados da tabela `tipolocacao`
--

INSERT INTO `tipolocacao` (`obj_tipo_id`, `obj_tipo_descricao`, `obj_tipo_valor`, `obj_tipo_obj`, `obj_tipo_grauloc`, `obj_tipo_evento`) VALUES
(1, 'SALAO SOCIAL', '250.00', 1, 1, 1),
(2, 'SALAO SOCIAL', '150.00', 1, 1, 2),
(3, 'SALAO SOCIAL', '700.00', 1, 2, 1),
(5, 'SALAO SOCIAL', '150.00', 1, 2, 2),
(6, 'SALAO SOCIAL', '700.00', 1, 3, 1),
(7, 'SALAO SOCIAL', '700.00', 1, 3, 2),
(8, 'CHURRASQUEIRA GRANDE', '60.00', 2, 1, 3),
(9, 'CHURRASQUEIRA PEQUENA ', '30.00', 3, 1, 3),
(10, 'CHURRASQUEIRA GRANDE', '350.00', 2, 3, 1),
(11, 'CHURRASQUEIRA GRANDE', '350.00', 2, 3, 2),
(12, 'CHURRASQUEIRA GRANDE', '200.00', 2, 5, 0),
(13, 'SALAO SOCIAL', '250.00', 1, 1, 0),
(14, 'SALAO - (FORMATURA ALUNO)', '350.00', 1, 5, 0),
(15, 'CHURRASQUEIRA PEQUENA', '50.00', 3, 2, 2),
(16, 'CHURRASQUEIRA PEQUENA', '20.00', 3, 1, 2);

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
-- Limitadores para a tabela `depinativo`
--
ALTER TABLE `depinativo`
  ADD CONSTRAINT `depinativo_dep` FOREIGN KEY (`depinativo_dep`) REFERENCES `dependencia` (`objeto_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
-- Limitadores para a tabela `exame`
--
ALTER TABLE `exame`
  ADD CONSTRAINT `exame` FOREIGN KEY (`exame_socio`) REFERENCES `socio` (`socio_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `itemproduto_ibfk_1` FOREIGN KEY (`itemprod_itemlocacao`) REFERENCES `itemlocacao` (`itemobj_id`) ON DELETE CASCADE,
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
