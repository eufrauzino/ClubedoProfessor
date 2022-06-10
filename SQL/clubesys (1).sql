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
(1, 340.23, 'SOCIO COMUM'),
(2, 0.00, 'NAO SOCIO');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Extraindo dados da tabela `catfreq`
--

INSERT INTO `catfreq` (`catfreq_id`, `mensalidade_valor`, `catfreq_descricao`, `catfreq_atualizacao`, `catfreq_tipo`) VALUES
(1, 88.00, 'SOCIO EFETIVO', '2013-09-14 19:46:51', 1),
(2, 100.00, 'SOCIO COLABORADOR', '2013-09-06 15:39:47', 1),
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=430 ;

--
-- Extraindo dados da tabela `itemlocacao`
--

INSERT INTO `itemlocacao` (`itemobj_id`, `itemobj_tipoloc`, `itemobj_locacao`, `itemobj_parente`, `itemobj_evento`, `itemobj_responsavel`, `itemobj_data`) VALUES
(392, 5, 78, 1, 2, '', '2013-09-20'),
(393, 5, 78, 1, 2, '', '2013-10-11'),
(395, 3, 79, 1, 1, '', '2013-10-25'),
(397, 11, 79, 2, 2, '', '2013-12-06'),
(398, 3, 80, 1, 1, '', '2013-10-05'),
(400, 9, 81, 3, 3, '', '2013-09-28'),
(421, 8, 80, 3, 3, '', '2013-10-05'),
(422, 9, 80, 3, 3, '', '2013-10-06'),
(424, 1, 82, 5, 1, '', '2014-12-15'),
(425, 8, 82, 5, 3, '', '2014-12-15'),
(427, 9, 82, 5, 3, '', '2014-12-17'),
(429, 8, 83, 3, 3, '', '2013-09-21');

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
(1, 1, 10, 100.00, 398);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=87 ;

--
-- Extraindo dados da tabela `locacao`
--

INSERT INTO `locacao` (`locacao_id`, `locacao_data`, `locacao_pago`, `locacao_total`, `locacao_socio`, `locacao_socionome`) VALUES
(78, '2013-09-05 00:54:10', 1, 300.00, 15, 'DOUGLAS EUFRAUZINO SOUZA'),
(79, '2013-09-06 15:12:40', 1, 1050.00, 15, 'DOUGLAS EUFRAUZINO SOUZA'),
(80, '2013-09-06 15:35:43', 0, 790.00, 14, 'Joao da Silva'),
(81, '2013-09-06 16:48:08', 1, 30.00, 15, 'DOUGLAS EUFRAUZINO SOUZA'),
(82, '2013-09-14 19:09:50', 0, 240.00, 15, 'DOUGLAS EUFRAUZINO SOUZA'),
(83, '2013-09-14 19:17:53', 0, 60.00, 17, 'Camila do Santos'),
(85, '2013-09-18 15:33:36', 0, NULL, 14, 'Joao da Silva'),
(86, '2013-09-18 15:40:50', 0, NULL, 15, 'DOUGLAS EUFRAUZINO SOUZA');

-- --------------------------------------------------------

--
-- Estrutura da tabela `mespagamento`
--

CREATE TABLE IF NOT EXISTS `mespagamento` (
  `mespag_id` int(11) NOT NULL AUTO_INCREMENT,
  `mespag_ano` year(4) DEFAULT NULL,
  `mespag_mes` int(11) DEFAULT NULL,
  PRIMARY KEY (`mespag_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Extraindo dados da tabela `mespagamento`
--

INSERT INTO `mespagamento` (`mespag_id`, `mespag_ano`, `mespag_mes`) VALUES
(13, 2013, 9);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=141 ;

--
-- Extraindo dados da tabela `pagmensalidade`
--

INSERT INTO `pagmensalidade` (`pag_mens_id`, `pag_mens_data`, `pag_mens_status`, `pag_mens_valor`, `pag_mens_socio`, `pag_mens_mes`) VALUES
(131, '2013-09-18 17:37:37', 1, 88.00, 1, 13),
(132, '2013-09-18 17:37:37', 1, 100.00, 2, 13),
(133, '2013-09-18 17:37:37', 0, 100.00, 6, 13),
(134, '2013-09-18 17:37:37', 1, 88.00, 11, 13),
(135, '2013-09-18 17:37:37', 0, 88.00, 12, 13),
(136, '2013-09-18 17:37:37', 0, 88.00, 13, 13),
(137, '2013-09-18 17:37:37', 0, 88.00, 14, 13),
(138, '2013-09-18 17:37:37', 1, 88.00, 15, 13),
(139, '2013-09-18 17:37:37', 0, 88.00, 16, 13),
(140, '2013-09-18 17:37:37', 1, 88.00, 17, 13);

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
  `produto_estoque` int(11) DEFAULT NULL,
  `produto_cat_obj` int(11) NOT NULL,
  PRIMARY KEY (`produto_id`),
  KEY `produto_cat_obj` (`produto_cat_obj`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`produto_id`, `produto_descricao`, `produto_disponivel`, `produto_valor`, `produto_estoque`, `produto_cat_obj`) VALUES
(1, 'TAMPAO', 1, 5.00, 30, 1),
(2, 'PRATO', 1, 1.20, 100, 1);

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
  ADD CONSTRAINT `itemproduto_ibfk_1` FOREIGN KEY (`itemprod_itemlocacao`) REFERENCES `itemlocacao` (`itemobj_id`),
  ADD CONSTRAINT `itemproduto_ibfk_2` FOREIGN KEY (`itemprod_objetos`) REFERENCES `produto` (`produto_id`);

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
-- Restrições para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`produto_cat_obj`) REFERENCES `catdependencia` (`catdep_id`);

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
